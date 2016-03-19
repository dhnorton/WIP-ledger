'From Cuis 4.2 of 25 July 2013 [latest update: #2701] on 19 March 2016 at 2:34:49.539037 pm'!
'Description A description for this package will be supplied.'!
!provides: 'Ledgerdemain' 1 169!
!requires: 'Records' 1 10 nil!
!requires: 'Calendar' 1 23 nil!
!classDefinition: #Account category: #Ledgerdemain!
Object subclass: #Account
	instanceVariableNames: 'accountName ledger ledgerLines balOpen openDate balRcon balCur lastCheck'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'Account class' category: #Ledgerdemain!
Account class
	instanceVariableNames: ''!

!classDefinition: #LedgerDeMain category: #Ledgerdemain!
TextModel subclass: #LedgerDeMain
	instanceVariableNames: 'directory accounts accountListIndex selectedAccount net modified transactionList transactionListIndex transactionListTime selectedTransaction entryTable netEditor'
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
	instanceVariableNames: 'key account date type payee amount category memo reconciled transfer check balance'
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

!String methodsFor: '*Ledgerdemain' stamp: 'dhn 3/13/2016 12:54'!
asLdmDate
	"Convert receiver in the form of mm/dd/yyyy to a Ledgerdemain date number"
	"Covers dates from 1/1/1901 to 2/27/2935093 (quite a long time!!)"
	| w x |
	w _ self select: [:a | a isDigit or: a = $/].
	x _ w findTokens: '/'.
	x size ~= 3 
		ifTrue: [nil error: 'not a date'].

	^ (Date 
		newDay: x second asNumber 
		month: x first asNumber 
		year: x third asNumber)
			 julianDayNumber - Time squeakEpoch! !

