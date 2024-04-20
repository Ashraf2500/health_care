import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class ChatBot extends StatelessWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(
        context: context,
        title: "Chat-Bot",
        titleColor: ColorHelper.whiteColor,
        backgroundColor: ColorHelper.mainColor,
        arrowColor: ColorHelper.whiteColor,
        elevation: 4,
        shadowColor: ColorHelper.mainColor,
        appBarHeight: FixedVariables.heightScreenQuery(context) * 0.07,
        hasActions: true,
        actions: [
          IconButton(
            onPressed: () async {
              await showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(FixedVariables.radius16),
                  ),
                ),
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          FixedVariables.widthScreenQuery(context) * 0.04,
                      vertical:
                          FixedVariables.heightScreenQuery(context) * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "Chosen Model",
                            style: TextStyleHelper.style12M,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: ModelsDropdownWidget(),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: Icon(
              Icons.more_vert,
              color: ColorHelper.whiteColor,
            ),
          ),
        ],
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
              child: BlocBuilder<ChatBotCubit, ChatBotState>(
                builder: (context, state) {
                  if (state is ChatBotInitial) {
                    if (state.status == ChatStateStatus.initial) {
                      return Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Hello, Ashraf",
                              style: TextStyleHelper.style18B.copyWith(color: ColorHelper.grayText.withOpacity(0.8)),
                            ),
                            Text(
                              "How can I help you today?",
                              style: TextStyleHelper.style18B.copyWith(color: ColorHelper.grayText.withOpacity(0.8)),
                            ),
                          ],
                        ),
                      );
                    }
                    else {
                      return Padding(
                        padding: EdgeInsets.only(
                            top: FixedVariables.heightScreenQuery(context) * 0.015),
                        child: NotificationListener<ScrollMetricsNotification>(
                          onNotification: (notification) {
                            print(notification.metrics.extentAfter);
                            if (notification.metrics.extentAfter > 12 && context.read<ChatBotCubit>().canScroll==false) {
                              context.read<ChatBotCubit>().scrollListToEnd();

                            }
                            return true;
                          },
                          child: ListView.builder(
                            controller:  context.read<ChatBotCubit>().listScrollController,
                              shrinkWrap: true,
                              itemCount: state.messages.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: CustomMessageItem(
                                    message: state.messages[index].text,
                                    image: state.messages[index].image,
                                    fromUser: state.messages[index].fromUser,
                                  ),
                                );
                              }),
                        ),
                      );
                    }
                  } else {
                    return Center(
                      child: Text("State Error"),
                    );
                  }
                },
              ),
            ),

            Column(
              children: [
                BlocBuilder<ChatBotCubit, ChatBotState>(
                  builder: (context, state) {
                    if (state is ChatBotInitial &&
                        state.status == ChatStateStatus.loading) {
                      return SpinKitThreeBounce(
                        color: ColorHelper.mainColor,
                        size: 16,
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
                SizedBox(
                  height: FixedVariables.heightScreenQuery(context) * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: FixedVariables.widthScreenQuery(context) * 0.77,
                      child: CustomTextFormField(
                        hintText: "How Can I Help You ?",
                        heightFilled: FixedVariables.heightScreenQuery(context) * 0.08,
                        hintStyle: TextStyleHelper.style12B.copyWith(color: ColorHelper.grayText.withOpacity(0.7)),
                        textStyle: TextStyleHelper.style12B,
                        controller: context.read<ChatBotCubit>().textController,
                        borderColor: ColorHelper.mainColor,
                        suffixIcon: GestureDetector(
                          onTap: (){
                            context.read<ChatBotCubit>().sendImagePrompt();
                          },
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: FixedVariables.widthScreenQuery(context)*0.02),
                            child: Icon(
                              Icons.photo,
                              color: ColorHelper.grayText.withOpacity(0.6)
                              ,size: 28,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<ChatBotCubit>().sendMessage(
                            context.read<ChatBotCubit>().textController.text);
                      },
                      child: SvgPicture.asset(
                        ImageHelper.sendMessage,
                        width: FixedVariables.widthScreenQuery(context) * 0.12,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: FixedVariables.heightScreenQuery(context) * 0.02,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
