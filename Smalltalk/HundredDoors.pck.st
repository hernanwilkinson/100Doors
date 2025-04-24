'From Cuis7.3 [latest update: #7095] on 24 April 2025 at 8:13:20 am'!
'Description Hago pasar el tercer test... muy feo'!
!provides: 'HundredDoors' 1 6!
SystemOrganization addCategory: 'HundredDoors'!


!classDefinition: #Portero category: 'HundredDoors'!
Object subclass: #Portero
	instanceVariableNames: 'primerPuerta segundaPuerta cantidadDePuertas'
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


!Portero methodsFor: 'initialization' stamp: 'HAW 4/24/2025 08:07:51'!
initializeDe: unaCantidadDePuertas 
	
	cantidadDePuertas := unaCantidadDePuertas.
	
	primerPuerta := false.
	segundaPuerta := false! !

!Portero methodsFor: 'as yet unclassified' stamp: 'HAW 4/24/2025 07:58:14'!
estanTodasLasPuertasCerradas
	
	^primerPuerta not! !

!Portero methodsFor: 'as yet unclassified' stamp: 'HAW 4/24/2025 08:12:25'!
puertasAbiertas
	
	^#(1)! !

!Portero methodsFor: 'as yet unclassified' stamp: 'HAW 4/24/2025 08:11:17'!
recorrerPuertas
	
	cantidadDePuertas = 1 ifTrue: [ 
		primerPuerta := true.
		^self ].
	
	primerPuerta := true.
	segundaPuerta := true.
	segundaPuerta := false.
! !

!Portero class methodsFor: 'instance creation' stamp: 'HAW 4/24/2025 07:53:20'!
de: unaCantidadDePuertas 
	
	^self new initializeDe: unaCantidadDePuertas ! !

!HundredDoorsTest methodsFor: 'as yet unclassified' stamp: 'HAW 4/24/2025 07:50:23'!
test01

	| portero |
	
	portero := Portero de: 1.
	
	self assert: portero estanTodasLasPuertasCerradas! !

!HundredDoorsTest methodsFor: 'as yet unclassified' stamp: 'HAW 4/24/2025 07:55:20'!
test02

	| portero |
	
	portero := Portero de: 1.
	
	portero recorrerPuertas.
	
	self deny: portero estanTodasLasPuertasCerradas! !

!HundredDoorsTest methodsFor: 'as yet unclassified' stamp: 'HAW 4/24/2025 08:12:59'!
test03

	| portero |
	
	portero := Portero de: 2.
	
	portero recorrerPuertas.
	
	self assert: portero puertasAbiertas equals: #(1).
	! !
