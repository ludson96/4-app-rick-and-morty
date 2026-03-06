import 'package:app_rich_and_morty/models/character.model.dart';
import 'package:app_rich_and_morty/services/rm_api.service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'home.store.g.dart';

// This is the class used by rest of your codebase
class HomeStore = HomeStoreBase with _$HomeStore;

// The store-class
abstract class HomeStoreBase with Store {
  final _service = RMApiService();

  int page = 1;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Character> character = <Character>[].asObservable();

  @action
  Future<void> loadCharacters() async {
    isLoading = true;

    final characterResponse = await _service.loadCharacters(page: page);

    page += 1;
    character.addAll(characterResponse.results);

    isLoading = false;
  }

  @action
  void updateCharacterColor({required int characterId, required Color color}) {
    final indexCharacter = character.indexWhere(
      (character) => character.id == characterId,
    );
    character[indexCharacter] = character[indexCharacter].copyWith(
      color: color,
    );
  }
}
