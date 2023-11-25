// register_exam.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dropdown_search/dropdown_search.dart';

class RegisterExam extends StatefulWidget {
  @override
  _RegisterExamState createState() => _RegisterExamState();
}

class _RegisterExamState extends State<RegisterExam> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController sobrenomeController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  String tipoSangue = "";

  void _cadastrar() async {
    // Validar campos
    if (nomeController.text.isEmpty ||
        sobrenomeController.text.isEmpty ||
        dataNascimentoController.text.isEmpty ||
        tipoSangue.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro de Validação'),
          content: Text('Por favor, preencha todos os campos corretamente.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    Map data = {
      "nome": nomeController.text,
      "sobrenome": sobrenomeController.text,
      "data_nascimento": dataNascimentoController.text,
      "tipo_sangue": tipoSangue,
    };
    Uri url = Uri.parse("http://10.0.2.2:8000/process_data");
    // Enviar os dados utilizando o método POST
    try {
      final response = await http.post(
        url,
        body: jsonEncode(data),
        headers: {
          "Content-Type": "application/json",
        },
      );
      print(response);

      if (response.statusCode == 200) {
        print("Cadastro realizado com sucesso! response = ${response.body}");
        _showNotification("Dados cadastrados com sucesso!", Colors.green);

        //Abrir a tela home novamente.

      } else {
        print("Erro ao cadastrar. Status code: ${response.statusCode}");
        Map<String, dynamic> jsonResponse = json.decode(response.body);

        // Verifica se a resposta da API possui a chave 'detail'
        if (jsonResponse.containsKey('detail')) {
          String detailMessage = jsonResponse['detail'];
          _showNotification(
              "Erro ao cadastrar. Detalhe: $detailMessage", Colors.red);
        } else {
          _showNotification(
              "Erro ao cadastrar. Status code: ${response.statusCode}",
              Colors.red);
        }
      }
    } catch (e) {
      print("Erro de conexão: $e");
      _showNotification("Erro de conexão: $e", Colors.red);
    }
  }

  void _showNotification(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  // Aplica a máscara "DD/MM/YYYY" ao campo de data de nascimento
  void _applyDateMask(String text) {
    String cleanedText =
        text.replaceAll(RegExp(r'\D'), ''); // Remove não dígitos
    if (cleanedText.length > 8) {
      cleanedText = cleanedText.substring(0, 8); // Limita a 8 caracteres
    }
    if (cleanedText.length >= 2 && cleanedText.length <= 4) {
      cleanedText =
          cleanedText.substring(0, 2) + '/' + cleanedText.substring(2);
    } else if (cleanedText.length > 4) {
      cleanedText = cleanedText.substring(0, 2) +
          '/' +
          cleanedText.substring(2, 4) +
          '/' +
          cleanedText.substring(4);
    }
    dataNascimentoController.text = cleanedText;
    dataNascimentoController.selection = TextSelection.fromPosition(
      TextPosition(offset: dataNascimentoController.text.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Exame"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: sobrenomeController,
              decoration: InputDecoration(labelText: 'Sobrenome'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: dataNascimentoController,
              onChanged: _applyDateMask,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Data de Nascimento'),
            ),
            SizedBox(height: 10),
            DropdownSearch<String>(
              items: ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"],
              popupProps:
                  PopupPropsMultiSelection.menu(showSelectedItems: true),
              onChanged: (value) {
                setState(() {
                  tipoSangue = value!;
                });
              },
              selectedItem: tipoSangue,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _cadastrar,
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
