'From Cuis7.3 [latest update: #7095] on 24 April 2025 at 7:53:57 am'!
'Description Hago pasar el primer test'!
!provides: 'HundredDoors' 1 1!
SystemOrganization addCategory: 'HundredDoors'!


!classDefinition: #Portero category: 'HundredDoors'!
Object subclass: #Portero
	instanceVariableNames: 'cantidadDePuertas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HundredDoors'!
!classDefinition: 'Portero class' category: 'HundredDoors'!
Portero class
	instanceVariableNames: ''!

!classDefinition: #HundredDoorsTest category: 'HundredDoors'!
TestCase subclass: #HundredDoorsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HundredDoors'!
!classDefinition: 'HundredDoorsTest class' category: 'HundredDoors'!
HundredDoorsTest class
	instanceVariableNames: ''!


!Portero methodsFor: 'initialization' stamp: 'HAW 4/24/2025 07:53:27'!
initializeDe: unaCantidadDePuertas 
	
	cantidadDePuertas := unaCantidadDePuertas.! !

!Portero methodsFor: 'as yet unclassified' stamp: 'HAW 4/24/2025 07:53:36'!
estanTodasLasPuertasCerradas
	
	^true! !

!Portero class methodsFor: 'instance creation' stamp: 'HAW 4/24/2025 07:53:20'!
de: unaCantidadDePuertas 
	
	^self new initializeDe: unaCantidadDePuertas ! !

!HundredDoorsTest methodsFor: 'as yet unclassified' stamp: 'HAW 4/24/2025 07:50:23'!
test01

	| portero |
	
	portero := Portero de: 1.
	
	self assert: portero estanTodasLasPuertasCerradas! !
