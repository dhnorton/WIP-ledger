'From Cuis 4.2 of 25 July 2013 [latest update: #2367] on 23 June 2015 at 10:21:13.919425 am'!
'Description Please enter a description for this package'!
!provides: 'Ledgerdemain' 1 22!
!classDefinition: #Account category: #Ledgerdemain!
Object subclass: #Account
	instanceVariableNames: 'ledger balOpen balRcon balCur'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'Account class' category: #Ledgerdemain!
Account class
	instanceVariableNames: ''!

!classDefinition: #LedgerDeMain category: #Ledgerdemain!
Object subclass: #LedgerDeMain
	instanceVariableNames: 'window accounts payees categories memos net trail accountListIndex selectedAccount modified'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'LedgerDeMain class' category: #Ledgerdemain!
LedgerDeMain class
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

!classDefinition: #LedgerWindow category: #Ledgerdemain!
SystemWindow subclass: #LedgerWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'LedgerWindow class' category: #Ledgerdemain!
LedgerWindow class
	instanceVariableNames: ''!

!classDefinition: #NamedEntity category: #Ledgerdemain!
Object subclass: #NamedEntity
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'NamedEntity class' category: #Ledgerdemain!
NamedEntity class
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

!classDefinition: #CheckNumber category: #Ledgerdemain!
Suggestion subclass: #CheckNumber
	instanceVariableNames: 'last'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'CheckNumber class' category: #Ledgerdemain!
CheckNumber class
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

!classDefinition: #TransactionDate category: #Ledgerdemain!
Suggestion subclass: #TransactionDate
	instanceVariableNames: 'last'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'TransactionDate class' category: #Ledgerdemain!
TransactionDate class
	instanceVariableNames: ''!

!classDefinition: #Transaction category: #Ledgerdemain!
Object subclass: #Transaction
	instanceVariableNames: 'date type payee amount category memo reconciled transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'Transaction class' category: #Ledgerdemain!
Transaction class
	instanceVariableNames: ''!

!classDefinition: #CheckingTransaction category: #Ledgerdemain!
Transaction subclass: #CheckingTransaction
	instanceVariableNames: 'number'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'CheckingTransaction class' category: #Ledgerdemain!
CheckingTransaction class
	instanceVariableNames: ''!


!Account commentStamp: 'dhn 6/12/2015 17:53' prior: 0!
Account responsibilities:

  maintain ledger as collection of transactions
  maintain name
  maintain opening balance, reconciled balance, current balance
  do transfers
  move transactions between accounts and record in audit trail
  edit transactions and record in audit trail 
  enter transactions and record in audit trail 
  delete transactions and record in audit trail
  reconcile
  report
  export and import!

!LedgerDeMain commentStamp: 'dhn 6/13/2015 20:09' prior: 0!
LedgerDeMain (a cover class) responsibilities:

  hold accounts
  hold payees
  hold categories
  hold audit trail
  search
  maintain net worth
  back up and restore

With apologies to all the magicians.

recorded date _ Date today julianDayNumber - Time squeakEpoch.
recorded amount _ amount as cents. (examples: 2995 500)
reported amount _ dollars (examples: 29.95 5.00)!

!Reconciliation commentStamp: 'dhn 6/12/2015 19:10' prior: 0!
Reconciliation responsibilities:

  report withdrawals and deposits
  update ledger
!

!NamedEntity commentStamp: 'dhn 6/14/2015 13:43' prior: 0!
Abstract class for entities which have a specified name.!

!Repository commentStamp: 'dhn 6/12/2015 19:12' prior: 0!
Repository responsibilities:

  maintain audit trail
  search
  report!

!Suggestion commentStamp: 'dhn 6/12/2015 18:48' prior: 0!
Suggestion (an abstract class) reponsibilities:

  autotype
!

!CheckNumber commentStamp: 'dhn 6/12/2015 19:05' prior: 0!
CheckNumber responsibilities:

  maintain last used
  adjust!

