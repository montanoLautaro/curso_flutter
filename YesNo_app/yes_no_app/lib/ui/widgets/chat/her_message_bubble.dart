import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  final String message;
  final String? imageUrl;

  const HerMessageBubble(
      {super.key, required this.message, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    //! Obtengo todos los colores declarados en mi tema
    final colors = Theme.of(context).colorScheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        decoration: BoxDecoration(
            color: colors.secondary, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      _ImageBubble(
        imageUrl: imageUrl!,
      ),
      const SizedBox(
        height: 5,
      )
    ]);
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    //! Obtenemos el tamaño de la pantalla (se pueden obtener otros valores)
    final size = MediaQuery.of(context).size;

    //!ClipRRect nos permite generar un borde redondeado
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        //! fit adapta el tamaño de la imagen con respecto a su contenedor
        fit: BoxFit.cover,
        //! muestra un widget mientras se carga la imagen
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            //!si la imagen ya se cargo, la muestro
            return child;
          }
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text("Esta enviando una imagen..."),
          );
        },
      ),
    );
  }
}
