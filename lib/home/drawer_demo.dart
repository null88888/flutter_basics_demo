import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('侧滑', style: TextStyle(fontWeight: FontWeight.bold)),
            accountEmail: Text('侧滑email'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://lh3.googleusercontent.com/motpsiWs081zOJH_eGr22wBvUVJxWaBkrr80-ItGvynlTlxZwqmsBAKVXDVyr9dnNCnnDRvwxumTUPhHfsojYHFOHA=w640-h400-e365-rj-sc0x00ffffff'),
            ),
            decoration: BoxDecoration(
              color: Colors.yellow[400],
              image: DecorationImage(
                image: NetworkImage(
                    'https://lh3.googleusercontent.com/motpsiWs081zOJH_eGr22wBvUVJxWaBkrr80-ItGvynlTlxZwqmsBAKVXDVyr9dnNCnnDRvwxumTUPhHfsojYHFOHA=w640-h400-e365-rj-sc0x00ffffff'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.yellow[400]!.withOpacity(0.6), BlendMode.hardLight),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Messages',
              textAlign: TextAlign.right,
            ),
            trailing: Icon(Icons.message, color: Colors.black12, size: 22.0),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text(
              'Favorite',
              textAlign: TextAlign.right,
            ),
            trailing: Icon(Icons.favorite, color: Colors.black12, size: 22.0),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text(
              'Settings',
              textAlign: TextAlign.right,
            ),
            trailing: Icon(Icons.settings, color: Colors.black12, size: 22.0),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
