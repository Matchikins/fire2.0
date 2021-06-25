import 'package:cefops/Src/model/Aluno_Model.dart';
import 'package:cefops/Src/model/post_model.dart';
import 'package:cefops/Src/repository/AlunoRepositrory.dart';
import 'package:cefops/Src/repository/PostRepository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String name="Adm";
bool obscure=true;
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
    futurePost = fetchPosts(context);


  }
  @override
  void dispose() {
    fetchPosts(context);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(

      child: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: MediaQuery.of(context).size.height*0.04,),
            FutureBuilder<PostModel>(
              future: futurePost,
              builder: (context, snapshot) {

                if (snapshot.hasData) {
                  if(snapshot.data!.title.length >=2){
                    obscure=false;

                  }

                  return Container(
                    decoration: BoxDecoration(
                      color:  Color(0xffd3d3d3),
                        border: Border.all(color: obscure? Colors.white : Color(corAzul) )
                    ),

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
                            child: Text(snapshot.data!.poste,style:GoogleFonts.roboto(fontSize: 24,),
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
        ),
      )
    );
  }
}
