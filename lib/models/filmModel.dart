class FilmModel {
  int? id;
  String? filmAdi;
  String? resimYolu;
  String? yapimYili;
  String? filmSuresi;

  FilmModel({required this.filmAdi,required this.resimYolu,required this.yapimYili,required this.filmSuresi});
  FilmModel.withId({this.id,this.filmAdi, this.resimYolu, this.yapimYili, this.filmSuresi});



  FilmModel.fromJson(Map<String, dynamic> json) {
    filmAdi = json['filmAdi'];
    resimYolu = json['resimYolu'];
    yapimYili = json['yapimYili'];
    filmSuresi = json['filmSuresi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filmAdi'] = filmAdi;
    data['resimYolu'] = resimYolu;
    data['yapimYili'] = yapimYili;
    data['filmSuresi'] = filmSuresi;
    return data;
  }
}