!String methodsFor: '*Ledgerdemain' stamp: 'dhn 2/14/2016 17:36'!
dollarsToCents
	"Convert the receiver to a number of cents"
	| x y z neg fracC |
	
	x _ self withBlanksCondensed.
	[x asNumber] on: Error do: [^nil].
	
	y _ x findTokens: '-.' keep: '-.'.
	(neg _ y first = '-') ifTrue: [y _ y removeFirst;	yourself].
	y size = 1 ifTrue: [y _ y addAll: #('.' '00'); yourself].
	y size = 2 ifTrue: [y _ y addAll: #('00'); yourself].
	fracC _ 0.
	y third size = 1 ifTrue: [y at: 3 put: (y third, '0')].
	y third size > 2 
		ifTrue: [
			fracC _ (y third at: 3) asString asNumber.
			y at: 3 put: (y third copyFrom: 1 to: 2); yourself].
		
	z _ ((y first), y third) asNumber.
	fracC >= 5 ifTrue: [z _ z + 1].	"fraction of a cent"
	neg ifTrue: [z _ z negated].
	^ z! !

!String methodsFor: '*Ledgerdemain' stamp: 'dhn 11/11/2015 19:01'!
withCommas
	"Answer the receiver with commas at the thousands, millions, etc positions"

	self size > 3
		ifTrue: [
			^ (self copyFrom: 1 to: self size - 3) withCommas, 
				',', (self copyFrom: self size - 2 to: self size)]! !

!TextEditor methodsFor: '*Ledgerdemain' stamp: 'dhn 3/15/2016 12:59'!
getMenu
	
	| menu |
	self morph owner name = #Date ifTrue: [ | c |
		c _ CalendarPage open: CalendarModel new. 
		c morphPosition: 40.0@220.0.
		{self morph. self morph owner. self morph owner owner} print.
		^ nil].
	menu _ MenuMorph new defaultTarget: self.
	^self class paneMenu: menu! !

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

!SmallInteger methodsFor: '*Ledgerdemain' stamp: 'dhn 6/29/2015 13:34'!
asMmDdYyyy
	"Convert the receiver from Ledgerdemain date number to dd/mm/yyyy"
	^ (Date fromDays: self) mmddyyyy! !

!SmallInteger methodsFor: '*Ledgerdemain' stamp: 'dhn 11/11/2015 18:18'!
centsToDollars
	"Answer the receiver as an array of strings in the form {'d,ddd'. 'cc'} "
	| all sd sc |
	
	all _ self asString.
	all size < 2 ifTrue: [all _ ('0', all, '0') copyFrom: 1 to: 2].
	sc _ all copyFrom: all size - 1 to: all size.
	all size > 2
		ifTrue: [sd _ (all copyFrom: 1 to: all size - 2) withCommas]
		ifFalse: [sd _ '0'].
	^ {sd. sc}! !

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

!HandMorph class methodsFor: '*Ledgerdemain' stamp: 'dhn 3/9/2016 16:35'!
specialKeys
	"Answer the event keyValue for keys which receive special processing"
	
	^ #(
		  9 		"tab (right unshifted, left shifted)"
		13 		"enter"
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

!Account methodsFor: 'accessing' stamp: 'dhn 3/17/2016 18:27'!
ledgerLines
	"Answer the value of ledgerLines"

	^ ledgerLines! !

!Account methodsFor: 'accessing' stamp: 'dhn 3/17/2016 18:27'!
ledgerLines: anObject
	"Set the value of ledgerLines"

	ledgerLines _ anObject! !

!Account methodsFor: 'accessing' stamp: 'dhn 3/19/2016 14:30'!
listLedgerLines
	"Answer the transaction content in a form suitable for the ledger list"
	| col |

	col _ OrderedCollection new.			
	balCur _ balOpen.
	ledger do: [:ea | 
		balCur _ balCur + ea amount dollarsToCents.
		col addLast: ea formatTransaction].
	^ col! !

!Account methodsFor: 'accessing' stamp: 'dhn 3/15/2016 21:40'!
loadTransaction: anObject
	"Update balances and add anObject to the ledger"
	| amt ck |
	
	amt _ anObject amount dollarsToCents.
	
	anObject reconciled = 'R' ifTrue: [self balRcon: self balRcon + amt].
	
	((ck _ anObject check) allSatisfy: [:ea | ea isDigit])
		ifTrue: [lastCheck _ lastCheck max: ck asNumber].
		
	self ledger add: anObject copy! !

!Account methodsFor: 'accessing' stamp: 'dhn 7/1/2015 14:49'!
openDate
	"Answer the value of openDate"

	^ openDate! !

!Account methodsFor: 'accessing' stamp: 'dhn 7/1/2015 14:49'!
openDate: anObject
	"Set the value of openDate"

	openDate _ anObject! !

!LedgerDeMain methodsFor: 'save & restore' stamp: 'dhn 3/17/2016 14:41'!
accountFromFile
	"Copy account ledger entries from a file and add them to the account ledger ivar"
	| file ios line rec acct |
	
	selectedAccount ifNil: [self newAccount].
	file _ FillInTheBlankMorph request: 'Name of file with xactions:' initialAnswer: 'c:\directory\file.txt'.
	file ~= '' ifTrue: [
		ios _ ReadStream on: file asFileEntry fileContents.
		acct _ accounts at: accountListIndex.
		[(line _ ios nextLine) notNil]
			whileTrue: [	line size > 0 
				ifTrue: [
					rec _ Transaction new account: acct.
					rec type: (rec acquire: #type from: line).
					rec date: (rec acquire: #date from: line) asLdmDate asString.
					rec check: (rec acquire: #check from: line).
					rec payee: (rec acquire: #payee from: line).
					rec memo: (rec acquire: #memo from: line).
					rec category: (rec acquire: #category from: line).
					rec reconciled: (rec acquire: #reconciled from: line).
					rec amount: (rec acquire: #amount from: line).
					rec key: rec date, rec check, rec payee.
					self categories: rec category withoutTrailingBlanks.
					self payees: rec payee withoutTrailingBlanks.
					self memos: rec memo withoutTrailingBlanks.
					self type: rec type withoutTrailingBlanks.
					acct loadTransaction: rec]].
		
		self computeNet.
		self changed: #acctList.
		self changed: #xactList.
		self changed: #lastOnList]! !

!LedgerDeMain methodsFor: 'account' stamp: 'dhn 10/23/2015 21:20'!
accountList
	"Answer a list of accounts"

	^ accounts
		ifNil: [#()]
		ifNotNil: [accounts collect: [:a | a accountName]]! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 10/20/2015 20:03'!
accountListIndex
	"Answer the value of accountListIndex"

	accounts ifNil: [^ accountListIndex _ 0].
	^ accountListIndex _ accounts indexOf: selectedAccount! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 10/24/2015 21:01'!
accountListIndex: index
	"Set the value of accountListIndex"

	accountListIndex _ index.
	self selectedAccount:
		(accounts at: index ifAbsent: nil).
	self changed: #acctList.
	self changed: #lastOnList
	! !

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

!LedgerDeMain methodsFor: 'save & restore' stamp: 'dhn 6/23/2015 20:30'!
categoriesFromFile
	"Copy category names from a file and add them to the categories ivar"
	| file ios line |
	file _ FillInTheBlankMorph request: 'Name of categories File:' initialAnswer: 'c:\directory\file.ext'.
	file ~= '' ifTrue: [
		ios _ FileStream oldFileNamed: file.
		[(line _ ios nextLine) notNil]
			whileTrue: [	line size > 0 ifTrue: [self addCategory: line]].
		ios close]! !

!LedgerDeMain methodsFor: 'account' stamp: 'dhn 11/11/2015 19:53'!
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
			netEditor color: Color black.
			str nextPutAll: ' Total  ']
		ifFalse: [
			netEditor color: Color red.
			str nextPutAll: ' Loss  '].
	ttl _ ttl abs centsToDollars.
	str 
		nextPut: $$;
		nextPutAll: ttl first;
		nextPut: $.;
		nextPutAll: ttl second.
	netEditor contents: str contents.
! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 3/17/2016 18:30'!
directory
	"Answer the value of directory"

	^ directory! !

!LedgerDeMain methodsFor: 'initialization' stamp: 'dhn 10/13/2015 21:11'!
directory: dir
	"Set the path of the directory containing the accounts."

	directory _ dir! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 11/10/2015 20:15'!
entryTable
	"Answer the value of entryTable"

	^ entryTable! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 11/13/2015 16:08'!
entryTable: aSymbol
	"Set the value of entryTable"

	entryTable _ self perform: aSymbol! !

!LedgerDeMain methodsFor: 'entry' stamp: 'dhn 3/11/2016 21:01'!
getCategory
	"Answer the category"
	
	transactionListIndex = 0
		ifTrue: [^ self actualContents asString]
		ifFalse: [^ selectedTransaction category withoutTrailingBlanks]! !

!LedgerDeMain methodsFor: 'entry' stamp: 'dhn 3/19/2016 14:15'!
getCheck
	"Answer the check number"
	
	transactionListIndex = 0
		ifTrue: [
			selectedAccount ifNotNil: [^ (selectedAccount lastCheck + 1) asString]]
		ifFalse: [^ selectedTransaction check withoutTrailingBlanks]! !

!LedgerDeMain methodsFor: 'entry' stamp: 'dhn 2/13/2016 14:45'!
getCredit
	"Answer the amount if positive; '' otherwise"
	| x |
	
	transactionListIndex = 0
		ifTrue: [^ '']
		ifFalse: [
			x _ selectedTransaction amount withBlanksCondensed.
			x dollarsToCents < 0 ifTrue: [^ '']].
		
	^ x! !

!LedgerDeMain methodsFor: 'transaction' stamp: 'dhn 10/15/2015 20:39'!
getDataFor: anEntry
	"Set the contents of entry field anEntry"
	| method x |
	
	method _ anEntry valueOfProperty: #input.
	x _ self perform: method.
	{method. x. } print.
	^ x
	
	! !

!LedgerDeMain methodsFor: 'entry' stamp: 'dhn 3/13/2016 15:49'!
getDate
	"Answer the date"
	
	transactionListIndex = 0
		ifTrue: [^ Date today mmddyyyy]
		ifFalse: [^ (Date fromDays: selectedTransaction date asNumber) mmddyyyy]! !

!LedgerDeMain methodsFor: 'entry' stamp: 'dhn 2/13/2016 14:57'!
getDebit
	"Answer the amount if negative; '' otherwise"
	| x y |
	
	transactionListIndex = 0
		ifTrue: [^ '']
		ifFalse: [
			x _ selectedTransaction amount withBlanksCondensed dollarsToCents.
			x >= 0 ifTrue: [^ ''].
			y _ x negated ledgerFormatted].
		
	^ y! !

!LedgerDeMain methodsFor: 'entry' stamp: 'dhn 3/11/2016 21:00'!
getMemo
	"Answer the memo"
	
	transactionListIndex = 0
		ifTrue: [^ '']
		ifFalse: [^ selectedTransaction memo withoutTrailingBlanks]! !

!LedgerDeMain methodsFor: 'entry' stamp: 'dhn 3/11/2016 20:58'!
getPayee
	"Answer the payee"
	
	transactionListIndex = 0
		ifTrue: [^ '']
		ifFalse: [^ selectedTransaction payee withoutTrailingBlanks]! !

!LedgerDeMain methodsFor: 'entry' stamp: 'dhn 10/21/2015 12:30'!
getR
	"Answer the reconciled indicator"
	
	transactionListIndex = 0
		ifTrue: [^ '']
		ifFalse: [^ selectedTransaction reconciled]! !

!LedgerDeMain methodsFor: 'initialization' stamp: 'dhn 3/17/2016 20:34'!
initialize
	"initialize the state of the receiver"

	super initialize.
	self transactionListIndex: 0.
	transactionListTime _ Time localMillisecondClock.
	modified _ false.
	self changed: #acctList.
	self changed: #xactList! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 8/12/2015 21:25'!
list: aSymbol
	"Show the results of the method named aSymbol in a SelectionMenu"
	| entries rcvr pick |
	
	entries _ OrderedCollection new.
	rcvr _ self perform: aSymbol.
	rcvr keysDo: [:k | entries add: k].
	entries size = 0 ifTrue: [^ Smalltalk beep].
	pick _ (SelectionMenu selections: entries) startUpMenu.
	{pick} print.
	^ pick
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

!LedgerDeMain methodsFor: 'save & restore' stamp: 'dhn 6/24/2015 11:03'!
memosFromFile
	"Copy memos from a file and add them to the memos ivar"
	| file ios line |
	file _ FillInTheBlankMorph request: 'Name of memos file:' initialAnswer: 'c:\directory\file.ext'.
	file ~= '' ifTrue: [
		ios _ FileStream oldFileNamed: file.
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

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 11/11/2015 14:31'!
netEditor
	"Answer the value of netEditor"

	^ netEditor! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 11/11/2015 14:32'!
netEditor: anObject
	"Set the value of netEditor"

	netEditor _ anObject! !

!LedgerDeMain methodsFor: 'account' stamp: 'dhn 3/18/2016 14:24'!
newAccount
	| temp bal amt balDate acct rec |
	
	temp _ FillInTheBlankMorph request: 'Name of new account:'.
	temp ~= '' ifTrue: [
		(accounts allSatisfy: [:a | temp ~= a accountName])
			ifTrue: [
				acct _ Account new accountName: temp.
				bal _ FillInTheBlankMorph 
					request: 'Opening balance for ', temp
					initialAnswer: '0.00'.
				bal ~= '' 
					ifTrue: [
						balDate _ FillInTheBlankMorph 
							request: 'Date of opening balance'
							initialAnswer: Date today mmddyyyy]
					ifFalse: [
						bal _ '0'.
						balDate _ Date today mmddyyyy].
				amt _ bal dollarsToCents.
				acct
					openDate: balDate asLdmDate asString;
					balOpen: amt;
					balCur: amt;
					balRcon: amt.
				rec _ Transaction new account: acct.
				rec
					date: acct openDate;
					payee: '**Opening Balance';
					reconciled: 'R';
					type: '';
					amount: '0.00';
					category: '';
					memo: '';
					transfer: '';
					check: '';
					balance: acct balOpen ledgerFormatted.
				acct ledger add: rec.
				self 
					accounts: acct;
					computeNet.
				self changed: #acctList.
				self changed: #xactList]
			ifFalse: [nil inform: temp,' is already an account']]
! !

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

!LedgerDeMain methodsFor: 'save & restore' stamp: 'dhn 6/23/2015 20:19'!
payeesFromFile
	"Copy payee names from a file and add them to the payees ivar"
	| file ios line |
	file _ FillInTheBlankMorph request: 'Name of payees File:' initialAnswer: 'c:\directory\file.ext'.
	file ~= '' ifTrue: [
		ios _ FileStream oldFileNamed: file.
		[(line _ ios nextLine) notNil]
			whileTrue: [	line size > 0 ifTrue: [self payees at: line put: Payee new]].
		ios close]! !

!LedgerDeMain methodsFor: 'entry' stamp: 'dhn 2/13/2016 15:48'!
putDebit: aString
	"Set the amount"
	
	self halt! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/26/2015 14:51'!
reconcile! !

!LedgerDeMain methodsFor: 'save & restore' stamp: 'dhn 6/24/2015 10:07'!
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
	ios _ FileStream oldFileNamed: fileName.
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

!LedgerDeMain methodsFor: 'account' stamp: 'dhn 10/24/2015 16:16'!
selectedAccount: anObject
	"Set the value of selectedAccount "

	selectedAccount _ anObject.
	self changed: #acctList.
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

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 3/17/2016 20:50'!
transactionList
	"Answer a list of transactions"

	self accounts isEmpty ifFalse: [ 
		self accountListIndex > 0 ifTrue: [ 
			(Time localMillisecondClock) - transactionListTime > 20
				ifTrue: [	"to avoid doing this 4 times per up or down arrow!!"
					transactionListTime _ Time localMillisecondClock.
					^ transactionList _ selectedAccount listLedgerLines]
				ifFalse: [^ transactionList]]].
	^ transactionList _ OrderedCollection new 
! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 3/17/2016 18:30'!
transactionList: anObject
	"Set the value of transactionList"

	transactionList _ anObject! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 10/20/2015 18:33'!
transactionListIndex
	"Answer the value of transactionListIndex"

	^ transactionListIndex! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 10/23/2015 20:57'!
transactionListIndex: index
	"Set the values of transactionListIndex and selectedTransaction"

	transactionListIndex _ index.
	transactionListIndex > 0
		ifTrue: [selectedTransaction _ selectedAccount ledger at: transactionListIndex]
		ifFalse: [selectedTransaction _ nil].
	self changed: #xactList.
	self changed: #fillEntries

! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 3/17/2016 18:30'!
transactionListTime
	"Answer the value of transactionListTime"

	^ transactionListTime! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 3/17/2016 18:30'!
transactionListTime: anObject
	"Set the value of transactionListTime"

	transactionListTime _ anObject! !

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

!LedgerCompleter methodsFor: 'accessing' stamp: 'dhn 11/13/2015 16:25'!
addEntriesTo: aStream
	"Supply content to the completer"
	| db pref |

	db _ model textProvider entryTable.
	pref _ model actualContents asString.
	db 
		forPrefix: pref
		keysAndValuesDo: [:key :val | aStream nextPut: key]! !

!LedgerCompleter methodsFor: 'accessing' stamp: 'dhn 2/15/2016 21:50'!
computeEntries
	"Set the list for the completer"
	| signal trie char col |
	
	signal _ textMorph owner valueOfProperty: #morphName. 	"where are we?"
	trie _ textMorph owner textModel getTrieFor: signal. 	"get the Trie for this field"
	char _ textMorph editor text first asString. 	"hack, cough"
	prefix _ char. 	"hack, cough"
	col _ OrderedCollection new.
	trie forPrefix: char keysAndValuesDo: [:key :val | col add: key]. 	"extract entries from the Trie"
	entries _ col.
	self triggerEvent: signal 	"notify that the completer entries have changed"! !

!LedgerCompleter methodsFor: 'menu morph' stamp: 'dhn 11/9/2015 20:17'!
openCompletionMenu
	| theEditor |
	theEditor _ textMorph editor.
	position _ theEditor startIndex - 1.
	self closeMenu.
	self computeEntries.
	entries notEmpty
		ifTrue: [ 
			menuMorph _  LedgerCompleterMorph 
				completer: self
				position: theEditor startBlock bottomLeft + textMorph morphPositionInWorld ]! !

!LedgerCalculator methodsFor: 'initialization' stamp: 'dhn 2/14/2016 14:31'!
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
					y _ w asString dollarsToCents ledgerFormatted]]
			ifFalse: [ok _ true]].
		
	^ y! !

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

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 6/30/2015 20:36'!
addAccountActionsTo: aMenu
	"Add items to aMenu for account actions"

	| subMenu |
	subMenu := MenuMorph new defaultTarget: self.
	subMenu add: 'Add an account'	target: self model 	action:	#newAccount.
	subMenu add: 'Load account from file...'	target: self model 	action:	#accountFromFile.
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

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 2/15/2016 22:19'!
autoCompleterClassFor: textGetter
	"Essential method. Necessary in order to have a completer available for the containing class"

	^ LedgerCompleter! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 1/28/2016 19:41'!
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
				borderWidth: 1;
				name: 'Account List').
	
	net _ (LayoutMorph newColumn color: Color lightGreen; name: 'Net Total')
		layoutSpec: (LayoutSpec proportionalWidth: 1.0 fixedHeight: 100).
	ttl _  (StringMorph new contents: '    Net Total:   $0.00'; name: #Total)
		layoutSpec: (LayoutSpec proportionalWidth: 1.0 proportionalHeight: 0.1 minorDirectionPadding: #center).
	model netEditor: ttl.
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

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 3/1/2016 11:58'!
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
		addMorph: (self buildREntry: (n _ n + 1));		
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

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 3/1/2016 15:05'!
changeHigher: anEntryField
	"Increase the EntryField"
	
	{'increase'} print! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 3/1/2016 15:05'!
changeLower: anEntryField
	"Decrease the EntryField"
	
	{'decrease'} print! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 3/1/2016 15:08'!
changeTransaction: anEntryField
	"Form a transaction from all the EntryFields"
	
	{'new or updated transaction'} print! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 3/18/2016 18:31'!
checkMinus: anEntry
	"Subtract 1 from check number"
	| w x |
	
	(w _ anEntry model actualContents)
		ifNotEmpty: [
			w first isDigit
				ifTrue: [
					x _ anEntry model actualContents asNumber.
					(x _ x - 1) > 0 ifTrue: [anEntry model actualContents: x asString]]
				ifFalse: [
					typeIndex _ typeIndex + 1.
					anEntry model actualContents: (self class transactionTypes atWrap: typeIndex)]].
	anEntry scroller selectAll.

! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 3/14/2016 18:47'!
checkPlus: anEntry
	"Add 1 to check number or answer transaction types"
	| w x |
	
	(w _ anEntry model actualContents)
		ifNotEmpty: [
			w first isDigit
				ifTrue: [
					x _ anEntry model actualContents asNumber.
					x _ x + 1.
					anEntry model actualContents: x asString]
				ifFalse: [
					typeIndex _ typeIndex + 1.
					anEntry model actualContents: (self class transactionTypes atWrap: typeIndex)]].
	anEntry scroller selectAll.
! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 3/14/2016 18:45'!
dateEarlier: anEntry
	"Subtract 1 from Ledgerdemain date"
	| x |
	
	x _ anEntry model actualContents asString asLdmDate.
	x _ x - 1.
	anEntry model actualContents: (Date fromDays: x) mmddyyyy.
	anEntry scroller selectAll.
! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 3/14/2016 18:45'!
dateLater: anEntry
	"Add 1 to Ledgerdemain date"
	| x |
	
	x _ anEntry model actualContents asString asLdmDate.
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

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 3/11/2016 21:49'!
goAhead
	"Go to the next EntryField to the right"
	| from |
	
	from _ self entryIndex.
	entryIndex _ from + 1.
	entryIndex > windowEntries size ifTrue: [entryIndex _ 1].
	self releaseKeyboardFocus: (windowEntries at: from) scroller.
	windowEntries first scroller releaseCachedState.
	(windowEntries at: from) scroller releaseCachedState.
	self newKeyboardFocus: (windowEntries at: entryIndex) scroller.
	(windowEntries at: entryIndex) scroller selectAll.
	! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 3/11/2016 21:49'!
goBack
	"Go to the next EntryField to the left"
	| from |
	
	from _ entryIndex.
	entryIndex _ from - 1.
	entryIndex <= 0 ifTrue: [entryIndex _ windowEntries size].
	self releaseKeyboardFocus: (windowEntries at: from) scroller.
	windowEntries first scroller releaseCachedState.
	(windowEntries at: from) scroller releaseCachedState.
	self newKeyboardFocus: (windowEntries at: entryIndex) scroller.
	(windowEntries at: entryIndex) scroller selectAll.
! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 3/9/2016 21:01'!
handlesKeyboard

	^self visible! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 3/14/2016 18:09'!
initialize

	super initialize.
	windowEntries _ OrderedCollection new.
	typeIndex _ 0! !

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 6/26/2015 14:49'!
menuLedger
	"Ledger pop-up menu"

	| aMenu |
	aMenu _ MenuMorph new defaultTarget: self.
	aMenu
		addTitle: 'Ledger Menu'; 
		addLine.
	aMenu add: 'Reconcile...'	target: self model 	action:	#reconcile.
	aMenu balloonTextForLastItem: 'reconcile this account'.
	aMenu add: 'Search...'		target: self model 	action:	#searchOneAccount.
	aMenu balloonTextForLastItem: 'search within this account only'.
	aMenu popUpInWorld: self world.
! !

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 7/1/2015 14:18'!
menuMain
	"Main pop-up menu"

	| aMenu |
	aMenu _ MenuMorph new defaultTarget: self.
	aMenu
		addTitle: 'Main Menu'; 
		addStayUpIcons;
		addLine.
	aMenu add: 'Restore a file'			target: self model 	action:	#restoreFile.
	aMenu balloonTextForLastItem: 'load a previously saved file 
of account ledgers'.
	aMenu add: 'Save the current file'	target: self model 	action:	#saveFile.
	aMenu balloonTextForLastItem: 'preserve changes to the data'.
	aMenu addLine.
	self addAccountActionsTo: aMenu.
	self addPayeeActionsTo: aMenu.
	self addCategoryActionsTo: aMenu.
	self addMemoActionsTo: aMenu.
	aMenu add: 'List transaction types'			target: self model 	action:	#listType.
	aMenu popUpInWorld: self world.
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

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 3/14/2016 17:47'!
sayWhen
	"Establish the receiving half of the Observer Pattern"
	
	self when: #toTheRight send: #goAhead to: self.
	self when: #toTheLeft send: #goBack to: self.
	self when: #specialKey send: #'someKey:of:with:' to: self withArguments: #(#a #b #c).
! !

!LedgerWindow methodsFor: 'event handling' stamp: 'dhn 3/14/2016 17:47'!
someKey: aKey of: aType with: aModifier
	"Process special key strokes"
	| entr |
	
	entr _ windowEntries at: entryIndex.
	
	aKey = 9 ifTrue: [	"tabs"
		aType = #keyUp  ifTrue: [ 
			aModifier = 0 ifTrue: [self goAhead].
			aModifier = 8 ifTrue: [self goBack]]].
	
	aKey = 13 ifTrue: [	"enter"
		aType = #keyUp  ifTrue: [self changeTransaction: entr]].
	
	aKey = 43 ifTrue: [	"plus"
		aType = #keystroke  ifTrue: [ 
			entr name = #Date ifTrue: [self dateLater: entr].
			entr name = #Check ifTrue: [self checkPlus: entr]]].
	
	aKey = 45 ifTrue: [	"minus"
		aType = #keystroke  ifTrue: [ 
			entr name = #Date ifTrue: [self dateEarlier: entr].
			entr name = #Check ifTrue: [self checkMinus: entr]]].
! !

!LedgerWindow methodsFor: 'updating' stamp: 'dhn 3/19/2016 14:27'!
update: aSymbol
	"Receive a change notice, as a dependent, from a dependee" 
	
	super update: aSymbol.
	
	aSymbol == #fillEntries
		ifTrue: [
			model selectedAccount isNil
				ifTrue: [windowEntries do: [:ea | ea model actualContents: '']]
				ifFalse: [windowEntries do: [:ea | ea model refetch]].
			entryIndex _ 1.
			self newKeyboardFocus: windowEntries first scroller.
			windowEntries first scroller selectAll.
			].
		
	aSymbol == #xactList
		ifTrue: [
			windowLedgerList 
				getList;
				updateList].
		
	aSymbol == #lastOnList
		ifTrue: [
			model 
				transactionListIndex: windowLedgerList getListSize;
				transactionListIndex: 0	"prepare to add a transaction"].
		
	aSymbol == #acctList
		ifTrue: [
			windowAccountList 
				getList; 
				updateList.
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

!LedgerWindow class methodsFor: 'key selection' stamp: 'dhn 3/14/2016 20:09'!
transactionTypes
	"Answer an array of transaction types"
	
	^ #(
		'DEP' 		"deposit"
		'EFT' 		"electronic funds transfer"
		'TXFR' 		"transfer between accounts"
		'WD' 		"withdraw from account (i.e. cashier's check)"
	)! !

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

!Transaction methodsFor: 'accessing' stamp: 'dhn 8/7/2015 15:24'!
amount
	"Answer the content of the amount field"

	amount ifNil: [amount _ String new].
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

!Transaction methodsFor: 'displaying' stamp: 'dhn 3/19/2016 14:30'!
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
					with: self amount);
			nextPutAll: 
				(self rightJustify: (self class listFields at: #Blank07) 
					with: ' ');
			nextPutAll: 
				(self leftJustify: (self class listFields at: #type) 
					with: self type withoutTrailingBlanks);
			nextPutAll: 
				(self rightJustify: (self class listFields at: #balance) 
					with: self account balCur ledgerFormatted)
	]! !

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
