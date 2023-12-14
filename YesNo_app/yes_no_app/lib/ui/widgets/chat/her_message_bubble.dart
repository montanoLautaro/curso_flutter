import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    //! Obtengo todos los colores declarados en mi tema
    final colors = Theme.of(context).colorScheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        decoration: BoxDecoration(
            color: colors.secondary, borderRadius: BorderRadius.circular(20)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "Hola mundo flutter",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      _ImageBubble(),
      const SizedBox(
        height: 5,
      )
    ]);
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //! Obtenemos el tamaño de la pantalla (se pueden obtener otros valores)
    final size = MediaQuery.of(context).size;

    //!ClipRRect nos permite generar un borde redondeado
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        "https://yesno.wtf/assets/yes/1-af11222d8d4af90bdab8fc447c8cfebf.gif",
        width: size.width * 0.7,
        height: 150,
        //! fit adapta el tamaño de la imagen con respecto a su contenedor
        fit: BoxFit.cover,
      ),
    );
  }
}
