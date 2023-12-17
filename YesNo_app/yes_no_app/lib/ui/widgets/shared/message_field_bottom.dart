import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  //! es un callback que trae dart, en este caso nos sirve para
  //! guardar un mensaje en el provider
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    //! variable para el manejar los valores del texto
    final textController = TextEditingController();

    //! variable para manejar el focus de forma manual
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: const BorderSide(color: Colors.transparent));

    final inputDecoration = InputDecoration(
        hintText: "Escribir un mensaje...",
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            //obtengo el valor del submit
            final textValue = textController.value.text;
            onValue(textValue);
            textController.clear();
            //
          },
        ));

    return TextFormField(
      onTapOutside: (event) {
        // quita el focus
        focusNode.unfocus();
      },
      decoration: inputDecoration,
      controller: textController,
      focusNode: focusNode,
      // Obtenemos el valor del texto al presionar enter
      onFieldSubmitted: (value) {
        onValue(value);
        textController.clear();
        // mantiene el focus en el input
        focusNode.requestFocus();
      },
    );
  }
}
