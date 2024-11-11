import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rickandmorty/BusinessLogic/cubits/characters_cubit.dart';
import 'package:flutter_rickandmorty/Constants/colors.dart';
import 'package:flutter_rickandmorty/Presentation/widgets/CharacterItem.dart';

import '../../Data/models/Characters.dart'; // Alias

class AllCharactersScreen extends StatefulWidget {
  const AllCharactersScreen({super.key});

  @override
  State<AllCharactersScreen> createState() => _AllCharactersScreenState();
}

class _AllCharactersScreenState extends State<AllCharactersScreen> {
  List<MyCharacters>? allCharacters;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      if (state is CharactersLoaded) {
        allCharacters = (state).characters;
        return buildLoadedListWidgets();
      } else {
        return Center(
          child: const CircularProgressIndicator(
            color: Colors.blueGrey,
          ),
        );
      }
    });
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey,
        child: Column(children: [
          buildCharactersList(),
        ]),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemBuilder: (context, index) => CharacterItem(
        character: allCharacters![index],
      ),
      itemCount: allCharacters?.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.GreenColor,
        centerTitle: true,
        title: const Text(
          "All Characters",
          style: (TextStyle(
              color: MyColors.WhiteColor, fontWeight: FontWeight.bold)),
        ),
      ),
      body: buildBlocWidget(),
    );
  }
}
