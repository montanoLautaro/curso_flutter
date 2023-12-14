import 'package:flutter/material.dart';
import 'package:yes_no_app/ui/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/ui/widgets/chat/my_message_bubble.dart';

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
        centerTitle: true,
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    //! SafeArea limita al widget hijo en las zonas de los botones en la pantalla (bottom)
    return SafeArea(
      //! Padding() para aplicarle padding al widget
      //! const EdgeInsets.symmetric(horizontal, vertical) le da un padding simetrico tanto horizontal como vertical
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          //!Expanded: expande al widget hijo dentro del espacio disponible
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return (index % 2 == 0)
                    ? const HerMessageBubble()
                    : const MyMessageBubble();
              },
            ))
          ],
        ),
      ),
    );
  }
}
