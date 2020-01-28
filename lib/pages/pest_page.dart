import 'package:flutter/material.dart';
import 'package:kamapp/pages/info_page.dart';
import 'package:kamapp/pages/info_pest_page.dart';

class PestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pest Library"),
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: ListTile.divideTiles(
            context: context,
            color: Colors.black,
            tiles: [
              ListTile(
                title: Text('Cutworms'),
                subtitle: Text(
                  "Alternaria Solani",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                trailing: Icon(Icons.chevron_right),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoPestPage(
                      index: 0,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text('Whiteflies'),
                subtitle: Text(
                  "Trialeurodes Vaporariorum",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                trailing: Icon(Icons.chevron_right),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoPage(
                      index: 1,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text('Hornworm'),
                subtitle: Text(
                  "Manduca Sexta",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                trailing: Icon(Icons.chevron_right),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoPage(
                      index: 2,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text('Stink Bug'),
                subtitle: Text(
                  "Halyomorpha Halys",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                trailing: Icon(Icons.chevron_right),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoPage(
                      index: 3,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text('Tomato Leaf Miner'),
                subtitle: Text(
                  "Tuta Absoluta",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                trailing: Icon(Icons.chevron_right),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoPage(
                      index: 4,
                    ),
                  ),
                ),
              ),
            ],
          ).toList(),
        ),
      ),
    );
  }
}
