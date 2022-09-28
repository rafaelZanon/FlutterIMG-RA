import 'package:flutter/material.dart';
import 'dados.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dadosimg.dart';

const String URL = "https://www.slmm.com.br/CTC/ctcApi.php";
// Montando os DBO(que no caso aqui são ABO) com os dados da API
Future<List<Dados>> fetchData() async {
  var response =
      await http.get(Uri.parse(URL), headers: {"Accept": "application/json"});
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => new Dados.fromJson(data)).toList();
  } else {
    throw Exception('Erro inesperado...');
  }
}

var resposta;
const String URLDog = "https://api.thecatapi.com/v1/images/search";
fetchImage() async {
  var response = await http
      .get(Uri.parse(URLDog), headers: {"Accept": "application/json"});
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    List a = jsonResponse.map((data) => new DadosImg.fromJson(data)).toList();

    a.forEach((element) {
      resposta = element.toString();
    });
  } else {
    throw Exception('Erro inesperado...');
  }
}

class getRa extends StatefulWidget {
  const getRa({Key? key}) : super(key: key);

  @override
  _getRaState createState() => _getRaState();
}

class _getRaState extends State<getRa> {
  late Future<List<Dados>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    fetchImage();
    return Scaffold(
      appBar: AppBar(title: Text("lista RA")),
      body: Container(
        padding: EdgeInsets.all(10),
        child: FutureBuilder<List<Dados>>(
          future: futureData,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              List<Dados> data = snapshot.data!;
              return ListView.builder(
                  itemCount: data.length,
                  // biuld por elementos que aqui no caso vem da API
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        color: Color.fromARGB(255, 53, 134, 55),
                        child: Container(
                            child: Column(
                          children: <Widget>[
                            //Imagem que busco na api
                            Image.network(resposta),

                            Text(
                              "RA: ${data[index].ra}",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ],
                        )));
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          }),
        ),
      ),
    );
  }
}
