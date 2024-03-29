import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getwidget/getwidget.dart';
import 'package:tell_me_news/config/app_route.dart';
import 'package:tell_me_news/config/assets.dart';
import 'package:tell_me_news/controller/newspaper_controller.dart';
import 'package:tell_me_news/extensions/context_extensions.dart';

import 'package:tell_me_news/view/widgets/news_filter_widget.dart';

import '../../../model/news/news_model.dart';
import '../../widgets/categories_widget.dart';
import '../../widgets/news_card_widget.dart';

class NewsPaperScreen extends StatelessWidget {
  const NewsPaperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final xUser = FirebaseAuth.instance.currentUser;
    final newspaperCtrl = Get.put(
      NewspaperController(),
      tag: 'newspaper',
    );
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          title: Text('latestnews'.tr),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
              ),
              onPressed: () {
                //  SearchDialog.show(context);
                Get.toNamed(Routes.searchPage);
              },
            ),
            const NewsFilterWidget()
          ],
          leading: GestureDetector(
            onTap: context.changeZoomDrawerState,
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black54,
                image: DecorationImage(
                  image: xUser!.photoURL != null
                      ? NetworkImage(xUser.photoURL!)
                      : Image.asset(Assets.person).image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            CategoriesWidget(
              changeCategory: newspaperCtrl.changeCategory,
              category: newspaperCtrl.category,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: FutureBuilder(
                future: newspaperCtrl.getNews(),
                builder: (
                  context,
                  AsyncSnapshot<List<NewsReportModel>> snapshot,
                ) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return const GFCard(
                        elevation: 50,
                        title: GFListTile(
                          title: Text(
                            'News not found',
                            textAlign: TextAlign.center,
                          ),
                          description: Text(
                            'no data has been found change language or country',
                          ),
                        ),
                        showImage: true,
                        image: Image(
                          image: AssetImage(Assets.appError),
                        ),
                      );
                    }
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * .9,
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: ((
                          context,
                          index,
                        ) {
                          if (index < snapshot.data!.length - 1) {
                            return NewsCardWidget.fromModel(
                              snapshot.data![index],
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 150),
                              child: NewsCardWidget.fromModel(
                                snapshot.data![index],
                              ),
                            );
                          }
                        }),
                      ),
                    );
                  } else {
                    return const Center(
                      child: GFLoader(
                        type: GFLoaderType.square,
                        size: GFSize.LARGE,
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
