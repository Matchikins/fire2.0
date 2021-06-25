import 'package:cefops/Src/model/post_model.dart';
import 'package:cefops/Src/repository/PostRepository.dart';
import 'package:flutter/material.dart';


class PostProvider with ChangeNotifier {
  PostModel post = PostModel(poste:"" , id: 1,title: "");
  bool loading=true;
  getPostData(context) async{
    post = await fetchPosts(context);
    loading = false;

  }

    notifyListeners();
  }
