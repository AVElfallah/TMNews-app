import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tell_me_news/controller/darwer_controller.dart';
import 'package:tell_me_news/model/news_model.dart';

import 'package:tell_me_news/view/widgets/categories_widget.dart';

import '../widgets/news_card_widget.dart';

class NewsDisplayer extends StatelessWidget {
  const NewsDisplayer({Key? key}) : super(key: key);

  Future<List<NewsModel>> getHttp() async {
    try {
      const url =
          'https://newsapi.org/v2/top-headlines?apiKey=2afa55caa3924c4080b5f3985e019145&language=en&pageSize=20&page=1';
      var response = await Dio().get(url);
      var res = const JsonDecoder().convert(response.toString());

      return (res["articles"] as List)
          .map((e) => NewsModel.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Widget>> f() async {
    var con = await getHttp();

    return con.map((e) => NewsCardWidget.fromModel(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppDarwerController>(
        tag: 'drawer_ctrl',
        builder: (ctrl) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('News'),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  ctrl.open();
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black54,
                    image: DecorationImage(
                      image: AssetImage('assets/images/person.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            body: ListView(children: [
              const CategoriesWidget(),
              Padding(
                padding: const EdgeInsets.all(10),
                child: FutureBuilder(
                    future: getHttp(),
                    builder:
                        (context, AsyncSnapshot<List<NewsModel>> snapshot) {
                      if (snapshot.hasData) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * .9,
                          child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: ((context, index) {
                              if (index != snapshot.data!.length - 1) {
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
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              )
            ]),
          );
        });
  }
}
