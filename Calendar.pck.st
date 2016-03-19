'From Cuis 4.2 of 25 July 2013 [latest update: #2701] on 19 March 2016 at 6:16:31.551037 pm'!
'Description Please enter a description for this package'!
!provides: 'Calendar' 1 24!
!classDefinition: #CalendarModel category: #Calendar!
TextModel subclass: #CalendarModel
	instanceVariableNames: 'days selectedDate date theDay month year'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendar'!
!classDefinition: 'CalendarModel class' category: #Calendar!
CalendarModel class
	instanceVariableNames: ''!

!classDefinition: #CalendarButton category: #Calendar!
PluggableButtonMorph subclass: #CalendarButton
	instanceVariableNames: 'index offColor onColor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendar'!
!classDefinition: 'CalendarButton class' category: #Calendar!
CalendarButton class
	instanceVariableNames: ''!

!classDefinition: #CalendarPage category: #Calendar!
SystemWindow subclass: #CalendarPage
	instanceVariableNames: 'buttons dayIndex oldButtonIndex'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendar'!
!classDefinition: 'CalendarPage class' category: #Calendar!
CalendarPage class
	instanceVariableNames: ''!


!CalendarModel commentStamp: 'dhn 2/1/2016 17:36' prior: 0!
The model for a calendar of the days of the month. 

Using the current date, forms a 42-element vector showing all the days of the current month, with days from preceding and succeeding months as filler. (42 = 7x6 = 6 weeks)
!

!CalendarPage commentStamp: 'dhn 2/1/2016 20:25' prior: 0!
A view for CalendarModel!

!CalendarModel methodsFor: 'accessing' stamp: 'dhn 2/2/2016 17:54'!
date
	"Answer the value of date"

	^ date! !

!CalendarModel methodsFor: 'accessing' stamp: 'dhn 2/2/2016 17:54'!
date: anObject
	"Set the value of date"

	date _ anObject! !

!CalendarModel methodsFor: 'accessing' stamp: 'dhn 2/2/2016 17:41'!
days
	"Answer the value of days"

	^ days! !

!CalendarModel methodsFor: 'accessing' stamp: 'dhn 2/2/2016 17:41'!
days: anObject
	"Set the value of days"

	days _ anObject! !

!CalendarModel methodsFor: 'initialization' stamp: 'dhn 3/19/2016 16:41'!
formDays: aDate
	"Answer a collection of day numbers based on aDate. Can be used for a one-month calendar page."
	| frst day col prec |
	
	frst _ Date newDay: 1 month: aDate monthIndex year: aDate yearNumber.	"first day of month"
	day _ frst weekdayIndex.	"day in the week"
	col _ OrderedCollection new.
	prec _ (frst previous: frst weekday) daysInMonth. 	"number of last day of preceding month"
	day = 1
		ifTrue: [
			col _ col addAll: ((prec - 6) to: prec) asArray; yourself] 	"month starts on Sunday"
		ifFalse:[
			col _ col addAll: ((prec - day  + 2) to: prec) asArray; yourself]. 	"days preceding this month"
	col _ col addAll: (1 to: aDate daysInMonth); yourself. "days of the month containing aDate"
	col _ col addAll: (1 to: 42 - col size); yourself. "days following the month containing aDate"
	^ col! !

!CalendarModel methodsFor: 'operating' stamp: 'dhn 2/3/2016 15:02'!
indexMonthBy: aNumber
	"Answer the month as a symbol resulting from changing the current month index by aNumber. Adjust year as required"
	| m |
	
	m _ aNumber + date monthIndex.
	m > 12 ifTrue: [year _ year + 1].
	m < 1 ifTrue: [year _ year - 1].
	
	m _ m mod: 12.
	m = 0 ifTrue: [m _ 12].
	^ Date nameOfMonth: m
	! !

!CalendarModel methodsFor: 'initialization' stamp: 'dhn 2/2/2016 17:57'!
initialize

	super initialize.
	date _ Date today.
	self reset
! !

!CalendarModel methodsFor: 'accessing' stamp: 'dhn 2/2/2016 17:41'!
month
	"Answer the value of month"

	^ month! !

