'From Cuis7.3 [latest update: #7095] on 24 April 2025 at 10:16:38 am'!
'Description Refactoring: Extract method al inner cicle de recorrer las puertas'!
!provides: 'HundredDoors' 1 27!
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

!Portero methodsFor: 'as yet unclassified' stamp: 'HAW 4/24/2025 08:41:12'!
cambiarPuerta: unNumeroDePuerta

	^ puertas at: unNumeroDePuerta put: (puertas at: unNumeroDePuerta) not! !

!Portero methodsFor: 'as yet unclassified' stamp: 'HAW 4/24/2025 10:15:46'!
cambiarPuertasDesde: unaPuertaInicial cada: unPaso

	unaPuertaInicial 
		to: cantidadDePuertas 
		by: unPaso 
		do: [ :numeroDePuerta | self cambiarPuerta: numeroDePuerta ]! !

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

!Portero methodsFor: 'as yet unclassified' stamp: 'HAW 4/24/2025 10:15:20'!
recorrerPuertas
	
	1 to: cantidadDePuertas do: [ :puertaInicialYPaso | 
		self cambiarPuertasDesde: puertaInicialYPaso cada: puertaInicialYPaso ].
	
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

!HundredDoorsTest methodsFor: 'as yet unclassified' stamp: 'HAW 4/24/2025 08:43:49'!
test06

	| portero |
	
	portero := Portero de: 6.
	
	portero recorrerPuertas.
	
	self assert: portero puertasAbiertas asArray equals: #(1 4).
	self assert: portero puertasCerradas asArray equals: #(2 3 5 6).
	! !
