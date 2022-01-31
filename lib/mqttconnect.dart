// import 'package:mqtt_client/mqtt_client.dart';
// import 'package:mqtt_client/mqtt_server_client.dart';
// import 'dart:convert' show utf8;
//
// Future<MqttServerClient> connect() async {
//   MqttServerClient client =
//   MqttServerClient.withPort('mqtt://mqtt.arduino.obotrons.net', 'mqtt-explorer-79c3501b', 1883);
//   client.logging(on: true);
//   client.onConnected = onConnected;
//   client.onDisconnected = onDisconnected;
//   client.onUnsubscribed = onUnsubscribed;
//   client.onSubscribed = onSubscribed;
//   client.onSubscribeFail = onSubscribeFail;
//   client.pongCallback = pong;
//   client.subscribe("topic/test", MqttQos.atLeastOnce);
//
//
//   final connMessage = MqttConnectMessage()
//       .authenticateAs('arduino', 'arduino@1234')
//       .keepAliveFor(60)
//       .withWillTopic('willtopic')
//       .withWillMessage('Will message')
//       .startClean()
//       .withWillQos(MqttQos.atLeastOnce);
//   client.connectionMessage = connMessage;
//   try {
//     await client.connect();
//   } catch (e) {
//     print('Exception: $e');
//     client.disconnect();
//   }
//
//   client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
//     final MqttPublishMessage message = c[0].payload;
//     final payload =
//     MqttPublishPayload.bytesToStringAsString(message.payload.message);
//
//     print('Received message:$payload from topic: ${c[0].topic}>');
//   });
//
//   return client;
// }
// // connection succeeded
// void onConnected() {
//   print('Connected');
// }
//
// // unconnected
// void onDisconnected() {
//   print('Disconnected');
// }
//
// // subscribe to topic succeeded
// void onSubscribed(String topic) {
//   print('Subscribed topic: $topic');
// }
//
// // subscribe to topic failed
// void onSubscribeFail(String topic) {
//   print('Failed to subscribe $topic');
// }
//
// // unsubscribe succeeded
// void onUnsubscribed(String topic) {
//   print('Unsubscribed topic: $topic');
// }
//
// // PING response received
// void pong() {
//   print('Ping response client callback invoked');
// }
//