!Payee commentStamp: '<historical>' prior: 0!
Payee responsibilities:

  hold last transaction, by category
!

!TransactionDate commentStamp: 'dhn 6/12/2015 19:02' prior: 0!
TransactionDate responsibilities:

  maintain last used (current if nil)
  adjust!

!Transaction commentStamp: 'dhn 6/12/2015 17:39' prior: 0!
Transaction responsibilities:

  hold date, [number], type, payee, amount, category, memo, reconciled, transfer
  provide entry suggestions for date, number, payee, category, amount
  update number, payee, category, memo
  split categories
  record actions in audit trail
!

!CheckingTransaction commentStamp: 'dhn 6/12/2015 18:42' prior: 0!
CheckingTransaction responsibilities:

  hold number!

!Trie methodsFor: '*Ledgerdemain' stamp: 'dhn 6/18/2015 12:07'!
storeOn: aStream
	"Refer to the comment in Object|storeOn:."
	| noneYet |
	aStream nextPutAll: '(('.
	aStream nextPutAll: self class name.
	aStream nextPutAll: ' new)'.
	noneYet _ true.
	self keysAndValuesDo: 
			[:each :val | 
			noneYet
				ifTrue: [noneYet _ false]
				ifFalse: [aStream nextPut: $;].
			aStream 
				nextPutAll: ' at: ';
				store: each;
				nextPutAll: ' put: ';
				store: val].
	noneYet ifFalse: [aStream nextPutAll: '; yourself'].
	aStream nextPut: $)! !

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

!Account methodsFor: 'accessing' stamp: 'dhn 6/14/2015 21:45'!
identity: aName
	self namAcct: aName! !

!Account methodsFor: 'initialization' stamp: 'dhn 6/13/2015 20:24'!
initialize
! !

!Account methodsFor: 'accessing' stamp: 'dhn 6/13/2015 20:10'!
ledger
	"Answer the value of ledger"

	^ ledger! !

!Account methodsFor: 'accessing' stamp: 'dhn 6/13/2015 20:10'!
ledger: anObject
	"Set the value of ledger"

	ledger _ anObject! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/22/2015 16:13'!
accountList
	"Answer a list of accounts"
	^ self accounts keys! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/22/2015 17:02'!
accountListIndex
	self accountList ifNil: [ ^ accountListIndex _ 0 ].
	^ self accountList indexOf: selectedAccount! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/23/2015 10:14'!
accountListIndex: anObject
	"Set the value of accountListIndex"

	accountListIndex _ anObject! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/15/2015 07:31'!
accounts
	"Answer the value of accounts"

	accounts ifNil: [accounts _ Dictionary new].
	^ accounts! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/15/2015 07:35'!
accounts: anObject
	"Save anObject in accounts"

	(self accounts includesKey: anObject asSymbol)
		ifTrue: [self inform: anObject,' is already an account']
		ifFalse: [self accounts at: anObject asSymbol put: Account new]! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/18/2015 09:00'!
addCategory: aString
	"Add category named aString"
	| x |
	x _ aString findDelimiters: '.' startingAt: 1. 
	x > aString size 
		ifTrue: [self categories at: aString put: 1] "primary category"
		ifFalse: [self categories at: aString put: 2] "sub-category"
! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/15/2015 06:29'!
categories
	"Answer the value of categories"

	categories ifNil: [categories _ Trie new].
	^ categories! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/18/2015 09:09'!
categories: anObject
	"Save anObject in categories"

	(self categories includesKey: anObject)
		ifTrue: [self inform: anObject,' is already a category']
		ifFalse: [self addCategory: anObject]! !

!LedgerDeMain methodsFor: 'save & restore' stamp: 'dhn 6/18/2015 09:05'!
categoriesFromFile
	"Copy category names from a file and add them to the categories ivar"
	| file ios line |
	file _ FillInTheBlankMorph request: 'Name of categories File:' initialAnswer: 'c:\index1\...\file.ext'.
	ios _ FileStream oldFileNamed: file.
	[(line _ ios nextLine) notNil]
		whileTrue: [	line size > 0 ifTrue: [self addCategory: line]].
	ios close! !

