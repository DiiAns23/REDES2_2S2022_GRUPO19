import mongoose from "mongoose";

const administradorSchema = mongoose.Schema({
    numero: { type: Number, required: true },
    nombre: { type: String, required: true },
    puesto: { type: String, required: true },
    salario: { type: Number, required: true },
    descripcion: { type: String, required: true },
    imagen: { type: String, required: true }
});

const administradores = mongoose.model("administradores", administradorSchema);

const getAll =  (req, res) => {
    administradores.find()
                        .then((data) => res.status(200).json(data))
                        .catch((error) => res.status(500).json({ message: error }));
}

export default getAll;