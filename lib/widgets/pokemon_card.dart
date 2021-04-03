import 'package:flutter/material.dart';
import 'package:pokedex_yt/colors.dart';
import 'package:pokedex_yt/models/pokemon.dart';

class PokemonCard extends StatelessWidget {

  final Pokemon pokemon;
  PokemonCard({this.pokemon});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [lightBlue0, lightBlue]
        )
      ),
      child: Row(
        children: [
          
          Expanded(
            flex: 2,
            child: Image.network('https://pokeres.bastionbot.org/images/pokemon/${pokemon.id}.png'),
          ),
  
          SizedBox(width: 20),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Column(
                children: [

                  InfoRow(
                    withPokebal: true,
                    field: 'Nº ${pokemon.id.toString().padLeft(3, '0')}',
                    value: pokemon.name,
                  ),

                  TypeWidget(type: pokemon.type,),

                  InfoRow(field: 'HEIGHT', value: '${pokemon.height}\'00\"',),

                  InfoRow(field: 'WEIGHT', value: '${pokemon.weight}lbs',),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class TypeWidget extends StatelessWidget {

  final String type;
  TypeWidget({this.type});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (type) {
      case 'grass':
        color = grassColor;
        break;
      case 'fire':
        color = fireColor;
        break;
      case 'bug':
        color = bugColor;
        break;
      case 'dark':
        color = darkColor;
        break;
      case 'dragon':
        color = dragonColor;
        break;
      case 'eletric':
        color = eletricColor;
        break;
      case 'fairy':
        color = fairyColor;
        break;
      case 'fighting':
        color = fightingColor;
        break;
      case 'flying':
        color = flyingColor;
        break;
      case 'ghost':
        color = ghostColor;
        break;
      case 'ground':
        color = groundColor;
        break;
      case 'ice':
        color = iceColor;
        break;
      case 'normal':
        color = normalColor;
        break;
      case 'poison':
        color = poisonColor;
        break;
      case 'psychic':
        color = psychicColor;
        break;
      case 'rock':
        color = rockColor;
        break;
      case 'steel':
        color = steelColor;
        break;
      case 'water':
        color = waterColor;
        break;
      default:
        color = grassColor;
        break;
    }
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(
            'TYPE',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 5),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(200),
              border: Border.all(color: Colors.white, width: 1)
            ),
            child: Text(type, style: TextStyle(color: Colors.white, fontSize: 18),),
          ),

        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {

  final String field, value;
  final bool withPokebal;
  InfoRow({this.field, this.value, this.withPokebal = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              (withPokebal) ? Container(
                margin: EdgeInsets.only(right: 5),
                child: Image.asset('assets/pokeball.png', width: 15,),
              ) : Container(),
              Text(
                field,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ],
          ),

          Text(
            value,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),

        ],
      ),
    );
  }
}