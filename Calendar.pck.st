'From Cuis 4.2 of 25 July 2013 [latest update: #2679] on 4 February 2016 at 1:18:36.456656 pm'!
'Description Please enter a description for this package'!
!provides: 'Calendar' 1 12!
!classDefinition: #CalendarModel category: #Calendar!
TextModel subclass: #CalendarModel
	instanceVariableNames: 'days selectedDate date month year'
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

!CalendarModel methodsFor: 'operating' stamp: 'dhn 2/2/2016 17:57'!
reset

	days _ self formDays: date.
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

!CalendarPage methodsFor: 'updating' stamp: 'dhn 2/3/2016 12:26'!
earlier
	"Indicate the need for the model to go to the previous month. Change label to the result"

	self triggerEvent: #minus.
	self setLabel: model month, ' ', model year asString
! !

!CalendarPage methodsFor: 'updating' stamp: 'dhn 2/4/2016 11:04'!
fillPage
	"Label the date buttons"

	1 to: buttons size do: [:i |
		(buttons at: i) label: ((model days at: i) asString);
			redrawNeeded]! !

!CalendarPage methodsFor: 'initialization' stamp: 'dhn 2/4/2016 12:57'!
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

!CalendarPage methodsFor: 'updating' stamp: 'dhn 2/3/2016 12:25'!
later
	"Indicate the need for the model to go to the next month. Change label to the result"

	self triggerEvent: #plus.
	self setLabel: model month, ' ', model year asString
! !

!CalendarPage methodsFor: 'events' stamp: 'dhn 2/4/2016 13:17'!
mouseButton2Down: event localPosition: point
	"Bring up menu for the calendar"
	| x |

	x _ (PopUpMenu withCaption: 'Change...' chooseFrom: 'Month\Year').
	x _ (PopUpMenu labelArray: self class monthNames) startUpWithCaption: 'Choose month.'.
	{x} print! !

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

!CalendarPage methodsFor: 'initialization' stamp: 'dhn 2/4/2016 11:03'!
sayWhen
	"Establish the receiving half of the Observer Pattern"
	
	self when: #plus send: #monthAfter to: model.
	self when: #plus send: #fillPage to: self.
	self when: #minus send: #monthBefore to: model.
	self when: #minus send: #fillPage to: self.
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
