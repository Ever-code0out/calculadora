import 'package:flutter/material.dart';
import 'calculadora.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Layout',
      theme: ThemeData(
        colorScheme: ColorScheme.light(onPrimary: const Color.fromARGB(255, 7, 226, 255)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Talento Tech'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Center(
          child: Text(widget.title),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: const Text('CAlCULADORA',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                        ),
              ),
            ),
            //
            Expanded(
              flex: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child:
                          const Text('', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  //
                  Expanded(
                    flex: 10,
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          // Suggested code may be subject to a license. Learn more: ~LicenseLog:248224329.
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(1),
                          border: Border.all(
                            color: const Color.fromARGB(255, 48, 48, 48),
                            width: 4,
                          ),
                        ),
                        child: const Calculadora(),
                        ),
                  ),
                  //
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            ),
            //Barra inferior TANK YOU
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,

                child: const Text('', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
