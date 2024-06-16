import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class ContentChatView extends StatelessWidget {
   ContentChatView({
    Key? key,
    required this.nameDestination,
  }) : super(key: key);

  String? nameDestination ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(
        context: context,
        title: "$nameDestination",
        titleColor: ColorHelper.whiteColor,
        backgroundColor: ColorHelper.mainColor,
        arrowColor: ColorHelper.whiteColor,
        elevation: 4,
        shadowColor: ColorHelper.mainColor,
        appBarHeight: FixedVariables.heightScreenQuery(context) * 0.07,
        hasActions: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: FixedVariables.widthScreenQuery(context) * 0.04,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/png_images/background_chatbot.png",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: BlocBuilder<PrivateChatCubit, PrivateChatState>(
                builder: (context, statePrivateChat) {
                  if (statePrivateChat is LoadingPrivateChatState) {
                    return Container(
                      width: FixedVariables.widthScreenQuery(context),
                        height: FixedVariables.heightScreenQuery(context),
                        child: Center(child: CircularProgressIndicator()));
                  }
                  else if(statePrivateChat is SuccessPrivateChatState){
                    return Padding(
                      padding: EdgeInsets.only(
                          top: FixedVariables.heightScreenQuery(context) * 0.015),
                      child: NotificationListener<ScrollMetricsNotification>(
                        onNotification: (notification) {
                          // print(notification.metrics.extentAfter);
                          // if (notification.metrics.extentAfter > 12 && context.read<ChatBotCubit>().canScroll==false) {
                          //   context.read<ChatBotCubit>().scrollListToEnd();
                          //
                          // }
                          return true;
                        },
                        child: Stack(
                          children: [
                            SizedBox(
                              height: FixedVariables.heightScreenQuery(context)*0.78,
                              child: ListView.builder(
                                  controller:  context.read<PrivateChatCubit>().listScrollController,
                                  shrinkWrap: true,
                                  itemCount: statePrivateChat.listOfPrivateChatData.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(vertical: 8),
                                      child: CustomMessageChat(
                                        message: statePrivateChat.listOfPrivateChatData[index].content,
                                        file: statePrivateChat.listOfPrivateChatData[index].file,
                                        fromUser: (statePrivateChat.listOfPrivateChatData[index].source==context.read<CurrentUserDataCubit>().currentUserId)?true:false,
                                      ),
                                    );
                                  }),
                            ),
                            Column(
                              children: [
                                Spacer(),
                                CustomTextFormField(
                                  suffixIcon:Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: SvgPicture.asset(ImageHelper.sendMessage,),
                                  ),
                                  hintText: "Send Message",
                                  backgroundFilled: ColorHelper.grayText.withOpacity(0.2),
                                ),
                                SizedBox(
                                  height: FixedVariables.heightScreenQuery(context)*0.02,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  else {
                    return Center(
                      child: Text("State Error"),
                    );
                  }
                },
              ),
            ),


          ],
        ),
      ),
    );
  }
}
