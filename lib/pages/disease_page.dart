import 'package:flutter/material.dart';
import 'package:kamapp/pages/info_page.dart';
import 'package:kamapp/constants/constants.dart' as Constants;

class DiseasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Disease Library"),
      ),
      body: Container(
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: Constants.COMPARE_NAME.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(Constants.NAME[index]),
              subtitle: Text(
                Constants.SCIENTIFIC[index],
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoPage(
                    index: index,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
      ),
    );
  }
}
