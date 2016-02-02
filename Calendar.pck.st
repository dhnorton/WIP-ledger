'From Cuis 4.2 of 25 July 2013 [latest update: #2679] on 1 February 2016 at 9:44:30.824627 pm'!
'Description Please enter a description for this package'!
!provides: 'Calendar' 1 2!
!classDefinition: #CalendarModel category: #Calendar!
TextModel subclass: #CalendarModel
	instanceVariableNames: 'days'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendar'!
!classDefinition: 'CalendarModel class' category: #Calendar!
CalendarModel class
	instanceVariableNames: ''!

!classDefinition: #CalendarPage category: #Calendar!
Panel subclass: #CalendarPage
	instanceVariableNames: ''
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

!CalendarModel methodsFor: 'initialization' stamp: 'dhn 2/1/2016 17:31'!
initialize

	super initialize.
	days _ self formDays: Date today! !

!CalendarPage methodsFor: 'initialization' stamp: 'dhn 2/1/2016 21:43'!
buildMorphicWindow
	"Answer a window for the calendar"
	| row arr |

	self morphExtent: 230@230.
	(row _ LayoutMorph newRow)
		addMorph: (RectangleLikeMorph new	color: Color lightGray);
		name: #'day names'.
		
	(arr _ LayoutMorph newColumn)
		name: #array.

	self layoutMorph
		addMorph: row
			layoutSpec: (LayoutSpec proportionalHeight: 0.1);
		addMorph: arr
			layoutSpec: (LayoutSpec useAll);
		name: #calendar
! !
