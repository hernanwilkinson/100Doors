'From Cuis7.3 [latest update: #7095] on 24 April 2025 at 3:31:40 pm'!
'Description Refactorig: renmobrar tests, borrar otros, dejar de usar todasLasPuertasAbiertas'!
!provides: 'HundredDoors' 1 29!
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

!HundredDoorsTest methodsFor: 'tests' stamp: 'HAW 4/24/2025 15:13:52'!
test01TodasLasPuertasEmpiezanCerradas

	| portero |
	
	portero := Portero de: 1.
	
	self assert: portero puertasAbiertas isEmpty.
	self assert: portero puertasCerradas asArray equals: #(1)! !

!HundredDoorsTest methodsFor: 'tests' stamp: 'HAW 4/24/2025 15:23:29'!
test02SeEmpiezaElRecorridoDesdeLaPrimerPuerta

	| portero |
	
	portero := Portero de: 1.
	
	portero recorrerPuertas.
	
	self assert: portero puertasAbiertas asArray equals: #(1).
	self assert: portero puertasCerradas isEmpty! !

!HundredDoorsTest methodsFor: 'tests' stamp: 'HAW 4/24/2025 15:24:41'!
test03SeRecorrenLasPuertasAPatirDelNumeroDeRepeticion

	| portero |
	
	portero := Portero de: 2.
	
	portero recorrerPuertas.
	
	self assert: portero puertasAbiertas asArray equals: #(1).
	self assert: portero puertasCerradas asArray equals: #(2).
	! !

!HundredDoorsTest methodsFor: 'tests' stamp: 'HAW 4/24/2025 15:25:04'!
test04SeRecorrenLasPuertasSaltandoCadaElNumeroDeRecorrido

	| portero |
	
	portero := Portero de: 4.
	
	portero recorrerPuertas.
	
	self assert: portero puertasAbiertas asArray equals: #(1 4).
	self assert: portero puertasCerradas asArray equals: #(2 3).
	! !

!HundredDoorsTest methodsFor: 'tests' stamp: 'HAW 4/24/2025 15:30:42'!
test05FuncionaParaCienPuertas

	| portero cuadradosPerfectos puertasAbiertasEsperadas |
	
	portero := Portero de: 100.
	
	portero recorrerPuertas.
	
	cuadradosPerfectos := {1*1. 2*2. 3*3. 4*4. 5*5. 6*6. 7*7. 8*8. 9*9. 10*10}.
	puertasAbiertasEsperadas := (1 to: 100) asOrderedCollection removeAll: cuadradosPerfectos; asArray.
	self assert: portero puertasAbiertas asArray equals: cuadradosPerfectos.
	self assert: portero puertasCerradas asArray equals: puertasAbiertasEsperadas
	! !
