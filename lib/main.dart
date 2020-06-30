import 'package:flutter/material.dart';
import 'package:flutter_widgets/flutter_widgets.dart';
import 'list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eBay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _searchVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(),
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: new IconThemeData(color:Colors.grey),
        backgroundColor: Colors.white,
        title: Container(
          width: 62,
          height: 25,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/ebay.png'), fit:BoxFit.fitHeight)
          ),
        ),
        actions: <Widget>[
          _searchVisible?Container():Icon(Icons.search),
          SizedBox(width:3),
          Icon(Icons.shopping_cart)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            VisibilityDetector(
              key: Key('search bar'), 
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Container(
                  height: 30,
                  margin: EdgeInsets.only(bottom:8, left:8, right:8),
                  padding: EdgeInsets.all(8),
                  color: Colors.grey[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.search),
                      Text('Rechercher sur eBay', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.grey[800], fontSize:20)),
                      Icon(Icons.mic)
                    ],
                  ),
                ),
              ), 
              onVisibilityChanged: (info){
                if(_searchVisible && info.visibleFraction<=0.4){
                  setState(() {
                    _searchVisible = false;
                  });
                }else if(info.visibleFraction>=0.4){
                  setState(() {
                    _searchVisible = true;
                  });
                }
              }),
              Container(
                height: 80,
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical:15),
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left:5, right:5),
                  itemBuilder: (context, index){
                    return Container(
                      width: 120,
                      height: 40,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.grey[300]
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(labels[index]['icon'], color: Colors.blue[800],),
                          Text(labels[index]['text'], style:TextStyle(color: Colors.blue[800], fontWeight:FontWeight.bold))
                        ],
                      ),
                    );
                  }),
              ),
              Container(
                color: Colors.indigo[900],
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Vente Flash Philips jusqu'à -50%", style: TextStyle(color:Colors.white, fontSize:12),),
                    SizedBox(height:5),
                    Text("Bons Plans irrésistibles jusqu'au 3 juillet seulement !", style:TextStyle(color: Colors.white, fontSize:12)),
                    SizedBox(height:25),
                    Row(
                      children: <Widget>[
                        Text('Livraison gratuite', style:TextStyle(color: Colors.white, fontWeight:FontWeight.bold, fontSize:12)),
                        Icon(Icons.arrow_forward, color: Colors.white, size:20)
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 350,
                padding: EdgeInsets.symmetric(vertical:40),
                child: Stack(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left:12),
                    child:Row(children: <Widget>[
                      Text('Bons Plans', style:TextStyle(fontWeight:FontWeight.bold, fontSize:20)),
                      Icon(Icons.arrow_forward, size: 20,)
                    ],)),
                    ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(right:12, left:12, top:40),
                      itemBuilder: (context, index){
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right:5),
                                width: 155,
                                height: 120,
                                decoration: BoxDecoration(
                                  border: Border.all(width:1, color:Colors.grey[200]),
                                  image: DecorationImage(image: AssetImage(products[index]['image'])),
                                ),
                              ),
                              SizedBox(height:8),
                              Container(
                                width: 155,
                                child: Text(products[index]['text'], style:TextStyle(fontSize: 13)),
                              ),
                              SizedBox(height:5),
                              Text(products[index]['prix'], style:TextStyle(fontSize: 16, fontWeight:FontWeight.bold)),
                              SizedBox(height:3),
                              Container(
                                width: 155,
                                child: Text.rich(products[index]['réduction'], style:TextStyle(fontSize: 12)),
                              )
                            ],
                          ),
                        );
                      })
                  ],
                ),
              ),
              Container(
                height: 350,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 150,
                      color: Colors.greenAccent[400],
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('Faites-vous plaisir sans attendre', style:TextStyle(color:Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
                              SizedBox(width:5),
                              Icon(Icons.arrow_forward, color: Colors.black, size:20)
                            ],
                          ),
                          SizedBox(height:8),
                          Text('Profitez de 5€ sur une séléction',
                          style:TextStyle(color: Colors.black, fontSize:12))
                        ],
                      ),
                    ),
                    ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(top:70, left:12),
                      itemBuilder: (context, index){
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right:5),
                                width: 155,
                                height: 120,
                                decoration: BoxDecoration(
                                  border: Border.all(width:1, color:Colors.grey[200]),
                                  color: Colors.white,
                                  image: DecorationImage(image: AssetImage(products[index]['image'])),
                                ),
                              ),
                              SizedBox(height:8),
                              Container(
                                width: 155,
                                child: Text(products[index]['text'], style:TextStyle(fontSize: 13)),
                              ),
                              SizedBox(height:5),
                              Text(products[index]['prix'], style:TextStyle(fontSize: 16, fontWeight:FontWeight.bold)),
                              SizedBox(height:3),
                              Container(
                                width: 155,
                                child: Text.rich(products[index]['réduction'], style:TextStyle(fontSize: 12)),
                              )
                            ],
                          ),
                        );
                      })
                  ],
                ),
              ),
              Container(
                color: Colors.yellow[800],
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Toujours ouvert sur eBay', style:TextStyle(color: Colors.black, fontWeight:FontWeight.bold, fontSize:18)),
                    SizedBox(height:5),
                    Text('Achetez, vendez, rejoignez-nous !', style: TextStyle(color:Colors.black, fontSize:12),),
                    SizedBox(height:25),
                    Row(
                      children: <Widget>[
                        Text('En savoir plus', style:TextStyle(color: Colors.black, fontWeight:FontWeight.bold, fontSize: 12)),
                        Icon(Icons.arrow_forward, color:Colors.black, size:20)
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 90,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/ebay_banner.jpg'), fit: BoxFit.cover)
                ),
              ),
              Container(
                height: 422,
                padding: EdgeInsets.symmetric(vertical:40, horizontal:12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(alignment:Alignment.topLeft,
                    child:Text('Populaire sur eBay', style:TextStyle(fontSize: 20, fontWeight:FontWeight.bold))),
                    GridView.builder(
                      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio:0.73),
                      shrinkWrap:true,
                      padding: EdgeInsets.only(top:12),
                      primary: false,
                      itemCount: 6, 
                      itemBuilder: (context, index){
                        return Card(
                          color: Colors.transparent,
                          elevation: 0.0,
                          margin: EdgeInsets.all(5),
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 55,
                                backgroundColor: grid[index]['color'],
                                child: Center(
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage(grid[index]['image']), fit:BoxFit.fill)
                                    ),
                                  ),
                                ),
                              ),
                              Text(grid[index]['text'], textAlign:TextAlign.center)
                            ],
                          ),
                        );
                      })
                  ],
                ),
              ),
              Container(
                height: 350,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 230,
                      color: Colors.blue[900],
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Démarrez sur les chapeaux de roues', style:TextStyle(color: Colors.amber[300], fontWeight:FontWeight.bold, fontSize:18)),
                          SizedBox(height:12),
                          Text('-10%* sur une séléction de produits avec le code PRIAUTO',
                          style:TextStyle(color:Colors.amber[300], fontSize: 14 )),
                          SizedBox(height:12),
                          Row(
                            children: <Widget>[
                              Text('Livraison gratuite', style: TextStyle(color:Colors.amber[300], fontWeight:FontWeight.bold, fontSize:16),),
                              SizedBox(width:5),
                              Icon(Icons.arrow_forward, color: Colors.amber[300], size:20)
                            ],
                          ),
                          SizedBox(height:22),
                          Text("* Offre valable jusqu'au 15/07. Voir conditions", style: TextStyle(color:Colors.amber[300], fontSize:14),)
                        ],
                      ),
                    ),
                    ListView.builder(
                      itemCount: 4,
                      padding: EdgeInsets.only(top:170, left: 12),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right:7),
                                width: 270,
                                height: 140,
                                padding: EdgeInsets.all(14),
                                color: Colors.lightBlueAccent,
                                child: Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: <Widget>[
                                    Container(
                                      width: 140,
                                      height: 90,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: 
                                        AssetImage('assets/produits/batterie.png'), fit:BoxFit.fill)
                                      ),
                                    ),
                                    Align(alignment:Alignment.bottomRight,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(width:80, child:Text('Pièces détachées', style:TextStyle(fontSize: 16, fontWeight:FontWeight.bold))),
                                        Icon(Icons.arrow_forward, size:20)
                                      ],
                                    ),)
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      })
                  ],
                ),
              ),
              Container(
                height: 300,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('assets/spook-logoG.png'),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Spook', style:TextStyle(fontWeight: FontWeight.bold, fontSize:16)),
                            Text('Annonce')
                          ],
                        )
                      ],
                    ),
                    SizedBox(height:8),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/ads.jpg'), fit:BoxFit.cover, alignment: Alignment.bottomCenter)
                      ),
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
