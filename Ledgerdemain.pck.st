'From Cuis 4.2 of 25 July 2013 [latest update: #2533] on 11 August 2015 at 11:31:10.877633 am'!
'Description A description for this package will be supplied.'!
!provides: 'Ledgerdemain' 1 81!
!requires: 'Records' 1 10 nil!
!classDefinition: #Account category: #Ledgerdemain!
Object subclass: #Account
	instanceVariableNames: 'accountName ledger ledgerLines balOpen openDate balRcon balCur'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'Account class' category: #Ledgerdemain!
Account class
	instanceVariableNames: ''!

!classDefinition: #LedgerDeMain category: #Ledgerdemain!
Workspace subclass: #LedgerDeMain
	instanceVariableNames: 'window accounts accountListIndex selectedAccount net trail modified transactions transactionList transactionListIndex selectedTransaction'
	classVariableNames: 'Categories Memos Payees Type UniqueInstance'
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'LedgerDeMain class' category: #Ledgerdemain!
LedgerDeMain class
	instanceVariableNames: ''!

!classDefinition: #Ledger category: #Ledgerdemain!
OrderedCollection subclass: #Ledger
	instanceVariableNames: 'contents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'Ledger class' category: #Ledgerdemain!
Ledger class
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

!classDefinition: #LedgerLine category: #Ledgerdemain!
RecordLayout subclass: #LedgerLine
	instanceVariableNames: 'date check payee category memo reconciled amount type balance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ledgerdemain'!
!classDefinition: 'LedgerLine class' category: #Ledgerdemain!
LedgerLine class
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
	instanceVariableNames: 'account date type payee amount category memo reconciled transfer check balance'
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

!LedgerDeMain commentStamp: 'dhn 8/5/2015 20:22' prior: 0!
LedgerDeMain is the model for LedgerWindow and a cover class. Its responsibilities are:

  hold accounts, payees, categories, memos, trail
  search
  maintain net worth
  back up and restore
  move transactions between accounts and record in audit trail

With apologies to those who do legerdemain.

recorded date _ Date today julianDayNumber - Time squeakEpoch.
recorded amount _ amount as cents. (examples: 2995 500)
reported amount _ dollars (examples: 29.95 5.00)!

!Ledger commentStamp: 'dhn 6/24/2015 21:11' prior: 0!
Ledger is an ordered collection of transactions.!

!Reconciliation commentStamp: 'dhn 6/12/2015 19:10' prior: 0!
Reconciliation responsibilities:

  report withdrawals and deposits
  update ledger
!

!LedgerWindow commentStamp: 'dhn 8/5/2015 20:23' prior: 0!
Window for Ledger d'Main. Provides pop-up menu for options.

The window is a LedgerWindow.
The window's model is a LedgerDeMain.!

!NamedEntity commentStamp: 'dhn 6/14/2015 13:43' prior: 0!
Abstract class for entities which have a specified name.!

!LedgerLine commentStamp: 'dhn 8/7/2015 18:45' prior: 0!
Format a transaction as an item in the ledger list pane.!

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

!String methodsFor: '*Ledgerdemain' stamp: 'dhn 6/29/2015 12:59'!
asLdmDate
	"Convert receiver in the form of dd/mm/yyyy to a Ledgerdemain date number"
	"Covers dates from 1/1/1901 to 2/27/2935093 (quite a long time)"
	| digits w x y dt |
	digits _ $0 to: $9.
	w _ self select: [:a | (digits includes: a) or: a = $/].
	x _ w findTokens: '/'.
	x size ~= 3 
		ifTrue: [nil error: 'not a date'].
	y _ OrderedCollection new.
	x do: [:ea | y add: ea asNumber].

	dt _ Date newDay: (y at: 2) month: (y at: 1) year: (y at: 3).
	^ dt julianDayNumber - Time squeakEpoch! !

!String methodsFor: '*Ledgerdemain' stamp: 'dhn 6/30/2015 18:48'!
dollarsToCents
	"Answer the conversion of the receiver to a number of cents"
	| digits w x y |
	digits _ $0 to: $9.
	w _ self select: [:a | (digits includes: a) or: ('-.' includes: a)].
	x _ w findDelimiters: '.' startingAt: 1. 
	x > w size 
		ifTrue: [y _ w, '00'] "no decimal point specified"
		ifFalse: [	"a decimal point exists"
			w size - x >= 2
				ifTrue: [y _ (w copyFrom: 1 to: x - 1), (w copyFrom: x + 1 to: x + 2)]
					"fractions of cents are dropped"
				ifFalse: [y _ (w copyFrom: 1 to: x - 1), '00']]. 
					"fewer than 2 decimal places gets zeros appended"
	^ y asNumber! !

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

