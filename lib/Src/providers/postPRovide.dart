import 'package:cefops/Src/model/model_Publication.dart';
import 'package:cefops/Src/repository/PostRepository.dart';
import 'package:flutter/material.dart';


class PostProvider with ChangeNotifier {
  PostModel post = PostModel(poste:"" , id: 1,title: "");
  bool loading=true;
  getPostData(context) async{
    post = await FetchPosts(context);
    loading = false;

  }

    notifyListeners();
  }
