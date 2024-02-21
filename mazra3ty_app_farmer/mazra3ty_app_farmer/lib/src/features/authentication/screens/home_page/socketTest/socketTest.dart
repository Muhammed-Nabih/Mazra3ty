import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:mazra3ty_app_farmer/src/features/authentication/screens/home_page/socketTest/sensor_modal.dart';

// D:\Flutter\Graduation Project\mazra3ty_app_farmer\lib\src\features\authentication\screens\home_page\socketTest\sensor_modaldart
class SocketTest extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SensorData>(
      future: apiService
          .fetchSensorData('http://localhost:3000/api/sensor/soil-moisture'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final sensorData = snapshot.data!;
          return Text(
              'Sensor Name: ${sensorData.name}, Value: ${sensorData.value}');
        }
      },
    );
  }
}




/*
class SocketTest extends StatefulWidget {
  const SocketTest({Key? key}) : super(key: key);

  @override
  State<SocketTest> createState() => _SocketTestState();
}

class _SocketTestState extends State<SocketTest> {
  late IO.Socket socket;
  @override
  void initState() {
    initSocket();
    super.initState();
  }

  initSocket() {
    socket = IO.io('localhost:3000/api/sensor', <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket.connect();
    socket.onConnect((_) {
      print('Connection established');
    });
    socket.onDisconnect((_) => print('Connection Disconnection'));
    socket.onConnectError((err) => print(err));
    socket.onError((err) => print(err));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            socket.emit('data', 'Hello');
          },
          child: const Text('Send'),
        ),
      ),
    );
  }
}*/
