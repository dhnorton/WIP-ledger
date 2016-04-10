'From Cuis 4.2 of 25 July 2013 [latest update: #2727] on 10 April 2016 at 12:23:44.903766 pm'!
!classDefinition: #InnerTextMorph category: #'Morphic-Views for Models'!
InnerPluggableMorph subclass: #InnerTextMorph
	instanceVariableNames: 'model wrapFlag textComposition editor pauseBlinking acceptOnCR hasUnacceptedEdits hasEditingConflicts askBeforeDiscardingEdits styler autoCompleter mutex'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morphic-Views for Models'!
!InnerTextMorph commentStamp: 'jmv 4/8/2016 13:46' prior: 0!
InnerTextMorphs support display of text with emphasis.  They also support reasonable text-editing capabilities, as well as embedded hot links, and the ability to embed submorphs in the text. They are 'bare' in the sense that they can not clip contents to some window, or scroll it by themselves.

Text display is clipped to the innerBounds of the rectangle, and text composition is normally performed within a rectangle which is innerBounds inset by the margins parameter.

Comment about Shout specifics:
-----------------------------------------
Instances of me are usually created using my #on:text:accept:readSelection:menu: class method.

In order to colour the text, I use an instance of SHTextStylerST80, which I store in my 'styler' instance variable.

When my setText: method is called, I use my styler to ...
	a) optionally set all assignments to ansi or leftArrow. 
	b) Colour my text (immediately, if the text is less than 4096 chars in length, or in a backgroundProcess otherwise)

	When my text is changed, my hasUnacceptedEdits: method is called with true, and I ask my styler to re-colour my text. This is performed in a background process so that typing remains responsive regardless of the length of the text.

	Just before my styler is about to format/style the text, I send #stylerAboutToStyle:  to my model. This gives my model a chance to veto the styling (by answering false), or to initialize the styler with information it needs in order to parse the text correctly (e.g. the class to which a method belongs, or the workspace in which I am contained).

	My styler informs me that it has finished styling by triggering the #shoutStyled event which I handle. I then update the textAttributes of my text and refresh the display.
 
	My 'unstyledAcceptText' instance variable is used in conjunction with my #acceptTextInModel and #correctFrom:to:with: methods to ensure that when my text is modified during a method compilation (removing unused vars etc), I do not lose those changes.!


!InnerTextMorph methodsFor: 'accessing' stamp: 'jmv 11/9/2011 17:57'!
askBeforeDiscardingEdits: aBoolean
	"Set the flag that determines whether the user should be asked before discarding unaccepted edits."

	askBeforeDiscardingEdits _ aBoolean! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'jmv 11/9/2011 17:57'!
contents: stringOrText
	^ self contentsAsIs: stringOrText! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'jmv 11/9/2011 17:57'!
contentsAsIs: stringOrText
	"Accept new text contents with line breaks only as in the text.
	Fit my width and height to the result."
	wrapFlag _ false.
	model basicActualContents: stringOrText! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'jmv 3/14/2012 08:38'!
crAction
	"Return the action to perform when user presses <Return> key"
	^self valueOfProperty: #crAction! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'jmv 2/5/2015 00:39'!
disableEdition
	self setProperty: #disablesEdition toValue: true.
	self stopBlinking! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'jmv 5/5/2014 07:03'!
editor
	"Return my current editor, or install a new one."
	editor ifNil: [ self installEditorAndTextComposition ].
	^editor! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'jmv 12/3/2011 00:41'!
hasEditingConflicts
	"Return true if a conflicting edit to the same code (typically) is known to have occurred after the current contents started getting edited"

	^ hasEditingConflicts! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'jmv 12/3/2011 00:41'!
hasEditingConflicts: aBoolean

	hasEditingConflicts _ aBoolean! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'jmv 11/9/2011 17:57'!
isWrapped
	
	^wrapFlag! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'jmv 10/16/2013 19:59'!
