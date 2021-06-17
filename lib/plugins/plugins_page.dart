import 'package:flutter/material.dart';
import 'package:flutter_basics_demo/config/plugins-list.dart';
import 'package:flutter_basics_demo/router/routes.dart';

class PluginsPage extends StatefulWidget {
  PluginsPage({Key? key, this.title = 'Plugins'}) : super(key: key);
  final String title;

  @override
  _PluginsPageState createState() => _PluginsPageState();
}

class _PluginsPageState extends State<PluginsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: plugins.length,
        separatorBuilder: (content, index) {
          return Divider(
            height: 1,
            color: Color(0xfff5f5f5),
          );
        },
        itemBuilder: (context, index) {
          return listItem(plugins[index]);
        },
      ),
    );
  }

  Widget listItem(Map item) {
    return GestureDetector(
      onTap: () {
        print(item['routeName']);
        Navigator.of(context).pushNamed(item['routeName']);
      },
      child: Container(
        height: 70,
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item['title'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 2, bottom: 2, left: 4, right: 4),
                    decoration: BoxDecoration(color: Color(0xfff5f5f5), borderRadius: BorderRadius.circular(2)),
                    child: Text(item['plugin_name'], maxLines: 1, style: TextStyle(color: Colors.black54)),
                  )
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black26,
            )
          ],
        ),
      ),
    );
  }
}
