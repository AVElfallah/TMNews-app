import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';

import '../model/news/news_model.dart';

Future<GetStorage> _getOpenBookmarksBox() async {
  var dir = await getApplicationDocumentsDirectory();
  var getSt = GetStorage('bookmarks', dir.path)..initStorage;
  return getSt;
}

class Bookmarks {
  Future<bool> contains(String id) async {
    var box = await _getOpenBookmarksBox();

    return box.hasData(id);
  }

  Future addBookmark(NewsReportModel newsModel) async {
    var bookmarkBox = await _getOpenBookmarksBox();

    await bookmarkBox.write(
      newsModel.id!,
      newsModel.convertToMap(),
    );
  }

  Future removeFromBookmark(String? id) async {
    final bookmarkBox = await _getOpenBookmarksBox();
    await bookmarkBox.remove(id!).then((value) {});

    return bookmarkBox.hasData(id);
  }

  Future<int> clearAllBookmarks() async {
    var box = await _getOpenBookmarksBox();
    box.erase();
    box.save();
    return 1;
  }

  Future<List> getBookmarks() async {
    var bookmarkBox = await _getOpenBookmarksBox();

    var val = bookmarkBox.getValues<Iterable>();

    return val.toList();
  }
}
