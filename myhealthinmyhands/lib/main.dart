import 'package:flutter/material.dart';
import 'presentation/samples/pie/pie_chart_sample2.dart'; // Importe o arquivo line_chart_sample1.dart
import 'register_exam.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text('Bem-vindo(a) ao My Health in My Hands'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity, // largura máxima
                  padding: EdgeInsets.all(20), // espaçamento interno
                  color: Color(0xFF0D3B66), // cor de fundo #0D3B66
                  child: Text(
                    'Acesse seu aplicativo',
                    style: TextStyle(
                      color: Colors.white, // cor do texto branco
                      fontSize: 24, // tamanho da fonte 24
                      fontWeight: FontWeight.bold, // fonte em negrito
                    ),
                    textAlign: TextAlign.center, // texto centralizado
                  ),
                ),
                // seção azul claro com formulário
                Container(
                  width: double.infinity, // largura máxima
                  padding: EdgeInsets.all(20), // espaçamento interno
                  color: Color(0xFF3C6E71), // cor de fundo #3C6E71
                  child: Column(
                    children: [
                      // campo para usuário
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Usuário', // rótulo do campo
                          labelStyle: TextStyle(
                            color: Colors.white, // cor do rótulo branco
                          ),
                          border: OutlineInputBorder(), // borda do campo
                        ),
                      ),
                      SizedBox(height: 10), // espaço entre os campos
                      // campo para senha
                      TextField(
                        obscureText: true, // esconde os caracteres da senha
                        decoration: InputDecoration(
                          labelText: 'Senha', // rótulo do campo
                          labelStyle: TextStyle(
                            color: Colors.white, // cor do rótulo branco
                          ),
                          border: OutlineInputBorder(), // borda do campo
                        ),
                      ),
                      SizedBox(height: 10), // espaço entre o campo e o botão
                      // botão de Login
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        },
                        child: Text('Login'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFDAE0E2), // cor de fundo #DAE0E2
                        ),
                      ),
                    ],
                  ),
                ),
                // link para recuperar a senha
                TextButton(
                  onPressed: () {
                    // ação do botão
                  },
                  child: Text(
                    'Problemas com login?\nclique aqui para recuperar sua senha.',
                    style: TextStyle(
                      color: Color(0xFF0D3B66), // cor do texto #0D3B66
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Health in My Hands"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Aqui está o conteúdo original do PieChartSample2()
              PieChartSample2(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterExam(),
                    ),
                  );
                },
                child: Text('Criar Cadastro'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
