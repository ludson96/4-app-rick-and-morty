import 'package:app_rich_and_morty/pages/home/store/home.store.dart';
import 'package:app_rich_and_morty/pages/home/widgets/grid_view_cards.widget.dart';
import 'package:app_rich_and_morty/pages/home/widgets/list_view_cards.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = HomeStore();
  bool isGrid = false;

  @override
  void initState() {
    super.initState();
    store.loadCharacters();
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
                child: isGrid
                    ? GridViewCards(store: store)
                    : ListViewCards(store: store),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
