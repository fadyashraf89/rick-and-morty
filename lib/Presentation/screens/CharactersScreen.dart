import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rickandmorty/BusinessLogic/cubits/characters_cubit.dart';
import 'package:flutter_rickandmorty/Constants/colors.dart';
import 'package:flutter_rickandmorty/Presentation/widgets/CharacterItem.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../Data/models/Characters.dart'; // Alias

class AllCharactersScreen extends StatefulWidget {
  const AllCharactersScreen({super.key});

  @override
  State<AllCharactersScreen> createState() => _AllCharactersScreenState();
}

bool isSearching = false;

class _AllCharactersScreenState extends State<AllCharactersScreen> {
  List<MyCharacters>? allCharacters;
  List<MyCharacters>? searchResultCharacters;
  final SearchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildSearchField() {
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: SearchTextController,
      cursorColor: Colors.white,
      enableSuggestions: true,
      decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Search For a Character",
          fillColor: Colors.white,
          focusColor: Colors.white,
          hintStyle: TextStyle(color: Colors.white)),
      onChanged: (searchedCharacter) {
        addSearchedForItemsToSearchedList(searchedCharacter);
      },
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      if (state is CharactersLoaded) {
        allCharacters = (state).characters;
        return buildLoadedListWidgets();
      } else {
        return const Center(
          child: CircularProgressIndicator(
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
        character: SearchTextController.text.isEmpty
            ? allCharacters![index]
            : searchResultCharacters![index],
      ),
      itemCount: SearchTextController.text.isEmpty
          ? allCharacters?.length
          : searchResultCharacters?.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
    );
  }

  void addSearchedForItemsToSearchedList(String searchedCharacter) {
    searchResultCharacters = allCharacters
        ?.where((character) =>
            character.name.toLowerCase().contains(searchedCharacter))
        .toList();
    setState(() {});
  }

  void StartSearching() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: StopSearching));
    setState(() {
      isSearching = true;
    });
  }

  void StopSearching() {
    ClearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void ClearSearch() {
    setState(() {
      SearchTextController.clear();
    });
  }

  List<Widget> buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
            onPressed: () {
              ClearSearch();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            )),
      ];
    } else {
      return [
        IconButton(
            onPressed: () {
              StartSearching();
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            )),
      ];
    }
  }

  Widget BuildAppBarTitle() {
    return const Text(
      "All Characters",
      style:
          (TextStyle(color: MyColors.WhiteColor, fontWeight: FontWeight.bold)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: MyColors.GreenColor,
            title: isSearching ? buildSearchField() : BuildAppBarTitle(),
            actions: buildAppBarActions(),
            leading:
                isSearching ? const BackButton(color: Colors.white) : null),
        body: OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            List<ConnectivityResult> connectivity,
            Widget child,
          ) {
            final bool connected =
                !connectivity.contains(ConnectivityResult.none);
            if (connected) {
              print("El net sha8al");
              return buildBlocWidget();
            } else {
              print("El net msh sha8al");
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/NoInternet.png"),
                    SizedBox(height: 20,),
                    Text(
                      "You Are Offline",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            }
          },
          child: const Center(
            // Optional: Display a loading indicator while checking connectivity
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
