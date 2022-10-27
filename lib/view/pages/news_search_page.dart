import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../../config/app_route.dart';
import '../../controller/search_controller.dart';
import '../widgets/search_filter_widget.dart';
import '../widgets/search_futures.dart';

class NewsSearchPage extends StatelessWidget {
  const NewsSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchCtrl = Get.put<SearchController>(
      SearchController(),
      tag: 'search',
    );
    var mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'searchbox'.tr,
          style: TextStyle(
            color: context.theme.colorScheme.onBackground,
          ),
        ),
        elevation: 0,
        backgroundColor: context.theme.colorScheme.background,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: context.theme.colorScheme.onBackground,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, mq.height * .05),
          child: const SearchFilterWidget(),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: searchCtrl.searchCtrl,
              style: const TextStyle(
                fontSize: 19,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(
                  10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                ),
                hintText: 'searchword'.tr,
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: GFButtonBadge(
              onPressed: () {
                Get.toNamed(Routes.searchResultPage);
              },
              elevation: 10,
              text: 'searchnow'.tr,
              textStyle: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom == 0,
            maintainAnimation: true,
            maintainState: true,
            child: const SearchFeatures(),
          )
        ],
      ),
    );
  }
}
