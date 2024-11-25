import 'dart:async';
import 'dart:io';
import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_appwrite/models.dart';

// This Appwrite function will be executed every time your function is triggered
Future<dynamic> main(final context) async {
  // You can use the Appwrite SDK to interact with other services
  // For this example, we're using the Users service
  final client = Client()
      .setEndpoint(Platform.environment['APPWRITE_FUNCTION_API_ENDPOINT'] ?? '')
      .setProject(Platform.environment['APPWRITE_FUNCTION_PROJECT_ID'] ?? '')
      .setKey(context.req.headers['x-appwrite-key'] ?? '');
  final users = Users(client);
  // print('context values by chuksDev => : ${context}');
  context.log('From Logger: context values by chuksDev => ${context}');
  

  try {
    final response = await users.list();
    // Log messages and errors to the Appwrite Console
    // These logs won't be seen by your end users
    context.log('Total users: ' + response.total.toString());
  } catch (e) {
    context.error('Could not list users: ' + e.toString());
  }

  // The req object contains the request data
  if (context.req.path == "/ping") {
    // Use res object to respond with text(), json(), or binary()
    // Don't forget to return a response!
    return context.res.text('Pong');
  }

  return context.res.json({
    "developer": "Edoki Chuks",
    'role': "App Write Functions Expert",
    'motto': 'Build like a team of hundreds_',
    'learn': 'https://appwrite.io/docs',
    'connect': 'https://appwrite.io/discord',
    'getInspired': 'https://builtwith.appwrite.io',
  });
}
