import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Cargando peliculas',
      'Ya merito...',
      'Casi listo...',
      'Casi casi...',
      'Falta muy poco...',
      'Un poquitico más ⌛️',
      'Se está demorando mucho la verdad 🙄',
      'Una eternidad más tarde (inserte voz de bob esponja) 🤣',
    ];
    return Stream.periodic(const Duration(seconds: 5), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            strokeWidth: 2,
          ),
          const SizedBox(height: 20),
          const Text('Cargando, espere por favor...'),
          const SizedBox(height: 20),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox();
              }
              return Text(
                snapshot.data!,
                style: const TextStyle(fontSize: 12),
              );
            },
          )
        ],
      ),
    );
  }
}
