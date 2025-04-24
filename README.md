# Kata de las 100 Puertas (100 Doors)
Este kata explora un problema intrigante que involucra 100 puertas en fila, todas inicialmente cerradas. El desafío consiste en realizar múltiples pasadas por estas puertas, cambiando su estado de una manera específica.

# Descripción del Problema
Imagina un largo pasillo con 100 puertas, todas cerradas. Realizas 100 pasadas por estas puertas, alterando su estado cada vez que pasas:
- Primera Pasada: Visitas cada puerta y la abres.
- Segunda Pasada: Empezas por la segunda puerta y visitas una puerta cada dos, o sea las puertas #2, #4, #6, etc. y las cerrás.
- Tercera Pasada: Empezas por la tercer puerta y una cada tres puertas, o sea las puertas #3, #6, #9, etc. y cambias su estado: si está cerrada, la abrís; si está abierta, la cerrás.
- Pasadas Posteriores: Continúas este patrón hasta la centésima pasada, donde solo visitas la puerta #100.

Tu tarea es determinar el estado de cada puerta después de las 100 pasadas.
