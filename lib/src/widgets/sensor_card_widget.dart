import 'package:alertduckapp/src/models/sensor_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SensorCardWidget extends StatelessWidget {
  final SensorModel xSensorModel;

  const SensorCardWidget({super.key, required this.xSensorModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 25),
        width: 300,
        decoration: BoxDecoration(
            color: Colors.lime, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    xSensorModel.imagePath,
                    fit: BoxFit.contain,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(xSensorModel.nombre,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Estado: ' + xSensorModel.estado.toString(),
                        style: TextStyle(fontSize: 18)),
                    Icon(
                      Icons.change_circle_outlined,
                      size: 30,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              )
            ],
          ),
        ));
  }
}
