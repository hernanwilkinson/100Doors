'From Cuis7.3 [latest update: #7095] on 24 April 2025 at 3:50:24 pm'!
'Description Test: cantidad de puertas debe ser entero'!
!provides: 'HundredDoors' 1 32!
SystemOrganization addCategory: 'HundredDoors'!


!classDefinition: #Portero category: 'HundredDoors'!
Object subclass: #Portero
	instanceVariableNames: 'puertas'
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


!Portero methodsFor: 'estado de puertas' stamp: 'HAW 4/24/2025 15:44:24'!
estaAbierta: unNumeroDePuerta

	^ puertas at: unNumeroDePuerta! !

!Portero methodsFor: 'estado de puertas' stamp: 'HAW 4/24/2025 15:44:45'!
puertasAbiertas
	
	^self todasLaPuertas select: [ :numeroDePuerta | self estaAbierta: numeroDePuerta ]! !

!Portero methodsFor: 'estado de puertas' stamp: 'HAW 4/24/2025 15:44:55'!
puertasCerradas
	
	^self todasLaPuertas reject: [ :numeroDePuerta | self estaAbierta: numeroDePuerta ]! !

!Portero methodsFor: 'estado de puertas' stamp: 'HAW 4/24/2025 15:43:43'!
todasLaPuertas

	^ 1 to: self cantidadDePuertas! !

!Portero methodsFor: 'initialization' stamp: 'HAW 4/24/2025 15:38:03'!
initializeDe: unaCantidadDePuertas 
	
	puertas := (1 to: unaCantidadDePuertas) collect: [ :numeroDePuerta | false ].
	! !

!Portero methodsFor: 'recorrer puertas' stamp: 'HAW 4/24/2025 15:46:03'!
recorrerPuertas
	
	self todasLaPuertas do: [ :puertaInicialYPaso | 
		"paso puertaInicialYPaso en dos parámetros distintos para que quede claro
		la diferencia de por donde empezar y cada cuanto saltar, por más que los 
		números son iguale - Hernan"
		self cambiarPuertasDesde: puertaInicialYPaso cada: puertaInicialYPaso ].
	
	! !

!Portero methodsFor: 'recorrer puertas-private' stamp: 'HAW 4/24/2025 15:41:50'!
cambiarPuerta: unNumeroDePuerta

	"No uso estaAbierta: porque me parece más claro que está cambiando
	el estado de la puerta así - Hernan"
	^ puertas at: unNumeroDePuerta put: (puertas at: unNumeroDePuerta) not! !

!Portero methodsFor: 'recorrer puertas-private' stamp: 'HAW 4/24/2025 15:44:05'!
cambiarPuertasDesde: unNumeroDePuertaInicial cada: unPaso

	unNumeroDePuertaInicial 
		to: self cantidadDePuertas
		by: unPaso 
		do: [ :numeroDePuerta | self cambiarPuerta: numeroDePuerta ]! !

!Portero methodsFor: 'recorrer puertas-private' stamp: 'HAW 4/24/2025 15:42:31'!
cantidadDePuertas

	^ puertas size! !

!Portero class methodsFor: 'instance creation' stamp: 'HAW 4/24/2025 15:48:48'!
de: unaCantidadDePuertas 

	unaCantidadDePuertas strictlyPositive ifFalse: [ self error: self cantidadDePuertasDebeSerEstrictamentePositivo ].
	
	^self new initializeDe: unaCantidadDePuertas ! !

!Portero class methodsFor: 'mensajes de error' stamp: 'HAW 4/24/2025 15:48:22'!
cantidadDePuertasDebeSerEstrictamentePositivo
	
	^'La cantidad de puertas debe ser estrictamente positivo'! !

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

!HundredDoorsTest methodsFor: 'tests' stamp: 'HAW 4/24/2025 15:47:50'!
test06CantidadDePuertasDebeSerEstrictamentePositivo

	self 
		should: [ Portero de: 0 ]
		raise: Error
		withMessageText: Portero cantidadDePuertasDebeSerEstrictamentePositivo! !

!HundredDoorsTest methodsFor: 'tests' stamp: 'HAW 4/24/2025 15:50:04'!
test07CantidadDePuertasDebeSerEntero

	self 
		should: [ Portero de: 1.1 ]
		raise: Error
		withMessageText: Portero cantidadDePuertasDebeSerEntero! !
