import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../routers/routers.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Diseños en Flutter'),
        ),
        drawer: _MenuPrincipal(),
        body: _ListaOpciones());
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, i) =>const Divider(
        color: Colors.blue,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(pageRoutes[i].icon, color: Colors.blue),
        title: Text(pageRoutes[i].titulo),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.blue,
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>pageRoutes[i].page));

        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    'OR',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
            Expanded(child: _ListaOpciones()),
             ListTile(
              leading: Icon(Icons.lightbulb_outline, color: Colors.blue),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: true,
                activeColor: Colors.blue,
                onChanged: (value){}
              ),
            ),
             SafeArea(
               top:false,
               bottom: true,
               left: false,
               right: false,
               child: ListTile(
                leading: Icon(Icons.lightbulb_outline, color: Colors.blue),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                  activeColor: Colors.blue,
                  value: true,
                  onChanged: (value){}
                ),
                         ),
             )
          ],
        ),
      ),
    );
  }
}