!Account methodsFor: 'accessing' stamp: 'dhn 8/7/2015 11:38'!
accountName
	"Answer the value of accountName"

	^ accountName! !

!Account methodsFor: 'accessing' stamp: 'dhn 8/7/2015 11:38'!
accountName: anObject
	"Set the value of accountName"

	accountName _ anObject! !

!Account methodsFor: 'accessing' stamp: 'dhn 8/7/2015 15:54'!
addTransaction: anObject
	"Add anObject to the ledger and to the ledger list as formatted"
	| str |
	self ledger addLast: anObject.
	str _ anObject formatted.
	self ledgerLines addLast: str! !

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

!Account methodsFor: 'initialization' stamp: 'dhn 7/1/2015 22:06'!
initialize

	balOpen _ 0.
	balRcon _ 0.
	balCur _ 0.
	ledgerLines _ OrderedCollection new.
	ledger _ Ledger new! !

!Account methodsFor: 'accessing' stamp: 'dhn 6/13/2015 20:10'!
ledger
	"Answer the value of ledger"

	^ ledger! !

!Account methodsFor: 'accessing' stamp: 'dhn 6/13/2015 20:10'!
ledger: anObject
	"Set the value of ledger"

	ledger _ anObject! !

!Account methodsFor: 'accessing' stamp: 'dhn 7/1/2015 22:03'!
ledgerLines
	"Answer the value of ledgerLines"

	^ ledgerLines! !

!Account methodsFor: 'accessing' stamp: 'dhn 7/1/2015 22:03'!
ledgerLines: anObject
	"Set the value of ledgerLines"

	ledgerLines _ anObject! !

!Account methodsFor: 'accessing' stamp: 'dhn 8/8/2015 19:32'!
loadTransaction: anObject
	"Update balances and add anObject to the ledger"
	| amt tr |
	
	amt _ anObject amount dollarsToCents.
	self balCur: self balCur + amt.
	anObject reconciled = 'R' 
		ifTrue: [self balRcon: self balRcon + amt].
	tr _ anObject copy.
	tr balance: self balCur ledgerFormatted.
	self addTransaction: tr! !

!Account methodsFor: 'accessing' stamp: 'dhn 7/1/2015 14:49'!
openDate
	"Answer the value of openDate"

	^ openDate! !

!Account methodsFor: 'accessing' stamp: 'dhn 7/1/2015 14:49'!
openDate: anObject
	"Set the value of openDate"

	openDate _ anObject! !

