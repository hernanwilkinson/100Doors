'From Cuis7.3 [latest update: #7095] on 24 April 2025 at 8:39:58 am'!
'Description Paso el quinto test'!
!provides: 'HundredDoors' 1 12!
SystemOrganization addCategory: 'HundredDoors'!


!classDefinition: #Portero category: 'HundredDoors'!
Object subclass: #Portero
	instanceVariableNames: 'cantidadDePuertas puertas'
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


!Portero methodsFor: 'initialization' stamp: 'HAW 4/24/2025 08:30:25'!
initializeDe: unaCantidadDePuertas 
	
	cantidadDePuertas := unaCantidadDePuertas.
	puertas := (1 to: cantidadDePuertas) collect: [ :numeroDePuerta | false ].
	! !

!Portero methodsFor: 'as yet unclassified' stamp: 'HAW 4/24/2025 08:29:56'!
estanTodasLasPuertasCerradas
	
	^puertas noneSatisfy: [ :puerta | puerta ]! !

!Portero methodsFor: 'as yet unclassified' stamp: 'HAW 4/24/2025 08:26:30'!
puertasAbiertas
	
	| puertasAbiertas |
	
	puertasAbiertas := OrderedCollection new.
	
	puertas withIndexDo: [ :puerta :indice | puerta ifTrue: [ puertasAbiertas add: indice ]].
		
	^puertasAbiertas
	! !

!Portero methodsFor: 'as yet unclassified' stamp: 'HAW 4/24/2025 08:39:34'!
puertasCerradas
	
	| puertasCerradas |
	
	puertasCerradas := OrderedCollection new.
	
	puertas withIndexDo: [ :puerta :indice | puerta ifFalse: [ puertasCerradas add: indice ]].
		
	^puertasCerradas
	! !

!Portero methodsFor: 'as yet unclassified' stamp: 'HAW 4/24/2025 08:38:58'!
recorrerPuertas
	
	cantidadDePuertas = 1 ifTrue: [ 
		puertas at: 1 put: (puertas at: 1) not.
		^self ].
	
	cantidadDePuertas = 2 ifTrue: [
		puertas at: 1 put: (puertas at: 1) not.
		puertas at: 2 put: (puertas at: 2) not.
		
		puertas at: 2 put: (puertas at: 2) not. 
		^self ].
	
	cantidadDePuertas = 4 ifTrue: [
		puertas at: 1 put: (puertas at: 1) not.
		puertas at: 2 put: (puertas at: 2) not.
		puertas at: 3 put: (puertas at: 3) not.
		puertas at: 4 put: (puertas at: 4) not.
		
		puertas at: 2 put: (puertas at: 2) not.
		puertas at: 4 put: (puertas at: 4) not.
		
		puertas at: 3 put: (puertas at: 3) not.
		
		puertas at: 4 put: (puertas at: 4) not.
		^self ].
	
	cantidadDePuertas = 5 ifTrue: [
		puertas at: 1 put: (puertas at: 1) not.
		puertas at: 2 put: (puertas at: 2) not.
		puertas at: 3 put: (puertas at: 3) not.
		puertas at: 4 put: (puertas at: 4) not.
		puertas at: 5 put: (puertas at: 5) not.
		
		puertas at: 2 put: (puertas at: 2) not.
		puertas at: 4 put: (puertas at: 4) not.
		
		puertas at: 3 put: (puertas at: 3) not.
		
		puertas at: 4 put: (puertas at: 4) not.
		
		puertas at: 5 put: (puertas at: 5) not.
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

!HundredDoorsTest methodsFor: 'as yet unclassified' stamp: 'HAW 4/24/2025 08:30:11'!
test03

	| portero |
	
	portero := Portero de: 2.
	
	portero recorrerPuertas.
	
	self assert: portero puertasAbiertas asArray equals: #(1).
	! !

!HundredDoorsTest methodsFor: 'as yet unclassified' stamp: 'HAW 4/24/2025 08:22:20'!
test04

	| portero |
	
	portero := Portero de: 4.
	
	portero recorrerPuertas.
	
	self assert: portero puertasAbiertas asArray equals: #(1 4).
	! !

!HundredDoorsTest methodsFor: 'as yet unclassified' stamp: 'HAW 4/24/2025 08:36:49'!
test05

	| portero |
	
	portero := Portero de: 5.
	
	portero recorrerPuertas.
	
	self assert: portero puertasAbiertas asArray equals: #(1 4).
	self assert: portero puertasCerradas asArray equals: #(2 3 5).
	! !
