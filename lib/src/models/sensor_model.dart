class SensorModel {
  final String codigo;
  final String nombre;
  final bool estado;
  final String imagePath;
  final String descripcion;

  SensorModel(
      {required this.codigo,
      required this.nombre,
      required this.estado,
      required this.imagePath,
      required this.descripcion});
}
