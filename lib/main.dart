import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    PageController controller=PageController();

    return Scaffold(
      body:ListView.builder(
          itemCount: 10,
          itemBuilder: (_,i){
        return CustomCard();
      })
    );
  }
}


class CustomCard extends StatefulWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {

  int selected=0;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            if(selected==0)
              Container(
                height:700 ,
                color: Colors.purple,
                child: Center(child: Text("1"),),
              ),
            if(selected==1)
              Container(
                height:700 ,
                color: Colors.greenAccent,
                child: Center(child: Text("2"),),
              ),
            if(selected==2)
              Container(
                height:700 ,
                color: Colors.deepOrange,
                child: Center(child: Text("3"),),
              ),
            if(selected==3)
              Container(
                height:700 ,
                child: Center(child: Text("4"),),
              ),
            Container(
              height: 80,
              child: FancyBottomNavigation(
                barBackgroundColor: Colors.green,
                initialSelection: 0,
                tabs: [
                  TabData(iconData: Icons.home, title: "Home"),
                  TabData(iconData: Icons.search, title: "Search"),
                  TabData(iconData: Icons.shopping_cart, title: "Basket"),
                  TabData(iconData: Icons.shopping_cart, title: "Basket"),
                ],
                onTabChangedListener: (position) {
                  setState(() {
                    selected = position;
                  });
                },
              ),
            )
          ],
        ),

      ),
    );
  }
}