!CalendarModel methodsFor: 'operating' stamp: 'dhn 2/9/2016 16:45'!
monthAfter
	"Change month later"
	| yr |
	
	yr _ year.
	(Date indexOfMonth: month) = 12 ifTrue: [yr _ year + 1].
	date _ Date newDay: 12 month: (self indexMonthBy: 1) year: yr.
	self reset.
	^ month! !

!CalendarModel methodsFor: 'operating' stamp: 'dhn 2/9/2016 16:44'!
monthBefore
	"Change month earlier"
	| yr |
	
	yr _ year.
	(Date indexOfMonth: month) = 1 ifTrue: [yr _ year - 1].
	date _ Date newDay: 12 month: (self indexMonthBy: -1) year: yr.
	self reset.
	^ month! !

!CalendarModel methodsFor: 'operating' stamp: 'dhn 2/9/2016 16:39'!
reset

	days _ self formDays: date.
	theDay _ date dayOfMonth.
	month _ date monthName.
	year _ date yearNumber.
	selectedDate _ nil! !

!CalendarModel methodsFor: 'accessing' stamp: 'dhn 2/2/2016 17:41'!
selectedDate
	"Answer the value of selectedDate"

	^ selectedDate! !

!CalendarModel methodsFor: 'accessing' stamp: 'dhn 2/2/2016 17:41'!
selectedDate: anObject
	"Set the value of selectedDate"

	selectedDate _ anObject! !

!CalendarModel methodsFor: 'accessing' stamp: 'dhn 2/5/2016 15:11'!
theDay
	"Answer the value of theDay"

	^ theDay! !

!CalendarModel methodsFor: 'accessing' stamp: 'dhn 2/2/2016 17:41'!
year
	"Answer the value of year"

	^ year! !

!CalendarButton methodsFor: 'accessing' stamp: 'dhn 2/8/2016 15:08'!
index: anObject
	"Set the value of index"

	index _ anObject! !

!CalendarButton methodsFor: 'initialization' stamp: 'dhn 2/8/2016 19:13'!
initialize

	super initialize.
	offColor _ self color.
	onColor _ Color lightGreen! !

!CalendarButton methodsFor: 'accessing' stamp: 'dhn 2/8/2016 19:12'!
offColor
	"Answer the value of offColor"

	^ offColor! !

!CalendarButton methodsFor: 'accessing' stamp: 'dhn 2/8/2016 19:12'!
onColor
	"Answer the value of onColor"

	^ onColor! !

!CalendarButton methodsFor: 'event handling' stamp: 'dhn 2/8/2016 15:42'!
performAction
	"For the view, identify the calendar button that was pressed"
	
	model dayIndex: index.
	super performAction! !

