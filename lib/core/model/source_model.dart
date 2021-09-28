
class Source{
  String ?id;
  String ?name;

  Source({this.id,this.name});

  // json veriyi map e dönüştürmek için factory fonksiyon 

  factory Source.fromJson(Map<String,dynamic> json){
    return Source(
      id: json["id"],
      name: json["name"],
    );
  }
}