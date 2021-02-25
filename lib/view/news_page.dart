import 'package:cursoflutter/presenter/build_view.dart';
import 'package:flutter/material.dart';
import 'package:cursoflutter/view/widgets/drawer_option.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int newsInt = 1;
  String viewName = 'NewsList';

  static const drawerOptions = <Map<String, dynamic>>[
  {'value': 1, 'text': 'All articles mentioning Apple from yesterday, sorted by popular publishers first.'},
  {'value': 2, 'text': 'All articles about Tesla from the last month, sorted by recent first.'},
  {'value': 3, 'text': 'Top business headlines in the US right now.'},
  {'value': 4, 'text': 'Top headlines from TechCrunch right now.'},
  {'value': 5, 'text': 'All articles published by the Wall Street Journal in the last 6 months, sorted by recent first.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black38,
        ),
        backgroundColor: Colors.white,
        title: Text(
          'BIT News',
          style: TextStyle(
            color: Colors.black38,
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.favorite,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white54,

                /* Opcion para insertar imagen local*/
                child: Image.asset(
                  'assets/img/icp.png',
                ), /* Fin opción para insertar imagen local*/
              ),
            ),

            ...drawerOptions.map((option) => DrawerOption(text: option['text'], onTap: (){ setState(() {
              newsInt = option['value'];
              Navigator.pop(context);
            });},),).toList()

          ],
        ),
      ),

      body: Container(
        padding: EdgeInsets.only(
          right: 10,
          left: 10,
        ),
        child: BuildView(viewName: viewName, intNews: newsInt),
      ),
    );
  }
}

/*  Opción para traer imgen de internet
    Se ubica como child de DrawerHeader
                Image.network(
                  'https://bit.institute/images/Instituto-Cursos-Programacion.png',
                ),
                Fin opción para traer imgen de internet  */
