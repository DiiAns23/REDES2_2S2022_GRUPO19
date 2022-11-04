import mongoose from "mongoose";

const mongodbUri = process.env.MONGODB_URI || "mongodb://admin-redes2:admin-redes2@52.12.129.214:27017/proyecto-redes" ;

export const connect = () => {
    //const URI = `mongodb://${process.env.MONGO_USERNAME}:${process.env.MONGO_PASSWORD}@${process.env.MONGO_HOST}:27017/SApractica3?authSource=admin&readPreference=primary&appname=MongoDB%20Compass&ssl=false`;
    const URI = 'mongodb://admin-redes2:admin-redes2@52.12.129.214:27017/proyecto-redes?authSource=admin&readPreference=primary&appname=MongoDB%20Compass&ssl=false';
    
    mongoose.connect(URI, {});
    
    const connection = mongoose.connection;
    
    connection.once('open', () => {
        console.log('DB is connected');
    })
}

