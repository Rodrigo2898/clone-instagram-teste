import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localization/localization.dart';
import 'package:instaclone/src/feature/home/view/widget/bubble_stories.dart';

/*PreferredSizeWidget _minhaBarra(String texto) {
  return AppBar(
    shadowColor: Colors.amber,
    backgroundColor: Colors.black45,
    elevation: 18,
    title: Text(
      texto,
      style: const TextStyle(color: Colors.amber),
    ),
  );
} */

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).canvasColor,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          Expanded(
            child: Text(
              'app_name'.i18n(),
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.apply(fontFamily: 'BillaBong'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Icon(
              Icons.favorite_border,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Icon(
            Icons.send,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }

  Widget _stories(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: SizedBox(
        height: 100,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          scrollDirection: Axis.horizontal, 
          itemCount: 10,
          itemBuilder: (context, index) => BubbleStorie('name $index'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Column(
        children: [
          _stories(context),
         // SingleChildScrollView(
           // child: ,
          //)
        ],
      )
    );
  }
}