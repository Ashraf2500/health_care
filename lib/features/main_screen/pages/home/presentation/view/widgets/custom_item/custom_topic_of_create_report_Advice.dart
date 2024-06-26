import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';


class CustomTopicOfCreateReportAdvice extends StatelessWidget {
   CustomTopicOfCreateReportAdvice({
    Key? key,
    required this.topicTitle,
    required this.textController,
    required this.currentIndex,
     required this.state
  }) : super(key: key);

  final String topicTitle;
  TextEditingController  textController ;
  ConvertSoundAdviceState  state ;
  int currentIndex ;

  @override
  Widget build(BuildContext context) {
    String lastWordA =  context.read<ConvertSoundAdviceCubit>().lastWordsAdvice;
    return SizedBox(
      height: FixedVariables.heightScreenQuery(context)*0.65,
      child: Padding(
        padding:  EdgeInsets.only(
          top:  FixedVariables.heightScreenQuery(context)*0.02,
        ),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            ListView.builder(
              itemCount: (FixedVariables.heightScreenQuery(context)/40).floor(),
              itemBuilder: (context,index){
                return Padding(
                  padding:  EdgeInsets.only(
                    //bottom: FixedVariables.heightScreenQuery(context)*0.04,
                    bottom: 31,
                  ),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: ColorHelper.gray300,
                  ),
                );
              },
            ),
            Stack(
              children: [
                (  state is  !SpeechListeningAdvice )? TextField(
                    maxLines: null,
                    expands: true,
                    controller: textController,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      hintText: 'write a $topicTitle here . . .',
                      hintStyle: TextStyleHelper.style16R.copyWith(color: ColorHelper.grayText.withOpacity(0.6)),
                      filled: true,
                    )
                ) : SizedBox(),
                (  state is  SpeechListeningAdvice )?Text("$lastWordA"):SizedBox()
              ],
            )

          ],
        ),
      ),
    );
  }
}