!LedgerDeMain methodsFor: 'initialization' stamp: 'dhn 6/23/2015 10:19'!
initialize
	"initialize the state of the receiver"

	super initialize.
	modified _ false! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/18/2015 10:38'!
listCategories

	categories ifNotNil: [categories keysDo: [:k |
		Transcript show: k; newLine]]
! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/18/2015 10:38'!
listPayees

	payees ifNotNil: [payees keysDo: [:k |
		Transcript show: k; newLine]]
! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/18/2015 20:40'!
memos
	"Answer the value of memos"

	memos ifNil: [memos _ Trie new].
	^ memos! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/18/2015 19:52'!
memos: anObject
	"Save anObject in memos:"

	self memos at: anObject put: 1! !

!LedgerDeMain methodsFor: 'save & restore' stamp: 'dhn 6/18/2015 20:33'!
memosFromFile
	"Copy memos from a file and add them to the memos ivar"
	| file ios line |
	file _ FillInTheBlankMorph request: 'Name of memos file:' initialAnswer: 'c:\directory\file.ext'.
	ios _ FileStream oldFileNamed: file.
	[(line _ ios nextLine) notNil]
		whileTrue: [	line size > 0 ifTrue: [self memos at: line put: 1]].
	ios close! !

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

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/14/2015 13:35'!
net: anObject
	"Set the value of net"

	net _ anObject! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/15/2015 07:15'!
newAccount
	| temp |
	
	temp _ FillInTheBlankMorph request: 'Name of new account:'.
	self accounts: temp.
! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/18/2015 09:14'!
newCategory
	| temp |
	
	temp _ FillInTheBlankMorph request: 'Name of new category:'.
	temp ~= '' ifTrue: [self addCategory: temp]! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/22/2015 14:32'!
newPayee
	| temp |
	
	temp _ FillInTheBlankMorph request: 'Name of new payee:'.
	(self payees includesKey: temp)
		ifTrue: [self inform: temp,' is already a payee']
		ifFalse: [temp ~= '' ifTrue: [self payees: temp]]! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/15/2015 06:37'!
payees
	"Answer the value of payees"

	payees ifNil: [payees _ Trie new].
	^ payees! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/22/2015 14:04'!
payees: anObject
	"Save anObject in payees"

	self payees at: anObject put: Payee new! !

!LedgerDeMain methodsFor: 'save & restore' stamp: 'dhn 6/22/2015 14:08'!
payeesFromFile
	"Copy payee names from a file and add them to the payees ivar"
	| file ios line |
	file _ FillInTheBlankMorph request: 'Name of payees File:' initialAnswer: 'c:\directory\file.ext'.
	ios _ FileStream oldFileNamed: file.
	[(line _ ios nextLine) notNil]
		whileTrue: [	line size > 0 ifTrue: [self payees at: line put: Payee new]].
	ios close! !

!LedgerDeMain methodsFor: 'save & restore' stamp: 'dhn 6/13/2015 19:54'!
restorationOf: fileName
	"Restore accounts from file named fileName"
	"File scheme:
		Account1 record
		Account2 record
		...
		Accountn record
		Ledger transactions for Account1
		Ledger transactions for Account2
		...
		
		Ledger transactions for Accountn"
	| acct ios x |
	acct _ 0.
	ios _ FileStream oldFileNamed: fileName.
	[(x _ ios nextLine) notNil]
		whileTrue: [
			acct _ acct + 1.
			accounts at: acct put: x.
			Transcript show: x; newLine].
	ios close.
! !

!LedgerDeMain methodsFor: 'save & restore' stamp: 'dhn 6/18/2015 14:47'!
restoreCategoriesFrom: storeString
	"Set the receiver to the object formed by evaluating  storeString"
	categories _ Compiler evaluate: storeString! !

