import "package:flutter/material.dart";

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int clickCounter = 0;
  String clickMsg = "Click";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Screen"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                clickCounter = 0;
                setState(() {});
              },
              icon: const Icon(Icons.refresh_rounded)),
          IconButton(
              onPressed: () {
                clickCounter = 0;
                setState(() {});
              },
              icon: const Icon(Icons.wrong_location_sharp))
        ],
      ),
      body: Center(
          child: Column(
        //!posicionamiento del widget con respecto al eje principal
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$clickCounter",
            style: const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
          ),
          Text(
            "$clickMsg${clickCounter == 1 || clickCounter == -1 ? "" : "s"}",
            style: const TextStyle(fontSize: 25),
          )
        ],
      )),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        CustomActionButton(
          icon: Icons.plus_one,
          onPressed: () {
            //! setState() cuando un cambio requiere actualizar al widget
            setState(() {
              clickCounter++;
            });
          },
        ),
        //!widget separador
        const SizedBox(
          height: 10,
        ),
        CustomActionButton(
            icon: Icons.exposure_minus_1,
            onPressed: () {
              setState(() {
                if (clickCounter == 0) return;
                clickCounter--;
              });
            }),
        const SizedBox(
          height: 10,
        ),
        CustomActionButton(
            icon: Icons.refresh_outlined,
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            })
      ]),
    );
  }
}

class CustomActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const CustomActionButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      //! icono  circular
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
