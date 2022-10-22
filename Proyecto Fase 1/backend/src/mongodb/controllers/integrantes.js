import mongoose from "mongoose";

const integranteSchema = mongoose.Schema({
    numero: { type: Number, required: true },
    nombre: { type: String, required: true },
    carnet: { type: Number, required: true }
});

const integrantes = mongoose.model("integrantes", integranteSchema);

const getAll = (req, res) => {
    integrantes.find()
                .then((data) => res.status(200).json(data))
                .catch((error) => res.status(500).json({ message: error }));
}

export default getAll;