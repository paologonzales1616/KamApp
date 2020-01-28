import 'package:flutter/material.dart';
import 'package:kamapp/pages/info_page.dart';

class PestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: ListTile.divideTiles(
        context: context,
        color: Colors.black,
        tiles: [
          ListTile(
            title: Text('Early Blight'),
            subtitle: Text(
              "Alternaria solani",
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InfoPage(
                  index: 0,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('Late blight'),
            subtitle: Text(
              "Phytophthora infestans",
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
            title: Text('Leaf Miner'),
            subtitle: Text(
              "Liriomyza brassicae",
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
            title: Text('Leaf Mould'),
            subtitle: Text(
              "Cladosporium fulvum",
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
            title: Text('Septoria leaf spot'),
            subtitle: Text(
              "Lycopersicon",
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
          ListTile(
            title: Text('Bacterial Wilt'),
            subtitle: Text(
              "Curtobacterium flaccumfaciens pv. flaccumfaciens",
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InfoPage(
                  index: 5,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('Verticillium Wilt'),
            subtitle: Text(
              "Verticillium dahliae",
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InfoPage(
                  index: 6,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('Yellow Leaf Curl'),
            subtitle: Text(
              "Tomato yellow leaf curl virus",
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InfoPage(
                  index: 7,
                ),
              ),
            ),
          ),
        ],
      ).toList(),
    );
  }
}
