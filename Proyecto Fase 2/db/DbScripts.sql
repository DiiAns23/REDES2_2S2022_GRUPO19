use proyecto-redes

db.createCollection("integrantes")
db.createCollection("administradores")
db.createCollection("estadisticas")
db.createCollection("fotografias")
db.createCollection("funcionpublica")

db.integrantes.drop()
db.administradores.drop()
db.estadisticas.drop()
db.fotografias.drop()
db.funcionpublica.drop()

db.integrantes.insertMany(
    [
	{numero: 1, nombre: "JOSUE DAVID ZEA HERRERA", carnet: 201807159},
	{numero: 2, nombre: "ALDO RIGOBERTO HERNANDEZ AVILA", carnet: 201800585},
	{numero: 3, nombre: "DIEGO ANDRÉS OBÍN ROSALES", carnet: 201903865},
	{numero: 5, nombre: "DEIVID ALEXANDER LUX REVOLORIO", carnet: 201549059}
    ]
)

db.administradores.insertMany(
    [
	{numero: 1, nombre: "Alan Brito", puesto: "CEO", salario: 2500, descripcion: "Hace referencia a la persona con la más alta responsabilidad dentro de una empresa. Su visión global acerca de la compañía le permite definir con gran exactitud y precisión la visión, el propósito y la misión de la organización, premisas fundamentales que orientan la actividad diaria de cada empresa.", imagen: "https://redes-pf2.s3.us-west-2.amazonaws.com/AlanBrito.jpg"},
	{numero: 2, nombre: "Esteban Dido", puesto: "Gerente Financiero", salario: 3400, descripcion: "Supervisa y se encarga del flujo de dinero y los activos que entran y salen de una empresa. En tal sentido, estos profesionales deben estar familiarizados con las leyes y normativas aplicables al ámbito de las finanzas. De igual modo, revisan y elaboran informes de las ganancias y sobre el desempeño de los empleados.", imagen: "https://redes-pf2.s3.us-west-2.amazonaws.com/EstebanDido.jpg"},
	{numero: 3, nombre: "Tomas Awita", puesto: "Gerente Comercial", salario: 2800, descripcion: "Está encargado de planificar y dirigir los planes de ventas de los productos o servicios de las empresas para alcanzar los objetivos marcados. Además es responsable de coordinar, liderar y supervisar el trabajo comercial del equipo de ventas. ", imagen: "https://redes-pf2.s3.us-west-2.amazonaws.com/TomasAwita.jpg"},
	{numero: 4, nombre: "Susana Oria", puesto: "Gerente de Servicios Administrativos", salario: 4000, descripcion: "Dirige o coordina los servicios de apoyo de una organización como son el mantenimiento de los registros, el reparto del correo, los teléfonos, la recepción y otros servicios de apoyo administrativo. Pueden supervisar la planificación y el mantenimiento de las instalaciones, así como los servicios de custodia.", imagen: "https://redes-pf2.s3.us-west-2.amazonaws.com/SusanaOria.jpg"},
	{numero: 5, nombre: "Aquiles Brinco", puesto: "Gerente de Recursos Humanos", salario: 3800, descripcion: "Es la persona a la que recurrir para todas las cuestiones relacionadas con empleados. Esto significa que sus funciones como gerente de RR. HH. serán gestionar actividades como diseño de puestos, reclutamiento, relaciones entre empleados, gestión del rendimiento, formación y desarrollo, y gestión del talento.", imagen: "https://redes-pf2.s3.us-west-2.amazonaws.com/AquilesBrinco.jpg"},
	{numero: 6, nombre: "Mario Neta", puesto: "Gerente Ventas", salario: 4200, descripcion: "Es la persona designada en una organización para coordinar un equipo con el propósito de alcanzar el objetivo deseado en el área comercial. Motiva y dirige a los demás integrantes para tomar las mejores decisiones y aumentar las ganancias de la empresa en la que se desenvuelven.", imagen: "https://redes-pf2.s3.us-west-2.amazonaws.com/MarioNeta.jpg"},
	{numero: 7, nombre: "Elsy Lantro", puesto: "Gerente Administrativo", salario: 4800, descripcion: "Planifica y coordina procedimientos y sistemas administrativos, así como idear modos de optimizar procesos, Contratar y formar personal, así como asignar responsabilidades y espacio en la oficina", imagen: "https://redes-pf2.s3.us-west-2.amazonaws.com/ElsyLantro.jpg"}
    ]
)

