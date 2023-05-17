const functions = require('firebase-functions');
const admin = require('firebase-admin');
/*
admin.initializeApp({apiKey: 'AIzaSyCv42_ADjGfAAKgful0NZDMUgjoeMWI8_c',
appId: '1:130462502963:android:c8fcbac5280099fd679346',
messagingSenderId: '130462502963',
projectId: 'iottecsup2021ao',
databaseURL: 'https://iottecsup2021ao-default-rtdb.firebaseio.com',
storageBucket: 'iottecsup2021ao.appspot.com'});
*/
admin.initializeApp(functions.config().firebase);

exports.lanzarNotificacion = functions.database.ref('pir/logs/{registroId}').onCreate((snapshot, context)=>{
    const mensajeID = context.params.registroId;
    console.log('Se ha creado un registro - ID:' + mensajeID );
    console.log('>>DigitalCode>>');
	
	
	//copiado desde aqui
	const payload = {
        notification:{
            title : 'SENSOR PIR',
            body : 'Movimiento dectectado.',
            badge : '1',
            sound : 'default'
        }
    };

    console.log(" Firebase Initialize ", admin.app().payload);


    return admin.database().ref('fcm-token').once('value').then(allToken => {
        if(allToken.val()){
            console.log('token VALIDO:');
            const token = Object.keys(allToken.val());
            return admin.messaging().sendToDevice(token,payload);
        }else{
            console.log('token INVALIDO');
        }
    });

	//fin de copiado
    
});
