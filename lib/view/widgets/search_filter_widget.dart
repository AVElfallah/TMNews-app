import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tell_me_news/controller/search_controller.dart';
import 'package:tell_me_news/model/search_enums.dart';

import '../../model/news_enums.dart';

class SearchFilterWidget extends StatelessWidget {
  const SearchFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mqsize = MediaQuery.of(context).size;
    var lang = SupportedLanguage.values
        .map(
          (lan) => PopupMenuItem<SupportedLanguage>(
            value: lan,
            child: Text(
              lan.name.toUpperCase(),
            ),
          ),
        )
        .toList();

    var ctrl = Get.find<SearchController>(tag: 'search');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //search query
          StatefulBuilder(builder: (context, setState) {
            return PopupMenuButton(
              icon: const Icon(
                Icons.manage_search,
                size: 40,
              ),
              tooltip: 'to specify where search in',
              position: PopupMenuPosition.under,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              itemBuilder: ((context) {
                return [
                  PopupMenuItem(
                    child: Obx(
                      () => SwitchListTile(
                        onChanged: (val) {
                          ctrl.changeSearchIn(SearchIn.title);
                          setState(() {});
                        },
                        title: const Text('Title'),
                        value: ctrl.searchIn.contains(SearchIn.title),
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    child: Obx(
                      () => SwitchListTile(
                        onChanged: (val) {
                          ctrl.changeSearchIn(SearchIn.description);
                          setState(() {});
                        },
                        title: const Text('Description'),
                        value: ctrl.searchIn.contains(SearchIn.description),
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    child: Obx(
                      () => SwitchListTile(
                          onChanged: (val) {
                            ctrl.changeSearchIn(SearchIn.content);
                            setState(() {});
                          },
                          title: const Text('Content'),
                          value: ctrl.searchIn.contains(SearchIn.content)),
                    ),
                  ),
                ];
              }),
            );
          }),
          //selection language
          PopupMenuButton<SupportedLanguage>(
            constraints: BoxConstraints.expand(
              width: mqsize.width * .35,
              height: mqsize.height * .35,
            ),
            position: PopupMenuPosition.under,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            itemBuilder: ((context) {
              return lang;
            }),
            icon: const Icon(
              Icons.translate,
              size: 35,
            ),
            onSelected: (supported) {
              ctrl.changeLanguage(supported);
            },
          ),

          //from ro
          PopupMenuButton<String>(
            position: PopupMenuPosition.under,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            itemBuilder: ((context) {
              return [
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: () {
                      var now = DateTime.now();
                      showDatePicker(
                        context: context,
                        initialDate: ctrl.from.value,
                        firstDate: DateTime(now.year - 1),
                        lastDate: now,
                      ).then(
                        (from) => ctrl.changefrom(from!),
                      );
                    },
                    label: const Text('From'),
                    icon: const Icon(Icons.date_range),
                  ),
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: ctrl.to.value,
                        firstDate: DateTime(1999),
                        lastDate: DateTime.now(),
                      ).then(
                        (to) => ctrl.changeto(to!),
                      );
                    },
                    label: const Text('To'),
                    icon: const Icon(Icons.date_range),
                  ),
                ),
              ];
            }),
            icon: const Icon(
              Icons.calendar_month,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}