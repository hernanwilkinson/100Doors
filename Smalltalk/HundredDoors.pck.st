'From Cuis7.3 [latest update: #7095] on 24 April 2025 at 7:59:12 am'!
'Description Segundo test. Recorro las puertas quera que estanTodasLasPuertasCerradas no tenga true hardcodeado'!
!provides: 'HundredDoors' 1 3!
SystemOrganization addCategory: 'HundredDoors'!


!classDefinition: #Portero category: 'HundredDoors'!
Object subclass: #Portero
	instanceVariableNames: 'cantidadDePuertas primerPuerta'
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


!Portero methodsFor: 'initialization' stamp: 'HAW 4/24/2025 07:57:44'!
initializeDe: unaCantidadDePuertas 
	
	cantidadDePuertas := unaCantidadDePuertas.
	
	primerPuerta := false! !

!Portero methodsFor: 'as yet unclassified' stamp: 'HAW 4/24/2025 07:58:14'!
estanTodasLasPuertasCerradas
	
	^primerPuerta not! !

!Portero methodsFor: 'as yet unclassified' stamp: 'HAW 4/24/2025 07:57:26'!
recorrerPuertas
	
	primerPuerta := true! !

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
