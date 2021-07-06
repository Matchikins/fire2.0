import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/model/model_Aluno.dart';
import 'package:cefops/Src/model/model_Publication.dart';
import 'package:cefops/Src/repository/AlunoRepositrory.dart';
import 'package:cefops/Src/repository/PostRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:google_fonts/google_fonts.dart';

String name="Adm";
bool obscure=true;
final ismobile=GetPlatform.isMobile;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<PostModel> futurePost;


  @override
  void initState() {
    super.initState();
    futurePost = FetchPosts(context);


  }
  @override
  void dispose() {
    FetchPosts(context);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final  size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          AppColors.primary,
        AppColors.primaryDark,

        ],
    )
      ),

      child: Center(

        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height:size.height*0.04,),
              FutureBuilder<PostModel>(
                future: futurePost,
                builder: (context, snapshot) {

                  if (snapshot.hasData) {
                    if(snapshot.data!.title.length >=2){
                      obscure=false;

                    }

                    return Container(
                        width: size.width*0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                          BoxShadow(color: obscure? Colors.white :AppColors.orange, spreadRadius: 3),
                      ]
                    )
                  ,

                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Text(snapshot.data!.title,
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                color:AppColors.orange,

                              ),),
                            SizedBox(height: size.height*0.04,),

                        Container( height: size.height/1.5,
                          width: size.width,
                              child: SingleChildScrollView(

                                  child: Text(snapshot.data!.poste,style:TextStyles.titleRegular,
                                  ),),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // By default, show a loading spinner.
                  return CircularProgressIndicator(
                    color: AppColors.background,
                    backgroundColor: AppColors.orange,
                  );
                },
              ),

            ],
          ),
        )
      ),
    );
  }
}

verifyMobile(){
    if(ismobile==true) {
      print("è mobile");
    }}