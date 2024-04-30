import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:interv_you/data_fetching/answers_post.dart';
import 'package:interv_you/data_fetching/questions_get.dart';
import 'package:interv_you/global/global_layout.dart';
import 'package:interv_you/global/questions.dart';
import 'package:interv_you/interview/message_bubble_widget.dart';
import '../evaluation/evaluation_screen.dart';
import 'message_input_field.dart';
import 'progress_bar_widget.dart';

class InterviewScreen extends StatefulWidget {
  const InterviewScreen({super.key});

  @override
  State<InterviewScreen> createState() => _InterviewScreenState();
}

class _InterviewScreenState extends State<InterviewScreen> {
  final List<Map<String, dynamic>> messages = [];
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  Map<String, QuestionList>? questionMap;
  int limit = 0;
  double progress = 0.0;
  int counter = 0;

  bool isLoadingFirstMessage = true;

  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
    fetchQuestions().then((fetchedQuestionMap) async {
      // Add a delay before setting the state
      await Future.delayed(const Duration(seconds: 2));
      if (fetchedQuestionMap.containsKey('1')) {
        setState(() {
          questionMap = fetchedQuestionMap;
          limit = questionMap?['1']!.questions.length ?? 0;
          // Insert the first question into the messages list
          messages.insert(0, {
            'text': questionMap!['1']!.questions[counter].question,
            'isOwnMessage': false
          });
          progress += 1 / limit;
          isLoadingFirstMessage = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: FutureBuilder<Map<String, QuestionList>>(
                    future: fetchQuestions(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        questionMap = snapshot.data;
                        limit = questionMap!['1']!.questions.length;
                        if (messages.isEmpty && counter > 0) {
                          messages.insert(0, {
                            'text':
                                questionMap!['1']!.questions[counter].question,
                            'isOwnMessage': false
                          });
                        }
                        return ListView.builder(
                          reverse: true,
                          itemCount:
                              messages.length + (isLoadingFirstMessage ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (isLoadingFirstMessage && index == 0) {
                              return const CircularProgressIndicator(); // Loading indicator for the first message
                            }
                            return MessageBubble(
                              message: messages[index -
                                  (isLoadingFirstMessage ? 1 : 0)]['text'],
                              isOwnMessage: messages[
                                      index - (isLoadingFirstMessage ? 1 : 0)]
                                  ['isOwnMessage'],
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
                MessageInputField(
                  controller: controller,
                  focusNode: focusNode,
                  onSubmitted: (text) async {
                    if (text.isNotEmpty) {
                      setState(() {
                        messages
                            .insert(0, {'text': text, 'isOwnMessage': true});
                        controller.clear();
                        focusNode.requestFocus();
                        counter++; // Increment the counter
                      });

                      final localContext = context;

                      await Future.delayed(const Duration(milliseconds: 500));

                      setState(() {
                        // Check if there is a next question
                        if (counter < limit) {
                          String nextQuestion =
                              questionMap!['1']!.questions[counter].question;
                          messages.insert(
                              0, {'text': nextQuestion, 'isOwnMessage': false});
                          progress += 1 /
                              limit; // Update progress after inserting the next question
                        }
                      });

                      if (progress >= 1) {
                        Navigator.push(
                          // ignore: use_build_context_synchronously
                          localContext,
                          MaterialPageRoute(
                            builder: (context) => GlobalAppBarScreen(
                              title: 'Evaluation',
                              child: EvaluationScreen(
                                score: 0.8,
                              ),
                            ),
                          ),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ProgressBar(progress: progress),
          ),
        ],
      ),
    );
  }
}