!LedgerDeMain methodsFor: 'save & restore' stamp: 'dhn 6/14/2015 13:33'!
restoreFile
	| fileName temp |
	
	fileName _ FillInTheBlankMorph request: 'Name of File to be Restored:' initialAnswer: 'c:\index1\...\file.ext'.
	temp _ OrderedCollection new.
	temp _ self restorationOf: fileName.
	accounts _ temp asSet.! !

!LedgerDeMain methodsFor: 'save & restore' stamp: 'dhn 6/14/2015 13:30'!
saveFile! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/23/2015 10:14'!
selectedAccount
	"Answer the value of selectedAccount"

	^ selectedAccount! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/23/2015 10:14'!
selectedAccount: anObject
	"Set the value of selectedAccount"

	selectedAccount _ anObject! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/14/2015 13:35'!
trail
	"Answer the value of trail"

	^ trail! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/14/2015 13:35'!
trail: anObject
	"Set the value of trail"

	trail _ anObject! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/18/2015 15:27'!
trie: aTrie withPrefix: aString
	"Answer the leaves which contain aString as the first character(s)"
	aTrie forPrefix: aString keysAndValuesDo: [:key :v | Transcript show: key; newLine]! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/22/2015 16:08'!
window
	"Answer the value of window"

	^ window! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/22/2015 16:08'!
window: anObject
	"Set the value of window"

	window _ anObject! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/18/2015 14:52'!
withPrefix: aString
	"Answer the leaves which contain aString as the first character(s)"
	^ self forPrefix: aString keysAndValuesDo: [:key :v | key]! !

!LedgerDeMain class methodsFor: 'as yet unclassified' stamp: 'dhn 6/18/2015 21:16'!
includeInNewMorphMenu
	"Not to be instantiated from the menu"
	^ false! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 6/22/2015 16:02'!
buildMorphicWindow
	"Answer a window for Ledger d'Main"
	| list1 |
	list1 _ PluggableListMorph
				model: model
				listGetter: #accountList
				indexGetter: #accountListIndex
				indexSetter: #accountListIndex:
				mainView: self
				menuGetter: nil
				keystrokeAction: nil.
	self setLabel: 'Ledger d''Main'! !

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 6/23/2015 09:52'!
handlesMouseDown: aMouseButtonEvent
	^ true! !

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 6/23/2015 09:53'!
mouseButton2Activity
	self theMenu.! !

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 6/23/2015 10:00'!
theMenu
	"Show a pop-up menu"
	| tuples list index |
	tuples _ #(
		('Restore a file'					#restoreFile)
		('Save the current file'			#saveFile)
		('Payees from file'				#payeesFromFile)
		('List payees'					#listPayees)
		('Add a payee'					#newPayee)
		('Categories from file'			#categoriesFromFile)
		('List categories'				#listCategories)
		('Add a category'				#newCategory)
		('Memos from file'				#memosFromFile)
		('Add an account'				#newAccount)
	).
	list _ tuples collect: [:ea | ea first].
	index _ (PopUpMenu labelArray: list) 
		startUpWithCaption: 'Getting Started'.
	index > 0 ifTrue: [model perform: ((tuples at: index) at: 2)]! !

!LedgerWindow class methodsFor: 'instance creation' stamp: 'dhn 6/22/2015 16:03'!
how
"
	LedgerWindow open.
"! !

!LedgerWindow class methodsFor: 'instance creation' stamp: 'dhn 6/23/2015 09:57'!
open
	| wind main |
	main _ LedgerDeMain new.
	main window: (wind _ self new model: main).
	wind buildMorphicWindow.
	wind openInWorld.
! !

!NamedEntity class methodsFor: 'initialization' stamp: 'dhn 6/14/2015 21:43'!
named: aName
	^ self basicNew identity: aName! !

!Payee methodsFor: 'accessing' stamp: 'dhn 6/22/2015 14:01'!
last
	"Answer the value of last"

	last ifNil: [last _ Dictionary new].
	^ last! !

!Payee methodsFor: 'accessing' stamp: 'dhn 6/14/2015 21:37'!
last: anObject
	"Set the value of last"

	last _ anObject! !
