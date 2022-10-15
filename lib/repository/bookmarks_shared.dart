import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';

import '../model/news_model.dart';

Future<GetStorage> _getOpenBookmarksBox() async {
  var dir = await getApplicationDocumentsDirectory();
  return GetStorage('bookmarks', dir.path);
}

class Bookmarks {
  Future<bool> contains(String id) async {
    var box = await _getOpenBookmarksBox();

    return box.hasData(id);
  }

  Future addBookmark(NewsModel newsModel) async {
    var bookmarkBox = await _getOpenBookmarksBox();

    await bookmarkBox.write(
      newsModel.id!,
      newsModel.convertToMap(),
    );
  }

  removeFromBookmark(String? id) async {
    await _getOpenBookmarksBox().then((box) async {
      box.remove(id!);
    });
  }

  Future<int> clearAllBookmarks() async {
    var box = await _getOpenBookmarksBox();
    box.erase();
    box.save();
    return 1;
  }

  Future<List<Map>> getBookmarks() async {
    var bookmarkBox = await _getOpenBookmarksBox();
    var val = bookmarkBox.getValues<List<Map>>();

    return val;
  }
}