!CalendarPage methodsFor: 'menu' stamp: 'dhn 2/9/2016 16:19'!
addMonthChoice
	"Add a menu for changing months to aMenu"
	| x |
	
	x _ ((PopUpMenu labelArray: self class monthNames) startUpWithCaption: 'Choose month.').
	x > 0 ifTrue: [
		model date: (Date 
			newDay: model theDay 
			month: (self class monthNames at: x) asSymbol
			year: model year).
		model reset.
		self fillPage.
		self triggerEvent: #dateChange]
! !

!CalendarPage methodsFor: 'menu' stamp: 'dhn 2/8/2016 18:56'!
addYearChoice
	"Add a menu for changing year to aMenu"
	| arr col y x lin yr |
	
	y _ self model year.
	arr _ (y - 4 to: y + 4) asArray.
	col _ OrderedCollection new.
	arr do: [:ea | col add: ea asString].
	col add: 'Other...'.
	lin _ {arr size}.
	
	x _ (PopUpMenu labelArray: col lines: lin) startUpWithCaption: nil.
	((x > 0) and: x <= arr size) ifTrue: [yr _ arr at: x].
	x = col size ifTrue: [
		yr _ (FillInTheBlankMorph request: 'Enter the year' initialAnswer: y asString) asNumber].
	
	yr ifNotNil: [
		model date: (Date 
			newDay: model theDay 
			month: model month
			year: yr).
		model reset.
		self fillPage.
		self triggerEvent: #dateChange]
! !

!CalendarPage methodsFor: 'initialization' stamp: 'dhn 2/4/2016 11:32'!
buildMorphicWindow
	"Answer a window for the calendar"
	| nam row1 row2 row3 row4 row5 row6 |
	
	self setLabel: model month, ' ', model year asString.
	self sayWhen.
	
	nam _ LayoutMorph newRow
		name: #'day names';
		separation: 2@0;
		addAllMorphs: self setDays.
		
	row1 _ LayoutMorph newRow
		name: #row1;
		separation: 2@2;
		addAllMorphs: (self row: 1).
		
	row2 _ LayoutMorph newRow
		name: #row2;
		separation: 2@2;
		addAllMorphs: (self row: 2).
		
	row3 _ LayoutMorph newRow
		name: #row3;
		separation: 2@2;
		addAllMorphs: (self row: 3).
		
	row4 _ LayoutMorph newRow
		name: #row4;
		separation: 2@2;
		addAllMorphs: (self row: 4).
		
	row5 _ LayoutMorph newRow
		name: #row5;
		separation: 2@2;
		addAllMorphs: (self row: 5).
		
	row6 _ LayoutMorph newRow
		name: #row6;
		separation: 2@2;
		addAllMorphs: (self row: 6).
		
	self fillPage.

	self layoutMorph
		addMorph: nam;
		addMorph: row1;
		addMorph: row2;
		addMorph: row3;
		addMorph: row4;
		addMorph: row5;
		addMorph: row6;
		name: #calendar
! !

!CalendarPage methodsFor: 'accessing' stamp: 'dhn 2/4/2016 10:35'!
buttons
	"Answer the value of buttons"

	^ buttons! !

!CalendarPage methodsFor: 'updating' stamp: 'dhn 2/9/2016 08:49'!
changeButtonColors
	"Change any prior button selection to the off color. Change new button selection to the on color"
	| old new |
	
	oldButtonIndex ifNotNil: [
		old _ buttons at: oldButtonIndex.
		old color: old offColor.
		old redrawNeeded].
	
	new _ buttons at: dayIndex.
	new color: new onColor.
	new redrawNeeded.
	oldButtonIndex _ dayIndex! !

!CalendarPage methodsFor: 'initialization' stamp: 'dhn 2/2/2016 16:15'!
createEarlierBox
	^ (PluggableButtonMorph model: self action: #earlier)
		icon: Theme current collapseIcon;
		iconName: #earlier;
		setBalloonText: 'month before';
		morphExtent: self boxExtent! !

!CalendarPage methodsFor: 'initialization' stamp: 'dhn 2/2/2016 16:15'!
createLaterBox
	^ (PluggableButtonMorph model: self action: #later)
		icon: Theme current expandIcon;
		iconName: #later;
		setBalloonText: 'month after';
		morphExtent: self boxExtent! !

!CalendarPage methodsFor: 'accessing' stamp: 'dhn 2/8/2016 15:33'!
dayIndex: anObject
	"Set the value of dayIndex"

	dayIndex _ anObject! !

!CalendarPage methodsFor: 'updating' stamp: 'dhn 2/4/2016 15:41'!
earlier
	"Indicate the need for the model to go to the previous month"

	self 
		triggerEvent: #minus;
		newDate! !

!CalendarPage methodsFor: 'updating' stamp: 'dhn 2/8/2016 15:24'!
fillPage
	"Label the date buttons and set their index numbers"

	1 to: buttons size do: [:i |
		(buttons at: i) 
			label: ((model days at: i) asString);
			index: i;
			redrawNeeded]! !

!CalendarPage methodsFor: 'initialization' stamp: 'dhn 2/4/2016 17:13'!
initialize

	super initialize.
	buttons _ OrderedCollection new.
	self setProperty: #'handlesMouseDown:' toValue: true
! !

!CalendarPage methodsFor: 'initialization' stamp: 'dhn 2/3/2016 12:21'!
initializeLabelArea
	"Specify the buttons for the title bar"

	| spacing |
	spacing _ self boxExtent x.
	self addMorph: self createCloseBox position: 2@2.
	self addMorph: self createEarlierBox position: spacing+2@2.
	self addMorph: self createLaterBox position: spacing*2+2@2! !

!CalendarPage methodsFor: 'updating' stamp: 'dhn 2/4/2016 15:42'!
later
	"Indicate the need for the model to go to the next month"

	self 
		triggerEvent: #plus;
		newDate! !

!CalendarPage methodsFor: 'menu' stamp: 'dhn 2/4/2016 15:06'!
menuMain
	"Main pop-up menu"
	| aMenu |

	aMenu _ (PopUpMenu withCaption: 'Change...' chooseFrom: 'Month\Year').
	aMenu = 1 ifTrue: [self addMonthChoice].
	aMenu = 2 ifTrue: [self addYearChoice].
	
! !

!CalendarPage methodsFor: 'events' stamp: 'dhn 2/4/2016 18:07'!
mouseButton2Down: event localPosition: point 
	"Bring up menu for the calendar"

	self menuMain! !

!CalendarPage methodsFor: 'updating' stamp: 'dhn 2/9/2016 16:31'!
newDate
	"Change label to show the current month and year"

	oldButtonIndex ifNotNil: [| b |
		b _ buttons at: oldButtonIndex.
		b color: b offColor.
		oldButtonIndex _ nil].
	self setLabel: model month, ' ', model year asString
! !

!CalendarPage methodsFor: 'initialization' stamp: 'dhn 2/3/2016 20:17'!
openInWorld
	"Override the extent"
	
	super openInWorld.
	self morphExtent: 220@200! !

!CalendarPage methodsFor: 'updating' stamp: 'dhn 2/10/2016 13:15'!
pickDate
	"Set the date selected from the calendar"
	| mx mo da yr dt |
	
	mx _ Date indexOfMonth: model month.
	yr _ model year.

	da _ model days at: dayIndex.
	((dayIndex <= 14) and: da >= 14) ifTrue: [	"preceding month"
		mx _ mx - 1.
		mx = 0 ifTrue: [yr _ yr - 1]		"preceding year"
		]. 
	((dayIndex >= 28) and: da <= 14) ifTrue: [	"succeeding month"
		mx _ mx + 1.
		mx = 13 ifTrue: [yr _ yr + 1]	"succeeding year"
		]. 
	
	mx _ mx mod: 12.
	mx = 0 ifTrue: [mx _ 12].

	mo _ Date nameOfMonth: mx.
	dt _ Date newDay: da month: mo year: yr.
	
	model selectedDate: dt mmddyyyy.
	
	self changeButtonColors! !

!CalendarPage methodsFor: 'initialization' stamp: 'dhn 2/8/2016 15:26'!
row: index
	"Answer a row of days from the model"
	| col |
	
	col _ OrderedCollection new.
	7 timesRepeat: [
		col add: 
			((CalendarButton model: self action: #pickDate)
				roundButtonStyle: false;
				layoutSpec: (LayoutSpec proportionalWidth: 0.2))].
	buttons addAll: col reversed.
	^ col ! !

!CalendarPage methodsFor: 'initialization' stamp: 'dhn 2/4/2016 15:53'!
sayWhen
	"Establish the receiving half of the Observer Pattern"
	
	self when: #plus send: #monthAfter to: model.
	self when: #plus send: #fillPage to: self.
	self when: #minus send: #monthBefore to: model.
	self when: #minus send: #fillPage to: self.
	self when: #dateChange send: #newDate to: self.
! !

!CalendarPage methodsFor: 'initialization' stamp: 'dhn 2/3/2016 17:00'!
setDays
	"Answer the morphs which name the days"
	| col |
	
	col _ OrderedCollection new.
	self class dayNames do: [:ea | | r |
		col addFirst: 
			((r _ RectangleLikeMorph new)
				color: Color lightBlue;
				layoutSpec: (LayoutSpec proportionalWidth: 0.2)).
			r addMorph: (StringMorph contents: ea)
		].
	^ col! !

!CalendarPage class methodsFor: 'instance creation' stamp: 'dhn 2/4/2016 11:48'!
dayNames
	"Answer the names for the days of the week"
	
	^ #('S' 'M' 'T' 'W' 'T' 'F' 'S')! !

!CalendarPage class methodsFor: 'instance creation' stamp: 'dhn 2/2/2016 13:27'!
how
"
	CalendarPage open: CalendarModel new.
"! !

!CalendarPage class methodsFor: 'instance creation' stamp: 'dhn 2/4/2016 11:52'!
monthNames
	"Answer the names for the months"
	
	^ #('January' 'February' 'March' 'April' 'May' 'June' 'July' 'August' 'September' 'October' 'November' 'December')! !
