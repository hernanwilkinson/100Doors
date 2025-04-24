'From Cuis7.3 [latest update: #7095] on 24 April 2025 at 8:22:55 am'!
'Description Paso el 4to test. Todo muy trucho, no me gusta ni para generalizar'!
!provides: 'HundredDoors' 1 8!
SystemOrganization addCategory: 'HundredDoors'!


!classDefinition: #Portero category: 'HundredDoors'!
Object subclass: #Portero
	instanceVariableNames: 'primerPuerta segundaPuerta cantidadDePuertas tercerPuerta cuartaPuerta'
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


!Portero methodsFor: 'initialization' stamp: 'HAW 4/24/2025 08:16:49'!
initializeDe: unaCantidadDePuertas 
	
	cantidadDePuertas := unaCantidadDePuertas.
	
	primerPuerta := false.
	segundaPuerta := false.
	tercerPuerta := false.
	cuartaPuerta := false! !

!Portero methodsFor: 'as yet unclassified' stamp: 'HAW 4/24/2025 07:58:14'!
estanTodasLasPuertasCerradas
	
	^primerPuerta not! !

!Portero methodsFor: 'as yet unclassified' stamp: 'HAW 4/24/2025 08:22:00'!
puertasAbiertas
	
	| puertasAbiertas |
	puertasAbiertas := OrderedCollection new.
	primerPuerta ifTrue: [ puertasAbiertas add: 1 ].
	segundaPuerta ifTrue: [ puertasAbiertas add: 2 ].
	tercerPuerta ifTrue: [ puertasAbiertas add: 3 ].
	cuartaPuerta ifTrue: [ puertasAbiertas add: 4 ].
	
	^puertasAbiertas
	! !

!Portero methodsFor: 'as yet unclassified' stamp: 'HAW 4/24/2025 08:19:37'!
recorrerPuertas
	
	cantidadDePuertas = 1 ifTrue: [ 
		primerPuerta := true.
		^self ].
	
	cantidadDePuertas = 2 ifTrue: [
		primerPuerta := true.
		segundaPuerta := true.
		
		segundaPuerta := false. 
		^self ].
	
	cantidadDePuertas = 4 ifTrue: [
		primerPuerta := true.
		segundaPuerta := true.
		tercerPuerta := true.
		cuartaPuerta := true.
		
		segundaPuerta := false. 
		cuartaPuerta := false.
		
		tercerPuerta := false.
		
		cuartaPuerta := true.
		^self ].
	
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

!HundredDoorsTest methodsFor: 'as yet unclassified' stamp: 'HAW 4/24/2025 08:22:20'!
test04

	| portero |
	
	portero := Portero de: 4.
	
	portero recorrerPuertas.
	
	self assert: portero puertasAbiertas asArray equals: #(1 4).
	! !
