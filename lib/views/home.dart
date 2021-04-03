import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_yt/colors.dart';
import 'package:pokedex_yt/models/pokemon.dart';
import 'package:pokedex_yt/widgets/pokedex.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_yt/widgets/pokemon_card.dart';
import 'package:pokedex_yt/widgets/pokemon_secondary_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Pokemon> pokemons = [];
  Pokemon pokemonActual;
  int index = 11;
  Future future;

  Future<List<Pokemon>> getPokemons() async {
    for (int i = 1; i <= 10; i++) {
      http.Response response = await http.get('https://pokeapi.co/api/v2/pokemon/${i.toString()}');
      final decoded = json.decode(response.body);

      pokemons.add(Pokemon.fromJson(decoded));
    }
    pokemonActual = pokemons[0];
    return pokemons;
  }
  
  @override
  void initState() {

    future = getPokemons();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    void loadMorePokemons() async {
      // 151 is the last pokemon from the first generation
      for (int i = index; (i < index+10) && (index <= 151); i++) {
        http.Response response = await http.get('https://pokeapi.co/api/v2/pokemon/${i.toString()}');
        final decoded = json.decode(response.body);

        pokemons.add(Pokemon.fromJson(decoded));
      }
      setState(() {
        index += 10;
      });
    }

    return Scaffold(
      body: FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
            case ConnectionState.active:

              return Pokedex(
                child: Column(
                  children: [

                    Expanded(
                      flex: 3,
                      child: PokemonCard(pokemon: pokemonActual,),
                    ),

                    Expanded(
                      child: ListView.builder(
                        itemCount: pokemons.length+1,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int i) {
                          if (i < pokemons.length) {
                            return Container(
                              margin: EdgeInsets.only(right: 15, left: (i != 0)?0:15),
                              child: PokemonSecondaryCard(
                                pokemon: pokemons[i],
                                onTap: () {
                                  setState(() {
                                    pokemonActual = pokemons[i];
                                  });
                                },
                              ),
                            );
                          } else {
                            loadMorePokemons();
                            return AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                height: 50,
                                width: 50,
                                margin: EdgeInsets.only(right: 15),
                                child: SpinKitRing(
                                  color: lightBlue,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),

                    SizedBox(height: 15),

                  ],
                ),
              );

            default:
              return Center(
                child: SpinKitRing(
                  color: red,
                  size: 50,
                ),
              );
          }
        },
      ),
    );
  }
}