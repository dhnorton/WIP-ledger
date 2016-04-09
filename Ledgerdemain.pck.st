'From Cuis 4.2 of 25 July 2013 [latest update: #2727] on 8 April 2016 at 10:02:42.453339 pm'!
'Description A description for this package will be supplied.'!
!provides: 'Ledgerdemain' 1 212!
!requires: 'Records' 1 10 nil!
!classDefinition: #Account category: #Ledgerdemain!
Object subclass: #Account
	instanceVariableNames: 'accountName type ledger balOpen openDate balRcon balCur lastCheck'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'Account class' category: #Ledgerdemain!
Account class
	instanceVariableNames: ''!

!classDefinition: #LedgerDeMain category: #Ledgerdemain!
TextModel subclass: #LedgerDeMain
	instanceVariableNames: 'directory accounts accountListIndex selectedAccount net modified transactionList transactionListIndex selectedTransaction entryTable netString'
	classVariableNames: 'Categories Memos Payees Type'
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'LedgerDeMain class' category: #Ledgerdemain!
LedgerDeMain class
	instanceVariableNames: ''!

!classDefinition: #LedgerCompleter category: #Ledgerdemain!
AutoCompleter subclass: #LedgerCompleter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'LedgerCompleter class' category: #Ledgerdemain!
LedgerCompleter class
	instanceVariableNames: ''!

!classDefinition: #LedgerCalculator category: #Ledgerdemain!
Object subclass: #LedgerCalculator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'LedgerCalculator class' category: #Ledgerdemain!
LedgerCalculator class
	instanceVariableNames: ''!

!classDefinition: #Reconciliation category: #Ledgerdemain!
Morph subclass: #Reconciliation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'Reconciliation class' category: #Ledgerdemain!
Reconciliation class
	instanceVariableNames: ''!

!classDefinition: #LedgerCompleterMorph category: #Ledgerdemain!
AutoCompleterMorph subclass: #LedgerCompleterMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'LedgerCompleterMorph class' category: #Ledgerdemain!
LedgerCompleterMorph class
	instanceVariableNames: ''!

!classDefinition: #EntryField category: #Ledgerdemain!
TextModelMorph subclass: #EntryField
	instanceVariableNames: 'textModel position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'EntryField class' category: #Ledgerdemain!
EntryField class
	instanceVariableNames: ''!

!classDefinition: #LedgerWindow category: #Ledgerdemain!
SystemWindow subclass: #LedgerWindow
	instanceVariableNames: 'windowAccountList windowLedgerList windowEntries entryIndex entryTable keyboardFocus typeIndex'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'LedgerWindow class' category: #Ledgerdemain!
LedgerWindow class
	instanceVariableNames: ''!

!classDefinition: #InnerTextMorph category: #Ledgerdemain!
InnerPluggableMorph subclass: #InnerTextMorph
	instanceVariableNames: 'model char wrapFlag textComposition editor pauseBlinking acceptOnCR hasUnacceptedEdits hasEditingConflicts askBeforeDiscardingEdits styler autoCompleter mutex'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'InnerTextMorph class' category: #Ledgerdemain!
InnerTextMorph class
	instanceVariableNames: ''!

!classDefinition: #Repository category: #Ledgerdemain!
Object subclass: #Repository
	instanceVariableNames: 'trail'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'Repository class' category: #Ledgerdemain!
Repository class
	instanceVariableNames: ''!

!classDefinition: #Suggestion category: #Ledgerdemain!
Object subclass: #Suggestion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'Suggestion class' category: #Ledgerdemain!
Suggestion class
	instanceVariableNames: ''!

!classDefinition: #Payee category: #Ledgerdemain!
Suggestion subclass: #Payee
	instanceVariableNames: 'last'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'Payee class' category: #Ledgerdemain!
Payee class
	instanceVariableNames: ''!

!classDefinition: #Transaction category: #Ledgerdemain!
Object subclass: #Transaction
	instanceVariableNames: 'key account date check payee category memo reconciled amount type balance transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'Transaction class' category: #Ledgerdemain!
Transaction class
	instanceVariableNames: ''!


!Account commentStamp: 'dhn 6/24/2015 10:49' prior: 0!
Account responsibilities:

  maintain ledger as collection of transactions
  maintain name
  maintain opening balance, reconciled balance, current balance
  do transfers
  edit transactions and record in audit trail 
  enter transactions and record in audit trail 
  delete transactions and record in audit trail
  reconcile
  report
  export and import!

!LedgerDeMain commentStamp: 'dhn 2/13/2016 12:00' prior: 0!
LedgerDeMain is the model for LedgerWindow. Its responsibilities are:

  hold accounts, payees, categories, memos
  search
  maintain net worth
  back up and restore
  move transactions between accounts

With apologies to those who do legerdemain.

recorded date _ Date today julianDayNumber - Time squeakEpoch.
recorded amount _ amount as cents. (examples: 2995 500)
reported amount _ dollars (examples: 29.95 5.00)!

!LedgerCompleter commentStamp: 'dhn 11/9/2015 15:31' prior: 0!
The AutoCompleter for LedgerDeMain.!

!LedgerCalculator commentStamp: 'dhn 2/13/2016 21:13' prior: 0!
A rudimentary calculator for arithmetic expressions containing '+-*/' and decimal numbers.

The result is formatted for ledger credits or debits.

One or more digits must occur before the decimal point.!

!Reconciliation commentStamp: 'dhn 6/12/2015 19:10' prior: 0!
Reconciliation responsibilities:

  report withdrawals and deposits
  update ledger
!

!LedgerCompleterMorph commentStamp: 'dhn 11/9/2015 17:10' prior: 0!
The auto completion menu for Ledgerdemain.!

!EntryField commentStamp: 'dhn 3/1/2016 11:43' prior: 0!
A data entry and display morph with the ability to encapsulate a symbol of the method which loads the Trie for a completer.!

!LedgerWindow commentStamp: 'dhn 2/13/2016 11:58' prior: 0!
A view for Ledger d'Main. Provides pop-up menu for options.

The window is a LedgerWindow (a view).
The window's model is a LedgerDeMain.

	LedgerWindow open.
!

!InnerTextMorph commentStamp: '<historical>' prior: 0!
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

	My styler informs me that it has finished styling by triggering the #stylerStyled: and #stylerStyledInBackground: events which I handle. I then update the textAttributes of my text and refresh the display.
 
	My 'unstyledAcceptText' instance variable is used in conjunction with my #acceptTextInModel and #correctFrom:to:with: methods to ensure that when my text is modified during a method compilation (removing unused vars etc), I do not lose those changes.!

!Repository commentStamp: 'dhn 6/12/2015 19:12' prior: 0!
Repository responsibilities:

  maintain audit trail
  search
  report!

!Suggestion commentStamp: 'dhn 6/12/2015 18:48' prior: 0!
Suggestion (an abstract class) reponsibilities:

  autotype
!

!Payee commentStamp: '<historical>' prior: 0!
Payee responsibilities:

  hold last transaction, by category
!

!Transaction commentStamp: 'dhn 6/24/2015 10:51' prior: 0!
Transaction responsibilities:

  hold date, [serial], type, payee, amount, category, memo, reconciled, transfer
  provide entry suggestions for date, serial, payee, category, amount
  update serial, payee, category, memo
  split categories
  record actions in audit trail
!

!Integer methodsFor: '*Ledgerdemain' stamp: 'cmm 6/8/2012 15:43'!
asStringWithCommasSigned: aBoolean
	"123456789 asStringWithCommasSigned: true"
	"-123456789 asStringWithCommasSigned: false"
	| digits |
	digits := self abs printString.
	^ String streamContents:
		[:strm | 
		self sign = -1 ifTrue: [strm nextPut: $-] ifFalse: [aBoolean ifTrue: [strm nextPut: $+]].
		1 to: digits size do: 
			[:i | strm nextPut: (digits at: i).
			(i < digits size and: [(i - digits size) \\ 3 = 0])
				ifTrue: [strm nextPut: $,]]]! !

!Integer methodsFor: '*Ledgerdemain' stamp: 'dhn 8/8/2015 21:04'!
ledgerFormatted
	"Answer the receiver as a string with commas to two decimal places. It will be signed only if negative."
	| x int frac partA str pos ios |
	x _ (self / 100) roundTo: 0.01.
	int _ x integerPart truncated.
	partA _ int asStringWithCommasSigned: false.
	ios _ String new writeStream.
	ios nextPutAll: partA.
	frac _ x fractionPart roundTo: 0.01.
	str _ frac asString.
	pos _ str findFirst: [:a | a = $.].
	str size - pos < 2 ifTrue: [str _ str, '0'].
	ios nextPutAll: (str copyFrom: pos count: 3).
	^ ios contents! !

!HandMorph methodsFor: '*Ledgerdemain' stamp: 'dhn 3/14/2016 17:35'!
generateKeyboardEvent: evtBuf 
	"Generate the appropriate mouse event for the given raw event buffer"

	| buttons modifiers type keyValue pressType stamp |
	stamp _ evtBuf second.
	stamp = 0 ifTrue: [stamp _ Time localMillisecondClock].
	(evtBuf sixth <= 0 or: [
		(keyValue _ (Character iso8859s15CodeForUnicodeCodePoint: evtBuf sixth)) isNil ])
			ifTrue: [ keyValue _ Character macRomanToLatin1: evtBuf third ].

	"start: Combining diacritical marks (i.e. accents in the Linux VM)"
	(Sensor peekEvent) ifNotNil: [ :nxt |
		(nxt fourth = EventSensor eventKeyDown and:[ nxt third >255 ])
			ifTrue: [
				keyValue _ ((Character value: keyValue) withDiacriticalMark: nxt third) iso8859s15Code.
				Sensor nextEvent; nextEvent; nextEvent
				]].
	"end: Combining diacritical marks (i.e. accents in the Linux VM)"

	modifiers _ evtBuf fifth.
	pressType _ evtBuf fourth.
	pressType = EventSensor eventKeyDown ifTrue: [
		type _ #keyDown.
		lastKeyDownValue _ keyValue].
	pressType = EventSensor eventKeyUp ifTrue: [type _ #keyUp].
	pressType = EventSensor eventKeyChar ifTrue: [
		type _ #keystroke.
		"If Control key pressed, and the VM answers a code below 27,
		 it means it did the translation, convert it back to regular character:
		We want to handle the meaning of ctrl ourselves."
		(modifiers anyMask: 2) ifTrue: [		"Control key pressed"
			keyValue < 27 ifTrue: [
				
				"But we don't want to do it for Home/End/PgUp/PgDn, just for alphabetic keys"
				lastKeyDownValue = keyValue ifFalse: [		"If equal, real Home/End/PgUp/PgDn in Windows => don't translate"
					(keyValue + 64 = lastKeyDownValue or: [ 	"If Equal, Ctrl-alphabetic in Windows => do translate"
							lastKeyDownValue < 47 ]) ifTrue: [		"Not on windows. If less (not sure about the bound, but do not translate 48: tab on Mac), alphabetic on Mac => do translate"
						keyValue _ (modifiers anyMask: 1)
							ifFalse: [ keyValue + 96 ]	"shift not pressed: conver to lowercase letter"
							ifTrue: [ keyValue + 64 ]].	"shift pressed: conver to uppercase letter"
					]
				].
			"Act as if command/alt was pressed for some usual Windows ctrl-key combinations"
			(self shouldControlEmulateAltFor: keyValue) ifTrue: [
				modifiers _ modifiers bitOr: 8 ]
			]].
	buttons _ modifiers bitShift: 3.
	(self class specialKeys includes: keyValue)
		ifTrue: [ | win |
			win _ owner findDeepSubmorphThat: [:m | m class = LedgerWindow] ifAbsent: [nil].
			win ifNotNil: [
				win isTopWindow ifTrue: [
					win triggerEvent: #specialKey withArguments: {keyValue. type. buttons}.
					^ nil]]]. 
	^KeyboardEvent new 
		setType: type
		buttons: buttons
		position: self morphPosition
		keyValue: keyValue
		hand: self
		stamp: stamp! !

!HandMorph class methodsFor: '*Ledgerdemain' stamp: 'dhn 4/8/2016 21:39'!
specialKeys
	"Answer the event keyValue for keys which receive special processing"
	
	^ #(
		28 		"left arrow"
		29 		"right arrow"
		10 		"ctl-enter"
		43 		"+ (plus)"
		45 		"- (minus)"
	)! !

