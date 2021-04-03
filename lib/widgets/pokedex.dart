import 'package:flutter/material.dart';
import 'package:pokedex_yt/colors.dart';

class Pokedex extends StatefulWidget {

  final Widget child;
  Pokedex({this.child});

  @override
  _PokedexState createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width/1.7,
              decoration: BoxDecoration(
                color: lighterBlue,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                image: DecorationImage(
                  image: AssetImage('assets/pokedex_cima.png'),
                  fit: BoxFit.cover
                )
              ),
            ),
          ),

          AnimatedContainer(
            duration: Duration(seconds: 1),
            height: isExpanded ? MediaQuery.of(context).size.height-(2*MediaQuery.of(context).size.width/1.7) : 0,
            color: lighterBlue,
            child: widget.child,
          ),

          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: RotatedBox(
              quarterTurns: 2,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width/1.7,
                decoration: BoxDecoration(
                  color: lighterBlue,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  image: DecorationImage(
                    image: AssetImage('assets/pokedex_cima.png'),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
} 