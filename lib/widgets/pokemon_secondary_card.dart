import 'package:flutter/material.dart';
import 'package:pokedex_yt/colors.dart';
import 'package:pokedex_yt/models/pokemon.dart';

class PokemonSecondaryCard extends StatelessWidget {

  final Pokemon pokemon;
  final Function onTap;
  PokemonSecondaryCard({this.pokemon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [lightBlue0, lightBlue]
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [

              Expanded(
                flex: 3,
                child: Image.network('https://pokeres.bastionbot.org/images/pokemon/${pokemon.id}.png')
              ),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Image.asset('assets/pokeball.png', height: 10,),
                    ),
                    SizedBox(width: 5),
                    Flexible(
                      child: Text(
                        pokemon.id.toString().padLeft(3, '0'),
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.start,
                      )
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}