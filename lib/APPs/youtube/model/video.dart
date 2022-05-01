

class Video {

  /* variáveis tipo String não aceitam métodos null
  dynamic id;
  dynamic titulo;
  dynamic descricao;
  dynamic imagem;
  dynamic canal;

  Video({this.id, this.titulo, this.descricao, this.imagem, this.canal});
  */

  String id;
  String titulo;
  String descricao;
  String imagem;
  String canal;

  Video(
      {required this.id, required this.titulo, required this.descricao, required this.imagem, required this.canal}
      );


  //esta forma cria várias instancias na memória (sobrecarregando-a)
  //melhor método na parte inferior
  /*
  static converterJson (Map<String, dynamic> json) {
  return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      descricao: json["snippet"]["description"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelId"],
  );
  }
  */

  //cria uma única instancia na memória
  factory Video.fromJson (Map<String, dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      descricao: json["snippet"]["description"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelId"],
    );
  }
}

