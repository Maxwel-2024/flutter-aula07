import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App de Filmes',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/detalhes': (context) => const DetalhePage(),
      },
    );
  }
}

// Tela Principal (HomePage)
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _abrirDetalhes(BuildContext context, String titulo) async {
    final resultado = await Navigator.pushNamed(
      context,
      '/detalhes',
      arguments: titulo,
    );

    if (resultado is String && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(resultado),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmes'),
        centerTitle: true,
      ),
      // Adição do Menu Lateral (Drawer)
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.movie_filter, size: 48, color: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    'CineApp',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Início'),
              onTap: () {
                // Fecha o Drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Sobre'),
              onTap: () {
                // Fecha o Drawer primeiro
                Navigator.pop(context);
                // Exibe uma caixa de diálogo informativa
                showAboutDialog(
                  context: context,
                  applicationName: 'App de Filmes',
                  applicationVersion: '1.0.0',
                  children: [
                    const Text('Aplicativo desenvolvido durante os estudos de navegação e rotas no Flutter.'),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('O Poderoso Chefão'),
            subtitle: const Text('Drama / Crime'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _abrirDetalhes(context, 'O Poderoso Chefão'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('Interstellar'),
            subtitle: const Text('Ficção Científica'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _abrirDetalhes(context, 'Interstellar'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('A Viagem de Chihiro'),
            subtitle: const Text('Animação / Aventura'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _abrirDetalhes(context, 'A Viagem de Chihiro'),
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
    final titulo = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text(titulo)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Você selecionou o filme: $titulo',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.check),
                label: const Text('Marcar como assistido'),
                onPressed: () {
                  Navigator.pop(context, '$titulo marcado como assistido!');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}