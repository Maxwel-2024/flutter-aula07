import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App de Filmes',
      home: HomePage(),
    );
  }
}

// Tela Principal (HomePage)
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filmes'), centerTitle: true),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('O Poderoso Chefão'),
            subtitle: const Text('Drama / Crime'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DetalhePage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('Interstellar'),
            subtitle: const Text('Ficção Científica'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DetalhePage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('A Viagem de Chihiro'),
            subtitle: const Text('Animação / Aventura'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DetalhePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Tela de Detalhes (DetalhePage)
class DetalhePage extends StatelessWidget {
  const DetalhePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do Filme')),
      body: const Center(
        child: Text(
          'Informações detalhadas sobre o filme selecionado.',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
