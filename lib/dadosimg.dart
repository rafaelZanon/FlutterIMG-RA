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

  @override
  String toString() {
    return this.resposta;
  }
}
