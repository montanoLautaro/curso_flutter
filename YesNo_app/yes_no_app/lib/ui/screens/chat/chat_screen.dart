import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/ui/providers/chat_provider.dart';
import 'package:yes_no_app/ui/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/ui/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/ui/widgets/shared/message_field_bottom.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //! CircleAvatar == avatar de perfil
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR8myPRFlPqsGFQ-osxLWbaTYALRql4lDOdA&usqp=CAU"),
          ),
        ),
        title: const Text("Hades II"),
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    //* obtenemos la referencia al ChatProvider y vigila si cambia su estado
    final chatProvider = context.watch<ChatProvider>();

    //* SafeArea limita al widget hijo en las zonas de los botones en la pantalla (bottom)
    return SafeArea(
      //*Padding() para aplicarle padding al widget
      //* const EdgeInsets.symmetric(horizontal, vertical) le da un padding simetrico tanto horizontal como vertical
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          //*Expanded: expande al widget hijo dentro del espacio disponible
          children: [
            Expanded(
                child: ListView.builder(
              //* Scroll automatico de la pantalla hacia abajo
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                //obtengo el mensaje
                final message = chatProvider.messageList[index];

                return (message.fromWho == FromWho.theirs)
                    ? HerMessageBubble(
                        message: message.text,
                        imageUrl: message.imageUrl,
                      )
                    : MyMessageBubble(message: message.text);
              },
            )),
            MessageFieldBox(
              //* utilizo el callback para enviarle el texto al provider
              onValue: (value) => chatProvider.sendMessage(value),
            )
          ],
        ),
      ),
    );
  }
}
