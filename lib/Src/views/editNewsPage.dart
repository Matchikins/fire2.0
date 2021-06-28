
import 'package:cefops/Src/model/post_model.dart';
import 'package:cefops/Src/repository/post/putNoticeHomePage.dart';
import 'package:cefops/Src/views/widgets/formsPAge_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class EditNews extends StatefulWidget {
  const EditNews({Key? key}) : super(key: key);

  @override
  _EditNewsState createState() => _EditNewsState();
}
final TextEditingController _controller = TextEditingController();
final titleControler = TextEditingController();
final postController = TextEditingController();
Future<PostModel>? editPost;


class _EditNewsState extends State<EditNews> {
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final String text = _controller.text;
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:
        TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: inputsForms(titleControler, "Insira o titulo", "titulo", ""),

          ),
          Container(
            child: inputsForms(postController, "Insira o post", "post", ""),

          ),
          Container(
            child: TextButton(
              child: Text("Postar"),
              onPressed: (){
                setState(() {
                    print(titleControler.text);
                    print(postController.text);
                  editPost=UpdateNews(titleControler.text, postController.text);
                });

              },
            ),
          )
        ],
      ),
    );
  }
}
