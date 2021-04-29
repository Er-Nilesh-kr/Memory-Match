import 'package:flutter/material.dart';
import 'package:memory_game/data/data.dart';
import 'package:memory_game/model/tile_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memory Match Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TileModel> gridViewTiles = <TileModel>[];
  List<TileModel> questionPairs = <TileModel>[];

  @override
  void initState() {
    super.initState();
    reStart();
  }

  void reStart() {
    pairs = getPairs();
    pairs.shuffle();
    gridViewTiles = pairs;
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        questionPairs = getQuestions();
        gridViewTiles = questionPairs;
        selected = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            points != 800
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "$points / 800",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 3.0,
                        ),
                      ),
                      Text(
                        "Points",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 2),
                      ),
                    ],
                  )
                : Container(),
            SizedBox(
              height: 10,
            ),
            points != 800
                ? GridView(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisSpacing: 0.0, maxCrossAxisExtent: 100),
                    children: List.generate(
                      gridViewTiles.length,
                      (index) {
                        return Tile(
                          imageAssestPath:
                              gridViewTiles[index].getImageAssetPath(),
                          parent: this,
                          tileIndex: index,
                        );
                      },
                    ),
                  )
                : Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 36.0,
                        ),
                        Text(
                          "CONGRATULATIONS\nYOU WON!\n\n",
                          style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Want To Play Again?",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.0),
                        ),
                        SizedBox(
                          height: 26.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              points = 0;
                              reStart();
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Text(
                              "Replay",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            SizedBox(
              height: 25.0,
            ),
            points != 800
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        points = 0;
                        reStart();
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text(
                        "Reset",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class Tile extends StatefulWidget {
  final String imageAssestPath;
  final int tileIndex;
  final _HomePageState parent;
  Tile({this.imageAssestPath, this.parent, this.tileIndex});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!selected) {
          setState(() {
            pairs[widget.tileIndex].setIsSelected(true);
          });
          if (selectedTile != "") {
            if (selectedTile == pairs[widget.tileIndex].getImageAssetPath()) {
              print("add point");
              points = points + 100;
              print(selectedTile + " thishis" + widget.imageAssestPath);

              TileModel tileModel = new TileModel();
              print(widget.tileIndex);
              selected = true;
              Future.delayed(const Duration(seconds: 1), () {
                tileModel.setImageAssetPath("");
                pairs[widget.tileIndex] = tileModel;
                print(selectedIndex);
                pairs[selectedIndex] = tileModel;
                this.widget.parent.setState(() {});
                setState(() {
                  selected = false;
                });
                selectedTile = "";
              });
            } else {
              print(selectedTile +
                  " thishis " +
                  pairs[widget.tileIndex].getImageAssetPath());
              print("wrong choice");
              print(widget.tileIndex);
              print(selectedIndex);
              selected = true;
              Future.delayed(const Duration(seconds: 1), () {
                this.widget.parent.setState(() {
                  pairs[widget.tileIndex].setIsSelected(false);
                  pairs[selectedIndex].setIsSelected(false);
                });
                setState(() {
                  selected = false;
                });
              });

              selectedTile = "";
            }
          } else {
            setState(() {
              selectedTile = pairs[widget.tileIndex].getImageAssetPath();
              selectedIndex = widget.tileIndex;
            });

            print(selectedTile);
            print(selectedIndex);
          }
        }
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: pairs[widget.tileIndex].getImageAssetPath() != ""
            ? Image.asset(pairs[widget.tileIndex].getIsSelected()
                ? pairs[widget.tileIndex].getImageAssetPath()
                : widget.imageAssestPath)
            : Container(
                child: Image.asset(
                  "images/correct.png",
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }
}