!Account methodsFor: 'accessing' stamp: 'dhn 8/7/2015 11:38'!
accountName
	"Answer the value of accountName"

	^ accountName! !

!Account methodsFor: 'accessing' stamp: 'dhn 8/7/2015 11:38'!
accountName: anObject
	"Set the value of accountName"

	accountName _ anObject! !

!Account methodsFor: 'accessing' stamp: 'dhn 6/13/2015 20:10'!
balCur
	"Answer the value of balCur"

	^ balCur! !

!Account methodsFor: 'accessing' stamp: 'dhn 6/13/2015 20:10'!
balCur: anObject
	"Set the value of balCur"

	balCur _ anObject! !

!Account methodsFor: 'accessing' stamp: 'dhn 6/13/2015 20:10'!
balOpen
	"Answer the value of balOpen"

	^ balOpen! !

!Account methodsFor: 'accessing' stamp: 'dhn 6/13/2015 20:10'!
balOpen: anObject
	"Set the value of balOpen"

	balOpen _ anObject! !

!Account methodsFor: 'accessing' stamp: 'dhn 6/13/2015 20:10'!
balRcon
	"Answer the value of balRcon"

	^ balRcon! !

!Account methodsFor: 'accessing' stamp: 'dhn 6/13/2015 20:10'!
balRcon: anObject
	"Set the value of balRcon"

	balRcon _ anObject! !

!Account methodsFor: 'initialization' stamp: 'dhn 3/17/2016 16:12'!
initialize

	balOpen _ 0.
	balRcon _ 0.
	balCur _ 0.
	lastCheck _ 0.
	ledger _ SortedCollection sortBlock: [:a :c | a key < c key]! !

!Account methodsFor: 'accessing' stamp: 'dhn 3/15/2016 15:16'!
lastCheck
	"Answer the value of lastCheck"

	^ lastCheck! !

!Account methodsFor: 'accessing' stamp: 'dhn 3/15/2016 15:16'!
lastCheck: anObject
	"Set the value of lastCheck"

	lastCheck _ anObject! !

!Account methodsFor: 'accessing' stamp: 'dhn 6/13/2015 20:10'!
ledger
	"Answer the value of ledger"

	^ ledger! !

!Account methodsFor: 'accessing' stamp: 'dhn 6/13/2015 20:10'!
ledger: anObject
	"Set the value of ledger"

	ledger _ anObject! !

!Account methodsFor: 'accessing' stamp: 'dhn 3/21/2016 21:00'!
listLedgerLines
	"Answer the transaction content in a form suitable for the ledger list"
	| col |

	col _ OrderedCollection new.			
	balCur _ balOpen.
	ledger do: [:ea | 
		balCur _ balCur + ea amount asNumber.
		col addLast: ea formatTransaction].
	^ col! !

!Account methodsFor: 'accessing' stamp: 'dhn 3/24/2016 16:54'!
loadTransaction: anObject
	"Update balances and add anObject to the ledger"
	| amt ck |
	
	amt _ anObject amount.
	
	anObject reconciled = 'R' ifTrue: [self balRcon: self balRcon + amt].
	
	((ck _ anObject check) allSatisfy: [:ea | ea isDigit])
		ifTrue: [lastCheck _ lastCheck max: ck asNumber].
		
	self ledger add: anObject! !

!Account methodsFor: 'accessing' stamp: 'dhn 7/1/2015 14:49'!
openDate
	"Answer the value of openDate"

	^ openDate! !

!Account methodsFor: 'accessing' stamp: 'dhn 7/1/2015 14:49'!
openDate: anObject
	"Set the value of openDate"

	openDate _ anObject! !

!Account methodsFor: 'accessing' stamp: 'dhn 4/5/2016 11:10'!
type
	"Answer the value of type"

	^ type! !

!Account methodsFor: 'accessing' stamp: 'dhn 4/5/2016 11:10'!
type: anObject
	"Set the value of type"

	type _ anObject! !

!LedgerDeMain methodsFor: 'transaction' stamp: 'dhn 4/5/2016 15:15'!
acceptTransaction: aTransaction
	"Put aTransaction in the ledger"
	| match |
	
	match _ selectedAccount ledger detect: [:a | a key = aTransaction key] ifNone: [nil].
	(self transactionCurrent notNil and: [match notNil])
		ifTrue: [ | b |
			b _ PopUpMenu 
				confirm: 'Regarding your entered data...'
				trueChoice: 'replace the selected transaction'
				falseChoice: 'insert a new transaction'.
			b ifTrue: [
				selectedAccount ledger remove: self transactionCurrent ifAbsent: [nil]].
				self transactionListIndex: 0 	"deselect removed transaction"].
	selectedAccount ledger add: aTransaction.
	self transactionListIndex: (selectedAccount ledger findFirst: [:a | a key = aTransaction key]).
	self changed: #xactList.
	self changed: #acctList! !

