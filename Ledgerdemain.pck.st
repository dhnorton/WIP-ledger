'From Cuis 4.2 of 25 July 2013 [latest update: #2367] on 17 June 2015 at 9:43:24.681169 pm'!
'Description Please enter a description for this package'!
!provides: 'Ledgerdemain' 1 9!
!classDefinition: #Account category: #Ledgerdemain!
Object subclass: #Account
	instanceVariableNames: 'ledger balOpen balRcon balCur'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'Account class' category: #Ledgerdemain!
Account class
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

!classDefinition: #LedgerDeMain category: #Ledgerdemain!
RectangleLikeMorph subclass: #LedgerDeMain
	instanceVariableNames: 'accounts payees categories net trail'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'LedgerDeMain class' category: #Ledgerdemain!
LedgerDeMain class
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

!classDefinition: #Category category: #Ledgerdemain!
NamedEntity subclass: #Category
	instanceVariableNames: 'catName subCategories'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'Category class' category: #Ledgerdemain!
Category class
	instanceVariableNames: ''!

!classDefinition: #SubCategory category: #Ledgerdemain!
NamedEntity subclass: #SubCategory
	instanceVariableNames: 'catName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'SubCategory class' category: #Ledgerdemain!
SubCategory class
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
	instanceVariableNames: 'payeeName last'
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

!Reconciliation commentStamp: 'dhn 6/12/2015 19:10' prior: 0!
Reconciliation responsibilities:

  report withdrawals and deposits
  update ledger
!

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

  maintain name
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

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/15/2015 06:29'!
categories
	"Answer the value of categories"

	categories ifNil: [categories _ Trie new].
	^ categories! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/15/2015 08:16'!
categories: anObject
	"Save anObject in categories"

	(self categories includesKey: anObject)
		ifTrue: [self inform: anObject,' is already a category']
		ifFalse: [self categories at: anObject put: (Category named: anObject)]! !

!LedgerDeMain methodsFor: 'save & restore' stamp: 'dhn 6/17/2015 21:29'!
categoriesFromFile
	"Copy category names from a file and add them to the categories ivar"
	| file ios line x |
	file _ FillInTheBlankMorph request: 'Name of categories File:' initialAnswer: 'c:\index1\...\file.ext'.
	ios _ FileStream oldFileNamed: file.
	[(line _ ios nextLine) notNil]
		whileTrue: [
			line size > 0 ifTrue: [
			x _ line findDelimiters: '.' startingAt: 1. 
			x > line size 
				ifTrue: [self categories at: line put: 1]
				ifFalse: [self categories at: line put: 2]]].
	self halt.
	ios close! !

!LedgerDeMain methodsFor: 'menus' stamp: 'dhn 6/14/2015 10:46'!
handlesMouseDown: aMouseButtonEvent
	^ true! !

!LedgerDeMain methodsFor: 'initialization' stamp: 'dhn 6/14/2015 10:38'!
initialize
	"initialize the state of the receiver"
	| win |
	super initialize.
	win _ self embeddedInMorphicWindowLabeled: 'Ledger d''Main'.
	win 	setProperty: #minimumExtent toValue: 188@185.
	win model: self.
	win openInWorld.
! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/17/2015 21:38'!
listCategories

	categories keysAndValuesDo: [:k :v |
		Transcript show: k; newLine]
! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/16/2015 21:22'!
listPayees

	payees keysDo: [:k |
		Transcript show: k; newLine]! !

!LedgerDeMain methodsFor: 'menus' stamp: 'dhn 6/15/2015 11:57'!
mouseButton2Activity
	self theMenu.! !

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

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/15/2015 06:34'!
newCategory
	| temp cat b |
	
	temp _ FillInTheBlankMorph request: 'Name of new category:'.
	self categories at: temp put: (cat _ Category named: temp).
	
	b _ true.
	(PopUpMenu confirm: 'Subcategories?')
		ifTrue: [
			[b] whileTrue: [
				cat newSubCategory.
				b _ PopUpMenu confirm: 'Another subcategory?']]! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/15/2015 12:10'!
newPayee
	"Temporary - add a payee. Normally done from ledger"
	| temp |
	
	temp _ FillInTheBlankMorph request: 'Name of new payee:'.
	self payees: temp! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/15/2015 06:37'!
