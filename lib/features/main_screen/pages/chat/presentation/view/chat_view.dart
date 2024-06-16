import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: CustomBackAppBar(
         context: context,
         title: "Massages",
         centerTitle: true,
         hasArrowBack: false,
         titleColor: ColorHelper.whiteColor,
         backgroundColor: ColorHelper.mainColor,
         arrowColor: ColorHelper.whiteColor,
         elevation: 3.5,
         shadowColor: ColorHelper.mainColor,
         appBarHeight: FixedVariables.heightScreenQuery(context) * 0.07,
       ),
      body: BlocBuilder<ProfileChatCubit,ProfileChatState>(
        builder: (context,StateProfileChat) {
          if(StateProfileChat is LoadingProfileChatState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if(StateProfileChat is SuccessProfileChatState){
            return Padding(
              padding:  EdgeInsets.symmetric(horizontal: FixedVariables.widthScreenQuery(context)*0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: FixedVariables.heightScreenQuery(context)*0.03,
                  ),

                  // Text(
                  //   "All Messages",
                  //   style: TextStyleHelper.style14B,
                  // ),
                  // SizedBox(
                  //   height: FixedVariables.heightScreenQuery(context) * 0.02,
                  // ),
                  Flexible(
                    child: ListView.builder(
                        itemCount: StateProfileChat.listOfProfileChatData.length,
                        padding: EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              context.read<PrivateChatCubit>().GetAllPrivateChat(context: context, destinationId: StateProfileChat.listOfProfileChatData[index].destination?.id);
                              Navigator.push(context, PageTransition(
                                child: ContentChatView(nameDestination:StateProfileChat.listOfProfileChatData[index].destination!.name ,),
                                type: PageTransitionType.fade,
                                curve: Curves.fastEaseInToSlowEaseOut,
                                duration: Duration(milliseconds: FixedVariables.pageTransition),
                              ));
                            },
                            child: Padding(
                              padding:  EdgeInsets.only(bottom: FixedVariables.heightScreenQuery(context)*0.01),
                              child: CustomPersonChatItem(
                                index: index,
                                listOfItems: StateProfileChat.listOfProfileChatData,
                              ),
                            ),
                          );
                        }),
                  ),

                ],
              ),
            );
          }else {
            return Container(
              child: Text("error"), //todo error
            );
          }
        }
      ),
    );
  }
}
