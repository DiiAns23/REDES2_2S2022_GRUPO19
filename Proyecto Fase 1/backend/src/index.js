import express from "express";
import cors from "cors"
import { connect } from "./mongodb/index.js"
import getAdmins from "./mongodb/controllers/administradores.js";
import getIntes from "./mongodb/controllers/integrantes.js"
import getEstads from "./mongodb/controllers/estadisticas.js"
import getFuncs from "./mongodb/controllers/funciones.js"

const app = express();
connect();

//settings
app.set("port", 3000);

//middlewares
app.use(cors());
app.use(express.json());

//routes
app.get("/", (req, res) => res.send("<h1>API corriendo el puerto: " + app.get('port') + "</h1>"));
app.get("/administradores", getAdmins);
app.get("/desarrolladores", getIntes);
app.get("/estadisticas", getEstads);
app.get("/funciones", getFuncs);

app.listen(app.get('port'), () => {
    console.log('Servidor en el puerto', app.get('port'));
});

export {app}