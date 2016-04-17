'From Cuis 4.2 of 25 July 2013 [latest update: #2727] on 16 April 2016 at 9:20:22.350218 pm'!
'Description A description for this package will be supplied.'!
!provides: 'Ledgerdemain' 1 224!
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
	instanceVariableNames: 'directory accounts accountListIndex selectedAccount net modified transactionList transactionListIndex selectedTransaction ledgerSelection netString'
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
	instanceVariableNames: 'windowAccountList windowLedgerList windowEntries entryMorphs entryIndex keyboardFocus typeIndex'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'LedgerWindow class' category: #Ledgerdemain!
LedgerWindow class
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

!HandMorph class methodsFor: '*Ledgerdemain' stamp: 'dhn 4/9/2016 13:45'!
specialKeys
	"Answer the event keyValue for keys which receive special processing"
	
	^ #(
		28 		"left arrow"
		29 		"right arrow"
		43 		"+ (plus)"
		45 		"- (minus)"
	)! !

!InnerTextMorph methodsFor: '*Ledgerdemain' stamp: 'dhn 4/11/2016 14:33'!
autoCompleter
	"Answer the value of autoCompleter"
	
	^ autoCompleter! !

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

!LedgerDeMain methodsFor: 'transaction' stamp: 'dhn 4/9/2016 20:54'!
acceptTransaction: aTransaction
	"Put aTransaction in the ledger"
	| match |
	
	match _ selectedAccount ledger detect: [:a | a key withoutTrailingBlanks = aTransaction key] ifNone: [nil].
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

!LedgerDeMain methodsFor: 'entry' stamp: 'dhn 4/16/2016 21:17'!
getDate
	"Answer the date"
	
	{transactionListIndex} print.
	transactionListIndex = 0
		ifTrue: [
			selectedAccount ifNotNil: [^ (Date fromDays: (self transactionLast date)) mmddyyyy].
			selectedAccount ifNil: [^'']]
		ifFalse: [
			^ (Date fromDays: (self transactionCurrent
				ifNil: [self transactionLast date]
				ifNotNil: [self transactionCurrent date])) mmddyyyy]! !

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

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 4/9/2016 21:06'!
ledgerSelection
	"Answer the value of ledgerSelection"

	^ ledgerSelection! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 4/9/2016 21:06'!
ledgerSelection: anObject
	"Set the value of ledgerSelection"

	ledgerSelection _ anObject! !

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

