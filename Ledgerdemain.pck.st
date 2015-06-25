'From Cuis 4.2 of 25 July 2013 [latest update: #2383] on 25 June 2015 at 1:17:16.83425 pm'!
'Description Please enter a description for this package'!
!provides: 'Ledgerdemain' 1 33!
!classDefinition: #Account category: #Ledgerdemain!
Object subclass: #Account
	instanceVariableNames: 'ledger balOpen balRcon balCur'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'Account class' category: #Ledgerdemain!
Account class
	instanceVariableNames: ''!

!classDefinition: #Ledger category: #Ledgerdemain!
Object subclass: #Ledger
	instanceVariableNames: 'contents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'Ledger class' category: #Ledgerdemain!
Ledger class
	instanceVariableNames: ''!

!classDefinition: #LedgerDeMain category: #Ledgerdemain!
Object subclass: #LedgerDeMain
	instanceVariableNames: 'window accounts net trail accountListIndex selectedAccount modified transactionListIndex'
	classVariableNames: 'Categories Memos Payees UniqueInstance'
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

!classDefinition: #LedgerListMorph category: #Ledgerdemain!
PluggableListMorph subclass: #LedgerListMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'LedgerListMorph class' category: #Ledgerdemain!
LedgerListMorph class
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
	instanceVariableNames: 'date type payee amount category memo reconciled transfer serial'
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

!Ledger commentStamp: 'dhn 6/24/2015 21:11' prior: 0!
Ledger is an ordered collection of transactions.!

!LedgerDeMain commentStamp: 'dhn 6/24/2015 10:49' prior: 0!
LedgerDeMain (a cover class) responsibilities:

  hold accounts, payees, categories, memos, trail
  search
  maintain net worth
  back up and restore
  move transactions between accounts and record in audit trail

With apologies to those who do legerdemane.

recorded date _ Date today julianDayNumber - Time squeakEpoch.
recorded amount _ amount as cents. (examples: 2995 500)
reported amount _ dollars (examples: 29.95 5.00)!

!Reconciliation commentStamp: 'dhn 6/12/2015 19:10' prior: 0!
Reconciliation responsibilities:

  report withdrawals and deposits
  update ledger
!

!LedgerListMorph commentStamp: 'dhn 6/25/2015 13:09' prior: 0!
Enable the LedgerDeMain pop-up menu.!

!LedgerWindow commentStamp: 'dhn 6/23/2015 20:42' prior: 0!
Window for Ledger d'Main. Provides pop-up menu for options.!

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

!Transaction commentStamp: 'dhn 6/24/2015 10:51' prior: 0!
Transaction responsibilities:

  hold date, [serial], type, payee, amount, category, memo, reconciled, transfer
  provide entry suggestions for date, serial, payee, category, amount
  update serial, payee, category, memo
  split categories
  record actions in audit trail
!

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

!Account methodsFor: 'initialization' stamp: 'dhn 6/24/2015 21:09'!
initialize

	balOpen _ 0.
	balRcon _ 0.
	balCur _ 0.
	ledger _ Ledger new! !

!Account methodsFor: 'accessing' stamp: 'dhn 6/13/2015 20:10'!
ledger
	"Answer the value of ledger"

	^ ledger! !

!Account methodsFor: 'accessing' stamp: 'dhn 6/13/2015 20:10'!
ledger: anObject
	"Set the value of ledger"

	ledger _ anObject! !

!Ledger methodsFor: 'displaying' stamp: 'dhn 6/24/2015 21:07'!
asFormatted
	"Answer the transactions in collection as a formatted list"! !

!Ledger methodsFor: 'initialization' stamp: 'dhn 6/24/2015 21:05'!
initialize

	contents _ OrderedCollection new! !

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

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/23/2015 21:27'!
accounts: anObject
	"Save anObject in accounts"

	(self accounts includesKey: anObject asSymbol)
		ifTrue: [self inform: anObject,' is already an account']
		ifFalse: [
			self accounts at: anObject asSymbol put: Account new.
			self modified: true]! !

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

!LedgerDeMain methodsFor: 'initialization' stamp: 'dhn 6/23/2015 10:19'!
initialize
	"initialize the state of the receiver"

	super initialize.
	modified _ false! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/25/2015 11:46'!
listCategories

	Categories ifNotNil: [Categories keysDo: [:k |
		Transcript show: k; newLine]]
! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/25/2015 11:48'!
listPayees

	Payees ifNotNil: [Payees keysDo: [:k |
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

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/23/2015 20:32'!
newAccount
	| temp |
	
	temp _ FillInTheBlankMorph request: 'Name of new account:'.
	temp ~= '' ifTrue: [self accounts: temp]
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

!LedgerDeMain methodsFor: 'save & restore' stamp: 'dhn 6/23/2015 21:50'!
saveFile

	Transcript show: 'Simulate saving the file'! !

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

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/23/2015 21:31'!
trail: anObject
	"Set the value of trail"

	trail _ anObject.
	self modified: true! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/24/2015 22:16'!
transactionList
	"Answer a list of transactions"
	"
	^ (self accounts at: (self accountList at: accountListIndex)) ledger asFormatted
	"
	^ nil! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/24/2015 22:16'!
transactionListIndex
	self transactionList ifNil: [ ^ self transactionListIndex: 0].
	^ self transactionList indexOf: self selectedTransaction! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/24/2015 21:26'!
transactionListIndex: anObject
	"Set the value of transactionListIndex"

	transactionListIndex _ anObject! !

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

!LedgerDeMain class methodsFor: 'class initialization' stamp: 'dhn 6/25/2015 11:07'!
uniqueInstance
	"Ensure that there is only one of me"

	UniqueInstance ifNil: [UniqueInstance _ self  basicNew initialize].
	^ UniqueInstance! !

!LedgerListMorph methodsFor: 'menus' stamp: 'dhn 6/25/2015 13:14'!
mouseButton2Activity
	self listMorph highlightedRow: nil.
	self model window theMenu.
	super mouseButton2Activity! !

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 6/23/2015 20:28'!
addCategoryActionsTo: aMenu
	"Add items to aMenu for category actions"

	| subMenu |
	subMenu := MenuMorph new defaultTarget: self.
	subMenu add: 'List categories'			target: self model 	action: #listCategories.
	subMenu add: 'Add a category'			target: self model 	action: #newCategory.
	subMenu add: 'Categories from file'	target: self model 	action: #categoriesFromFile.
	aMenu add: 'Categories...' subMenu: subMenu! !

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 6/23/2015 20:25'!
addMemoActionsTo: aMenu
	"Add items to aMenu for payee actions"

	| subMenu |
	subMenu := MenuMorph new defaultTarget: self.
	subMenu add: 'Memos from file'		target: self model 	action: #memosFromFile.
	aMenu add: 'Memos...' subMenu: subMenu! !

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 6/23/2015 20:09'!
addPayeeActionsTo: aMenu
	"Add items to aMenu for payee actions"

	| subMenu |
	subMenu := MenuMorph new defaultTarget: self.
	subMenu add: 'List payees'			target: self model 	action: #listPayees.
	subMenu add: 'Add a payee'		target: self model 	action: #newPayee.
	subMenu add: 'Payees from file'	target: self model 	action: #payeesFromFile.
	aMenu add: 'Payees...' subMenu: subMenu! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 6/25/2015 13:14'!
buildMorphicWindow
	"Answer a window for Ledger d'Main"
	| list1 list2 row |
	list1 _ LedgerListMorph
				model: model
				listGetter: #accountList
				indexGetter: #accountListIndex
				indexSetter: #accountListIndex:
				mainView: self
				menuGetter: nil
				keystrokeAction: nil.
	list2 _ PluggableListMorph
				model: model
				listGetter: nil
				indexGetter: nil
				indexSetter: nil
				mainView: self
				menuGetter: nil
				keystrokeAction: nil.
	row _ LayoutMorph newRow.
	row
		addMorph: list1 proportionalWidth: 0.2;
		addAdjusterAndMorph: list2 proportionalWidth: 0.8.
	self layoutMorph
		addMorph: row.
	self setLabel: 'Ledger d''Main'! !

!LedgerWindow methodsFor: 'open/close' stamp: 'dhn 6/23/2015 21:47'!
delete

	self model modified ifTrue: [
		(nil confirm: 'Save changes?') ifTrue: [
			self model saveFile]].
	super delete! !

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 6/23/2015 09:52'!
handlesMouseDown: aMouseButtonEvent
	^ true! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 6/25/2015 11:03'!
initialize

	super initialize! !

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 6/23/2015 09:53'!
mouseButton2Activity
	self theMenu.! !

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 6/23/2015 20:25'!
theMenu
	"Show a pop-up menu"

	| aMenu |
	aMenu _ MenuMorph new defaultTarget: self.
	aMenu
		addTitle: 'Options'; 
		addStayUpIcons;
		addLine.
	aMenu add: 'Restore a file'			target: self model 	action:	#restoreFile.
	aMenu balloonTextForLastItem: 'load a previously saved file 
of account ledgers'.
	aMenu add: 'Save the current file'	target: self model 	action:	#saveFile.
	aMenu balloonTextForLastItem: 'preserve changes to the data'.
	aMenu addLine.
	aMenu add: 'Add an account'	target: self model 	action:	#newAccount.
	self addPayeeActionsTo: aMenu.
	self addCategoryActionsTo: aMenu.
	self addMemoActionsTo: aMenu.
	aMenu popUpInWorld: self world.
! !

!LedgerWindow class methodsFor: 'instance creation' stamp: 'dhn 6/22/2015 16:03'!
how
"
	LedgerWindow open.
"! !

!LedgerWindow class methodsFor: 'instance creation' stamp: 'dhn 6/23/2015 20:45'!
includeInNewMorphMenu

	^ false 	"Not to be instantiated from the menu"! !

!LedgerWindow class methodsFor: 'instance creation' stamp: 'dhn 6/25/2015 11:06'!
open
	| wind main |
	main _ LedgerDeMain uniqueInstance.
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
