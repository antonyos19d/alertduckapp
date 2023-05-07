import 'package:alertduckapp/src/services/sensor_service.dart';
import 'package:alertduckapp/src/widgets/sensor_textfield_widget.dart';
import 'package:flutter/material.dart';

class RegisterSensorPage extends StatefulWidget {
  RegisterSensorPage({Key? key});

  @override
  State<RegisterSensorPage> createState() => _RegisterSensorPageState();
}

class _RegisterSensorPageState extends State<RegisterSensorPage> {
  final xCodigoSensor = TextEditingController();
  final xNombreSensor = TextEditingController();
  final xDescripcionSensor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final SensorService xSensorService = SensorService();

    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              'Registra tu Sensor!',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Text(
                    'Ingresa el codigo:',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SensorTextfieldWidget(
                xController: xCodigoSensor,
                xHintText: 'CB-0000',
                xObscureText: false),
            SensorTextfieldWidget(
                xController: xNombreSensor,
                xHintText: 'Titulo',
                xObscureText: false),
            SensorTextfieldWidget(
                xController: xDescripcionSensor,
                xHintText: 'Descripcion',
                xObscureText: false),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                      color: Colors.blueAccent,
                      child: Text('Agregar'),
                      onPressed: (() {
                        print('hizo clicnk');
                        xSensorService
                            .registerSensor(xCodigoSensor.text,
                                xNombreSensor.text, '', xDescripcionSensor.text)
                            .then((resp) {
                          if (resp != null) {
                            if (resp == 1) {
                              Navigator.pushNamed(context, 'contenedor');
                            } else if (resp == 0) {
                              print('no se pudo registrar');
                            }
                          } else {
                            return CircularProgressIndicator();
                          }
                        });
                      })),
                  SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                      color: Colors.amber,
                      child: Text('Cancelar'),
                      onPressed: (() {
                        Navigator.pop(context);
                      }))
                ],
              ),
            )
          ],
        )),
      ),
    ));
  }
}
