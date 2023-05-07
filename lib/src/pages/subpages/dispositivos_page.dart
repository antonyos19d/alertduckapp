import 'package:alertduckapp/src/models/sensor_model.dart';
import 'package:alertduckapp/src/pages/register_sensor_page.dart';
import 'package:alertduckapp/src/services/sensor_service.dart';
import 'package:alertduckapp/src/widgets/sensor_card_widget.dart';
import 'package:flutter/material.dart';

class DispositivosPage extends StatefulWidget {
  @override
  State<DispositivosPage> createState() => _DispositivosPageState();
}

class _DispositivosPageState extends State<DispositivosPage> {
  RegistrarMensaje() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text('Dejanos tu mensaje:'),
          content: TextField(),
          actions: [
            MaterialButton(
              onPressed: () {},
              child: Text('Agregar'),
            ),
            MaterialButton(
              onPressed: () {},
              child: Text('Cancelar'),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final xSensorService = SensorService();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('AlertDuck'),
        actions: [
          IconButton(
            onPressed: () {
              xSensorService.getListaSensores().then((resp) {
                if (resp != null) {
                  print('RESPONDIÓ:' + resp.toString());
                  RegistrarMensaje();
                } else {
                  print('ESPERANDO RESPUESTA');
                }
              });
            },
            icon: Icon(Icons.help),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'registerSensor');
        },
        child: Icon(Icons.add),
      ),
      body: Column(children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sensor de Movimiento', style: TextStyle(fontSize: 20)),
              Icon(Icons.directions_run_rounded)
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: FutureBuilder(
            future: xSensorService.getListaSensores(),
            builder: (BuildContext context,
                AsyncSnapshot<List<SensorModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SensorCardWidget(
                        xSensorModel: snapshot.data![index]);
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
        SizedBox(
          height: 200,
        )
      ]),
    );
  }
}