payees
	"Answer the value of payees"

	payees ifNil: [payees _ Trie new].
	^ payees! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/15/2015 12:24'!
payees: anObject
	"Save anObject in payees"

	self payees at: anObject put: nil! !

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

!LedgerDeMain methodsFor: 'save & restore' stamp: 'dhn 6/14/2015 13:33'!
restoreFile
	| fileName temp |
	
	fileName _ FillInTheBlankMorph request: 'Name of File to be Restored:' initialAnswer: 'c:\index1\...\file.ext'.
	temp _ OrderedCollection new.
	temp _ self restorationOf: fileName.
	accounts _ temp asSet.! !

!LedgerDeMain methodsFor: 'save & restore' stamp: 'dhn 6/14/2015 13:30'!
saveFile! !

!LedgerDeMain methodsFor: 'menus' stamp: 'dhn 6/16/2015 21:23'!
theMenu
	"Show a pop-up menu"
	| tuples list index |
	tuples _ #(
		('Restore a file'					#restoreFile)
		('Save the current file'			#saveFile)
		('List payees'					#listPayees)
		('Add a payee'					#newPayee)
		('List categories'				#listCategories)
		('Add a category'				#newCategory)
		('Add an account'				#newAccount)
	).
	list _ tuples collect: [:ea | ea first].
	index _ (PopUpMenu labelArray: list) 
		startUpWithCaption: 'Getting Started'.
	index > 0 ifTrue: [self perform: ((tuples at: index) at: 2)]! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/14/2015 13:35'!
trail
	"Answer the value of trail"

	^ trail! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/14/2015 13:35'!
trail: anObject
	"Set the value of trail"

	trail _ anObject! !

!NamedEntity class methodsFor: 'initialization' stamp: 'dhn 6/14/2015 21:43'!
named: aName
	^ self basicNew identity: aName! !

!Category methodsFor: 'accessing' stamp: 'dhn 6/14/2015 21:20'!
addSubCategory: anObject
	self subCategories add: anObject! !

!Category methodsFor: 'accessing' stamp: 'dhn 6/14/2015 21:33'!
catName
	"Answer the value of catName"

	^ catName! !

!Category methodsFor: 'accessing' stamp: 'dhn 6/14/2015 21:33'!
catName: anObject
	"Set the value of catName"

	catName _ anObject! !

!Category methodsFor: 'accessing' stamp: 'dhn 6/14/2015 21:47'!
identity: aName
	self catName: aName! !

!Category methodsFor: 'accessing' stamp: 'dhn 6/14/2015 21:49'!
newSubCategory
	| temp |
	
	temp _ FillInTheBlankMorph request: 'Subcategory to ', self catName.
	self addSubCategory: temp! !

!Category methodsFor: 'accessing' stamp: 'dhn 6/14/2015 20:19'!
subCategories
	"Answer the value of categories"

	subCategories ifNil: [subCategories _ OrderedCollection new].
	^ subCategories! !

!Category methodsFor: 'accessing' stamp: 'dhn 6/14/2015 21:18'!
subCategories: anObject
	"Set the value of subCategories"

	subCategories _ anObject! !

!SubCategory methodsFor: 'accessing' stamp: 'dhn 6/14/2015 21:34'!
catName
	"Answer the value of catName"

	^ catName! !

!SubCategory methodsFor: 'accessing' stamp: 'dhn 6/14/2015 21:34'!
catName: anObject
	"Set the value of catName"

	catName _ anObject! !

!SubCategory methodsFor: 'accessing' stamp: 'dhn 6/14/2015 21:47'!
identity: aName
	self catName: aName! !

!Payee methodsFor: 'accessing' stamp: 'dhn 6/14/2015 21:37'!
last
	"Answer the value of last"

	^ last! !

!Payee methodsFor: 'accessing' stamp: 'dhn 6/14/2015 21:37'!
last: anObject
	"Set the value of last"

	last _ anObject! !

!Payee methodsFor: 'accessing' stamp: 'dhn 6/14/2015 21:37'!
payeeName
	"Answer the value of payeeName"

	^ payeeName! !

!Payee methodsFor: 'accessing' stamp: 'dhn 6/14/2015 21:37'!
payeeName: anObject
	"Set the value of payeeName"

	payeeName _ anObject! !