model: aTextModel
	model _ aTextModel.
	styler ifNotNil: [ styler textModel: model ].
	self releaseEditorAndTextComposition.	"So the model is properly set on the editor and the text composition"! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'jmv 6/6/2014 14:34'!
model: aTextModel wrappedTo: width
	"Accept new text contents.  Lay it out, wrapping to width.
	Then fit my height to the result."
	| newExtent |
	wrapFlag _ true.
	newExtent _ width truncated@extent y.
	extent = newExtent ifFalse: [
		self redrawNeeded.
		extent _ newExtent.
		self someSubmorphPositionOrExtentChanged.
		owner ifNotNil: [ owner someSubmorphPositionOrExtentChanged ].
		self redrawNeeded ].
	self model: aTextModel! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'jmv 8/21/2012 21:56'!
textColor

	^ color! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'jmv 8/21/2012 22:00'!
textColor: aColor

	color = aColor ifTrue: [^ self].
	color _ aColor.
	self redrawNeeded! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'jmv 5/3/2015 19:22'!
wrapFlag: aBoolean
	"Change whether contents are wrapped to the container."

	aBoolean == wrapFlag ifTrue: [^ self].
	wrapFlag _ aBoolean.

	"Compose my text to fit my bounds."
	self resetTextComposition.
	self editor recomputeSelection.	
	self updateFromTextComposition ! !


!InnerTextMorph methodsFor: 'anchors' stamp: 'jmv 8/5/2012 01:09'!
anchorMorph: aMorph at: aPoint
	| relPt |
	aMorph owner == self ifTrue: [ self removeMorph: aMorph ].
	self addMorphFront: aMorph.
	relPt _ aPoint - self morphPositionInWorld.
	editor insertMorph: aMorph at: relPt.
	self fit.! !


!InnerTextMorph methodsFor: 'caching' stamp: 'jmv 10/16/2013 19:59'!
releaseCachedState

	super releaseCachedState.
	self releaseEditorAndTextComposition.
! !


!InnerTextMorph methodsFor: 'drawing' stamp: 'jmv 10/16/2013 19:55'!
debugDrawLineRectsOn: aCanvas
	"Shows where text line rectangles are"

	self textComposition lines do: [ :line |
		aCanvas
			frameRectangle: line rectangle
			borderWidth: 1
			color: Color brown ]
! !

!InnerTextMorph methodsFor: 'drawing' stamp: 'jmv 10/16/2013 19:55'!
drawOn: aCanvas
	"Draw the receiver on a canvas"

	false ifTrue: [ self debugDrawLineRectsOn: aCanvas ].  "show line rects for debugging"

	aCanvas
		textComposition: self textComposition
		bounds: (0@0 extent: extent)
		color: color
		selectionColor: (Theme current textHighlightFocused: self hasKeyboardFocus)! !