!LedgerDeMain methodsFor: 'save & restore' stamp: 'dhn 8/8/2015 11:33'!
accountFromFile
	"Copy account ledger entries from a file and add them to the account ledger ivar"
	| file ios line rec acct |
	file _ FillInTheBlankMorph request: 'Name of file with xactions:' initialAnswer: 'c:\directory\file.txt'.
	file ~= '' ifTrue: [
		ios _ FileStream oldFileNamed: file.
		acct _ accounts at: selectedAccount.
		rec _ Transaction new account: acct.
		[(line _ ios nextLine) notNil]
			whileTrue: [	line size > 0 
				ifTrue: [
					rec type: (rec acquire: #type from: line).
					rec date: (rec acquire: #date from: line).
					rec check: (rec acquire: #check from: line).
					rec payee: (rec acquire: #payee from: line).
					rec memo: (rec acquire: #memo from: line).
					rec category: (rec acquire: #category from: line).
					rec reconciled: (rec acquire: #reconciled from: line).
					rec amount: (rec acquire: #amount from: line).
					self categories: rec category withoutTrailingBlanks.
					self payees: rec payee withoutTrailingBlanks.
					self memos: rec memo withoutTrailingBlanks.
					self type: rec type withoutTrailingBlanks.
					acct loadTransaction: rec]].
		ios close]! !

!LedgerDeMain methodsFor: 'account' stamp: 'dhn 6/26/2015 12:21'!
accountList
	"Answer a list of accounts"
	^ self accounts keys asOrderedCollection! !

!LedgerDeMain methodsFor: 'account' stamp: 'dhn 6/26/2015 12:22'!
accountListIndex
	self accountList ifNil: [ ^ accountListIndex _ 0 ].
	^ self accountList indexOf: selectedAccount! !

!LedgerDeMain methodsFor: 'account' stamp: 'dhn 6/26/2015 12:18'!
accountListIndex: index
	"Set the value of accountListIndex"

	accountListIndex _ index.
	self selectedAccount: 
		(self accountList at: index ifAbsent: nil)! !

!LedgerDeMain methodsFor: 'account' stamp: 'dhn 6/15/2015 07:31'!
accounts
	"Answer the value of accounts"

	accounts ifNil: [accounts _ Dictionary new].
	^ accounts! !

!LedgerDeMain methodsFor: 'account' stamp: 'dhn 8/7/2015 11:40'!
accounts: anObject
	"Save anObject in accounts"

	(self accounts includesKey: anObject asSymbol)
		ifTrue: [self inform: anObject,' is already an account']
		ifFalse: [
			self accounts at: anObject asSymbol put: (Account new accountName: anObject).
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

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/30/2015 21:43'!
listMemos

	Memos ifNotNil: [Memos keysDo: [:k |
		Transcript show: k; newLine]]
! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/25/2015 11:48'!
listPayees

	Payees ifNotNil: [Payees keysDo: [:k |
		Transcript show: k; newLine]]
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

!LedgerDeMain methodsFor: 'account' stamp: 'dhn 8/8/2015 19:30'!
newAccount
	| temp bal amt balDate acct rec |
	
	temp _ FillInTheBlankMorph request: 'Name of new account:'.
	temp ~= '' ifTrue: [
		self accounts: temp.
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
		acct _ (self accounts at: temp)
			openDate: balDate;
			balOpen: amt;
			balCur: amt;
			balRcon: amt.
		self modified: true.
		rec _ Transaction new account: acct.
		rec
			date: (rec mmddyyyy: acct openDate);
			payee: '**Opening Balance';
			reconciled: 'R';
			type: '';
			amount: '';
			category: '';
			memo: '';
			transfer: '';
			check: '';
			balance: acct balOpen ledgerFormatted.
		acct addTransaction: rec].
		self changed: #accountList
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

!LedgerDeMain methodsFor: 'account' stamp: 'dhn 6/23/2015 10:14'!
selectedAccount
	"Answer the value of selectedAccount"

	^ selectedAccount! !

!LedgerDeMain methodsFor: 'account' stamp: 'dhn 7/1/2015 22:13'!
selectedAccount: anObject
	"Set the value of selectedAccount"

	selectedAccount _ anObject.
	anObject ifNotNil: [
		self transactionList: (self accounts at: anObject) ledgerLines].
	self changed: #accountListIndex.
	self changed: #transactionList! !

!LedgerDeMain methodsFor: 'transaction' stamp: 'dhn 6/26/2015 21:34'!
selectedTransaction
	"Answer the value of selectedTransaction"

	^ selectedTransaction! !

!LedgerDeMain methodsFor: 'transaction' stamp: 'dhn 7/1/2015 17:57'!
selectedTransaction: anObject
	"Set the value of selectedTransaction"

	selectedTransaction _ anObject.
	self changed: #transactionListIndex! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/14/2015 13:35'!
trail
	"Answer the value of trail"

	^ trail! !

!LedgerDeMain methodsFor: 'accessing' stamp: 'dhn 6/23/2015 21:31'!
trail: anObject
	"Set the value of trail"

	trail _ anObject.
	self modified: true! !

!LedgerDeMain methodsFor: 'transaction' stamp: 'dhn 7/1/2015 22:06'!
transactionList
	"Answer a list of transactions"

	self accounts isEmpty ifFalse: [
		self accountListIndex > 0 ifTrue: [
			^ (self accounts at: (self accountList at: accountListIndex))
				ledgerLines]].
	^ OrderedCollection new
! !

!LedgerDeMain methodsFor: 'transaction' stamp: 'dhn 6/28/2015 19:58'!
transactionList: anObject
	"Set the value of transactionList"

	transactionList _ anObject! !

!LedgerDeMain methodsFor: 'transaction' stamp: 'dhn 6/24/2015 22:16'!
transactionListIndex
	self transactionList ifNil: [ ^ self transactionListIndex: 0].
	^ self transactionList indexOf: self selectedTransaction! !

!LedgerDeMain methodsFor: 'transaction' stamp: 'dhn 6/26/2015 21:37'!
transactionListIndex: index
	"Set the value of transactionListIndex"

	transactionListIndex _ index.
	self selectedTransaction: 
		(self transactionList at: index ifAbsent: nil)! !

!LedgerDeMain methodsFor: 'transaction' stamp: 'dhn 6/26/2015 21:28'!
transactions
	"Answer the value of transactions"

	^ transactions! !

!LedgerDeMain methodsFor: 'transaction' stamp: 'dhn 6/26/2015 21:28'!
transactions: anObject
	"Set the value of transactions"

	transactions _ anObject! !

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

!LedgerDeMain class methodsFor: 'as yet unclassified' stamp: 'dhn 6/25/2015 20:04'!
look
	Payees explore! !

!LedgerDeMain class methodsFor: 'class initialization' stamp: 'dhn 6/25/2015 11:07'!
uniqueInstance
	"Ensure that there is only one of me"

	UniqueInstance ifNil: [UniqueInstance _ self  basicNew initialize].
	^ UniqueInstance! !

!Ledger methodsFor: 'initialization' stamp: 'dhn 6/24/2015 21:05'!
initialize

	contents _ OrderedCollection new! !

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 6/30/2015 20:36'!
addAccountActionsTo: aMenu
	"Add items to aMenu for account actions"

	| subMenu |
	subMenu := MenuMorph new defaultTarget: self.
	subMenu add: 'Add an account'	target: self model 	action:	#newAccount.
	subMenu add: 'Load account from file...'	target: self model 	action:	#accountFromFile.
	subMenu add: 'Search all accounts...'		target: self model 	action: #searchAllAccounts.
	aMenu add: 'Accounts...' subMenu: subMenu! !

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 6/23/2015 20:28'!
addCategoryActionsTo: aMenu
	"Add items to aMenu for category actions"

	| subMenu |
	subMenu := MenuMorph new defaultTarget: self.
	subMenu add: 'List categories'			target: self model 	action: #listCategories.
	subMenu add: 'Add a category'			target: self model 	action: #newCategory.
	subMenu add: 'Categories from file'	target: self model 	action: #categoriesFromFile.
	aMenu add: 'Categories...' subMenu: subMenu! !

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 6/30/2015 21:44'!
addMemoActionsTo: aMenu
	"Add items to aMenu for payee actions"

	| subMenu |
	subMenu := MenuMorph new defaultTarget: self.
	subMenu add: 'List memos'			target: self model 	action: #listMemos.
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

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 7/1/2015 12:37'!
buildMorphicWindow
	"Answer a window for Ledger d'Main"
	| list1 list2 row |
	list1 _ self windowAccountList.
	list2 _ self windowLedgerList.
	row _ LayoutMorph newRow.
	row name: #Row.
	row
		addMorph: list1 proportionalWidth: 0.2;
		addAdjusterAndMorph: list2 proportionalWidth: 0.8.
	self layoutMorph
		addMorph: row.
	self setLabel: 'Ledger d''Main'! !

!LedgerWindow methodsFor: 'open/close' stamp: 'dhn 6/25/2015 15:03'!
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

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 6/26/2015 14:35'!
mouseButton2Activity
	self menuMain.! !

!LedgerWindow methodsFor: 'menu' stamp: 'dhn 6/26/2015 11:35'!
popUpInWorld: aWorld
	"Required by PluggableListMorph. Do nothing."! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 7/1/2015 12:36'!
windowAccountList
	"Answer the specifications for the list of accounts in the window"
	
	^ (PluggableListMorph
		model: model
		listGetter: #accountList
		indexGetter: #accountListIndex
		indexSetter: #accountListIndex:
		mainView: self
		menuGetter: #menuMain
		keystrokeAction: nil)
			name: 'Account List'
! !

!LedgerWindow methodsFor: 'initialization' stamp: 'dhn 8/7/2015 18:38'!
windowLedgerList
	"Answer the specifications for the ledger list in the window"
	
	^ (PluggableListMorph
		model: model
		listGetter: #transactionList
		indexGetter: #transactionListIndex
		indexSetter: #transactionListIndex:
		mainView: self
		menuGetter: #menuLedger
		keystrokeAction: nil)
			name: #Ledger;
			font: (AbstractFont familyName: 'DejaVu Sans Mono' aroundPointSize: 9)
! !

!LedgerWindow class methodsFor: 'instance creation' stamp: 'dhn 6/22/2015 16:03'!
how
"
	LedgerWindow open.
"! !

!LedgerWindow class methodsFor: 'instance creation' stamp: 'dhn 6/23/2015 20:45'!
includeInNewMorphMenu

	^ false 	"Not to be instantiated from the menu"! !

!LedgerWindow class methodsFor: 'instance creation' stamp: 'dhn 6/26/2015 21:23'!
open
	| wind main |
	main _ LedgerDeMain new.
	main window: (wind _ LedgerWindow new model: main).
	wind buildMorphicWindow.
	wind openInWorld.
! !

!NamedEntity class methodsFor: 'initialization' stamp: 'dhn 6/14/2015 21:43'!
named: aName
	^ self basicNew identity: aName! !

!LedgerLine methodsFor: 'accessing' stamp: 'dhn 8/7/2015 14:02'!
amount
	"Answer the value of amount"

	amount ifNil: [amount _ String new].
	^ amount! !

!LedgerLine methodsFor: 'accessing' stamp: 'dhn 8/7/2015 14:01'!
amount: anObject
	"Set the value of amount"

	amount _ anObject! !

!LedgerLine methodsFor: 'finalizing' stamp: 'dhn 8/7/2015 18:03'!
assemble: anObject 
	"Answer the record formed by populating the fields with data from
	anObject "
	^ self assemble: anObject endingWith: ''
! !

!LedgerLine methodsFor: 'accessing' stamp: 'dhn 8/7/2015 14:04'!
balance
	"Answer the value of balance"

	balance ifNil: [balance _ String new].
	^ balance! !

!LedgerLine methodsFor: 'accessing' stamp: 'dhn 8/7/2015 14:01'!
balance: anObject
	"Set the value of balance"

	balance _ anObject! !

!LedgerLine methodsFor: 'accessing' stamp: 'dhn 8/7/2015 14:04'!
category
	"Answer the value of category"

	category ifNil: [category _ String new].
	^ category! !

!LedgerLine methodsFor: 'accessing' stamp: 'dhn 8/7/2015 14:01'!
category: anObject
	"Set the value of category"

	category _ anObject! !

!LedgerLine methodsFor: 'accessing' stamp: 'dhn 8/7/2015 14:05'!
check
	"Answer the value of check"

	check ifNil: [check _ String new].
	^ check! !

!LedgerLine methodsFor: 'accessing' stamp: 'dhn 8/7/2015 14:01'!
check: anObject
	"Set the value of check"

	check _ anObject! !

!LedgerLine methodsFor: 'accessing' stamp: 'dhn 8/7/2015 14:05'!
date
	"Answer the value of date"

	date ifNil: [date _ String new].
	^ date! !

!LedgerLine methodsFor: 'accessing' stamp: 'dhn 8/7/2015 14:01'!
date: anObject
	"Set the value of date"

	date _ anObject! !

!LedgerLine methodsFor: 'initialization' stamp: 'dhn 8/10/2015 20:56'!
initialize

	CompileFields from: #(
		#(#date 			11)		"mm/dd/yyyy"
		#(#check 			  5)		"check number"
		#(#payee 			31)
		#(#category 		36)
		#(#memo 			30)
		#(#reconciled		  2)		"reconciled: R, blank"
		#(#amount 		13  false)	"right justify"
		#(#Blank07 		  1)
		#(#type 				  5)		"EFT, DEB, TOUT"
		#(#balance 		12  false)	"right justify"
	) for: self class.
	super initialize
! !

!LedgerLine methodsFor: 'accessing' stamp: 'dhn 8/7/2015 14:06'!
memo
	"Answer the value of memo"

	memo ifNil: [memo _ String new].
	^ memo! !

!LedgerLine methodsFor: 'accessing' stamp: 'dhn 8/7/2015 14:01'!
memo: anObject
	"Set the value of memo"

	memo _ anObject! !

!LedgerLine methodsFor: 'accessing' stamp: 'dhn 8/7/2015 14:06'!
payee
	"Answer the value of payee"

	payee ifNil: [payee _ String new].
	^ payee! !

!LedgerLine methodsFor: 'accessing' stamp: 'dhn 8/7/2015 14:01'!
payee: anObject
	"Set the value of payee"

	payee _ anObject! !

!LedgerLine methodsFor: 'accessing' stamp: 'dhn 8/7/2015 14:07'!
reconciled
	"Answer the value of reconciled"

	reconciled ifNil: [reconciled _ String new].
	^ reconciled! !

!LedgerLine methodsFor: 'accessing' stamp: 'dhn 8/7/2015 14:01'!
reconciled: anObject
	"Set the value of reconciled"

	reconciled _ anObject! !

!LedgerLine methodsFor: 'accessing' stamp: 'dhn 8/7/2015 14:07'!
type
	"Answer the value of type"

	type ifNil: [type _ String new].
	^ type! !

!LedgerLine methodsFor: 'accessing' stamp: 'dhn 8/7/2015 14:01'!
type: anObject
	"Set the value of type"

	type _ anObject! !

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

!Transaction methodsFor: 'loading' stamp: 'dhn 8/7/2015 21:27'!
acquire: aField from: aString
	"Answer the subset of aString which is defined by aField"
	| loc |
	loc _ (self class fields at: aField asSymbol) location.
	^ aString copyFrom: loc x to: loc y.! !

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

!Transaction methodsFor: 'accessing' stamp: 'dhn 8/7/2015 21:41'!
check
	"Answer the value of check"

	^ check! !

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

!Transaction methodsFor: 'displaying' stamp: 'dhn 8/9/2015 17:30'!
formatted
	"Answer the receiver as a formatted string"
	| str |
	str _ LedgerLine new.
	str data at: #date put: self date withoutTrailingBlanks.
	str data at: #check put: self check withoutTrailingBlanks.
	str data at: #payee put: self payee withoutTrailingBlanks.
	str data at: #category put: self category withoutTrailingBlanks.
	str data at: #memo put: self memo withoutTrailingBlanks.
	str data at: #reconciled put: self reconciled asString.
	str data at: #amount put: self amount dollarsToCents ledgerFormatted.
	str data at: #balance put: self account balCur ledgerFormatted.
	str data at: #type put: self type withoutTrailingBlanks.
	^ str assemble: str data! !

!Transaction methodsFor: 'initialization' stamp: 'dhn 8/11/2015 11:27'!
initialize

	"There should be a FillInTheBlank dialog here for the various input record formats"
	self initializeS50! !

!Transaction methodsFor: 'initialization' stamp: 'dhn 8/11/2015 11:23'!
initializeS50
	CompileFields from: #(
		#(#type               5)	"EFT, DEB, TOUT"
		#(#Blank1         15)
		#(#date             10)	"mm/dd/yyyy"
		#(#Blank2           5)
		#(#check             4)	"check number"
		#(#Blank3           1)
		#(#payee          30)
		#(#memo           17)
		#(#category     35)
		#(#reconciled    1)	"R, blank"
		#(#amount       13)
	) for: self class! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 8/7/2015 15:26'!
memo
	"Answer the value of memo"

	memo ifNil: [memo _ String new].
	^ memo! !

!Transaction methodsFor: 'accessing' stamp: 'dhn 8/7/2015 15:17'!
memo: anObject
	"Set the value of memo"

	memo _ anObject! !

!Transaction methodsFor: 'displaying' stamp: 'dhn 8/8/2015 15:14'!
mmddyyyy: anObject
	"Answer anObject as a date in the form mm/dd/yyyy because Date does not do it right"
	| str dd mm yyyy ios |
	str _ anObject asDate yyyymmdd.		"ISO format"
	dd _  str copyFrom: 9 to: 10.
	mm _ str copyFrom: 6 to: 7.
	yyyy _ str copyFrom: 1 to: 4.
	ios _ String new writeStream
		nextPutAll: mm;
		nextPut: $/;
		nextPutAll: dd;
		nextPut: $/;
		nextPutAll: yyyy.
	^ ios contents! !

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
