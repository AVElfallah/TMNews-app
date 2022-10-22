import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:tell_me_news/config/app_route.dart';

import '../../controller/search_controller.dart';
import 'search_filter_widget.dart';
import 'search_futures.dart';

class SearchDialog extends GetView {
  const SearchDialog({Key? key}) : super(key: key);
  static void show(BuildContext context) {
    Get.dialog(const SearchDialog());
  }

  @override
  Widget build(BuildContext context) {
    var searchCtrl = Get.put<SearchController>(
      SearchController(),
      tag: 'search',
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: AnimatedScale(
        scale: MediaQuery.of(context).viewInsets.bottom == 0 ? 1 : 1.1,
        duration: const Duration(milliseconds: 1200),
        curve: Curves.easeInCubic,
        child: SimpleDialog(
          backgroundColor: context.theme.canvasColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('searchbox'.tr),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
              )
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          children: [
            const SearchFilterWidget(),
            SizedBox(
              height: 62,
              child: GFTextFieldPill(
                controller: searchCtrl.searchCtrl,
                editingbordercolor: context.theme.hintColor,
                idlebordercolor: Colors.black,
                borderwidth: 1,
                hintText: 'searchword'.tr,
                iconPrefix: const Icon(Icons.search),
                style: const TextStyle(
                  fontSize: 19,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GFButtonBadge(
                onPressed: () {
                  Get.toNamed(Routes.searchPage);
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
      ),
    );
  }
}