!InnerTextMorph methodsFor: 'editing' stamp: 'jmv 5/27/2013 10:52'!
acceptContents
	"The message is sent when the user hits return or Cmd-S.
	Accept the current contents and end editing."
	"Inform the model of text to be accepted, and return true if OK."

	| ok prevSelection prevScrollValue |
	prevSelection _ self editor selectionInterval copy.
	prevScrollValue _ owner verticalScrollBar value.
	(self canDiscardEdits and: [(self hasProperty: #alwaysAccept) not]) 
		ifTrue: [^self flash].
	self hasEditingConflicts 
		ifTrue: [
			(self confirm: 
'Caution!! Contents were saved
elsewhere since you started
editing them here.  Accept anyway?' ) 
					ifFalse: [^self flash]].
	ok _ model acceptContentsFrom: owner.
	ok == true
		ifTrue: [ model refetch ].

	"sps 8/13/2001 22:41: restore selection and scroll info"
	self flag: #jmvVer2.	"Check this. Do we need the error handler? Consider explicitly the case where no world?"
	["During the step for the browser, updatePaneIfNeeded is called, and 
		invariably resets the contents of the codeholding PluggableTextMorph
		at that time, resetting the cursor position and scroller in the process.
		The following line forces that update without waiting for the step,
 		then restores the cursor and scrollbar"
		ok
			ifTrue: [
				self editor selectFrom: prevSelection first to: prevSelection last.
				WorldState addDeferredUIMessage: [
					self world ifNotNil: [ :w | w activeHand newKeyboardFocus: self ].
					owner setScrollDeltas.
					owner verticalScrollBar setValue: prevScrollValue ]]
	] on: Error do: nil! !

!InnerTextMorph methodsFor: 'editing' stamp: 'jmv 11/9/2011 17:57'!
acceptOnCR
	"Answer whether the receiver wants to accept when the Return key is hit"

	^ acceptOnCR == true! !

!InnerTextMorph methodsFor: 'editing' stamp: 'jmv 10/16/2013 19:59'!
cancelEdits
	"The message is sent when the user hits Cmd-L.
	Cancel the current contents and end editing."
	self releaseEditorAndTextComposition.
	model refetch! !

!InnerTextMorph methodsFor: 'editing' stamp: 'jmv 10/16/2013 19:54'!
chooseEmphasisOrAlignment
	self editor changeEmphasisOrAlignment.
	self updateFromTextComposition! !

!InnerTextMorph methodsFor: 'editing' stamp: 'jmv 10/16/2013 19:54'!
chooseFont
	self editor offerFontMenu.
	self updateFromTextComposition.! !

!InnerTextMorph methodsFor: 'editing' stamp: 'jmv 5/26/2013 16:31'!
enterClickableRegion: aMorphicEvent localPosition: localEventPosition
! !

!InnerTextMorph methodsFor: 'editing' stamp: 'jmv 12/8/2015 20:40'!
handleInteraction: interactionBlock
	"Perform the changes in interactionBlock, noting any change in selection
	and possibly a change in the composition"

	self selectionChanged.  "Note old selection"

	interactionBlock value.

	self selectionChanged.  "Note new selection"
	self updateFromTextComposition! !

!InnerTextMorph methodsFor: 'editing' stamp: 'jmv 12/19/2011 14:48'!
hasUnacceptedEdits: aBoolean
	"Set the hasUnacceptedEdits flag to the given value. "
	aBoolean == hasUnacceptedEdits ifFalse: [
		hasUnacceptedEdits _ aBoolean.
		owner redrawNeeded].
	aBoolean ifFalse: [ hasEditingConflicts _ false].

	"shout:  re-style the text iff aBoolean is true
	Do not apply any formatting (i.e. changes to the characters in the text),
	just styling (i.e. TextAttributes)"
	(aBoolean and: [self okToStyle])
		ifTrue: [ styler styleInBackgroundProcess ]! !


!InnerTextMorph methodsFor: 'events' stamp: 'jmv 8/21/2012 09:14'!
clickAndHalf: aMouseButtonEvent localPosition: localEventPosition

	self handleInteraction: [
		editor clickAndHalf ].
	owner scrollSelectionIntoView! !

!InnerTextMorph methodsFor: 'events' stamp: 'jmv 8/21/2012 10:03'!
doubleClickAndHalf: aMouseButtonEvent localPosition: localEventPosition

	self handleInteraction: [
		editor doubleClickAndHalf ].
	owner scrollSelectionIntoView! !

!InnerTextMorph methodsFor: 'events' stamp: 'len 11/15/2015 06:45'!
keyStroke: aKeyboardEvent

	(Theme current keyStroke: aKeyboardEvent morph: self)
		ifTrue: [^ self].
	(self focusKeyboardFor: aKeyboardEvent)
		ifTrue: [ ^ self ].
		
	"Maybe disable? Precludes the use of up and down arrows with control,
	that are standard keystrokes in Windows to control the cursor.
	Problem: At least Mac and Win VM generate ctrl-up and ctrl-down for
	mouse wheel events.
	I guess most people would prefer the mouse wheel to work properly..."
	(owner scrollByKeyboard: aKeyboardEvent)
		ifTrue: [ ^self ].

	autoCompleter 
		ifNil: [ self processKeyStroke: aKeyboardEvent ]
		ifNotNil: [
			autoCompleter
				autoCompletionAround: [ self processKeyStroke: aKeyboardEvent ]
				keyStroke: aKeyboardEvent ]! !

!InnerTextMorph methodsFor: 'events' stamp: 'jmv 1/14/2013 23:15'!
mouseButton1Up: aMouseButtonEvent localPosition: localEventPosition

	super mouseButton1Up: aMouseButtonEvent localPosition: localEventPosition.
	self pauseBlinking.
	self handleInteraction: [ editor mouseButton1Up: aMouseButtonEvent  localPosition: localEventPosition ].
	owner scrollSelectionIntoView! !

!InnerTextMorph methodsFor: 'events' stamp: 'jmv 8/21/2012 12:38'!
mouseMove: aMouseMoveEvent localPosition: localEventPosition

	aMouseMoveEvent mouseButton1Pressed ifFalse: [
		^ self enterClickableRegion: aMouseMoveEvent localPosition: localEventPosition ].
	self handleInteraction: [
		editor mouseMove: aMouseMoveEvent localPosition: localEventPosition].
	owner scrollSelectionIntoView! !


!InnerTextMorph methodsFor: 'event handling testing' stamp: 'jmv 2/5/2015 00:45'!
disablesEdition

	^self hasProperty: #disablesEdition! !

!InnerTextMorph methodsFor: 'event handling testing' stamp: 'jmv 11/9/2011 17:57'!
handlesKeyboard

	^self visible! !

!InnerTextMorph methodsFor: 'event handling testing' stamp: 'jmv 8/20/2012 18:52'!
handlesMouseDown: aMouseButtonEvent
	^ true! !


!InnerTextMorph methodsFor: 'event handling' stamp: 'jmv 2/5/2015 00:33'!
keyboardFocusChange: aBoolean
	
	"The message is sent to a morph when its keyboard focus changes.
	The given argument indicates that the receiver is gaining (versus losing) the keyboard focus.
	In this case, all we need to do is to redraw border feedback"
	aBoolean
		ifTrue: [
			"A hand is wanting to send us characters..."
			editor ifNil: [ self editor storeSelectionInComposition ].	"Forces install"
			self showsBlinkingCursor ifTrue: [
				self startBlinking ]]
		ifFalse: [ self stopBlinking ].
	"Selection might be shown differently when focused"
	owner
		ifNotNil: [ owner redrawNeeded ]
		ifNil: [ self redrawNeeded ]		"Or at least redraw us"! !

!InnerTextMorph methodsFor: 'event handling' stamp: 'jmv 8/6/2014 11:34'!
processKeyStroke: evt
	| action |

	(acceptOnCR and: [evt isReturnKey])
		ifTrue: [^ self acceptContents].

	self pauseBlinking.
	evt isReturnKey ifTrue: [	"Return - check for special action"
		action _ self crAction.
		action ifNotNil: [
			^action value]].
	self handleInteraction: [ editor processKeyStroke: evt ].

	"Is this really needed? It produces whole morph invalidation just by (for example)
	moving the cursor around... (jmv Aug 6, 2014)"
	"self updateFromTextComposition."

	self scrollSelectionIntoView! !


!InnerTextMorph methodsFor: 'events-processing' stamp: 'jmv 2/5/2015 00:31'!
processKeystroke: aKeyboardEvent localPosition: localEventPosition
	"System level event handling."
		"localEventPosition?????"

	aKeyboardEvent wasHandled ifTrue:[^self].
	self handlesKeyboard ifFalse: [^ self].
	aKeyboardEvent wasHandled: true.
	self keyStroke: aKeyboardEvent! !

!InnerTextMorph methodsFor: 'events-processing' stamp: 'jmv 2/2/2014 22:18'!
processMouseMove: aMouseMoveEvent localPosition: localEventPosition
	"Re-implemented to allow for mouse-up move events"

	aMouseMoveEvent wasHandled ifTrue: [ ^self ]. "not interested"
	aMouseMoveEvent hand hasSubmorphs ifTrue: [ ^self ].
	aMouseMoveEvent wasHandled: true.
	self mouseMove: aMouseMoveEvent localPosition: localEventPosition.
	(aMouseMoveEvent anyButtonPressed and: [ self hasMouseFocus ]) ifFalse: [ ^self ].
	(self handlesMouseStillDown: aMouseMoveEvent) ifTrue:[
		"Step at the new location"
		self startStepping: #processMouseStillDown stepTime: 1]! !


!InnerTextMorph methodsFor: 'geometry' stamp: 'jmv 7/20/2014 10:04'!
adjustExtent
	"This is just a suggestion. If we do wordwrap, the width will be honored.
	But the height is whatever is appropriate for the contents!! See #fit"
	self morphExtent: owner viewableExtent! !

!InnerTextMorph methodsFor: 'geometry' stamp: 'KenD 8/27/2015 15:58'!
fontPreferenceChanged

	super fontPreferenceChanged.
	self updateFromTextComposition.! !

!InnerTextMorph methodsFor: 'geometry' stamp: 'jmv 4/15/2014 09:22'!
minimumExtent

	^(9@(AbstractFont default height+2))! !

!InnerTextMorph methodsFor: 'geometry' stamp: 'jmv 7/20/2014 10:08'!
privateExtent: aPoint
	| newExtent |

	"Resist changing the extent if no wordwrap. this should be checked."
	wrapFlag ifFalse: [ ^ false ].
	
	"Just update width. Height is set by ourselves. See #fit"
	newExtent _ aPoint x truncated @ extent y.

	^ (super privateExtent: newExtent)
		ifTrue: [
			self resetTextComposition.
			self editor recomputeSelection.	
			self updateFromTextComposition ]; yourself! !


!InnerTextMorph methodsFor: 'initialization' stamp: 'jmv 11/9/2011 17:57'!
defaultColor
	"Return the default fill style for the receiver"
	^ Theme current text! !

!InnerTextMorph methodsFor: 'initialization' stamp: 'jmv 12/3/2011 00:41'!
initialize
	super initialize.
	wrapFlag _ true.
	acceptOnCR _ false.
	hasUnacceptedEdits _ false.
	hasEditingConflicts _ false.
	askBeforeDiscardingEdits _ true! !


!InnerTextMorph methodsFor: 'menu' stamp: 'jmv 11/9/2011 17:57'!
addCustomMenuItems: aCustomMenu hand: aHandMorph 
	"Add text-related menu items to the menu"

	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu 
		addUpdating: #wrapString
		target: self
		action: #wrapOnOff! !

!InnerTextMorph methodsFor: 'menu' stamp: 'jmv 12/3/2011 02:36'!
getMenu

	^self editor getMenu! !

!InnerTextMorph methodsFor: 'menu' stamp: 'jmv 11/9/2011 17:57'!
wrapOnOff
	self wrapFlag: wrapFlag not! !

!InnerTextMorph methodsFor: 'menu' stamp: 'jmv 11/9/2011 17:57'!
wrapString
	"Answer the string to put in a menu that will invite the user to 
	switch word wrap mode"
	^ (wrapFlag
		ifTrue: ['<yes>']
		ifFalse: ['<no>'])
		, 'text wrap to bounds'! !


!InnerTextMorph methodsFor: 'submorphs-add/remove' stamp: 'jmv 9/22/2012 15:10'!
addMorphFrontFromWorldPosition: aMorph
	"Overridden for more specific re-layout and positioning"
	| positionInWorld |
	positionInWorld _ aMorph morphPositionInWorld.
	^self anchorMorph: aMorph at: positionInWorld! !


!InnerTextMorph methodsFor: 'private' stamp: 'jmv 6/21/2015 14:11'!
autoCompleterClass: aTextCompleterClass
	autoCompleter class == aTextCompleterClass ifFalse: [
		autoCompleter _ aTextCompleterClass ifNotNil: [
			aTextCompleterClass withModel: model ].
		autoCompleter ifNotNil: [
			autoCompleter textMorph: self ]]! !

!InnerTextMorph methodsFor: 'private' stamp: 'jmv 9/7/2012 19:46'!
extentForComposing
	self flag: #jmvVer2.	"like #extent ..."
	^wrapFlag
		ifTrue: [ extent x @ 9999999 ]
		ifFalse: [ 9999999@9999999 ]! !

!InnerTextMorph methodsFor: 'private' stamp: 'jmv 1/29/2015 09:46'!
fit
	"Adjust my bounds to fit the text.
	Required after the text changes,
	or if wrapFlag is true and the user attempts to change the extent."

	| newExtent newHeight newWidth |
	newWidth _ extent x.
	"Adjust width only if we don't wrap text to own width!!"
	wrapFlag ifFalse: [
		newWidth _ self textComposition usedWidth max: 9 ].
	newHeight _ self textComposition usedHeight max: AbstractFont default height + 2.
	newExtent _ newWidth @ newHeight.
	extent = newExtent 
		ifTrue: [
			self redrawNeeded.
			"Too conservative: only text composition (because of changes in text or styles, etc)
			should cause invalidation.
			Try to avoid calling #fit unless needed."
		]
		ifFalse: [
			extent = newExtent ifFalse: [
				self redrawNeeded.
				extent _ newExtent.
				self someSubmorphPositionOrExtentChanged.
				owner ifNotNil: [ owner someSubmorphPositionOrExtentChanged ].
				self redrawNeeded ]].

	owner innerHeight: newExtent y! !

!InnerTextMorph methodsFor: 'private' stamp: 'jmv 6/21/2015 14:13'!
installEditorAndTextComposition
	"Install an editor for my textComposition. Install also the textComposition."
	| e tc |
	
	"Editor and TextComposition are assigned here atomically."
	e _ model editorClass new morph: self.
	e model: model.
	tc _ TextComposition new.
	"Keep critical section short"
	self mutex critical: [
		editor _ e.
		textComposition _ tc ].
	tc
		setModel: model;
		extentForComposing: self extentForComposing.
	e textComposition: tc.
	tc editor: e.
	e setEmphasisHereFromText.
	tc composeAll.
	e resetState.
	self fit.
	self selectionChanged.

	"Add extras. Text Styler and Autocompleter"
	self stylerClass:
		(Preferences syntaxHighlightingAsYouType ifTrue: [
			model textStylerClass ]).
	self autoCompleterClass:
		model autoCompleterClass! !

!InnerTextMorph methodsFor: 'private' stamp: 'jmv 1/27/2013 00:50'!
mouseButton2Activity
	"Invoke the menu"
	self getMenu ifNotNil: [ :menu |
		menu popUpInWorld: self world.
		"menu invokeModal" ]! !

!InnerTextMorph methodsFor: 'private' stamp: 'jmv 9/19/2012 23:05'!
mutex
	mutex
		ifNil: [ mutex := Mutex new ].
	^mutex! !

!InnerTextMorph methodsFor: 'private' stamp: 'jmv 10/16/2013 20:01'!
releaseEditorAndTextComposition
	"Editor and TextComposition instantiation is lazy -- they will be created only when needed"

	editor _ nil.
	textComposition _ nil! !

!InnerTextMorph methodsFor: 'private' stamp: 'jmv 11/9/2011 17:57'!
removedMorph: aMorph

	editor removeMorph: aMorph.
	self fit.
	super removedMorph: aMorph! !

!InnerTextMorph methodsFor: 'private' stamp: 'jmv 10/16/2013 20:02'!
resetTextComposition
	textComposition ifNotNil: [
		textComposition
			initialize;
			extentForComposing: self extentForComposing;
			composeAll.
		editor storeSelectionInComposition ].
	self fit.
	self selectionChanged.! !

!InnerTextMorph methodsFor: 'private' stamp: 'jmv 7/18/2014 14:53'!
selectionChanged

	self textComposition selectionRects do: [:r | self invalidateLocalRect: r ]! !

!InnerTextMorph methodsFor: 'private' stamp: 'jmv 6/21/2015 14:12'!
stylerClass: aTextStylerClass
	styler class == aTextStylerClass ifFalse: [
		styler _ aTextStylerClass ifNotNil: [
			aTextStylerClass new ].
		styler ifNotNil: [
			model ifNotNil: [
				styler textModel: model ]]]! !

!InnerTextMorph methodsFor: 'private' stamp: 'jmv 5/5/2014 07:03'!
textComposition
	"textComposition instantiation is lazy -- create it only when needed"
	textComposition ifNil: [ self installEditorAndTextComposition ].
	^textComposition! !

!InnerTextMorph methodsFor: 'private' stamp: 'jmv 10/16/2013 20:02'!
updateFromTextComposition
	"A change has taken place in my textComposition, as a result of editing and I must be updated. "

	textComposition ifNotNil: [
		editor storeSelectionInComposition.
		self fit ].

	owner
		updateScrollBarsBounds;
		setScrollDeltas! !


!InnerTextMorph methodsFor: 'notifications' stamp: 'jmv 4/8/2016 09:37'!
possiblyChanged
	| embeddedMorphs |
	embeddedMorphs _ model actualContents embeddedMorphs.
	self submorphsDo: [:each| 
		(embeddedMorphs includes: each) ifFalse: [
			self privateRemove: each.
			each privateOwner: nil ]].
	embeddedMorphs do: [:each| each owner == self ifFalse: [self addMorphFront: each]].
	owner possiblyChanged! !

!InnerTextMorph methodsFor: 'notifications' stamp: 'jmv 4/7/2016 18:20'!
someSubmorphPositionOrExtentChanged
	"Our extent, or some submorph changed. Must layout submorphs again."

	super someSubmorphPositionOrExtentChanged.
	textComposition ifNotNil: [ 
		textComposition composeAll.
		self fit.
		self selectionChanged ]! !


!InnerTextMorph methodsFor: 'testing' stamp: 'jmv 11/9/2011 17:57'!
canDiscardEdits
	"Return true if this view either has no text changes or does not care."
	^ (hasUnacceptedEdits & askBeforeDiscardingEdits) not! !

!InnerTextMorph methodsFor: 'testing' stamp: 'jmv 11/9/2011 17:57'!
hasUnacceptedEdits
	^hasUnacceptedEdits! !


!InnerTextMorph methodsFor: 'blinking cursor' stamp: 'jmv 12/4/2015 15:35'!
onBlinkCursor
	"Blink the cursor"
	textComposition ifNil: [ ^nil ].
	textComposition showTextCursor: textComposition showTextCursor not | pauseBlinking.
	pauseBlinking _ false.
	textComposition lastTextCursorRect ifNotNil: [ :r | self invalidateLocalRect: r].! !

!InnerTextMorph methodsFor: 'blinking cursor' stamp: 'jmv 2/5/2015 00:33'!
pauseBlinking
	"Show a solid cursor (non blinking) for a short while"
	pauseBlinking _ true.
	textComposition ifNotNil: [
		self showsBlinkingCursor ifTrue: [
			"Show cursor right now if needed"
			textComposition showTextCursor ifFalse: [
				textComposition showTextCursor: true ]]]! !

!InnerTextMorph methodsFor: 'blinking cursor' stamp: 'jmv 2/5/2015 00:45'!
showsBlinkingCursor

	^self handlesKeyboard and: [ self disablesEdition not ]! !

!InnerTextMorph methodsFor: 'blinking cursor' stamp: 'jmv 2/2/2014 22:18'!
startBlinking
	"And show the cursor"
	pauseBlinking _ true.
	"Start blinking in a short while"
	textComposition ifNotNil: [ textComposition showTextCursor: true ].
	self startStepping: #onBlinkCursor stepTime: 500! !

!InnerTextMorph methodsFor: 'blinking cursor' stamp: 'jmv 2/2/2014 22:45'!
stopBlinking
	"And do not show cursor anymore."
	self stopStepping: #onBlinkCursor.
	textComposition ifNotNil: [
		textComposition showTextCursor: false ]! !


!InnerTextMorph methodsFor: 'accept/cancel' stamp: 'jmv 11/9/2011 17:57'!
acceptOnCR: trueOrFalse
	acceptOnCR _ trueOrFalse! !


!InnerTextMorph methodsFor: 'macpal' stamp: 'jmv 11/15/2011 16:01'!
flash
	^ owner flash! !


!InnerTextMorph methodsFor: 'miscellaneous' stamp: 'jmv 11/9/2011 17:57'!
disregardUnacceptedEdits

	^ self hasUnacceptedEdits: false! !

!InnerTextMorph methodsFor: 'miscellaneous' stamp: 'jmv 11/9/2011 17:57'!
selectAll
	"Tell my editor to select all the text"

	self editor selectAll.
	self redrawNeeded! !


!InnerTextMorph methodsFor: 'shout' stamp: 'jmv 11/9/2011 17:57'!
formatAndStyleIfNeeded
	"Apply both formatting (changes to the characters in the text, such as
	preferred assignment operators), and styling (TextAttributes to make
	Smalltalk code easier to understand)"

	self okToStyle ifTrue: [
		styler formatAndStyle ]! !

!InnerTextMorph methodsFor: 'shout' stamp: 'jmv 11/9/2011 17:57'!
okToStyle
	styler ifNil: [ ^false ].
	^model shoutAboutToStyle: styler! !

!InnerTextMorph methodsFor: 'shout' stamp: 'jmv 10/16/2013 19:55'!
stylerStyled

	self textComposition composeAll.
	self editor recomputeSelection.	
	self updateFromTextComposition.
	self editor blinkParen.
	self scrollSelectionIntoView! !


!InnerTextMorph methodsFor: 'selection' stamp: 'jmv 7/29/2012 15:12'!
scrollSelectionIntoView

	(owner is: #ScrollPane) ifTrue: [
		owner scrollSelectionIntoView ]! !


!InnerTextMorph methodsFor: 'classification' stamp: 'jmv 11/14/2011 16:52'!
is: aSymbol
	^ aSymbol == #InnerTextMorph or: [ super is: aSymbol ]! !


!InnerTextMorph methodsFor: '*Ledgerdemain' stamp: 'dhn 4/10/2016 12:19'!
mouseButton1Down: aMouseButtonEvent localPosition: localEventPosition
	"Make this TextMorph be the keyboard input focus, if it isn't already,
		and repond to the text selection gesture."

	"If we don't focus, Get focus, and do nothing else (the user will need to click again to do further interaction)"
	self hasKeyboardFocus ifFalse: [
		^aMouseButtonEvent hand newKeyboardFocus: self].

	super mouseButton1Down: aMouseButtonEvent localPosition: localEventPosition.

	self handleInteraction: [ 
		self owner class = EntryField
			ifTrue: [
				self owningWindow triggerEvent: #mouseSelected withArguments: {self owner position}].
		editor mouseButton1Down: aMouseButtonEvent localPosition: localEventPosition ].

	aMouseButtonEvent hand
		waitForClicksOrDragOrSimulatedMouseButton2: self
		event: aMouseButtonEvent
		clkSel: nil
		clkNHalf: #clickAndHalf:localPosition:
		dblClkSel: nil
		dblClkNHalfSel: #doubleClickAndHalf:localPosition:
		tripleClkSel: nil! !
