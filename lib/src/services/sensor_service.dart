import 'package:alertduckapp/src/models/sensor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SensorService {
  final xUser = FirebaseAuth.instance.currentUser;

  Future<List<SensorModel>> getListaSensores() async {
    List<SensorModel> xListaSensor = [];

    if (xUser != null) {
      final xUid = xUser!.email;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(xUid)
          .collection('sensors')
          .get()
          .then(
            (snapshot) => snapshot.docs.forEach((element) {
              Map<String, dynamic> xData =
                  element.data() as Map<String, dynamic>;

              xListaSensor.add(SensorModel(
                  codigo: xData['cod_sensor'] ?? 'NA',
                  nombre: xData['nombre'] ?? 'NA',
                  estado: xData['estado'] ?? false,
                  imagePath: 'lib/images/digitalCode_.jpg',
                  descripcion: 'sin descripcion'));

              //print(element.data());
            }),
          );
    } else {
      print('[getListaSensores]: Usuario no Logeado!!!');
    }

    return xListaSensor;
  }

  Future<int> registerSensor(String codigo, String nombre, String imagePath,
      String descripcion) async {
    if (xUser != null) {
      final xUid = xUser!.email;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(xUid)
          .collection('sensors')
          .doc()
          .set({
        'codigo': codigo,
        'nombre': nombre,
        'estado': false,
        'descripcion': descripcion
      });
      
      return 1;
    } else {
      print('[registerSensor]: Usuario no Logueado!!!');
      return 0;
    }
  }
}
