import 'package:app_rich_and_morty/pages/home/store/home.store.dart';
import 'package:app_rich_and_morty/pages/home/widgets/grid_view_cards.widget.dart';
import 'package:app_rich_and_morty/pages/home/widgets/list_view_cards.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = HomeStore();
  bool isGrid = false;

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    store.loadCharacters();
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      store.loadCharacters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Rick and Morty",
                  style: TextStyle(
                    fontSize: 38,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Procure pelo seu personagem",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: "Nome ou identificador",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: store.setSearch,
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isGrid = !isGrid;
                    });
                  },
                  icon: Icon(
                    isGrid ? Icons.list : Icons.grid_view,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Observer(
                  builder: (_) {
                    if (store.isLoading && store.character.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }
                    return isGrid
                        ? GridViewCards(
                            store: store,
                            scrollController: scrollController,
                          )
                        : ListViewCards(
                            store: store,
                            scrollController: scrollController,
                          );
                  },
                ),
              ),
              Observer(
                builder: (_) {
                  return store.isLoading && store.character.isNotEmpty
                      ? const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