db.estadisticas.insertMany(
    [
    { fecha: 1960, pbi: 1043599900},
    { fecha: 1961, pbi: 1076699900},
    { fecha: 1962, pbi: 1143600000},
    { fecha: 1963, pbi: 1262800000},
    { fecha: 1964, pbi: 1299099900},
    { fecha: 1965, pbi: 1331399900},
    { fecha: 1966, pbi: 1390700000},
    { fecha: 1967, pbi: 1453500000},
    { fecha: 1968, pbi: 1610500000},
    { fecha: 1969, pbi: 1715399900},
    { fecha: 1970, pbi: 1904000000},
    { fecha: 1971, pbi: 1984800000},
    { fecha: 1972, pbi: 2101300000},
    { fecha: 1973, pbi: 2569200100},
    { fecha: 1974, pbi: 3161499900},
    { fecha: 1975, pbi: 3645900000},
    { fecha: 1976, pbi: 4365300200},
    { fecha: 1977, pbi: 5480500200},
    { fecha: 1978, pbi: 6070600200},
    { fecha: 1979, pbi: 6902600200},
    { fecha: 1980, pbi: 7878700000},
    { fecha: 1981, pbi: 8607500300},
    { fecha: 1982, pbi: 8716999700},
    { fecha: 1983, pbi: 9050000400},
    { fecha: 1984, pbi: 9470000100},
    { fecha: 1985, pbi: 9721652087},
    { fecha: 1986, pbi: 7231963516},
    { fecha: 1987, pbi: 7084399840},
    { fecha: 1988, pbi: 7841602824},
    { fecha: 1989, pbi: 8410724361},
    { fecha: 1990, pbi: 7650125217},
    { fecha: 1991, pbi: 9406097735},
    { fecha: 1992, pbi: 10440842165},
    { fecha: 1993, pbi: 11399942453},
    { fecha: 1994, pbi: 12983235568},
    { fecha: 1995, pbi: 14655404433},
    { fecha: 1996, pbi: 15674835615},
    { fecha: 1997, pbi: 17790026221},
    { fecha: 1998, pbi: 19395491992},
    { fecha: 1999, pbi: 18318412251},
    { fecha: 2000, pbi: 19288827159},
    { fecha: 2001, pbi: 18405203853},
    { fecha: 2002, pbi: 20444205991},
    { fecha: 2003, pbi: 21576351799},
    { fecha: 2004, pbi: 23577286227},
    { fecha: 2005, pbi: 26783543667},
    { fecha: 2006, pbi: 29744368111},
    { fecha: 2007, pbi: 33567868322},
    { fecha: 2008, pbi: 38503862830},
    { fecha: 2009, pbi: 37125943564},
    { fecha: 2010, pbi: 40676432028},
    { fecha: 2011, pbi: 46876114650},
    { fecha: 2012, pbi: 49593961141},
    { fecha: 2013, pbi: 52996540703},
    { fecha: 2014, pbi: 57852399963},
    { fecha: 2015, pbi: 62186186575},
    { fecha: 2016, pbi: 66053725049},
    { fecha: 2017, pbi: 71654134378},
    { fecha: 2018, pbi: 73208583758},
    { fecha: 2019, pbi: 77020015201},
    { fecha: 2020, pbi: 77604632620},
    { fecha: 2021, pbi: 85986321551}
    ]
)

db.fotografias.insertMany(
    [
    {titulo: "Desarrollo Economico", enlace: "https://redes-pf2.s3.us-west-2.amazonaws.com/DesarrolloEconomico.jpg"},
    {titulo: "Fondo homepage", enlace: "https://redes-pf2.s3.us-west-2.amazonaws.com/Background.jpg"}
    ]
)

db.funcionpublica.insertMany(
    [
    {nombre: "Marco juridico", descripcion: "Resultan ser los preceptos en los que se sustenta el grueso de la regulación en materia de Función Pública.", enlace: "https://redes-pf2.s3.us-west-2.amazonaws.com/FuncionPublica.jpg"},
    {nombre: "Estatuto Basico del Empleado Publico", descripcion: "El Estatuto Básico del Empleado Público tiene, en primer lugar, un carácter básico, en el que, de acuerdo con lo establecido en la Constitución Española, supone las bases del régimen estatutario de los funcionarios. Es por ello, que las Comunidades Autónomas, dentro de las competencias que tienen atribuidas.", enlace: "https://redes-pf2.s3.us-west-2.amazonaws.com/EstatutoEmpleado.jpg"},
    {nombre: "Clasificacion del personal ", descripcion: "Lo primero que debemos señalar es que la Función Pública española se caracteriza por emplear un modelo mixto en el que tiene a su servicio personal laboral como funcionarios, además de personal eventual. Para ello, fundamenta todo el sistema de la Función Pública en el concepto de empleado público que engloba la totalidad de categorías antes mencionadas.", enlace: "https://redes-pf2.s3.us-west-2.amazonaws.com/ClasificacionPersonal.jpg"},
    {nombre: "Sistema de seleccion", descripcion: "Es el ordinario, consistente en la oposición, que como todos sabemos, se trata de la realización de una o varias pruebas de capacidad y aptitud en la que se evalúan las competencias del candidato para acceder a la Función Pública, y de conformidad con la puntuación obtenida, se establece un orden de prelación.", enlace: "https://redes-pf2.s3.us-west-2.amazonaws.com/SistemaSeleccion.jpg"},
    ]
)