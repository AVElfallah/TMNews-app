import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tell_me_news/controller/bookmark_controller.dart';
import 'package:tell_me_news/model/news_model.dart';
import 'package:tell_me_news/view/widgets/news_card_widget.dart';

class BookmarkPage extends GetView<BookmarkController> {
  const BookmarkPage({Key? key}) : super(key: key);
  @override
  get controller {
    var ctrl = Get.put(BookmarkController());
    return ctrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.red,
            highlightColor: Colors.red,
            onPressed: () {
              controller.clearBookmarks();
            },
          ),
        ],
      ),
      body: Obx(
        () {
          return FutureBuilder(
            future: controller.getBookmarks.value,
            builder: (context, AsyncSnapshot<List<Map>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: ((context, index) {
                    var newsModel = NewsModel.fromJson(snapshot.data![index]);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Dismissible(
                        background: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 150,
                        ),
                        key: UniqueKey(),
                        onDismissed: (dir) {
                          controller.removeFromBookmarks(newsModel.id!);
                        },
                        child: NewsCardWidget.fromModel(
                          newsModel,
                          isBookmarked: true,
                        ),
                      ),
                    );
                  }),
                );
              } else {
                return const Text('not found data');
              }
            },
          );
        },
      ),
    );
  }
}
