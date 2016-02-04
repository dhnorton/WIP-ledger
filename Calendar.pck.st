'From Cuis 4.2 of 25 July 2013 [latest update: #2679] on 4 February 2016 at 5:58:53.186827 pm'!
'Description Please enter a description for this package'!
!provides: 'Calendar' 1 14!
!classDefinition: #CalendarModel category: #Calendar!
TextModel subclass: #CalendarModel
	instanceVariableNames: 'days selectedDate date day month year'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendar'!
!classDefinition: 'CalendarModel class' category: #Calendar!
CalendarModel class
	instanceVariableNames: ''!

!classDefinition: #CalendarPage category: #Calendar!
SystemWindow subclass: #CalendarPage
	instanceVariableNames: 'buttons'
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

!CalendarModel methodsFor: 'accessing' stamp: 'dhn 2/4/2016 15:16'!
day
	"Answer the value of day"

	^ day! !

!CalendarModel methodsFor: 'accessing' stamp: 'dhn 2/4/2016 15:16'!
day: anObject
	"Set the value of day"

	day _ anObject! !

!CalendarModel methodsFor: 'accessing' stamp: 'dhn 2/2/2016 17:41'!
days
	"Answer the value of days"

	^ days! !

!CalendarModel methodsFor: 'accessing' stamp: 'dhn 2/2/2016 17:41'!
days: anObject
	"Set the value of days"

	days _ anObject! !

!CalendarModel methodsFor: 'initialization' stamp: 'dhn 2/1/2016 17:54'!
formDays: aDate
	"Answer a collection of day numbers based on aDate. Can be used for a one-month calendar page."
	| frst day col prec |
	
	frst _ Date newDay: 1 month: aDate monthName year: aDate yearNumber.	"first day of month"
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

!CalendarModel methodsFor: 'accessing' stamp: 'dhn 2/2/2016 17:41'!
month: anObject
	"Set the value of month"

	month _ anObject! !

!CalendarModel methodsFor: 'operating' stamp: 'dhn 2/2/2016 18:22'!
monthAfter
	"Change month later"
	
	date _ Date newDay: 12 month: (self indexMonthBy: 1) year: year.
	self reset.
	^ month! !

!CalendarModel methodsFor: 'operating' stamp: 'dhn 2/2/2016 18:20'!
monthBefore
	"Change month earlier"
	
	date _ Date newDay: 12 month: (self indexMonthBy: -1) year: year.
	self reset.
	^ month! !

!CalendarModel methodsFor: 'operating' stamp: 'dhn 2/4/2016 10:55'!
pickDate
	"Answer the date selected from the calendar"
	
	Smalltalk beep! !

!CalendarModel methodsFor: 'operating' stamp: 'dhn 2/4/2016 15:20'!
reset

	days _ self formDays: date.
	day _ date dayOfMonth.
	month _ date monthName.
	year _ date yearNumber! !

!CalendarModel methodsFor: 'accessing' stamp: 'dhn 2/2/2016 17:41'!
selectedDate
	"Answer the value of selectedDate"

	^ selectedDate! !

!CalendarModel methodsFor: 'accessing' stamp: 'dhn 2/2/2016 17:41'!
selectedDate: anObject
	"Set the value of selectedDate"

	selectedDate _ anObject! !

!CalendarModel methodsFor: 'accessing' stamp: 'dhn 2/2/2016 17:41'!
year
	"Answer the value of year"

	^ year! !

!CalendarModel methodsFor: 'accessing' stamp: 'dhn 2/2/2016 17:41'!
year: anObject
	"Set the value of year"

	year _ anObject! !

!CalendarPage methodsFor: 'menu' stamp: 'dhn 2/4/2016 16:05'!
addMonthChoice
	"Add a menu for changing months to aMenu"
	| x |
	
	x _ ((PopUpMenu labelArray: self class monthNames) startUpWithCaption: 'Choose month.').
	x > 0 ifTrue: [
		model date: (Date 
			newDay: model day 
			month: (self class monthNames at: x) asSymbol
			year: model year).
		model reset.
		self fillPage.
		self triggerEvent: #dateChange]
! !

!CalendarPage methodsFor: 'menu' stamp: 'dhn 2/4/2016 17:55'!
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
			newDay: model day 
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

!CalendarPage methodsFor: 'accessing' stamp: 'dhn 2/4/2016 10:35'!
buttons: anObject
	"Set the value of buttons"

	buttons _ anObject! !

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

!CalendarPage methodsFor: 'updating' stamp: 'dhn 2/3/2016 19:37'!
daysForWeek: aNumber
	"Answer 7 days from the model for week aNumber"
	| n |
	
	n _ 7 * aNumber.
	((n <= model days size) and: n > 0) ifTrue: [	
		^ (model days copyFrom: (n - 6) to: n)	].
	^ #()! !

!CalendarPage methodsFor: 'updating' stamp: 'dhn 2/4/2016 15:41'!
earlier
	"Indicate the need for the model to go to the previous month"

	self 
		triggerEvent: #minus;
		newDate! !

!CalendarPage methodsFor: 'updating' stamp: 'dhn 2/4/2016 11:04'!
fillPage
	"Label the date buttons"

	1 to: buttons size do: [:i |
		(buttons at: i) label: ((model days at: i) asString);
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

!CalendarPage methodsFor: 'events' stamp: 'dhn 2/4/2016 17:08'!
mouseButton2Down: event localPosition: point 
	"Bring up menu for the calendar"

	self menuMain.
	super mouseButton2Down: event localPosition: point! !

!CalendarPage methodsFor: 'updating' stamp: 'dhn 2/4/2016 15:47'!
newDate
	"Change label to show the current month and year"

	self setLabel: model month, ' ', model year asString
! !

!CalendarPage methodsFor: 'initialization' stamp: 'dhn 2/3/2016 20:17'!
openInWorld
	"Override the extent"
	
	super openInWorld.
	self morphExtent: 220@200! !

!CalendarPage methodsFor: 'initialization' stamp: 'dhn 2/4/2016 11:30'!
row: index
	"Answer a row of days from the model"
	| col |
	
	col _ OrderedCollection new.
	7 timesRepeat: [
		col add: 
			((PluggableButtonMorph model: model action: #pickDate)
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
