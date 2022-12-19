import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tell_me_news/controller/bookmark_controller.dart';
import 'package:tell_me_news/view/widgets/news_card_widget.dart';

import '../../model/news/news_model.dart';

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
            builder: (context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: ((context, index) {
                    var newsModel =
                        NewsReportModel.fromJson(snapshot.data![index]);

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Dismissible(
                        background: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 150,
                        ),
                        confirmDismiss: (direction) {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: const Text('Delete'),
                                content: const Text('Delete bookmark forever'),
                                actions: <Widget>[
                                  ElevatedButton(
                                    onPressed: () {
                                      controller
                                          .removeFromBookmarks(newsModel.id!);
                                      Navigator.of(
                                        context,
                                      ).pop(true);
                                    },
                                    child: const Text('Yes'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(
                                        context,
                                      ).pop(false);
                                    },
                                    child: const Text('No'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        key: UniqueKey(),
                        onDismissed: (dir) {},
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
