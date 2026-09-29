# flutter_aula07

# 🎬 App de Filmes - Estudo de Navegação e Rotas no Flutter

Este projeto é um aplicativo simples e prático desenvolvido para consolidar conceitos fundamentais de navegação, passagem de dados e construção de interfaces com o Flutter.

---

## 📌 Etapas do Aprendizado

### A) Interface Principal (`HomePage`)
- Construção de uma lista interativa utilizando o widget `ListView`.
- Exibição de filmes com `ListTile`, contendo ícones (`leading`), títulos (`title`), gêneros (`subtitle`) e indicadores de ação (`trailing`).

### B) Tela de Detalhes (`DetalhePage`)
- Criação de uma segunda tela para exibir informações do filme selecionado.
- Utilização de `Column`, `Padding` e alinhamentos centrais para organizar os elementos visuais.

### C) Navegação e Passagem de Parâmetros
- Envio do nome do filme selecionado como argumento ao navegar para a tela de detalhes.
- Recuperação dos dados enviados utilizando o contexto de rota (`ModalRoute.of(context)`).

### D) Retorno de Dados e Feedback com SnackBar
- Implementação da ação "Marcar como assistido" através do botão `ElevatedButton`.
- Retorno de dados para a tela anterior utilizando `Navigator.pop`.
- Exibição de uma `SnackBar` com mensagem de confirmação ao retornar à `HomePage`.

### E) Refatoração com Rotas Nomeadas
- Reorganização do fluxo de navegação declarando um mapa centralizado de rotas (`routes`) no `MaterialApp`.
- Navegação simplificada e desacoplada usando `Navigator.pushNamed`.
- Tratamento seguro de tipos e verificação do contexto ativo (`context.mounted`).

### F) Menu Lateral (`Drawer`)
- Adição de um menu de navegação lateral retrátil acionado automaticamente pelo ícone de hambúrguer na `AppBar`.
- Estruturação do menu utilizando `DrawerHeader` e opções com `ListTile` ("Início" e "Sobre").
- Manipulação do menu com `Navigator.pop` e exibição de informações do app via `showAboutDialog`.

---

## 🛠️ Tecnologias Utilizadas
- **Flutter / Dart**
- **Material Design** (`Scaffold`, `ListTile`, `Drawer`, `SnackBar`)
- **Navegação Declarativa** (`routes` e `Navigator`)