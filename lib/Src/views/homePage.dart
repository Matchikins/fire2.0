import 'package:cefops/Src/model/user_model.dart';
import 'package:cefops/Src/repository/PostRepository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String name="Adm";
int corLaranja=0xffFD7E14;
int corAzul=0xff15355C;
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
    futurePost = fetchPosts();
  }
@override
  void dispose() {
    fetchPosts();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Center(child: Text("Bem Vindo ${name}",
            style: TextStyle(fontWeight:FontWeight.bold,
                    fontSize: 32,
            ),
          ),
          ),
          Center(child: Text("Essas São as Últimas Notícias da Almeida Santos"),),
          SizedBox(height: MediaQuery.of(context).size.height*0.04,),
          FutureBuilder<PostModel>(
            future: futurePost,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: Column(
                    children: [
                      Text(snapshot.data!.title,
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold

                        ),),
                      SizedBox(height: MediaQuery.of(context).size.height*0.04,),

                      Container(
                          width: MediaQuery.of(context).size.width/2,
                          child: Text(snapshot.data!.poste,style:GoogleFonts.notoSans()
                          ),),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator(
                color: Color(corAzul),
                backgroundColor: Color(corLaranja),
              );
            },
          ),

        ],
      )
    );
  }
}
