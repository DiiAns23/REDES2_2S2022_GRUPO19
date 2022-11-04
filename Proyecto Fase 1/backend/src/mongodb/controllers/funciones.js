import mongoose from "mongoose";

const funcionSchema = mongoose.Schema({
    nombre: { type: String, required: true },
    descripcion: { type: String, required: true },
    enlace: { type: String, required: true }
});

const funciones = mongoose.model("funcionpublica", funcionSchema);

const getAll = (req, res) => {
    console.log("entraaaaaaa");
    funciones.find()
                .then((data) => {
                    if (data.length === 0)
                        data = [
                            {nombre: "Marco juridico", descripcion: "Resultan ser los preceptos en los que se sustenta el grueso de la regulación en materia de Función Pública.", enlace: "https://redes2-proyectof1.s3.us-west-2.amazonaws.com/FuncionPublica.jpg"},
                            {nombre: "Estatuto Basico del Empleado Publico", descripcion: "El Estatuto Básico del Empleado Público tiene, en primer lugar, un carácter básico, en el que, de acuerdo con lo establecido en la Constitución Española, supone las bases del régimen estatutario de los funcionarios. Es por ello, que las Comunidades Autónomas, dentro de las competencias que tienen atribuidas.", enlace: "https://redes2-proyectof1.s3.us-west-2.amazonaws.com/EstatutoEmpleado.jpg"},
                            {nombre: "Clasificacion del personal ", descripcion: "Lo primero que debemos señalar es que la Función Pública española se caracteriza por emplear un modelo mixto en el que tiene a su servicio personal laboral como funcionarios, además de personal eventual. Para ello, fundamenta todo el sistema de la Función Pública en el concepto de empleado público que engloba la totalidad de categorías antes mencionadas.", enlace: "https://redes2-proyectof1.s3.us-west-2.amazonaws.com/ClasificacionPersonal.jpg"},
                            {nombre: "Sistema de seleccion", descripcion: "Es el ordinario, consistente en la oposición, que como todos sabemos, se trata de la realización de una o varias pruebas de capacidad y aptitud en la que se evalúan las competencias del candidato para acceder a la Función Pública, y de conformidad con la puntuación obtenida, se establece un orden de prelación.", enlace: "https://redes2-proyectof1.s3.us-west-2.amazonaws.com/SistemaSeleccion.jpg"}
                        ] 
                    res.status(200).json(data)
                })
                .catch((error) => res.status(500).json({ message: error }));
}

export default getAll;