!LedgerDeMain methodsFor: 'account' stamp: 'dhn 4/5/2016 14:28'!
accountList
	"Answer a list of accounts"

	^ accounts
		ifNil: [#()]
		ifNotNil: [accounts collect: [:a | self formatAccount: a]]! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 10/20/2015 20:03'!
accountListIndex
	"Answer the value of accountListIndex"

	accounts ifNil: [^ accountListIndex _ 0].
	^ accountListIndex _ accounts indexOf: selectedAccount! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 3/28/2016 21:24'!
accountListIndex: index
	"Set the value of accountListIndex"

	accountListIndex _ index.
	self selectedAccount:
		(accounts at: index ifAbsent: nil).
	self transactionListIndex: transactionList size.
	self changed: #acctList.
	self changed: #lastOnList
	! !

!LedgerDeMain methodsFor: 'account' stamp: 'dhn 4/5/2016 11:11'!
accountNamed: aString type: aSymbol opening: amount at: date
	"Answer an account named aString of type aSymbol with an opening balance of amount as of date"
	| acct amt rec |
	
	acct _ Account new accountName: aString.
	amt _ LedgerWindow dollarsToCents: amount.
	acct
		type: aSymbol;
		openDate: (LedgerWindow asLdmDate: date);
		balOpen: amt;
		balCur: amt;
		balRcon: amt.
	rec _ Transaction new account: acct.
	rec
		date: acct openDate;
		payee: '**Opening Balance';
		reconciled: 'R';
		type: '';
		amount: 0;
		category: '';
		memo: '';
		transfer: '';
		check: '';
		balance: acct balOpen ledgerFormatted.
	acct ledger add: rec.
	^ acct! !

!LedgerDeMain methodsFor: 'account' stamp: 'dhn 10/15/2015 13:09'!
accounts
	"Answer the value of accounts"

	accounts ifNil: [accounts _ OrderedCollection new].
	^ accounts! !

!LedgerDeMain methodsFor: 'account' stamp: 'dhn 11/11/2015 16:15'!
accounts: anObject
	"Save anObject in accounts"

	self accounts addLast: anObject.
	self selectedAccount: anObject.
	self computeNet.
	self modified: true.
	self changed: #acctList.
	self changed: #xactList
! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/23/2015 21:28'!
addCategory: aString
	"Add category named aString"
	| x |
	x _ aString findDelimiters: '.' startingAt: 1. 
	x > aString size 
		ifTrue: [self categories at: aString put: 1] "primary category"
		ifFalse: [self categories at: aString put: 2]. "sub-category"
	self modified: true! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/25/2015 11:29'!
categories
	"Answer the value of Categories"

	Categories ifNil: [Categories _ Trie new].
	^ Categories! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/24/2015 11:21'!
categories: anObject
	"Save anObject in categories"

	(self categories includesKey: anObject)
		ifFalse: [self addCategory: anObject]! !

!LedgerDeMain methodsFor: 'save & restore' stamp: 'dhn 4/3/2016 16:02'!
categoriesFromFile
	"Copy category names from a file and add them to the categories ivar"
	| file ios line |
	file _ FillInTheBlankMorph request: 'Name of categories File:' initialAnswer: 'c:\directory\file.ext'.
	file ~= '' ifTrue: [
		ios _ ReadStream on: file asFileEntry fileContents.
		[(line _ ios nextLine) notNil]
			whileTrue: [	line size > 0 ifTrue: [self addCategory: line]].
		ios close]! !

!LedgerDeMain methodsFor: 'account' stamp: 'dhn 4/3/2016 15:36'!
computeNet
	"Display the net sum of all accounts"
	| ttl str |
	
	ttl _ 0.
	accounts
		ifNotNil: [accounts do: [:a | ttl _ ttl + a balCur]]
		ifNil: [ttl _ 0].
	(str _ String new writeStream)
		nextPutAll: '    Net'.
	ttl >= 0
		ifTrue: [
			netString color: Color black.
			str nextPutAll: ' Total  ']
		ifFalse: [
			netString color: Color red.
			str nextPutAll: ' Loss  '].
	ttl _ LedgerWindow centsToDollars: ttl abs.
	str 
		nextPut: $$;
		nextPutAll: ttl first;
		nextPut: $.;
		nextPutAll: ttl second.
	netString contents: str contents.
! !

!LedgerDeMain methodsFor: 'transaction' stamp: 'dhn 4/3/2016 12:47'!
deleteTransaction
	"Remove the selected entry from the ledger"
	
	transactionListIndex > 1
		ifTrue: [
			self selectedAccount ledger 
				remove: (self selectedAccount ledger at: transactionListIndex) ifAbsent: [].
				self changed: #xactList]
		ifFalse: [
			transactionListIndex = 1 
				ifTrue: [self inform: 'can not delete opening balance']
				ifFalse: [self inform: 'no entry is selected']]
	! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 3/17/2016 18:30'!
directory
	"Answer the value of directory"

	^ directory! !

!LedgerDeMain methodsFor: 'initialization' stamp: 'dhn 10/13/2015 21:11'!
directory: dir
	"Set the path of the directory containing the accounts."

	directory _ dir! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 4/8/2016 19:30'!
entryTable: index
	"Answer the value of entryTable"

	^ #(Payee Category Memo) at: index - 2! !

!LedgerDeMain methodsFor: 'account' stamp: 'dhn 4/5/2016 14:54'!
formatAccount: anAccount 
	"Answer a justified string with name and current balance"
	| t s1 s2 str |
	
	t _ 27.	"desired line length"
	s1 _ anAccount accountName.
	s2 _ anAccount balCur ledgerFormatted.
	(str _ String new writeStream)
		nextPutAll: (s1 padded: #right to: (t - (s2 size)) with: $ );
		nextPutAll: s2.
	^ str contents! !

!LedgerDeMain methodsFor: 'entry' stamp: 'dhn 4/2/2016 23:04'!
getCategory
	"Answer the category"
	
	transactionListIndex = 0
		ifTrue: [^ self actualContents asString]
		ifFalse: [^ self transactionCurrent category withoutTrailingBlanks]! !

!LedgerDeMain methodsFor: 'entry' stamp: 'dhn 4/2/2016 23:05'!
getCheck
	"Answer the check number"
	
	transactionListIndex = 0
		ifTrue: [^'']
		ifFalse: [^ self transactionCurrent check withoutTrailingBlanks]! !

!LedgerDeMain methodsFor: 'entry' stamp: 'dhn 4/2/2016 23:05'!
getCredit
	"Answer the amount if positive; '' otherwise"
	| x |
	
	transactionListIndex = 0
		ifTrue: [x _ '']
		ifFalse: [
			self transactionCurrent amount < 0 
				ifTrue: [x _ '']
				ifFalse: [x _ self transactionCurrent amount ledgerFormatted]].
		
	^ x! !

!LedgerDeMain methodsFor: 'entry' stamp: 'dhn 4/2/2016 23:07'!
getDate
	"Answer the date"
	
	transactionListIndex = 0
		ifTrue: [
			selectedAccount ifNotNil: [^ (Date fromDays: self transactionLast date) mmddyyyy].
			selectedAccount ifNil: [^'']]
		ifFalse: [^ (Date fromDays: self transactionCurrent date) mmddyyyy]! !

!LedgerDeMain methodsFor: 'entry' stamp: 'dhn 4/2/2016 23:08'!
getDebit
	"Answer the amount if negative; '' otherwise"
	| x |
	
	transactionListIndex = 0
		ifTrue: [x _ '']
		ifFalse: [
			self transactionCurrent amount >= 0 
				ifTrue: [x _ '']
				ifFalse: [x _ self transactionCurrent amount negated ledgerFormatted]].
		
	^ x! !

!LedgerDeMain methodsFor: 'entry' stamp: 'dhn 4/2/2016 23:08'!
getMemo
	"Answer the memo"
	
	transactionListIndex = 0
		ifTrue: [^ '']
		ifFalse: [^ self transactionCurrent memo withoutTrailingBlanks]! !

!LedgerDeMain methodsFor: 'entry' stamp: 'dhn 4/2/2016 23:08'!
getPayee
	"Answer the payee"
	
	transactionListIndex = 0
		ifTrue: [^ '']
		ifFalse: [^ self transactionCurrent payee withoutTrailingBlanks]! !

!LedgerDeMain methodsFor: 'entry' stamp: 'dhn 4/2/2016 23:09'!
getR
	"Answer the reconciled indicator"
	
	transactionListIndex = 0
		ifTrue: [^ '']
		ifFalse: [^ self transactionCurrent reconciled]! !

!LedgerDeMain methodsFor: 'transaction' stamp: 'dhn 4/8/2016 21:49'!
growTries: aTransaction
	"Populate tries with data from aTransaction"
	
	self
		categories: aTransaction category withoutTrailingBlanks;
		payees: aTransaction payee withoutTrailingBlanks;
		memos: aTransaction memo withoutTrailingBlanks;
		type: aTransaction type withoutTrailingBlanks
		
! !

!LedgerDeMain methodsFor: 'initialization' stamp: 'dhn 4/3/2016 16:05'!
initialize
	"initialize the state of the receiver"

	super initialize.
	self transactionListIndex: 0.
	modified _ false.
	netString _ ''.
	self changed: #acctList.
	self changed: #xactList! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 4/3/2016 15:24'!
list: aSymbol
	"Show the results of the method named aSymbol in a SelectionMenu"
	| entries rcvr pick |
	
	entries _ OrderedCollection new.
	rcvr _ self perform: aSymbol.
	rcvr keysDo: [:k | entries add: k].
	entries size = 0 ifTrue: [^ Smalltalk beep].
	pick _ (SelectionMenu selections: entries) startUpMenu.
	TextEditor  new clipboardTextPut:  pick
! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 7/1/2015 14:17'!
listType

	Type ifNotNil: [Type keysDo: [:k |
		Transcript show: k; newLine]]
! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/25/2015 11:42'!
memos
	"Answer the value of Memos"

	Memos ifNil: [Memos _ Trie new].
	^ Memos! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/24/2015 19:43'!
memos: anObject
	"Save anObject in memos:"

	(self memos includesKey: anObject)
		ifFalse: [self memos at: anObject put: 1]! !

!LedgerDeMain methodsFor: 'save & restore' stamp: 'dhn 4/3/2016 16:02'!
memosFromFile
	"Copy memos from a file and add them to the memos ivar"
	| file ios line |
	file _ FillInTheBlankMorph request: 'Name of memos file:' initialAnswer: 'c:\directory\file.ext'.
	file ~= '' ifTrue: [
		ios _ ReadStream on: file asFileEntry fileContents.
		[(line _ ios nextLine) notNil]
			whileTrue: [	line size > 0 ifTrue: [self memos: line]].
		ios close]! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/23/2015 10:19'!
modified
	"Answer the value of modified"

	^ modified! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/23/2015 10:19'!
modified: anObject
	"Set the value of modified"

	modified _ anObject! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/14/2015 13:35'!
net
	"Answer the value of net"

	^ net! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/23/2015 21:29'!
net: anObject
	"Set the value of net"

	net _ anObject.
	self modified: true! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 4/3/2016 15:39'!
netString
	"Answer the value of netString"

	^ netString! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 4/3/2016 15:39'!
netString: anObject
	"Set the value of netString"

	netString _ anObject! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/24/2015 09:49'!
newCategory
	| temp |
	
	temp _ FillInTheBlankMorph request: 'Name of new category:'.
	(self categories includesKey: temp)
		ifTrue: [self inform: temp,' is already a category']
		ifFalse: [
			self addCategory: temp.
			self modified: true]! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/22/2015 14:32'!
newPayee
	| temp |
	
	temp _ FillInTheBlankMorph request: 'Name of new payee:'.
	(self payees includesKey: temp)
		ifTrue: [self inform: temp,' is already a payee']
		ifFalse: [temp ~= '' ifTrue: [self payees: temp]]! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/25/2015 11:41'!
payees
	"Answer the value of Payees"

	Payees ifNil: [Payees _ Trie new].
	^ Payees! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/24/2015 11:18'!
payees: anObject
	"Save anObject in payees"

	(self payees includesKey: anObject)
		ifFalse: [self payees at: anObject put: Payee new]! !

!LedgerDeMain methodsFor: 'save & restore' stamp: 'dhn 4/3/2016 16:03'!
payeesFromFile
	"Copy payee names from a file and add them to the payees ivar"
	| file ios line |
	file _ FillInTheBlankMorph request: 'Name of payees File:' initialAnswer: 'c:\directory\file.ext'.
	file ~= '' ifTrue: [
		ios _ ReadStream on: file asFileEntry fileContents.
		[(line _ ios nextLine) notNil]
			whileTrue: [	line size > 0 ifTrue: [self payees at: line put: Payee new]].
		ios close]! !

!LedgerDeMain methodsFor: 'entry' stamp: 'dhn 2/13/2016 15:48'!
putDebit: aString
	"Set the amount"
	
	self halt! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/26/2015 14:51'!
reconcile! !

!LedgerDeMain methodsFor: 'save & restore' stamp: 'dhn 4/3/2016 16:03'!
restorationOf: fileName
	"Restore accounts from file named fileName"
	"File scheme:
		Account1 record
		Ledger transactions for Account1
		Account2 record
		Ledger transactions for Account2
		...
		Accountn record
		...
		Ledger transactions for Accountn"
	| acct ios x |
	
	"must consider: effect on balances"
	acct _ 0.
	ios _ ReadStream on: fileName asFileEntry fileContents.
	[(x _ ios nextLine) notNil]
		whileTrue: [
			acct _ acct + 1.
			accounts at: acct put: x.
			Transcript show: x; newLine].
	ios close.
! !

!LedgerDeMain methodsFor: 'save & restore' stamp: 'dhn 6/25/2015 11:49'!
restoreCategoriesFrom: storeString
	"Set the receiver to the object formed by evaluating  storeString"
	Categories _ Compiler evaluate: storeString! !

!LedgerDeMain methodsFor: 'save & restore' stamp: 'dhn 6/24/2015 10:20'!
restoreFile
	"Add a file to the accounts"
	| fileName temp |
	
	fileName _ FillInTheBlankMorph request: 'Name of file to be restored:' initialAnswer: 'c:\directory\file.ext'.
	temp _ OrderedCollection new.
	self accounts ifNil: [self modified: false].
	temp _ self restorationOf: fileName.
	self accounts: temp asSet.
	! !

!LedgerDeMain methodsFor: 'save & restore' stamp: 'dhn 7/1/2015 14:03'!
saveFile

	Transcript show: 'Simulate saving the file'; newLine! !

!LedgerDeMain methodsFor: 'account' stamp: 'dhn 6/26/2015 14:47'!
searchAllAccounts! !

!LedgerDeMain methodsFor: 'account' stamp: 'dhn 6/26/2015 14:47'!
searchOneAccount! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 3/17/2016 18:30'!
selectedAccount
	"Answer the value of selectedAccount"

	^ selectedAccount! !

!LedgerDeMain methodsFor: 'account' stamp: 'dhn 3/28/2016 20:41'!
selectedAccount: anObject
	"Set the value of selectedAccount "

	selectedAccount _ anObject.
	self changed: #xactList! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 3/17/2016 18:30'!
selectedTransaction
	"Answer the value of selectedTransaction"

	^ selectedTransaction! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 10/23/2015 20:08'!
selectedTransaction: anObject
	"Set the value of selectedTransaction"

	selectedTransaction _ anObject.
	self changed: #xactList
	! !

!LedgerDeMain methodsFor: 'transaction' stamp: 'dhn 4/3/2016 11:40'!
transactionCurrent
	"Answer the transaction indexed by transactionListIndex"
	
	^ transactionListIndex > 0
		ifTrue: [selectedAccount ledger at: transactionListIndex]
		ifFalse: [nil]! !

!LedgerDeMain methodsFor: 'transaction' stamp: 'dhn 4/2/2016 23:00'!
transactionLast
	"Answer the last transaction in the ledger of the selected account"
	
	^ selectedAccount ledger last! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 3/28/2016 17:41'!
transactionList
	"Answer a list of transactions"

	self accounts isEmpty ifFalse: [
		self accountListIndex > 0 ifTrue: [^ transactionList _ selectedAccount listLedgerLines]].
	^ transactionList _ OrderedCollection new 
! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 3/17/2016 18:30'!
transactionList: anObject
	"Set the value of transactionList"

	transactionList _ anObject! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 4/2/2016 21:27'!
transactionListIndex
	"Answer the value of transactionListIndex"

	transactionList ifNil: [^ transactionListIndex _ 0].
	^ transactionListIndex _ transactionList indexOf: selectedTransaction! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 4/3/2016 09:51'!
transactionListIndex: index
	"Set the values of transactionListIndex and selectedTransaction"

	transactionListIndex _ index.
	transactionList ifNotNil: [
		self selectedTransaction:
			(transactionList at: index ifAbsent: nil).		
		self changed: #fillEntries]

! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/18/2015 15:27'!
trie: aTrie withPrefix: aString
	"Answer the leaves which contain aString as the first character(s)"
	aTrie forPrefix: aString keysAndValuesDo: [:key :v | Transcript show: key; newLine]! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 7/1/2015 13:57'!
type
	"Answer the value of Type"

	Type ifNil: [Type _ Trie new].
	^ Type! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 7/1/2015 14:00'!
type: anObject
	"Save anObject in Type"

	(self type includesKey: anObject)
		ifFalse: [self type at: anObject put: 1]! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/18/2015 14:52'!
withPrefix: aString
	"Answer the leaves which contain aString as the first character(s)"
	^ self forPrefix: aString keysAndValuesDo: [:key :v | key]! !

!LedgerDeMain class methodsFor: 'completer' stamp: 'dhn 1/29/2016 21:13'!
completerTable
	"Translate entry field names to methods for completer entries"
	
	^ Dictionary new
		at: #Category put: #categories;
		at: #Memo put: #memos;
		at: #Payee put: #payees;
		at: #Type put: #type;
		yourself! !

!LedgerDeMain class methodsFor: 'fileIn/Out' stamp: 'dhn 6/23/2015 21:10'!
keyTable
	"Answer a dictionary of keys and their hash values"
	^ Dictionary new
		at: 'account' put: 'account' hash;
		at: 'account balances' put: 'account balances' hash;
"actually what's needed: <account name> balances"
		at: 'account ledger transaction' put: 'account ledger transaction' hash;
		at: 'payee' put: 'payee' hash;
		at: 'category' put: 'category' hash;
		at: 'memo' put: 'memo' hash;
		yourself! !

!LedgerDeMain class methodsFor: 'as yet unclassified' stamp: 'dhn 6/25/2015 20:04'!
look
	Payees explore! !

!LedgerCompleter methodsFor: 'accessing' stamp: 'dhn 4/8/2016 19:24'!
addEntriesTo: aStream
	"Supply content to the completer"
	| db nam pref |

	nam _ model textProvider model entryTable: model textProvider entryIndex.
	db _ model textProvider getTrieFor: nam.
	pref _ model actualContents asString.
	db 
		forPrefix: pref
		keysAndValuesDo: [:key :val | aStream nextPut: key]! !

!LedgerCompleter methodsFor: 'menu morph' stamp: 'dhn 4/6/2016 14:55'!
openCompletionMenu
	"Open a completer menu if the field has one"
	| theEditor |
	
	(self class entryFields includes: textMorph owner name)
		ifTrue: [
			theEditor _ textMorph editor.
			position _ theEditor startIndex - 1.
			self closeMenu.
			self computeEntries.
			entries notEmpty
				ifTrue: [ 
					menuMorph _  LedgerCompleterMorph 
						completer: self
						position: theEditor startBlock bottomLeft + textMorph morphPositionInWorld]]! !

!LedgerCompleter class methodsFor: 'entries' stamp: 'dhn 4/6/2016 13:56'!
entryFields
	"Answer the fields which have completers"
	
	^ #(#Payee #Category #Memo)! !

!LedgerCalculator methodsFor: 'initialization' stamp: 'dhn 3/22/2016 22:25'!
initialize
	"Answer an evaluated expression in ledger format"
	| w x y ok err |
	
	x _ ''.
	ok _ false.
	err _ false.
	
	[ok and: err not] whileFalse: [
		x _ FillInTheBlankMorph request: 'Calculator' initialAnswer: x.
		y _ x copyWithout: $ .		"remove blanks"
		err _ false.
		y ~= '' 
			ifTrue: [
				[w _ Compiler evaluate: y] on: Error do: [
					err _ true.
					nil inform: 'Error in the arithmetic expression'].
				err ifFalse: [
					ok _ true.
					y _ (LedgerWindow dollarsToCents: w asString) ledgerFormatted]]
			ifFalse: [ok _ true]].
		
	^ y! !

!LedgerCompleterMorph methodsFor: 'as yet unclassified' stamp: 'dhn 4/6/2016 15:27'!
timeout
	"Answer the time given to the user for selecting a completion menu item"
	
	^ 15000! !

!LedgerCompleterMorph class methodsFor: 'instance creation' stamp: 'dhn 11/9/2015 17:08'!
initializedInstance
	| completer m |
	completer _ LedgerCompleter withModel: (TextModel withText: 'Small').
	completer
		instVarNamed: 'position'
		put: 5.
	completer computeEntries.
	m _ LedgerCompleterMorph
		completer: completer
		position: 200 @ 200.
	completer instVarNamed: 'menuMorph' put: m.
	^m! !

!EntryField methodsFor: 'initialization' stamp: 'dhn 11/13/2015 15:26'!
initialize

	super initialize.
	self
		borderWidth: 1;
		color: Color white
! !

!EntryField methodsFor: 'accessing' stamp: 'dhn 3/1/2016 11:43'!
position
	"Answer the value of position"

	^ position! !

!EntryField methodsFor: 'accessing' stamp: 'dhn 3/1/2016 11:43'!
position: anObject
	"Set the value of position"

	position _ anObject! !

!EntryField methodsFor: 'accessing' stamp: 'dhn 1/29/2016 21:01'!
textModel
	"Answer the value of textModel"

	^ textModel! !

!EntryField methodsFor: 'accessing' stamp: 'dhn 1/29/2016 21:01'!
textModel: anObject
	"Set the value of textModel"

	textModel _ anObject! !

!EntryField class methodsFor: 'class initialization' stamp: 'dhn 2/18/2016 14:30'!
textProvider: aTextProvider getter: symb1 name: aName
	"Establish an entry field morph"
	^ (self
		textProvider: aTextProvider
		textGetter: symb1)
	name: aName! !

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 4/8/2016 21:50'!
accountFromFile
	"Copy account ledger entries from a file and add them to the account ledger"
	| file ios line rec acct |
	
	model selectedAccount ifNil: [self newAccount].
	file _ FillInTheBlankMorph request: 'Name of file with xactions:' initialAnswer: 'c:\directory\file.txt'.
	file ~= '' ifTrue: [
		ios _ ReadStream on: file asFileEntry fileContents.
		acct _ model accounts at: model accountListIndex.
		[(line _ ios nextLine) notNil]
			whileTrue: [	line size > 0 
				ifTrue: [
					rec _ Transaction new account: acct.
					rec type: (rec acquire: #type from: line).
					rec date: (LedgerWindow asLdmDate: (rec acquire: #date from: line) asString).
					rec check: (rec acquire: #check from: line).
					rec payee: (rec acquire: #payee from: line).
					rec memo: (rec acquire: #memo from: line).
					rec category: (rec acquire: #category from: line).
					rec reconciled: (rec acquire: #reconciled from: line).
					rec amount: (LedgerWindow dollarsToCents: (rec acquire: #amount from: line)).
					rec key: rec date asString, rec check, rec payee.
					model growTries: rec.
					acct loadTransaction: rec]].
		
		model computeNet.
		model changed: #xactList.
		model changed: #acctList.
		model changed: #lastOnList]! !

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 4/5/2016 12:09'!
addAccountActionsTo: aMenu
	"Add items to aMenu for account actions"

	| subMenu |
	subMenu := MenuMorph new defaultTarget: self.
	subMenu add: 'Add an account'				target: self  			action:	#newAccount.
	subMenu add: 'Load account from file...'	target: self 		 	action:	#accountFromFile.
	subMenu add: 'Search all accounts...'		target: self model 	action: #searchAllAccounts.
	aMenu add: 'Accounts...' subMenu: subMenu! !

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 8/12/2015 21:23'!
addCategoryActionsTo: aMenu
	"Add items to aMenu for category actions"

	| subMenu |
	subMenu := MenuMorph new defaultTarget: self.
	subMenu add: 'List categories'			target: self model 	selector: #list: argument: #categories.
	subMenu add: 'Add a category'			target: self model 	action: #newCategory.
	subMenu add: 'Categories from file'	target: self model 	action: #categoriesFromFile.
	aMenu add: 'Categories...' subMenu: subMenu! !

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 8/12/2015 21:23'!
addMemoActionsTo: aMenu
	"Add items to aMenu for payee actions"

	| subMenu |
	subMenu := MenuMorph new defaultTarget: self.
	subMenu add: 'List memos'			target: self model 	selector: #list: argument: #memos.
	subMenu add: 'Memos from file'		target: self model 	action: #memosFromFile.
	aMenu add: 'Memos...' subMenu: subMenu! !

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 8/12/2015 21:20'!
addPayeeActionsTo: aMenu
	"Add items to aMenu for payee actions"

	| subMenu |
	subMenu := MenuMorph new defaultTarget: self.
	subMenu add: 'List payees'			target: self model 	selector: #list: argument: #payees.
	subMenu add: 'Add a payee'		target: self model 	action: #newPayee.
	subMenu add: 'Payees from file'	target: self model 	action: #payeesFromFile.
	aMenu add: 'Payees...' subMenu: subMenu! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 4/3/2016 10:11'!
amount: debit or: credit
	"Answer an amount with an appropriate sign"
	| x |
	
	((self entryContents: debit) allSatisfy: [:a | a = $ ])
		ifTrue: [x _ self entryContents: credit]
		ifFalse: [x _ '-', (self entryContents: debit)].
	x ifEmpty: [x _ '0'].
	^ LedgerWindow dollarsToCents: x! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 3/27/2016 20:23'!
areAnyMissing: anArray
	"Answer whether entry fields named in anArray are not empty"
	| ans |
	
	ans _ true.
	anArray do: [:ea |
		ans _ ans and: [(self entryContents: ea) notEmpty]].
	^ ans not! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 2/15/2016 22:19'!
autoCompleterClassFor: textGetter
	"Essential method. Necessary in order to have a completer available for the containing class"

	^ LedgerCompleter! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 4/5/2016 14:15'!
buildAccountList
	"Answer the specifications for the list of accounts in the window"
	| net ttl |
	
	windowAccountList _ ((PluggableListMorph
			model: model
			listGetter: #accountList
			indexGetter: #accountListIndex
			indexSetter: #accountListIndex:
			mainView: self
			menuGetter: #menuMain
			keystrokeAction: nil)
				name: #Accounts;
				font: (AbstractFont familyName: 'DejaVu Sans Mono' aroundPointSize: 9);
				borderWidth: 1;
				name: 'Account List').
	
	net _ (LayoutMorph newColumn color: Color lightGreen; name: 'Net Total')
		layoutSpec: (LayoutSpec proportionalWidth: 1.0 fixedHeight: 100).
	ttl _  (StringMorph new contents: '    Net Total:   $0.00'; name: #Total)
		layoutSpec: (LayoutSpec proportionalWidth: 1.0 proportionalHeight: 0.1 minorDirectionPadding: #center).
	model netString: ttl.
	net addMorph: ttl.

	^ LayoutMorph newColumn
		name: #Accounts;
		addMorph: (windowAccountList layoutSpec: LayoutSpec useAll);
		addMorph: net! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 3/1/2016 11:49'!
buildCategoryEntry: aNumber
	"Answer the label and entry field for Category"
	| m fld |
	
	m _ LayoutMorph newColumn
				layoutSpec: (LayoutSpec proportionalWidth: 0.8).
	m addMorph: ((StringMorph contents: 'Category')
		layoutSpec: (LayoutSpec fixedHeight: 15)).
		
	m addMorph: ((fld _ EntryField 
			textProvider: self
			getter: #getCategory
			name: #Category)
				when: #atEntry send: #entryTable: to: self with: #categories;
				textModel: self;
				setBalloonText: 'What transaction was for';
				hideScrollBarsIndefinitely;
				layoutSpec: (LayoutSpec useAll)).
	fld position: aNumber.
	windowEntries add: fld.
	
	^ m
		! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 3/1/2016 12:50'!
buildCheckEntry: aNumber
	"Answer the label and entry field for Check number"
	| m fld |
	
	m _ LayoutMorph newColumn
				layoutSpec: (LayoutSpec fixedWidth: 60).
	m addMorph: ((StringMorph contents: 'Check')
		layoutSpec: (LayoutSpec fixedHeight: 15)).
		
	m addMorph: ((fld _ EntryField 
			textProvider: self
			getter: #getCheck
			name: #Check)
				textModel: self;
				setBalloonText: 'Check number or transaction type';
				layoutSpec: (LayoutSpec useAll)).
	fld position: aNumber.
	windowEntries add: fld.
	
	^ m
		! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 3/1/2016 12:32'!
buildCreditEntry: aNumber
	"Answer the label and entry field for the Credit amount"
	| m fld |
	
	m _ LayoutMorph newColumn
				layoutSpec: (LayoutSpec fixedWidth: 65).
	m addMorph: ((StringMorph contents: 'Credit')
		layoutSpec: (LayoutSpec fixedHeight: 15)).
		
	m addMorph: ((fld _ EntryField 
			textProvider: self
			getter: #getCredit
			name: #Credit)
				textModel: self;
				setBalloonText: 'Amount, if positive';
				layoutSpec: (LayoutSpec useAll)).
	fld position: aNumber.
	windowEntries add: fld.
	
	^ m
		! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 3/13/2016 22:14'!
buildDateEntry: aNumber
	"Answer the label and entry field for Date"
	| m fld |
	
	m _ LayoutMorph newColumn
				layoutSpec: (LayoutSpec fixedWidth: 85).
	m addMorph: ((StringMorph contents: 'Date')
		layoutSpec: (LayoutSpec fixedHeight: 15)).
		
	m addMorph: ((fld _ EntryField
			textProvider: self
			getter: #getDate 
			name: #Date)
				textModel: self;
				setBalloonText: 'When transaction occurred';
				layoutSpec: (LayoutSpec useAll)).
	fld position: aNumber;
		hideScrollBarsIndefinitely.
	windowEntries add: fld.
	
	^ m
		! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 3/1/2016 12:32'!
buildDebitEntry: aNumber
	"Answer the label and entry field for the Debit amount"
	| m fld |
	
	m _ LayoutMorph newColumn
				layoutSpec: (LayoutSpec fixedWidth: 65).
	m addMorph: ((StringMorph contents: 'Debit')
		color: Color red;
		layoutSpec: (LayoutSpec fixedHeight: 15)).
		
	m addMorph: ((fld _ EntryField 
			textProvider: self
			getter: #getDebit
			name: #Debit)
				textModel: self;
				setBalloonText: 'Amount, if negative';
				color: Color lightRed muchLighter;
				layoutSpec: (LayoutSpec useAll)).
	fld position: aNumber.
	windowEntries add: fld.
	
	^ m
		! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 3/23/2016 14:44'!
buildEntries
	"Answer the layout for transaction entry fields"
	| n |
	
	n _ 0.
	^ (LayoutMorph newRow separation: 5)
		name: #'Entry Fields';
		addMorph: (self buildDateEntry: (n _ n + 1));		
		addMorph: (self buildCheckEntry: (n _ n + 1));		
		addMorph: (self buildPayeeEntry: (n _ n + 1));		
		addMorph: (self buildCategoryEntry: (n _ n + 1));		
		addMorph: (self buildMemoEntry: (n _ n + 1));		
		addMorph: (self buildDebitEntry: (n _ n + 1));		
		addMorph: (self buildCreditEntry: (n _ n + 1))
! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 2/18/2016 15:48'!
buildLedgerList
	"Answer the specifications for the ledger list in the window"
	| entries |
	
	windowLedgerList _ (PluggableListMorph
			model: model
			listGetter: #transactionList
			indexGetter: #transactionListIndex
			indexSetter: #transactionListIndex:
			mainView: self
			menuGetter: #menuLedger
			keystrokeAction: nil)
				name: #Ledger;
				font: (AbstractFont familyName: 'DejaVu Sans Mono' aroundPointSize: 9).
	windowLedgerList  layoutSpec: (LayoutSpec useAll).
				
	entries _ self buildEntries
		layoutSpec: (LayoutSpec fixedHeight: 50).

	
	^ (LayoutMorph newColumn name: 'Ledger Column')
		addMorph: windowLedgerList;
		addMorph: entries
		
		
! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 3/1/2016 11:49'!
buildMemoEntry: aNumber
	"Answer the label and entry field for Memo"
	| m fld |
	
	m _ LayoutMorph newColumn
				layoutSpec: (LayoutSpec proportionalWidth: 0.8).
	m addMorph: ((StringMorph contents: 'Memo')
		layoutSpec: (LayoutSpec fixedHeight: 15)).
		
	m addMorph: ((fld _ EntryField 
			textProvider: self
			getter: #getMemo
			name: #Memo)
				when: #atEntry send: #entryTable: to: self with: #memos;
				textModel: self;
				setBalloonText: 'Additional transaction details';
				hideScrollBarsIndefinitely;
				layoutSpec: (LayoutSpec useAll)).
	fld position: aNumber.
	windowEntries add: fld.
	
	^ m
		! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 3/11/2016 21:30'!
buildMorphicWindow
	"Lay out a window for Ledger d'Main"

	(self layoutMorph beRow name: #Row)
		addMorph: self buildAccountList fixedWidth: 200;
		addMorph: self buildLedgerList
			layoutSpec: (LayoutSpec useAll).
	
	self newKeyboardFocus: (windowEntries at: self entryIndex) scroller.
	(windowEntries at: self entryIndex) scroller selectAll.
	self sayWhen
! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 3/1/2016 11:47'!
buildPayeeEntry: aNumber
	"Answer the label and entry field for Payee"
	| m fld |
	
	m _ LayoutMorph newColumn
				layoutSpec: (LayoutSpec proportionalWidth: 0.8).
	m addMorph: ((StringMorph contents: 'Payee')
		layoutSpec: (LayoutSpec fixedHeight: 15)).
	m addMorph: ((fld _ EntryField 
			textProvider: self
			getter: #getPayee
			name: #Payee)
				when: #atEntry send: #entryTable: to: self with: #payees;
				textModel: self;
				setBalloonText: 'Transaction destination or source';
				hideScrollBarsIndefinitely;
				layoutSpec: (LayoutSpec useAll)).
	fld position: aNumber.
	windowEntries add: fld.
	
	^ m
		! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 3/1/2016 12:32'!
buildREntry: aNumber
	"Answer the label and entry field for the Reconciled indicator"
	| m fld |
	
	m _ LayoutMorph newColumn
				layoutSpec: (LayoutSpec fixedWidth: 12).
	m addMorph: ((StringMorph contents: 'R')
		layoutSpec: (LayoutSpec fixedHeight: 15)).
		
	m addMorph: ((fld _ EntryField  
			textProvider: self
			getter: #getR
			name: #R)
				textModel: self;
				setBalloonText: 'Reconciled?';
				layoutSpec: (LayoutSpec useAll)).
	fld position: aNumber.
	windowEntries add: fld.
	
	^ m
		! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 4/8/2016 21:55'!
changeTransaction
	"Form a transaction from the EntryFields"
	| tx dt ck py |
	
	model selectedAccount ifNotNil: [
		(self areAnyMissing: {#Date. #Check. #Payee})
			ifFalse: [	
				tx _ Transaction new.
				dt _ LedgerWindow asLdmDate: (self entryContents: #Date).
				ck _ self entryContents: #Check.
				py _ self entryContents: #Payee.
	
				tx 
					key: dt asString, ck, py;
					account: model selectedAccount;
					date: dt;
					check: ck;
					payee: py;
					category: (self entryContents: #Category);
					memo: (self entryContents: #Memo).
		
				tx amount: (self amount: #Debit or: #Credit).

				(tx check allSatisfy: [:a | a isDigit])
					ifTrue: [
						tx type: 'DEB'.
						model selectedAccount lastCheck: (model selectedAccount lastCheck max: tx check asNumber)]
					ifFalse: [tx type: tx check].

				model
					growTries: tx;
					acceptTransaction: tx.
				self resetUnacceptedEdits]
		
			ifTrue: [nil inform: 'Something missing in Date, Check, or Payee.']]
! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 3/25/2016 18:55'!
checkMinus: anEntry
	"Subtract 1 from check number"
	| w x |
	
	(w _ anEntry model actualContents)
		ifNotEmpty: [
			w first isDigit
				ifTrue: [
					x _ anEntry model actualContents asNumber.
					(x _ x - 1) < 1 ifTrue: [x _ '']]
				ifFalse: [
					typeIndex _ typeIndex + 1.
					x _ (self class transactionTypes atWrap: typeIndex)]]
		ifEmpty: [
			model selectedAccount
				ifNotNil: [x _ model selectedAccount lastCheck - 1]].
			
	anEntry model actualContents: x asString.
	anEntry scroller selectAll.
	model modified: true

! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 3/25/2016 18:55'!
checkPlus: anEntry
	"Add 1 to check number or answer transaction types"
	| w x |
	
	(w _ anEntry model actualContents)
		ifNotEmpty: [
			w first isDigit
				ifTrue: [
					x _ anEntry model actualContents asNumber.
					x _ x + 1]
				ifFalse: [
					typeIndex _ typeIndex + 1.
					x _ (self class transactionTypes atWrap: typeIndex)]]
		ifEmpty: [
			model selectedAccount
				ifNotNil: [x _ model selectedAccount lastCheck + 1]].
	
	anEntry model actualContents: x asString.
	anEntry scroller selectAll.
	model modified: true
! !

!LedgerWindow methodsFor: 'updating' stamp: 'dhn 4/6/2016 15:26'!
complete: aSymbol
	"Indicate which entry field is active"
	
	{'#complete:'. aSymbol} print.! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 3/23/2016 11:37'!
dateEarlier: anEntry
	"Subtract 1 from Ledgerdemain date"
	| x |
	
	(x _ anEntry model actualContents) asString size = 0
		ifTrue: [x _ Date today julianDayNumber - Time squeakEpoch]
		ifFalse: [x _ LedgerWindow asLdmDate: x].
	x _ x - 1.
	anEntry model actualContents: (Date fromDays: x) mmddyyyy.
	anEntry scroller selectAll.
! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 3/23/2016 11:36'!
dateLater: anEntry
	"Add 1 to Ledgerdemain date"
	| x |
	
	(x _ anEntry model actualContents) asString size = 0
		ifTrue: [x _ Date today julianDayNumber - Time squeakEpoch]
		ifFalse: [x _ LedgerWindow asLdmDate: x].
	x _ x + 1.
	anEntry model actualContents: (Date fromDays: x) mmddyyyy.
	anEntry scroller selectAll.
! !

!LedgerWindow methodsFor: 'open/close' stamp: 'dhn 10/16/2015 20:39'!
delete
	"Close the window"
	| cancel |

	cancel _ false.
	self model modified ifTrue: [
		(nil confirm: 'Save changes?' orCancel: [(cancel _ true) not]) ifTrue: [
			self model saveFile]].
	cancel ifFalse: [super delete]		"terminate"
	"otherwise, cancel this"! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 3/20/2016 11:25'!
entryContents: aSymbol
	"Answer the contents of the entry field named aSymbol"
	
	^ (windowEntries detect: [:a | a name = aSymbol] ifNone: [nil]) model actualContents asString! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 3/3/2016 16:00'!
entryIndex
	"Answer the value of entryIndex"

	entryIndex ifNil: [entryIndex _ 1].
	^ entryIndex! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 3/3/2016 12:41'!
entryIndex: anObject
	"Set the value of entryIndex"

	entryIndex _ anObject! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 3/1/2016 11:36'!
entryTable
	"Answer the value of entryTable"

	^ entryTable! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 2/15/2016 10:29'!
entryTable: aSymbol
	"Set the value of entryTable"

	entryTable _ model entryTable: aSymbol! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 2/14/2016 21:26'!
getCategory
	"Answer the category"
	
	^ model getCategory! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 2/14/2016 21:25'!
getCheck
	"Answer the check number"
	
	^ model getCheck! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 2/14/2016 21:29'!
getCredit
	"Answer the amount if positive; '' otherwise"
	
	^ model getCredit! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 2/14/2016 21:24'!
getDate
	"Answer the date"
	
	^ model getDate! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 2/14/2016 21:29'!
getDebit
	"Answer the amount if negative; '' otherwise"
	
	^ model getDebit! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 2/14/2016 21:27'!
getMemo
	"Answer the memo"
	
	^ model getMemo! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 2/14/2016 21:25'!
getPayee
	"Answer the payee"
	
	^ model getPayee! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 2/14/2016 21:28'!
getR
	"Answer the reconciled indicator"
	
	^ model getR! !

!LedgerWindow methodsFor: 'updating' stamp: 'dhn 2/15/2016 21:44'!
getTrieFor: aSymbol
	"Answer the contents Trie for the field named aSymbol"
	| method |
	
	method _ model class completerTable at: aSymbol.
	^ model perform: method! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 3/28/2016 14:52'!
goAhead
	"Go to the next EntryField to the right"
	| from to |
	
	from _ windowEntries at: entryIndex.
	entryIndex _ entryIndex + 1.
	entryIndex > windowEntries size ifTrue: [entryIndex _ 1].
	to _ windowEntries at: entryIndex.
	self releaseKeyboardFocus: from scroller.
	from scroller releaseCachedState.
	self newKeyboardFocus: to scroller.
	to focusText.
	to scroller selectAll
	! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 3/28/2016 14:52'!
goBack
	"Go to the next EntryField to the left"
	| from to |
	
	from _ windowEntries at: entryIndex.
	entryIndex _ entryIndex - 1.
	entryIndex <= 0 ifTrue: [entryIndex _ windowEntries size].
	to _ windowEntries at: entryIndex.
	self releaseKeyboardFocus: from scroller.
	from scroller releaseCachedState.
	self newKeyboardFocus: to scroller.
	to focusText.
	to scroller selectAll
! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 4/4/2016 11:00'!
goMouse: index
	"Go to the EntryField selected by the mouse"
	| from to |
	
	from _ windowEntries at: entryIndex.
	entryIndex _ index.
	to _ windowEntries at: entryIndex.
	self releaseKeyboardFocus: from scroller.
	from scroller releaseCachedState.
	self newKeyboardFocus: to.
	to focusText
	
	! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 3/9/2016 21:01'!
handlesKeyboard

	^self visible! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 3/20/2016 15:20'!
initialize

	super initialize.
	windowEntries _ OrderedCollection new.
	typeIndex _ 0! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 3/19/2016 17:32'!
keyboardFocus
	"Answer the value of keyboardFocus"

	^ keyboardFocus! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 3/19/2016 17:32'!
keyboardFocus: anObject
	"Set the value of keyboardFocus"

	keyboardFocus _ anObject! !

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 4/3/2016 16:36'!
listTransactionTypes
	"List the type codes for transactions"
	| pick |
	
	pick _ (SelectionMenu selections: self class transactionTypes) startUpMenu.
	TextEditor  new clipboardTextPut:  pick! !

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 4/3/2016 12:51'!
menuLedger
	"Ledger pop-up menu"

	| aMenu |
	aMenu _ MenuMorph new defaultTarget: self.
	aMenu
		addTitle: 'Ledger Menu'; 
		addLine.
	aMenu add: 'Reconcile...'		target: self model 	action:	#reconcile.
	aMenu balloonTextForLastItem: 'reconcile this account'.
	aMenu add: 'Search...'			target: self model 	action:	#searchOneAccount.
	aMenu balloonTextForLastItem: 'search within this account only'.
	aMenu add: 'Delete entry...'	target: self model 	action:	#deleteTransaction.
	aMenu balloonTextForLastItem: 'delete the selected ledger entry'.
	aMenu popUpInWorld: self world.
! !

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 4/3/2016 16:37'!
menuMain
	"Main pop-up menu"

	| aMenu |
	aMenu _ MenuMorph new defaultTarget: self.
	aMenu
		addTitle: 'Main Menu'; 
		addStayUpIcons;
		addLine.
	aMenu add: 'Restore Accounts'			target: self model 	action:	#restoreFile.
	aMenu balloonTextForLastItem: 'load a previously saved file 
of account ledgers'.
	aMenu add: 'Save current Accounts'	target: self model 	action:	#saveFile.
	aMenu balloonTextForLastItem: 'preserve changes to the data'.
	aMenu addLine.
	self addAccountActionsTo: aMenu.
	aMenu add: 'Payees to clipboard'			target: self model 	selector: #list: argument: #payees.
	aMenu add: 'Categories to clipboard'			target: self model 	selector: #list: argument: #categories.
	aMenu add: 'Memos to clipboard'			target: self model 	selector: #list: argument: #memos.
	aMenu add: 'Transaction Types to clipboard'			target: self  	action:	#listTransactionTypes.
	aMenu popUpInWorld: self world.
! !

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 4/5/2016 11:52'!
newAccount
	"Ensure data needed to open a new account is available and open the account if so"
	| temp arr kind bal balDate |
	
	temp _ FillInTheBlankMorph request: 'Name of new account:'.
	temp ~= '' ifTrue: [
		(model accounts allSatisfy: [:a | temp ~= a accountName])
			ifTrue: [
				arr _ #(#checking #savings #'credit card' #cash).
				kind _ (PopUpMenu labelArray: arr) startUpWithCaption: 'Type of account:'.
				kind > 0
					ifTrue: [
						bal _ FillInTheBlankMorph 
							request: 'Opening balance for ', temp
							initialAnswer: '0.00'.
						bal ~= '' ifTrue: [
							balDate _ FillInTheBlankMorph 
								request: 'Date of opening balance'
								initialAnswer: Date today mmddyyyy.
							balDate ~= '' ifTrue: [
								model accounts: (model accountNamed: temp type: (arr at: kind) opening: bal at: balDate)]]]]
			ifFalse: [nil inform: temp,' is already an account']]
! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 3/10/2016 22:01'!
newKeyboardFocus: aMorphOrNil
	"Make the given morph the new keyboard focus, canceling the previous keyboard focus if any. If the argument is nil, the current keyboard focus is cancelled."
	| oldFocus |
	oldFocus _ keyboardFocus.
	keyboardFocus _ aMorphOrNil.
	oldFocus ifNotNil: [oldFocus == aMorphOrNil ifFalse: [oldFocus keyboardFocusChange: false]].
	aMorphOrNil ifNotNil: [aMorphOrNil keyboardFocusChange: true].
! !

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 6/26/2015 11:35'!
popUpInWorld: aWorld
	"Required by PluggableListMorph. Do nothing."! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 3/10/2016 22:07'!
releaseKeyboardFocus
	"Release the current keyboard focus unconditionally"
	self newKeyboardFocus: nil.
! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 3/10/2016 22:06'!
releaseKeyboardFocus: aMorph
	"If the given morph had the keyboard focus before, release it"
	keyboardFocus == aMorph ifTrue:[self releaseKeyboardFocus].! !

!LedgerWindow methodsFor: 'updating' stamp: 'dhn 3/20/2016 16:49'!
resetUnacceptedEdits
	"Send false to any entry field with unaccepted edits"
	
	windowEntries do: [:ea |
		ea scroller hasUnacceptedEdits 
			ifTrue: [ea scroller hasUnacceptedEdits: false]]! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 4/3/2016 20:00'!
sayWhen
	"Establish the receiving half of the Observer Pattern"
	
	self when: #toTheRight send: #goAhead to: self.
	self when: #toTheLeft send: #goBack to: self.
	self when: #specialKey send: #'someKey:of:with:' to: self withArguments: #(#a #b #c).
	self when: #mouseSelected send: #goMouse: to: self withArguments: #(#ndx).
! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 4/8/2016 21:41'!
someKey: aKey of: aType with: aModifier
	"Process special key strokes"
	| entr |
	
	entr _ windowEntries at: entryIndex.
	
	aKey = 28 ifTrue: [	"left arrow"
		aType = #keyUp  ifTrue: [self goBack]].
	
	aKey = 29 ifTrue: [	"right arrow"
		aType = #keyUp  ifTrue: [self goAhead]].
	
	aKey = 10 ifTrue: [	"ctl-enter"
		aType = #keyUp  ifTrue: [self changeTransaction]].
	
	aKey = 43 ifTrue: [	"plus"
		aType = #keystroke  ifTrue: [ 
			entr name = #Date ifTrue: [self dateLater: entr].
			entr name = #Check ifTrue: [self checkPlus: entr]]].
	
	aKey = 45 ifTrue: [	"minus"
		aType = #keystroke  ifTrue: [ 
			entr name = #Date ifTrue: [self dateEarlier: entr].
			entr name = #Check ifTrue: [self checkMinus: entr]]].
! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 3/19/2016 17:32'!
typeIndex
	"Answer the value of typeIndex"

	^ typeIndex! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 3/19/2016 17:32'!
typeIndex: anObject
	"Set the value of typeIndex"

	typeIndex _ anObject! !

!LedgerWindow methodsFor: 'updating' stamp: 'dhn 4/3/2016 11:42'!
update: aSymbol
	"Receive a change notice, as a dependent, from a dependee" 
	
	super update: aSymbol.
	
	aSymbol == #fillEntries
		ifTrue: [
			model selectedAccount isNil
				ifTrue: [windowEntries do: [:ea | ea model actualContents: '']]
				ifFalse: [windowEntries do: [:ea | ea model refetch]].
			entryIndex _ windowEntries size].
		
	aSymbol == #xactList
		ifTrue: [
			windowLedgerList updateList.
			model computeNet].
		
	aSymbol == #lastOnList
		ifTrue: [
			model selectedAccount
				ifNotNil: [
					model transactionListIndex: model selectedAccount ledger size.
					windowLedgerList scrollSelectionIntoView].
			model transactionListIndex: 0.
			windowLedgerList updateList].
		
	aSymbol == #acctList
		ifTrue: [
			windowAccountList updateList.
			model computeNet]
! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 10/17/2015 13:52'!
windowAccountList
	"Answer the value of windowAccountList"

	^ windowAccountList! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 3/1/2016 11:36'!
windowAccountList: anObject
	"Set the value of windowAccountList"

	windowAccountList _ anObject! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 10/17/2015 12:01'!
windowEntries
	
	^ windowEntries! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 3/1/2016 11:36'!
windowEntries: anObject
	"Set the value of windowEntries"

	windowEntries _ anObject! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 10/17/2015 13:52'!
windowLedgerList
	"Answer the value of windowLedgerList"

	^ windowLedgerList! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 3/1/2016 11:36'!
windowLedgerList: anObject
	"Set the value of windowLedgerList"

	windowLedgerList _ anObject! !

!LedgerWindow class methodsFor: 'conversion' stamp: 'dhn 3/23/2016 11:28'!
asLdmDate: aString
	"Convert aString in the form of mm/dd/yyyy to a Ledgerdemain date number"
	"Covers dates from 1/1/1901 to 2/27/2935093 (quite a long time!!)"
	| w x |
	w _ aString asString select: [:a | a isDigit or: a = $/].
	x _ w findTokens: '/'.
	x size ~= 3 
		ifTrue: [nil error: 'not a date'].

	^ (Date 
		newDay: x second asNumber 
		month: x first asNumber 
		year: x third asNumber)
			 julianDayNumber - Time squeakEpoch! !

!LedgerWindow class methodsFor: 'conversion' stamp: 'dhn 3/23/2016 09:38'!
asMmDdYyyy: aDate
	"Convert aDate from Ledgerdemain date number to mm/dd/yyyy"
	^ (Date fromDays: aDate) mmddyyyy! !

!LedgerWindow class methodsFor: 'conversion' stamp: 'dhn 3/23/2016 09:42'!
centsToDollars: anAmount
	"Answer anAmount as an array of strings in the form {'d,ddd'. 'cc'} "
	| all sd sc |
	
	all _ anAmount asString.
	all size < 2 ifTrue: [all _ ('0', all, '0') copyFrom: 1 to: 2].
	sc _ all copyFrom: all size - 1 to: all size.
	all size > 2
		ifTrue: [sd _ LedgerWindow withCommas: (all copyFrom: 1 to: all size - 2)]
		ifFalse: [sd _ '0'].
	^ {sd. sc}! !

!LedgerWindow class methodsFor: 'conversion' stamp: 'dhn 3/24/2016 21:15'!
dollarExpression: aString
	"Convert aString to a string expressing dollars and cents"
	| ix w x |

	w _ aString copyWithout: $ .
		w
			ifEmpty: [x _ '0']
			ifNotEmpty: [
				ix _ w indexOf: $..
				ix = 0 
					ifTrue: [x _ w, '.', '00']
					ifFalse: [
						w first = $-
							ifTrue: [
								ix > 2
									ifTrue: [x _ w, ('00' copyFrom: 1 count: (w size - ix - 2) abs)]
									ifFalse: [
										x _ w first asString, '0.', 
										(w copyFrom: ix + 1 to: w size), 
										('00' copyFrom: 1 to: ((1 - ix min: 0) max: 2))]]
							ifFalse: [
								ix > 1
									ifTrue: [x _ w, ('00' copyFrom: 1 count: (w size - ix - 2) abs)]
									ifFalse: [
										x _ '0.', (w copyFrom: ix + 1 to: w size), 
										('00' copyFrom: 1 to: ((1 - ix min: 0) max: 2))]]]].
	
	^ x! !

!LedgerWindow class methodsFor: 'conversion' stamp: 'dhn 3/24/2016 16:07'!
dollarsToCents: aString
	"Answer aString converted to a number of cents"
	|  y z neg fracC |
	
	y _ (LedgerWindow dollarExpression: aString) findTokens: '-.' keep: '-.'.
	(neg _ y first = '-') ifTrue: [y _ y removeFirst; yourself].
	(y first, y third allSatisfy: [:a | a isDigit])
		ifFalse: [nil error: '''', aString,''' can not be converted to cents.'].
				
	fracC _ 0.
	y third size > 2 
		ifTrue: [
			fracC _ (y third at: 3) asString asNumber.
			y at: 3 put: (y third copyFrom: 1 to: 2); yourself].
		
	z _ (y first, y third) asNumber.
	fracC > 4 ifTrue: [z _ z + 1].	"fraction of a cent"
	neg ifTrue: [z _ z negated].
	^ z! !

!LedgerWindow class methodsFor: 'instance creation' stamp: 'dhn 6/22/2015 16:03'!
how
"
	LedgerWindow open.
"! !

!LedgerWindow class methodsFor: 'instance creation' stamp: 'dhn 6/23/2015 20:45'!
includeInNewMorphMenu

	^ false 	"Not to be instantiated from the menu"! !

!LedgerWindow class methodsFor: 'key selection' stamp: 'dhn 3/1/2016 14:45'!
keys
	"Answer the event keyValue for keys which receive special processing in #navigateWith:for:"
	
	^ #(
		13 		"enter"
		28 		"left arrow"
		29 		"right arrow"
		30 		"up arrow"
		31 		"down arrow"
	)! !

!LedgerWindow class methodsFor: 'instance creation' stamp: 'dhn 10/23/2015 20:05'!
open
	"
	LedgerWindow open.
	"

	(LedgerWindow open: (LedgerDeMain new) label: 'Ledger d''Main')
		morphExtent: 1250@500;
		setWindowColor:  Theme current workspace! !

!LedgerWindow class methodsFor: 'conversion' stamp: 'dhn 3/22/2016 22:34'!
prependZeros: aString
	"Answer aString with '0' or '00' prepended as necessary for a length of at least 3"
	
	 aString size > 2 ifTrue: [^ aString].
	^ ('00' copyFrom: 1 count: (3 - aString size max: 0)), aString! !

!LedgerWindow class methodsFor: 'key selection' stamp: 'dhn 3/14/2016 20:09'!
transactionTypes
	"Answer an array of transaction types"
	
	^ #(
		'DEP' 		"deposit"
		'EFT' 		"electronic funds transfer"
		'TXFR' 		"transfer between accounts"
		'WD' 		"withdraw from account (i.e. cashier's check)"
	)! !

!LedgerWindow class methodsFor: 'conversion' stamp: 'dhn 3/22/2016 23:18'!
withCommas: aString
	"Answer aString with commas at the thousands, millions, etc positions"

	aString size > 3
		ifTrue: [
			^ ((LedgerWindow withCommas: (aString copyFrom: 1 to: aString size - 3)), 
				',', (aString copyFrom: aString size - 2 to: aString size))].
	^ aString! !

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

!InnerTextMorph methodsFor: 'accept/cancel' stamp: 'jmv 11/9/2011 17:57'!
acceptOnCR: trueOrFalse
	acceptOnCR _ trueOrFalse! !

!InnerTextMorph methodsFor: 'menu' stamp: 'jmv 11/9/2011 17:57'!
addCustomMenuItems: aCustomMenu hand: aHandMorph 
	"Add text-related menu items to the menu"

	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu 
		addUpdating: #wrapString
		target: self
		action: #wrapOnOff! !

!InnerTextMorph methodsFor: 'submorphs-add/remove' stamp: 'jmv 9/22/2012 15:10'!
addMorphFrontFromWorldPosition: aMorph
	"Overridden for more specific re-layout and positioning"
	| positionInWorld |
	positionInWorld _ aMorph morphPositionInWorld.
	^self anchorMorph: aMorph at: positionInWorld! !

!InnerTextMorph methodsFor: 'geometry' stamp: 'jmv 7/20/2014 10:04'!
adjustExtent
	"This is just a suggestion. If we do wordwrap, the width will be honored.
	But the height is whatever is appropriate for the contents!! See #fit"
	self morphExtent: owner viewableExtent! !

!InnerTextMorph methodsFor: 'anchors' stamp: 'jmv 8/5/2012 01:09'!
anchorMorph: aMorph at: aPoint
	| relPt |
	aMorph owner == self ifTrue: [ self removeMorph: aMorph ].
	self addMorphFront: aMorph.
	relPt _ aPoint - self morphPositionInWorld.
	editor insertMorph: aMorph at: relPt.
	self fit.! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'dhn 4/5/2016 21:35'!
askBeforeDiscardingEdits
	"Answer the value of askBeforeDiscardingEdits"

	^ askBeforeDiscardingEdits! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'jmv 11/9/2011 17:57'!
askBeforeDiscardingEdits: aBoolean
	"Set the flag that determines whether the user should be asked before discarding unaccepted edits."

	askBeforeDiscardingEdits _ aBoolean! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'dhn 4/5/2016 21:35'!
autoCompleter
	"Answer the value of autoCompleter"

	^ autoCompleter! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'dhn 4/5/2016 21:35'!
autoCompleter: anObject
	"Set the value of autoCompleter"

	autoCompleter _ anObject! !

!InnerTextMorph methodsFor: 'private' stamp: 'jmv 6/21/2015 14:11'!
autoCompleterClass: aTextCompleterClass
	autoCompleter class == aTextCompleterClass ifFalse: [
		autoCompleter _ aTextCompleterClass ifNotNil: [
			aTextCompleterClass withModel: model ].
		autoCompleter ifNotNil: [
			autoCompleter textMorph: self ]]! !

!InnerTextMorph methodsFor: 'testing' stamp: 'jmv 11/9/2011 17:57'!
canDiscardEdits
	"Return true if this view either has no text changes or does not care."
	^ (hasUnacceptedEdits & askBeforeDiscardingEdits) not! !

!InnerTextMorph methodsFor: 'editing' stamp: 'jmv 10/16/2013 19:59'!
cancelEdits
	"The message is sent when the user hits Cmd-L.
	Cancel the current contents and end editing."
	self releaseEditorAndTextComposition.
	model refetch! !

!InnerTextMorph methodsFor: '*Ledgerdemain' stamp: 'dhn 4/6/2016 13:22'!
char
	"Answer the value of char"

	^ char! !

!InnerTextMorph methodsFor: '*Ledgerdemain' stamp: 'dhn 4/6/2016 13:22'!
char: anObject
	"Set the value of char"

	char _ anObject! !

!InnerTextMorph methodsFor: 'editing' stamp: 'jmv 10/16/2013 19:54'!
chooseEmphasisOrAlignment
	self editor changeEmphasisOrAlignment.
	self updateFromTextComposition! !

!InnerTextMorph methodsFor: 'editing' stamp: 'jmv 10/16/2013 19:54'!
chooseFont
	self editor offerFontMenu.
	self updateFromTextComposition.! !

!InnerTextMorph methodsFor: 'events' stamp: 'jmv 8/21/2012 09:14'!
clickAndHalf: aMouseButtonEvent localPosition: localEventPosition

	self handleInteraction: [
		editor clickAndHalf ].
	owner scrollSelectionIntoView! !

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

!InnerTextMorph methodsFor: 'drawing' stamp: 'jmv 10/16/2013 19:55'!
debugDrawLineRectsOn: aCanvas
	"Shows where text line rectangles are"

	self textComposition lines do: [ :line |
		aCanvas
			frameRectangle: line rectangle
			borderWidth: 1
			color: Color brown ]
! !

!InnerTextMorph methodsFor: 'initialization' stamp: 'jmv 11/9/2011 17:57'!
defaultColor
	"Return the default fill style for the receiver"
	^ Theme current text! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'jmv 2/5/2015 00:39'!
disableEdition
	self setProperty: #disablesEdition toValue: true.
	self stopBlinking! !

!InnerTextMorph methodsFor: 'event handling testing' stamp: 'jmv 2/5/2015 00:45'!
disablesEdition

	^self hasProperty: #disablesEdition! !

!InnerTextMorph methodsFor: 'miscellaneous' stamp: 'jmv 11/9/2011 17:57'!
disregardUnacceptedEdits

	^ self hasUnacceptedEdits: false! !

!InnerTextMorph methodsFor: 'events' stamp: 'jmv 8/21/2012 10:03'!
doubleClickAndHalf: aMouseButtonEvent localPosition: localEventPosition

	self handleInteraction: [
		editor doubleClickAndHalf ].
	owner scrollSelectionIntoView! !

!InnerTextMorph methodsFor: 'drawing' stamp: 'jmv 10/16/2013 19:55'!
drawOn: aCanvas
	"Draw the receiver on a canvas"

	false ifTrue: [ self debugDrawLineRectsOn: aCanvas ].  "show line rects for debugging"

	aCanvas
		textComposition: self textComposition
		bounds: (0@0 extent: extent)
		color: color
		selectionColor: (Theme current textHighlightFocused: self hasKeyboardFocus)! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'jmv 5/5/2014 07:03'!
editor
	"Return my current editor, or install a new one."
	editor ifNil: [ self installEditorAndTextComposition ].
	^editor! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'dhn 4/5/2016 21:35'!
editor: anObject
	"Set the value of editor"

	editor _ anObject! !

!InnerTextMorph methodsFor: 'editing' stamp: 'jmv 5/26/2013 16:31'!
enterClickableRegion: aMorphicEvent localPosition: localEventPosition
! !

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

!InnerTextMorph methodsFor: 'macpal' stamp: 'jmv 11/15/2011 16:01'!
flash
	^ owner flash! !

!InnerTextMorph methodsFor: 'geometry' stamp: 'KenD 8/27/2015 15:58'!
fontPreferenceChanged

	super fontPreferenceChanged.
	self updateFromTextComposition.! !

!InnerTextMorph methodsFor: 'shout' stamp: 'jmv 11/9/2011 17:57'!
formatAndStyleIfNeeded
	"Apply both formatting (changes to the characters in the text, such as
	preferred assignment operators), and styling (TextAttributes to make
	Smalltalk code easier to understand)"

	self okToStyle ifTrue: [
		styler formatAndStyle ]! !

!InnerTextMorph methodsFor: 'menu' stamp: 'jmv 12/3/2011 02:36'!
getMenu

	^self editor getMenu! !

!InnerTextMorph methodsFor: 'editing' stamp: 'jmv 12/8/2015 20:40'!
handleInteraction: interactionBlock
	"Perform the changes in interactionBlock, noting any change in selection
	and possibly a change in the composition"

	self selectionChanged.  "Note old selection"

	interactionBlock value.

	self selectionChanged.  "Note new selection"
	self updateFromTextComposition! !

!InnerTextMorph methodsFor: 'event handling testing' stamp: 'jmv 11/9/2011 17:57'!
handlesKeyboard

	^self visible! !

!InnerTextMorph methodsFor: 'event handling testing' stamp: 'jmv 8/20/2012 18:52'!
handlesMouseDown: aMouseButtonEvent
	^ true! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'jmv 12/3/2011 00:41'!
hasEditingConflicts
	"Return true if a conflicting edit to the same code (typically) is known to have occurred after the current contents started getting edited"

	^ hasEditingConflicts! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'jmv 12/3/2011 00:41'!
hasEditingConflicts: aBoolean

	hasEditingConflicts _ aBoolean! !

!InnerTextMorph methodsFor: 'testing' stamp: 'jmv 11/9/2011 17:57'!
hasUnacceptedEdits
	^hasUnacceptedEdits! !

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

!InnerTextMorph methodsFor: 'initialization' stamp: 'jmv 12/3/2011 00:41'!
initialize
	super initialize.
	wrapFlag _ true.
	acceptOnCR _ false.
	hasUnacceptedEdits _ false.
	hasEditingConflicts _ false.
	askBeforeDiscardingEdits _ true! !

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

!InnerTextMorph methodsFor: 'classification' stamp: 'jmv 11/14/2011 16:52'!
is: aSymbol
	^ aSymbol == #InnerTextMorph or: [ super is: aSymbol ]! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'jmv 11/9/2011 17:57'!
isWrapped
	
	^wrapFlag! !

!InnerTextMorph methodsFor: '*Ledgerdemain' stamp: 'dhn 4/6/2016 13:22'!
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
			char := aKeyboardEvent keyValue asCharacter.
			autoCompleter class = LedgerCompleter ifTrue: [autoCompleter openCompletionMenu].
			autoCompleter
				autoCompletionAround: [ self processKeyStroke: aKeyboardEvent ]
				keyStroke: aKeyboardEvent ]! !

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

!InnerTextMorph methodsFor: 'geometry' stamp: 'jmv 4/15/2014 09:22'!
minimumExtent

	^(9@(AbstractFont default height+2))! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'dhn 4/5/2016 21:35'!
model
	"Answer the value of model"

	^ model! !

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

!InnerTextMorph methodsFor: '*Ledgerdemain' stamp: 'dhn 4/6/2016 13:22'!
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

!InnerTextMorph methodsFor: 'events' stamp: 'jmv 1/14/2013 23:15'!
mouseButton1Up: aMouseButtonEvent localPosition: localEventPosition

	super mouseButton1Up: aMouseButtonEvent localPosition: localEventPosition.
	self pauseBlinking.
	self handleInteraction: [ editor mouseButton1Up: aMouseButtonEvent  localPosition: localEventPosition ].
	owner scrollSelectionIntoView! !

!InnerTextMorph methodsFor: 'private' stamp: 'jmv 1/27/2013 00:50'!
mouseButton2Activity
	"Invoke the menu"
	self getMenu ifNotNil: [ :menu |
		menu popUpInWorld: self world.
		"menu invokeModal" ]! !

!InnerTextMorph methodsFor: 'events' stamp: 'jmv 8/21/2012 12:38'!
mouseMove: aMouseMoveEvent localPosition: localEventPosition

	aMouseMoveEvent mouseButton1Pressed ifFalse: [
		^ self enterClickableRegion: aMouseMoveEvent localPosition: localEventPosition ].
	self handleInteraction: [
		editor mouseMove: aMouseMoveEvent localPosition: localEventPosition].
	owner scrollSelectionIntoView! !

!InnerTextMorph methodsFor: 'private' stamp: 'jmv 9/19/2012 23:05'!
mutex
	mutex
		ifNil: [ mutex := Mutex new ].
	^mutex! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'dhn 4/5/2016 21:35'!
mutex: anObject
	"Set the value of mutex"

	mutex _ anObject! !

!InnerTextMorph methodsFor: 'shout' stamp: 'jmv 11/9/2011 17:57'!
okToStyle
	styler ifNil: [ ^false ].
	^model shoutAboutToStyle: styler! !

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

!InnerTextMorph methodsFor: 'accessing' stamp: 'dhn 4/5/2016 21:35'!
pauseBlinking: anObject
	"Set the value of pauseBlinking"

	pauseBlinking _ anObject! !

!InnerTextMorph methodsFor: 'notifications' stamp: 'jmv 11/15/2011 16:00'!
possiblyChanged
	owner possiblyChanged! !

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

!InnerTextMorph methodsFor: 'caching' stamp: 'jmv 10/16/2013 19:59'!
releaseCachedState

	super releaseCachedState.
	self releaseEditorAndTextComposition.
! !

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

!InnerTextMorph methodsFor: 'selection' stamp: 'jmv 7/29/2012 15:12'!
scrollSelectionIntoView

	(owner is: #ScrollPane) ifTrue: [
		owner scrollSelectionIntoView ]! !

!InnerTextMorph methodsFor: 'miscellaneous' stamp: 'jmv 11/9/2011 17:57'!
selectAll
	"Tell my editor to select all the text"

	self editor selectAll.
	self redrawNeeded! !

!InnerTextMorph methodsFor: 'private' stamp: 'jmv 7/18/2014 14:53'!
selectionChanged

	self textComposition selectionRects do: [:r | self invalidateLocalRect: r ]! !

!InnerTextMorph methodsFor: 'blinking cursor' stamp: 'jmv 2/5/2015 00:45'!
showsBlinkingCursor

	^self handlesKeyboard and: [ self disablesEdition not ]! !

!InnerTextMorph methodsFor: 'notifications' stamp: 'jmv 4/7/2016 17:34'!
someSubmorphPositionOrExtentChanged
	"Our extent, or some submorph changed. Must layout submorphs again."

	super someSubmorphPositionOrExtentChanged.
	self releaseEditorAndTextComposition! !

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

!InnerTextMorph methodsFor: 'accessing' stamp: 'dhn 4/5/2016 21:35'!
styler
	"Answer the value of styler"

	^ styler! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'dhn 4/5/2016 21:35'!
styler: anObject
	"Set the value of styler"

	styler _ anObject! !

!InnerTextMorph methodsFor: 'private' stamp: 'jmv 6/21/2015 14:12'!
stylerClass: aTextStylerClass
	styler class == aTextStylerClass ifFalse: [
		styler _ aTextStylerClass ifNotNil: [
			aTextStylerClass new ].
		styler ifNotNil: [
			model ifNotNil: [
				styler textModel: model ]]]! !

!InnerTextMorph methodsFor: 'shout' stamp: 'jmv 10/16/2013 19:55'!
stylerStyled

	self textComposition composeAll.
	self editor recomputeSelection.	
	self updateFromTextComposition.
	self editor blinkParen.
	self scrollSelectionIntoView! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'jmv 8/21/2012 21:56'!
textColor

	^ color! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'jmv 8/21/2012 22:00'!
textColor: aColor

	color = aColor ifTrue: [^ self].
	color _ aColor.
	self redrawNeeded! !

!InnerTextMorph methodsFor: 'private' stamp: 'jmv 5/5/2014 07:03'!
textComposition
	"textComposition instantiation is lazy -- create it only when needed"
	textComposition ifNil: [ self installEditorAndTextComposition ].
	^textComposition! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'dhn 4/5/2016 21:35'!
textComposition: anObject
	"Set the value of textComposition"

	textComposition _ anObject! !

!InnerTextMorph methodsFor: 'private' stamp: 'jmv 10/16/2013 20:02'!
updateFromTextComposition
	"A change has taken place in my textComposition, as a result of editing and I must be updated. "

	textComposition ifNotNil: [
		editor storeSelectionInComposition.
		self fit ].

	owner
		updateScrollBarsBounds;
		setScrollDeltas! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'dhn 4/5/2016 21:35'!
wrapFlag
	"Answer the value of wrapFlag"

	^ wrapFlag! !

!InnerTextMorph methodsFor: 'accessing' stamp: 'jmv 5/3/2015 19:22'!
wrapFlag: aBoolean
	"Change whether contents are wrapped to the container."

	aBoolean == wrapFlag ifTrue: [^ self].
	wrapFlag _ aBoolean.

	"Compose my text to fit my bounds."
	self resetTextComposition.
	self editor recomputeSelection.	
	self updateFromTextComposition ! !

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

!Suggestion class methodsFor: 'as yet unclassified' stamp: 'dhn 10/16/2015 20:37'!
try
	"see if this shows up in unsaved changes"
	^ Dictionary new
		at: #date put: (Field at: 1@11);
		at: #balance put: (Field at: 135@146 left: false);
		yourself
! !

!Payee methodsFor: 'accessing' stamp: 'dhn 6/22/2015 14:01'!
last
	"Answer the value of last"

	last ifNil: [last _ Dictionary new].
	^ last! !

!Payee methodsFor: 'accessing' stamp: 'dhn 6/14/2015 21:37'!
last: anObject
	"Set the value of last"

	last _ anObject! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 8/7/2015 15:53'!
account
	"Answer the value of account"

	^ account! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 8/7/2015 15:53'!
account: anObject
	"Set the value of account"

	account _ anObject! !

!Transaction methodsFor: 'loading' stamp: 'dhn 10/24/2015 15:42'!
acquire: aField from: aRecord
	"Answer the subset of aString which is defined by aField. Input aRecord is an input file record."
	| loc |
	loc _ (self class fileFields at: aField asSymbol) location.
	^ aRecord copyFrom: loc x to: loc y.! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 3/23/2016 10:23'!
amount
	"Answer the content of the amount field"

	amount ifNil: [amount _ 0].
	^ amount! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 8/8/2015 20:52'!
amount: anObject
	"Set the value of amount"

	amount _ anObject! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 8/7/2015 15:24'!
balance
	"Answer the content of the balance field"

	balance ifNil: [balance _ String new].
	^ balance! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 8/8/2015 20:53'!
balance: anObject
	"Set the value of balance"

	balance _ anObject! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 8/7/2015 15:25'!
category
	"Answer the value of category"

	category ifNil: [category _ String new].
	^ category! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 8/7/2015 15:17'!
category: anObject
	"Set the value of category"

	category _ anObject! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 10/21/2015 15:22'!
check
	"Answer the value of check"

	(check allSatisfy: [:a | (a = $ )])
		ifTrue: [^ type]
		ifFalse: [^ check]! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 8/7/2015 21:41'!
check: anObject
	"Set the value of check"

	check _ anObject! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 8/7/2015 15:25'!
date
	"Answer the value of date"

	date ifNil: [date _ String new].
	^ date! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 8/7/2015 15:17'!
date: anObject
	"Set the value of date"

	date _ anObject! !

!Transaction methodsFor: 'displaying' stamp: 'dhn 3/29/2016 20:36'!
formatTransaction
	"Answer the receiver as a formatted ledger line"

	^ String streamContents: [:str |
		str 
			nextPutAll: 
				(self leftJustify: (self class listFields at: #date) 
					with: (Date fromDays: self date asNumber) mmddyyyy);
			nextPutAll: 
				(self leftJustify: (self class listFields at: #check) 
					with: self check withoutTrailingBlanks);
			nextPutAll: 
				(self leftJustify: (self class listFields at: #payee) 
					with: self payee withoutTrailingBlanks);
			nextPutAll: 
				(self leftJustify: (self class listFields at: #category) 
					with: self category withoutTrailingBlanks);
			nextPutAll: 
				(self leftJustify: (self class listFields at: #memo) 
					with: self memo withoutTrailingBlanks);
			nextPutAll: 
				(self leftJustify: (self class listFields at: #reconciled) 
					with: self reconciled withoutTrailingBlanks);
			nextPutAll: 
				(self rightJustify: (self class listFields at: #amount) 
					with: self amount ledgerFormatted);
			nextPutAll: 
				(self rightJustify: (self class listFields at: #Blank07) 
					with: ' ');
			nextPutAll: 
				(self leftJustify: (self class listFields at: #type) 
					with: self type withoutTrailingBlanks);
			nextPutAll: 
				(self rightJustify: (self class listFields at: #balance) 
					with: self account balCur ledgerFormatted)]! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 3/15/2016 20:25'!
key
	"Answer the value of key"

	key ifNil: [key _ ''].
	^ key! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 3/15/2016 15:42'!
key: anObject
	"Set the value of key"

	key _ anObject! !

!Transaction methodsFor: 'displaying' stamp: 'dhn 3/17/2016 20:25'!
leftJustify: aByteCount with: aString
	"Answer the contents of  of a field named  aSymbol, left-justifying it and padding it with padChar, if required."
	| padding rest padChar |
	
	rest _ aByteCount - aString size.
	padChar _ $ .
		
	rest < 0 
		ifTrue: [Error new signal: aString, ' for ', aByteCount asString, ' bytes in ', self class asString, ' is too long'].
	
	rest > 0 ifTrue: [
		padding _ String new: rest.
		1 to: rest do: [:n | padding at: n put: padChar]].
	
	rest = 0 ifTrue: [padding _ ''].
			
	^ String streamContents: [:str |
		str nextPutAll: aString.
		str nextPutAll: padding]! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 8/7/2015 15:26'!
memo
	"Answer the value of memo"

	memo ifNil: [memo _ String new].
	^ memo! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 8/7/2015 15:17'!
memo: anObject
	"Set the value of memo"

	memo _ anObject! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 8/7/2015 15:26'!
payee
	"Answer the value of payee"

	payee ifNil: [payee _ String new].
	^ payee! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 8/7/2015 15:17'!
payee: anObject
	"Set the value of payee"

	payee _ anObject! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 8/7/2015 15:27'!
reconciled
	"Answer the value of reconciled"

	reconciled ifNil: [reconciled _ String new].
	^ reconciled! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 8/7/2015 15:17'!
reconciled: anObject
	"Set the value of reconciled"

	reconciled _ anObject! !

!Transaction methodsFor: 'displaying' stamp: 'dhn 3/17/2016 20:26'!
rightJustify: aByteCount with: aString
	"Answer the contents of  of a field named  aSymbol, right-justifying it and padding it with padChar, if required."
	| padding rest padChar |
	
	rest _ aByteCount - aString size.
	padChar _ $ .
		
	rest < 0 
		ifTrue: [Error new signal: aString, ' for ', aByteCount asString, ' bytes in ', self class asString, ' is too long'].
	
	rest > 0 ifTrue: [
		padding _ String new: rest.
		1 to: rest do: [:n | padding at: n put: padChar]].
	
	rest = 0 ifTrue: [padding _ ''].
			
	^ String streamContents: [:str |
		str nextPutAll: padding.
		str nextPutAll: aString]! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 6/26/2015 17:15'!
transfer
	"Answer the value of transfer"

	^ transfer! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 6/26/2015 17:15'!
transfer: anObject
	"Set the value of transfer"

	transfer _ anObject! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 8/7/2015 15:28'!
type
	"Answer the value of type"

	type ifNil: [type _ String new].
	^ type! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 8/7/2015 15:17'!
type: anObject
	"Set the value of type"

	type _ anObject! !

!Transaction class methodsFor: 'as yet unclassified' stamp: 'dhn 10/24/2015 15:39'!
fileFields
	"Answer the record definition consisting of field names and positions"
	^ Dictionary new
		at: #type put: (Field at: 1@5);
		at: #Blank1 put: (Field at: 6@20);
		at: #date put: (Field at: 21@30);
		at: #Blank2 put: (Field at: 31@35);
		at: #check put: (Field at: 36@39);
		at: #Blank3 put: (Field at: 40);
		at: #payee put: (Field at: 41@70);
		at: #memo put: (Field at: 71@87);
		at: #category put: (Field at: 88@122);
		at: #reconciled put: (Field at: 123);
		at: #amount put: (Field at: 124@136);
		yourself
! !

!Transaction class methodsFor: 'as yet unclassified' stamp: 'dhn 3/17/2016 14:10'!
listFields
	"Answer the field names and their lengths for the ledger line"
	
	^ Dictionary new
		at: #date put: 11;
		at: #check put: 5;
		at: #payee put: 31;
		at: #category put: 36;
		at: #memo put: 30;
		at: #reconciled put: 2;
		at: #amount put: 13;
		at: #Blank07 put: 1;
		at: #type put: 5;
		at: #balance put: 12;
		yourself
! !
