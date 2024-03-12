import 'package:flutter/material.dart';
import 'package:web_scraping_flutter/const/Helper.dart';
import 'models/filmModel.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Helper helper = Helper();
  List<FilmModel> filmListesi = [];


  void getData() async {
    var list=helper.getFilms();
    list.then((value) {
      setState(() {
        filmListesi=value;
      });
    });
  }

  void initState() {
    super.initState();
    getData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("IMDB TOP 250"),
      ),
      body: filmListesi.length==0?Center(child: CircularProgressIndicator()):ListView.builder(
        itemCount: filmListesi.length,
        itemBuilder: (context, index) => Column(
          children: [
            Image.network(filmListesi[index].resimYolu.toString(),errorBuilder: (context, error, stackTrace) => Image.asset("assets/indir.png"),),
            Text(filmListesi[index].filmAdi.toString()),
            Text(filmListesi[index].filmSuresi.toString()),
            Text(filmListesi[index].yapimYili.toString()),
          ],
        ),
      ),
    );
  }
}
