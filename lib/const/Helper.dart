
import 'package:web_scraping_flutter/models/filmModel.dart';
import 'const.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class Helper {
  Future getData() async {
    var response = await http.get(Uri.parse(url));
    var body = response.body;
    var document = parser.parse(body);
    var res = document
        .getElementsByClassName(
            "ipc-metadata-list ipc-metadata-list--dividers-between sc-71ed9118-0 kxsUNk compact-list-view ipc-metadata-list--base")
        // .toString();
        // print(res);
        //çıktı>>[<html ul>]

        // [0].className.toString();
        //print(res);
        //çıktı>>ipc-metadata-list ipc-metadata-list--dividers-between sc-71ed9118-0 kxsUNk compact-list-view ipc-metadata-list--base

        // [0].text.toString();
        // print(res);
        //çıktı>>
        /*
        1. The Shawshank Redemption19942h 22m13+9.3 (2.9M)Rate
        2. The Godfather19722h 55m18+9.2(2M)Rate3. The Dark Knight20082h 32m16+9.
        0(2.8M)Rate4. The Godfather Part II19743h 22m18+9.0(1.4M)Rate5. 12 Angry Men19571h 36m15+9.0(857K)Rate6. Schindler's
         List19933h 15m18+9.0(1.4M)Rate7. The Lord of the Rings: The Return of the King20033h 21m16+9.0(2M)
         Rate8. Pulp Fiction19942h 34m18+8.9(2.2M)Rate9. The Lord of the Rings: The Fellowship of the Ring20012h 58m13+8.9(2M)
         Rate10. Dune: Part Two20242h 46mPG-139.0(142K)Rate11. Il buono, il brutto, il cattivo19662h 41m15+8.8(806K)Rate12. Forrest
          Gump19942h 22m7+8.8(2.2M)Rate13. The Lord of the Rings: The Two Towers20022h 59m16+8.8(1.8M)Rate14. Fight Club19992h
           19m18+8.8(2.3M)Rate15. Inception20102h 28m13+8.8(2.5M)Rate16. Star Wars: Episode V - The Empire Strikes Back19802h
            4m7+8.7(1.4M)Rate17. The Matrix19992h 16m18+8.7(2M)Rate18. Goodfellas19902h 25m18+8.7(1.2M)Rate19.
             One Flew Over the Cuckoo's Nest19752h 13m15+8.7(1.1M)Rate20. Se7en19952h
        */

        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        [
            0] //>>"ipc-metadata-list ipc-metadata-list--dividers-between sc-71ed9118-0 kxsUNk compact-list-view ipc-metadata-list--base" normalde bu ifade bu class adının olduğu sastıra konması gerekn bir ifadedir karışıklık olmaması adına
        // bu şekilde kullanıldı alt satırlarda bulanan kodların çalışması için bu ifadenin kullanılması gerekir çünkü bu ifade bir nevi bize şunu demek ister:
        //"ipc-metadata-list ipc-metadata-list--dividers-between sc-71ed9118-0 kxsUNk compact-list-view ipc-metadata-list--base" isimli yapının içerisinde işlemlerime devam edecğim.

        .getElementsByClassName(
            "ipc-metadata-list-summary-item sc-1364e729-0 caNpAE cli-parent")

        // [0].text.toString();
        // print(res);
        //[] içerisine yazılan sayılar "ipc-metadata-list-summary-item sc-1364e729-0 caNpAE cli-parent" ismindeki yapıların index numarasını belirtir
        //burada [] kullanmayıp bir for döngüsü yardımı ile ya da forEach kullanarak tüm "ipc-metadata-list-summary-item sc-1364e729-0 caNpAE cli-parent" ismindeki
        //yapılarda gezebiliriz.

        .forEach((element) {
      //buradaki element değişkeni aslında şunlardır:
      //ilk dönüş için >>.getElementsByClassName("ipc-metadata-list-summary-item sc-1364e729-0 caNpAE cli-parent")[0]
      //ikinici dönüş için >>.getElementsByClassName("ipc-metadata-list-summary-item sc-1364e729-0 caNpAE cli-parent")[1]
      //üçüncü dönüş için >>.getElementsByClassName("ipc-metadata-list-summary-item sc-1364e729-0 caNpAE cli-parent")[2]

      String data = element

          // buradan sonrası filmlerin adını elde edebilmek için ulaşmamız gerekn tüm yapıların adlarını içerir ve son yapıdaki text ifadesi çekerek film adlarına ulaşbaliriz.
          .getElementsByClassName("ipc-metadata-list-summary-item__c")[0]
          .getElementsByClassName("ipc-metadata-list-summary-item__tc")[0]
          .getElementsByClassName("sc-be6f1408-0 gVGktK cli-children")[0]
          .getElementsByClassName(
              "ipc-title ipc-title--base ipc-title--title ipc-title-link-no-icon ipc-title--on-textPrimary sc-be6f1408-9 srahg cli-title")[0]
          .getElementsByClassName("ipc-title__text")[0]
          .text
          .toString();
    });

    //öyle bir fonksiyon yazalım ki sadece
    /*
        1. The Shawshank Redemption19942h 22m13+9.3 (2.9M)Rate
        2. The Godfather19722h 55m18+9.2(2M)Rate3. The Dark Knight20082h 32m16+9.
        0(2.8M)Rate4. The Godfather Part II19743h 22m18+9.0(1.4M)Rate5. 12 Angry Men19571h 36m15+9.0(857K)Rate6. Schindler's
         List19933h 15m18+9.0(1.4M)Rate7. The Lord of the Rings: The Return of the King20033h 21m16+9.0(2M)
         Rate8. Pulp Fiction19942h 34m18+8.9(2.2M)Rate9. The Lord of the Rings: The Fellowship of the Ring20012h 58m13+8.9(2M)
         Rate10. Dune: Part Two20242h 46mPG-139.0(142K)Rate11. Il buono, il brutto, il cattivo19662h 41m15+8.8(806K)Rate12. Forrest
          Gump19942h 22m7+8.8(2.2M)Rate13. The Lord of the Rings: The Two Towers20022h 59m16+8.8(1.8M)Rate14. Fight Club19992h
           19m18+8.8(2.3M)Rate15. Inception20102h 28m13+8.8(2.5M)Rate16. Star Wars: Episode V - The Empire Strikes Back19802h
            4m7+8.7(1.4M)Rate17. The Matrix19992h 16m18+8.7(2M)Rate18. Goodfellas19902h 25m18+8.7(1.2M)Rate19.
             One Flew Over the Cuckoo's Nest19752h 13m15+8.7(1.1M)Rate20. Se7en19952h
        */
    // verilen bu çıktılar ile film adına, süresine, yapım yılına ve resmine ulaşalım . bunun için bize sadece res değişkenin içerisindeki ilk sınıf lazım
    //bunun için yeni bir fonksiyon yazalım ve bu fonskiyon bize sadece "ipc-metadata-list ipc-metadata-list--dividers-between sc-71ed9118-0 kxsUNk compact-list-view ipc-metadata-list--base"
    //ismindeki yapıyı döndürsün
  }
  Future<List<FilmModel>> getFilms() async {
    List<FilmModel> list = [];
    var response = await http.get(Uri.parse(url));
    var body = response.body;
    var document = parser.parse(body);
    var res = document.getElementsByClassName(
        "ipc-metadata-list ipc-metadata-list--dividers-between sc-a1e81754-0 eBRbsI compact-list-view ipc-metadata-list--base")[0];
    //burada artık filmlere ulaşıldı.
    //res.children[0]-res.children[249] bütün filmlere ait olan yapılardır
    //res.children yapsına bir forEach ekleyerek bütün filmlerde dolaşacağız.
    //var element =res.children[249].text.toString();
    res.children.forEach((element) {
      String filmAdi = (element
          .getElementsByClassName("ipc-metadata-list-summary-item__c")[0]
          .getElementsByClassName(
              "ipc-title ipc-title--base ipc-title--title ipc-title-link-no-icon ipc-title--on-textPrimary sc-b0691f29-9 klOwFB cli-title")[0]
          .text);
      String resimYolu = (element
          .getElementsByClassName(
              "sc-e5a25b0f-0 jQjDIb cli-poster-container")[0]
          .getElementsByClassName("ipc-image")[0]
          .attributes['src']
          .toString());
      String yapimYili = (element
          .getElementsByClassName("ipc-metadata-list-summary-item__c")[0]
          .getElementsByClassName(
              "sc-b0691f29-8 ilsLEX cli-title-metadata-item")[0]
          .text);
      String filmSuresi = (element
          .getElementsByClassName("ipc-metadata-list-summary-item__c")[0]
          .getElementsByClassName(
              "sc-b0691f29-8 ilsLEX cli-title-metadata-item")[1]
          .text);
      list.add(FilmModel(
          filmAdi: filmAdi,
          resimYolu: resimYolu,
          yapimYili: yapimYili,
          filmSuresi: filmSuresi));
    });
    return list;
  }
}
