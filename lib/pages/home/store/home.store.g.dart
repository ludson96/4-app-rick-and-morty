// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  Computed<List<Character>>? _$filteredCharactersComputed;

  @override
  List<Character> get filteredCharacters =>
      (_$filteredCharactersComputed ??= Computed<List<Character>>(
        () => super.filteredCharacters,
        name: 'HomeStoreBase.filteredCharacters',
      )).value;

  late final _$isLoadingAtom = Atom(
    name: 'HomeStoreBase.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$characterAtom = Atom(
    name: 'HomeStoreBase.character',
    context: context,
  );

  @override
  ObservableList<Character> get character {
    _$characterAtom.reportRead();
    return super.character;
  }

  @override
  set character(ObservableList<Character> value) {
    _$characterAtom.reportWrite(value, super.character, () {
      super.character = value;
    });
  }

  late final _$searchAtom = Atom(
    name: 'HomeStoreBase.search',
    context: context,
  );

  @override
  String? get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String? value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  late final _$loadCharactersAsyncAction = AsyncAction(
    'HomeStoreBase.loadCharacters',
    context: context,
  );

  @override
  Future<void> loadCharacters() {
    return _$loadCharactersAsyncAction.run(() => super.loadCharacters());
  }

  late final _$HomeStoreBaseActionController = ActionController(
    name: 'HomeStoreBase',
    context: context,
  );

  @override
  void setSearch(String? text) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
      name: 'HomeStoreBase.setSearch',
    );
    try {
      return super.setSearch(text);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCharacterColor({required int characterId, required Color color}) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
      name: 'HomeStoreBase.updateCharacterColor',
    );
    try {
      return super.updateCharacterColor(characterId: characterId, color: color);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
character: ${character},
search: ${search},
filteredCharacters: ${filteredCharacters}
    ''';
  }
}
