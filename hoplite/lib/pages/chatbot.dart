// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:flutter/material.dart';
// import 'package:hoplite/const.dart';

// class ChatBotPage extends StatefulWidget {
//   const ChatBotPage({super.key});

//   @override
//   State<ChatBotPage> createState() => _ChatBotPageState();
// }

// class _ChatBotPageState extends State<ChatBotPage> {
//   final List<ChatMessage> displayChat = [];
//   final _openAI = OpenAI.instance.build(
//       token: apiKeys,
//       baseOption: HttpSetup(
//         receiveTimeout: const Duration(seconds: 5),
//       ),
//       enableLog: true);

//   final ChatUser _currentUser = ChatUser(
//     id: "1",
//     firstName: "Sabarish",
//     lastName: "V S",
//   );
//   final ChatUser gptChatUser = ChatUser(
//     id: "2",
//     firstName: "chatGPT",
//   );
//   final List<ChatMessage> messages = [];

//   ////
//   @override
//   void initState() {
//     super.initState();
//     sendInitialRequest();
//   }

//   Future<void> sendInitialRequest() async {
//     const String initialMessageText =
//         "hello my name is sherlin kumar i want you to be a fitness assistant and reply to the messages with fitness content with answers and if it not related to fitness or diet say that \"Please ask something related to fitness\" i you agree to be my fitness assistant please say only \"Hi Sherlin how can i help with you today \"";
//     // Create a ChatMessage with the initial message
//     final initialMessage = ChatMessage(
//         user: _currentUser,
//         createdAt: DateTime.now(),
//         text: initialMessageText);

//     // Add the initial message to the messages list

//     // Call getChatResponse to send the initial message to the API
//     await getChatResponse(initialMessage);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: DashChat(
//           messageOptions: const MessageOptions(
//               textColor: Colors.grey,
//               containerColor: Color(0xff5AF5C4),
//               currentUserContainerColor: Color(0xff5AF5C4),
//               currentUserTextColor: Color(0xff242731)),
//           currentUser: _currentUser,
//           onSend: getChatResponse,
//           messages: messages,
//         ),
//       ),
//     );
//   }

//   Future<void> getChatResponse(ChatMessage m) async {
//     // Convert DashChat messages to maps
//     List<Map<String, dynamic>> messageHistory = messages.reversed.map((m) {
//       if (m.user == _currentUser) {
//         return {
//           'role': Role.user.toString(),
//           'content': m.text,
//         };
//       } else {
//         return {
//           'role': Role.assistant.toString(),
//           'content': m.text,
//         };
//       }
//     }).toList();

//     // Create the request
//     final request = ChatCompleteText(
//       model: GptTurbo0301ChatModel(),
//       messages: messageHistory,
//       maxToken: 200,
//     );
//     final response = await _openAI.onChatCompletion(request: request);
//     if (response != null) {
//       // print('Response: $response');
//       for (var element in response.choices) {
//         if (element.message != null) {
//           setState(() {
//             messages.insert(
//               0,
//               ChatMessage(
//                 user: gptChatUser,
//                 createdAt: DateTime.now(),
//                 text: element.message!.content,
//               ),
//             );
//           });
//         }
//       }
//     } else {
//       // print('Error: No response from the API');
//     }
//   }
// }

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../data/app_data.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final ChatUser _currentUser = ChatUser(
    id: "1",
    firstName: "Sabarish",
    lastName: "V S",
  );
  final ChatUser geminiChatUser = ChatUser(
    id: "2",
    firstName: "Gemini",
  );

  final List<ChatMessage> messages = [];
  @override
  void initState() {
    super.initState();
    // Automatically send an initial request when the page is opened
    sendInitialRequest();
  }

  Future<void> sendInitialRequest() async {
    setState(() {
      messages.add(
        ChatMessage(
          createdAt: DateTime.now(),
          text:
              "Hey there! 🖐️ How's your fitness journey going? 💪 Need some help with workout routines, diet plans, or calorie info? I'm here to assist! 🏋️‍♂️🥗 Let's crush those goals together! 🔥",
          user: geminiChatUser,
        ),
      );
    });

    // Call getChatResponse to send the initial message to the Gemini API
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: DashChat(
          messageOptions: const MessageOptions(
              textColor: Color.fromARGB(255, 0, 0, 0),
              containerColor: Color(0xff5AF5C4),
              currentUserContainerColor: Color(0xff5AF5C4),
              currentUserTextColor: Color(0xff242731)),
          currentUser: _currentUser,
          onSend: getChatResponse,
          messages: messages.reversed.toList(),
        ),
      ),
    ));
  }

  Future<void> getChatResponse(ChatMessage message) async {
    setState(() {
      messages.add(message);
    });

    //Call Gemini API and get response
    String response = await callGeminiAPI(message.text);

    setState(() {
      messages.add(
        ChatMessage(
          createdAt: DateTime.now(),
          text: response,
          user: geminiChatUser,
        ),
      );
    });
  }
}

Future<String> callGeminiAPI(String message) async {
  final model = GenerativeModel(
    model: "gemini-pro",
    apiKey: apiKeys,
  );

  final content = Content.text(message); // Create Content object with text
  final response =
      await model.generateContent([content]); // Pass list of Content objects
  return response.text ?? "No response";
}