!LedgerDeMain methodsFor: 'entry' stamp: 'dhn 4/16/2016 16:37'!
selectedEntries: anAccount 
	"Set the entry fields for anAccount"
	
	anAccount type = #checking
		ifTrue: [self triggerEvent: #checkingAccount]
		ifFalse: [self triggerEvent: #otherAccount]! !

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

!LedgerDeMain methodsFor: 'transaction' stamp: 'dhn 4/9/2016 21:21'!
transactionCurrent
	"Answer the transaction indexed by transactionListIndex"
	
	^ self transactionListIndex > 0
		ifTrue: [self ledgerSelection]
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

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 4/16/2016 16:51'!
transactionListIndex: index
	"Set the values of transactionListIndex, selectedTransaction, and ledgerSelection"

	transactionListIndex _ index.
	transactionList ifNotNil: [
		selectedAccount
			ifNil: [self triggerEvent: #removeEntries]
			ifNotNil: [self selectedEntries: selectedAccount].
		self selectedTransaction:
			(transactionList at: index ifAbsent: nil).
		self ledgerSelection: (self selectedAccount notNil
			ifTrue: [(self selectedAccount ledger at: index ifAbsent: nil)]
			ifFalse: [nil]).
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

!LedgerCompleter methodsFor: 'accessing' stamp: 'dhn 4/16/2016 12:33'!
computeEntries
	"Set the entries for the completer menu"
	| prefixStart prefixStop string |
	
	string _ model actualContents string.
	prefixStop _ position.
	prefixStart _ position.
	[ prefixStart > 0 and: [ (string at: prefixStart) isSeparator not ]] whileTrue: [
		prefixStart _ prefixStart - 1 ].
	prefix _ string copyFrom: prefixStart+1 to: prefixStop.
	entries _ Array streamContents: [ :strm |
		model textProvider getEntryTrie 
			forPrefix: prefix
			keysAndValuesDo: [:key :val | strm nextPut: key]]! !

!LedgerCompleter methodsFor: 'menu morph' stamp: 'dhn 4/16/2016 12:47'!
openCompletionMenu
	"Open the completer menu, but first close any open already"
	| theEditor |
	
	theEditor _ textMorph editor.
	position _ theEditor startIndex - 1.
	self closeMenu.
	self computeEntries.
	menuMorph _  LedgerCompleterMorph 
		completer: self
		position: theEditor startBlock bottomLeft + textMorph morphPositionInWorld! !

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

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 4/16/2016 20:35'!
buildCategoryEntry: aNumber
	"Answer the label and entry field for Category"
	| m fld |
	
	m _ LayoutMorph newColumn
				layoutSpec: (LayoutSpec proportionalWidth: 0.8).
	m addMorph: ((StringMorph contents: 'Category')
		layoutSpec: (LayoutSpec fixedHeight: 15)).
		
	m addMorph: ((fld _ EntryField 
			textProvider: model
			getter: #getCategory
			name: #Category)
				textModel: self;
				setBalloonText: 'What transaction was for';
				hideScrollBarsIndefinitely;
				layoutSpec: (LayoutSpec useAll)).
	fld position: aNumber.
	windowEntries add: fld.
	
	^ m
		! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 4/16/2016 20:38'!
buildCheckEntry: aNumber
	"Answer the label and entry field for Check number"
	| m fld |
	
	m _ LayoutMorph newColumn
				layoutSpec: (LayoutSpec fixedWidth: 60).
	m addMorph: ((StringMorph contents: 'Check')
		layoutSpec: (LayoutSpec fixedHeight: 15)).
		
	m addMorph: ((fld _ EntryField 
			textProvider: model
			getter: #getCheck
			name: #Check)
				textModel: self;
				setBalloonText: 'Check number or transaction type';
				layoutSpec: (LayoutSpec useAll)).
	fld position: aNumber.
	windowEntries add: fld.
	
	^ m
		! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 4/12/2016 10:40'!
buildCheckingEntries
	"Answer the layout for transaction entry fields for checking accounts"
	| n |
	
	n _ 0.
	^ (OrderedCollection new)
		add: (self buildDateEntry: (n _ n + 1));		
		add: (self buildCheckEntry: (n _ n + 1));		
		add: (self buildPayeeEntry: (n _ n + 1));		
		add: (self buildCategoryEntry: (n _ n + 1));		
		add: (self buildMemoEntry: (n _ n + 1));		
		add: (self buildDebitEntry: (n _ n + 1));		
		add: (self buildCreditEntry: (n _ n + 1));
		yourself! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 4/16/2016 20:37'!
buildCreditEntry: aNumber
	"Answer the label and entry field for the Credit amount"
	| m fld |
	
	m _ LayoutMorph newColumn
				layoutSpec: (LayoutSpec fixedWidth: 65).
	m addMorph: ((StringMorph contents: 'Credit')
		layoutSpec: (LayoutSpec fixedHeight: 15)).
		
	m addMorph: ((fld _ EntryField 
			textProvider: model
			getter: #getCredit
			name: #Credit)
				textModel: self;
				setBalloonText: 'Amount, if positive';
				layoutSpec: (LayoutSpec useAll)).
	fld position: aNumber.
	windowEntries add: fld.
	
	^ m
		! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 4/16/2016 20:35'!
buildDateEntry: aNumber
	"Answer the label and entry field for Date"
	| m fld |
	
	m _ LayoutMorph newColumn
				layoutSpec: (LayoutSpec fixedWidth: 85).
	m addMorph: ((StringMorph contents: 'Date')
		layoutSpec: (LayoutSpec fixedHeight: 15)).
		
	m addMorph: ((fld _ EntryField
			textProvider: model
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

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 4/16/2016 20:36'!
buildDebitEntry: aNumber
	"Answer the label and entry field for the Debit amount"
	| m fld |
	
	m _ LayoutMorph newColumn
				layoutSpec: (LayoutSpec fixedWidth: 65).
	m addMorph: ((StringMorph contents: 'Debit')
		color: Color red;
		layoutSpec: (LayoutSpec fixedHeight: 15)).
		
	m addMorph: ((fld _ EntryField 
			textProvider: model
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

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 4/12/2016 10:02'!
buildEntries
	"Answer the empty layout for transaction entry fields"
	
	^ (LayoutMorph newRow separation: 5)
		name: #'Entry Fields'! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 4/16/2016 18:44'!
buildLedgerList
	"Answer the specifications for the ledger list in the window"
	
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
				
	entryMorphs _ self buildEntries
		layoutSpec: (LayoutSpec fixedHeight: 50).

	
	^ (LayoutMorph newColumn name: 'Ledger Column')
		addMorph: windowLedgerList;
		addMorph: entryMorphs
		
		
! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 4/16/2016 20:36'!
buildMemoEntry: aNumber
	"Answer the label and entry field for Memo"
	| m fld |
	
	m _ LayoutMorph newColumn
				layoutSpec: (LayoutSpec proportionalWidth: 0.8).
	m addMorph: ((StringMorph contents: 'Memo')
		layoutSpec: (LayoutSpec fixedHeight: 15)).
		
	m addMorph: ((fld _ EntryField 
			textProvider: model
			getter: #getMemo
			name: #Memo)
				textModel: self;
				setBalloonText: 'Additional transaction details';
				hideScrollBarsIndefinitely;
				layoutSpec: (LayoutSpec useAll)).
	fld position: aNumber.
	windowEntries add: fld.
	
	^ m
		! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 4/12/2016 09:57'!
buildMorphicWindow
	"Lay out a window for Ledger d'Main"

	(self layoutMorph beRow name: #Row)
		addMorph: self buildAccountList fixedWidth: 200;
		addMorph: self buildLedgerList
			layoutSpec: (LayoutSpec useAll).
	
	self sayWhen
! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 4/12/2016 10:40'!
buildOtherEntries
	"Answer the layout for transaction entry fields for accounts which have no checks"
	| n |
	
	n _ 0.
	^ (OrderedCollection new)
		add: (self buildDateEntry: (n _ n + 1));		
		add: (self buildPayeeEntry: (n _ n + 1));		
		add: (self buildCategoryEntry: (n _ n + 1));		
		add: (self buildMemoEntry: (n _ n + 1));		
		add: (self buildDebitEntry: (n _ n + 1));		
		add: (self buildCreditEntry: (n _ n + 1));
		yourself! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 4/16/2016 20:35'!
buildPayeeEntry: aNumber
	"Answer the label and entry field for Payee"
	| m fld |
	
	m _ LayoutMorph newColumn
				layoutSpec: (LayoutSpec proportionalWidth: 0.8).
	m addMorph: ((StringMorph contents: 'Payee')
		layoutSpec: (LayoutSpec fixedHeight: 15)).
	m addMorph: ((fld _ EntryField 
			textProvider: model
			getter: #getPayee
			name: #Payee)
				textModel: self;
				setBalloonText: 'Transaction destination or source';
				hideScrollBarsIndefinitely;
				layoutSpec: (LayoutSpec useAll)).
	fld position: aNumber.
	windowEntries add: fld.
	
	^ m
		! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 4/16/2016 20:37'!
buildREntry: aNumber
	"Answer the label and entry field for the Reconciled indicator"
	| m fld |
	
	m _ LayoutMorph newColumn
				layoutSpec: (LayoutSpec fixedWidth: 12).
	m addMorph: ((StringMorph contents: 'R')
		layoutSpec: (LayoutSpec fixedHeight: 15)).
		
	m addMorph: ((fld _ EntryField  
			textProvider: model
			getter: #getR
			name: #R)
				textModel: self;
				setBalloonText: 'Reconciled?';
				layoutSpec: (LayoutSpec useAll)).
	fld position: aNumber.
	windowEntries add: fld.
	
	^ m
		! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 4/12/2016 14:55'!
changeTransaction
	"Form a transaction from the EntryFields"
	| acct useCk tx dt ck py |
	
	acct _ model selectedAccount.
	acct ifNotNil: [
			(self areAnyMissing: ((useCk _ acct type = #checking)
				ifTrue: [{#Date. #Check. #Payee}]
				ifFalse: [{#Date. #Payee}]))
			ifFalse: [	
				tx _ Transaction new.
				dt _ LedgerWindow asLdmDate: (self entryContents: #Date).
				py _ self entryContents: #Payee.
				
				useCk
					ifTrue: [
						ck _ (self entryContents: #Check) withoutTrailingBlanks.
						tx 
							key: dt asString, ck, py;
							check: ck.
						(ck allSatisfy: [:a | a isDigit])
							ifTrue: [
								tx type: 'DEB'.
								acct lastCheck: (acct lastCheck max: tx check asNumber)]
					ifFalse: [tx type: tx check].
							]
					ifFalse: [tx key: dt asString,  py].
		
				tx 					
					account: acct;
					date: dt;
					payee: py;
					category: (self entryContents: #Category);
					memo: (self entryContents: #Memo);
					amount: (self amount: #Debit or: #Credit).

				tx reconciled: (model ledgerSelection notNil
					ifTrue: [model ledgerSelection reconciled]
					ifFalse: ['']).
					

				model
					growTries: tx;
					acceptTransaction: tx.
				self resetUnacceptedEdits]
		
			ifTrue: [nil inform: 
				(useCk
					ifTrue: ['Something missing in Date, Check, or Payee.']
					ifFalse: ['Something missing in Date or Payee.'])]]
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

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 4/16/2016 18:45'!
deleteEntries
	"Ensure that there are no entry fields"
	
	windowEntries _ OrderedCollection new.
	entryMorphs ifNotNil: [entryMorphs removeAllMorphs]
! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 4/12/2016 11:03'!
entryContents: aSymbol
	"Answer the contents of the entry field named aSymbol"
	
	^ (windowEntries detect: [:a | a name = aSymbol] ifNone: ['']) model actualContents asString! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 3/3/2016 16:00'!
entryIndex
	"Answer the value of entryIndex"

	entryIndex ifNil: [entryIndex _ 1].
	^ entryIndex! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 3/3/2016 12:41'!
entryIndex: anObject
	"Set the value of entryIndex"

	entryIndex _ anObject! !

!LedgerWindow methodsFor: 'updating' stamp: 'dhn 4/11/2016 12:41'!
getEntryTrie
	"Answer the completer database for the entry field at entryIndex"
	
	^ model perform: (self class completerTable at: (windowEntries at: entryIndex) name)! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 4/11/2016 20:41'!
goAhead
	"Go to the next EntryField to the right"
	| from to |
	
	from _ windowEntries at: entryIndex.
	entryIndex _ entryIndex + 1.
	entryIndex > windowEntries size 
		ifTrue: [
			entryIndex _ 1.
			(PopUpMenu confirm: 'Enter transaction?')
				ifTrue: [self changeTransaction]].
	to _ windowEntries at: entryIndex.
	from scroller autoCompleter closeMenu.
	self releaseKeyboardFocus: from scroller.
	from scroller releaseCachedState.
	self newKeyboardFocus: to scroller.
	to focusText.
	to scroller selectAll.
	
	self openCompleterFor: to
	! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 4/11/2016 14:59'!
goBack
	"Go to the next EntryField to the left"
	| from to |
	
	from _ windowEntries at: entryIndex.
	entryIndex _ entryIndex - 1.
	entryIndex <= 0 ifTrue: [entryIndex _ windowEntries size].
	to _ windowEntries at: entryIndex.
	from scroller autoCompleter closeMenu.
	self releaseKeyboardFocus: from scroller.
	from scroller releaseCachedState.
	self newKeyboardFocus: to scroller.
	to focusText.
	to scroller selectAll.
	
	self openCompleterFor: to

! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 4/11/2016 14:59'!
goMouse: index
	"Go to the EntryField selected by the mouse"
	| from to |
	
	from _ windowEntries at: entryIndex.
	entryIndex _ index.
	to _ windowEntries at: entryIndex.
	from scroller autoCompleter closeMenu.
	self releaseKeyboardFocus: from scroller.
	from scroller releaseCachedState.
	self newKeyboardFocus: to.
	to focusText.
	
	self openCompleterFor: to

	
	! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 3/9/2016 21:01'!
handlesKeyboard

	^self visible! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 4/12/2016 15:18'!
initialize

	super initialize.
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

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 4/16/2016 20:49'!
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
								model accounts: (model accountNamed: temp type: (arr at: kind) opening: bal at: balDate)].
							(arr at: kind) = #checking
								ifTrue: [self selectChecking]
								ifFalse: [self selectOther]]]]
					
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

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 4/11/2016 14:41'!
openCompleterFor: aField
	"Display completer menu for aField"
	
	(self class completerTable includesKey: aField name)
		ifTrue: [aField scroller autoCompleter openCompletionMenu]
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

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 4/16/2016 17:15'!
sayWhen
	"Establish the receiving half of the Observer Pattern"
	
	self when: #toTheRight send: #goAhead to: self.
	self when: #toTheLeft send: #goBack to: self.
	self when: #specialKey send: #'someKey:of:with:' to: self withArguments: #(#a #b #c).
	self when: #mouseSelected send: #goMouse: to: self withArguments: #(#ndx).
	self model when: #checkingAccount send: #selectChecking to: self.
	self model when: #otherAccount send: #selectOther to: self.
	self model when: #removeEntries send: #deleteEntries to: self.
! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 4/16/2016 18:48'!
selectChecking
	"Set entry fields for a checking account"
	
	self deleteEntries.
	entryMorphs addAllMorphs: self buildCheckingEntries reverse! !

!LedgerWindow methodsFor: 'accessing' stamp: 'dhn 4/16/2016 18:48'!
selectOther
	"Set entry fields for an account other than a checking account"
	
	self deleteEntries.
	entryMorphs addAllMorphs: self buildOtherEntries reverse! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 4/12/2016 10:48'!
someKey: aKey of: aType with: aModifier
	"Process special key strokes"
	| entr |
	
	entr _ windowEntries at: (entryIndex _ self entryIndex max: 1).
	aKey = 28 ifTrue: [	"left arrow"
		aType = #keyUp  ifTrue: [self goBack]].
	
	aKey = 29 ifTrue: [	"right arrow"
		aType = #keyUp  ifTrue: [self goAhead]].
	
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

!LedgerWindow methodsFor: 'updating' stamp: 'dhn 4/11/2016 20:51'!
update: aSymbol
	"Receive a change notice, as a dependent, from a dependee" 
	
	super update: aSymbol.
	
	aSymbol == #fillEntries
		ifTrue: [
			model selectedAccount isNil
				ifTrue: [windowEntries do: [:ea | ea model actualContents: '']]
				ifFalse: [windowEntries do: [:ea | ea model refetch]]].
		
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

!LedgerWindow class methodsFor: 'completer' stamp: 'dhn 4/11/2016 12:29'!
completerTable
	"Translate entry field names to methods for completer entries"
	
	^ Dictionary new
		at: #Category put: #categories;
		at: #Memo put: #memos;
		at: #Payee put: #payees;
		at: #Type put: #type;
		yourself! !

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

!LedgerWindow class methodsFor: 'instance creation' stamp: 'dhn 4/11/2016 15:28'!
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

!Transaction methodsFor: 'displaying' stamp: 'dhn 4/12/2016 15:04'!
formatTransaction
	"Answer the receiver as a formatted ledger line"

	^ String streamContents: [:str |
		str 	nextPutAll: 
			(self leftJustify: (self class listFields at: #date) 
				with: (Date fromDays: self date asNumber) mmddyyyy).

		self account type = #checking
			ifTrue: [
				str	nextPutAll: 
					(self leftJustify: (self class listFields at: #check) 
						with: self check withoutTrailingBlanks)].

		str
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
