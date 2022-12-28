
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:line_icons/line_icons.dart';
import 'package:vedio_call_audio_call/screens/massage/massage_screen.dart';
import 'package:vedio_call_audio_call/util/theme/app_colors.dart';
import 'package:vedio_call_audio_call/util/theme/text.styles.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
   backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top:4,left: 15,right: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Padding(
                  padding:  const EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    children: [
                      Text("Chat",style: latoStyle700Bold.copyWith(fontSize: 30,),),
                      const Spacer(),
                      const SizedBox(
                          height: 20,
                          width: 20,
                          child: Image(image: AssetImage("assets/icon/edit.png"),color: Colors.black45,)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:  const EdgeInsets.only(left: 10,right: 10),
                  child: Container(
                    height: 40,
                    width: width*0.9,
                    decoration: BoxDecoration(
                      color: AppColors.scaffold,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:Padding(
                      padding: const EdgeInsets.only(left: 10,bottom: 5,),
                      child: TextField(

                        decoration: InputDecoration(
                            border: InputBorder.none,
                          icon: const Icon(CupertinoIcons.search),
                          hintText: "Search for chat & background",
                          hintStyle: latoStyle500Medium.copyWith(color: Colors.grey)

                        ),
                      ),
                    ),


                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding:  const EdgeInsets.only(left: 10,right: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 2,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            Get.to(const Massage());
                          },
                          child: Container(
                            height: 70,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               const CircleAvatar(
                                 radius: 30,
                                 backgroundColor: Colors.green,
                                 child: CircleAvatar(
                                   radius: 28,
                                   backgroundColor: Colors.white,
                                   child: CircleAvatar(
                                     radius: 26,
                                     backgroundColor: Colors.grey,
                                   ),
                                 ),
                               ),
                               Padding(
                                 padding:  const EdgeInsets.only(top: 15,left: 10),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                     Text("S M Tanvir Hasan Faysal",style: latoStyle800ExtraBold,),
                                     Text("Good morning",style:latoStyle500Medium.copyWith(color: Colors.grey),),
                                   ],
                                 ),
                               ),
                               const SizedBox(width:20,),
                               Padding(
                                 padding:  const EdgeInsets.only(top: 10),
                                 child: Row(
                                   children: [
                                     const Icon(CupertinoIcons.checkmark_alt,color: Colors.grey,size: 15,),
                                     Text("today: 07.06",style: latoStyle400Regular.copyWith(fontSize: 10,color: Colors.grey),),

                                   ],
                                 ),
                               )
                             ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),

      ),
    );
  }
}
