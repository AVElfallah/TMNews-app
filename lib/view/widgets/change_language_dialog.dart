import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

class ChangeLanguageDialog extends StatelessWidget {
  const ChangeLanguageDialog({Key? key, this.selectArabic, this.selectEnglish})
      : super(key: key);
  final void Function()? selectArabic;
  final void Function()? selectEnglish;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: GFListTile(
        title: Text(
          'applanguage'.tr,
          textAlign: TextAlign.center,
        ),
        icon: const Icon(
          Icons.language,
        ),
      ),
      children: [
        GFListTile(
          title: const Text('اللغة العربية'),
          onTap: selectArabic,
        ),
        const Divider(
          color: Colors.amber,
          indent: 30,
          endIndent: 30,
        ),
        GFListTile(
          title: const Text('English Language'),
          onTap: selectEnglish,
        ),
      ],
    );
  }
}
