import 'package:app_rich_and_morty/models/character.model.dart';
import 'package:app_rich_and_morty/services/rm_api.service.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'home.store.g.dart';

// This is the class used by rest of your codebase
class HomeStore = _HomeStore with _$HomeStore;

// The store-class
abstract class _HomeStore with Store {
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
}
