// criaremos uma classe para manipular os dados json

import 'dart:convert';

class DadosImg {
  String id;
  String url;
  int width;
  int height;
  String resposta;

  DadosImg(this.id, this.url, this.width, this.height, this.resposta);

  // metodos para json
  // toJson e fromJson
  //pegando os parametros da API, e tentando remover os "[ ]" do link da API, pois o programa não estava conseguindo as imagens

  Map toJson() => {'id': id, 'url': url, 'width': width, 'height': height};

  factory DadosImg.fromJson(dynamic json) {
    var resp = json['url'].toString();
    return DadosImg(
        json['id'], json['url'], json['width'], json['height'], resp);
  }
  var url2;
  String setUrl(String x) {
    if (x == null) return '';
    return x;
  }

//tentando fazer o toString tirar os "[ ]" do link da API, pois por algum motivo ele é recebido dessa maneira [link]
  @override
  String toString() {
    return this.resposta;
  }
}
