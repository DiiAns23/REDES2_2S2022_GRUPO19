import mongoose from "mongoose";

const estadisticaSchema = mongoose.Schema({
    fecha: { type: Number, required: true },
    pbi: { type: Number, required: true }
});

const estadisticas = mongoose.model("estadisticas", estadisticaSchema);

const getAll = (req, res) => {
    estadisticas.find()
                    .then((data) => res.status(200).json(data))
                    .catch((error) => res.status(500).json({ message: error }));
}

export default getAll;