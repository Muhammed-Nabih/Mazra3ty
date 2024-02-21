import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazra3ty_app_farmer/src/features/Home/controllers/home/home_cubit.dart';
import 'package:mazra3ty_app_farmer/src/features/Home/screens/home_Screen/tabs/soil_moisture.dart';
import 'package:mazra3ty_app_farmer/src/features/authentication/screens/home_page/overview/overview.dart';
import 'package:mazra3ty_app_farmer/src/features/authentication/screens/home_page/corn/corn.dart';
import 'package:mazra3ty_app_farmer/src/features/Home/screens/home_Screen/tapMaterials.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class HomeModel extends StatefulWidget {
  const HomeModel({Key? key}) : super(key: key);
  @override
  State<HomeModel> createState() => _HomeBodyState();
}

IO.Socket socket = IO.io('http://10.0.2.2:3000', <String, dynamic>{
  'autoConnect': false,
  'transports': ['websocket'],
});

initSocket() {
  socket.connect();
  socket.onConnect((_) {
    print(
        'Connection established A user is connected with socket @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
  });
  socket.on('Statistics', (newMessage) {
    print(
        '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Statistics%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
    print(newMessage);
  });
  socket.onDisconnect((_) => print('Connection Disconnection'));
  socket.onConnectError((err) => print(err));
  socket.onError((err) => print(err));
}

class _HomeBodyState extends State<HomeModel> {
  @override
  void initState() {
    super.initState();
    initSocket();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: Scaffold(
        body: DefaultTabController(
          length: 6,
          child: Column(
            children: [
              Materials(),
              Expanded(
                child: TabBarView(
                  // tab bar view
                  children: [
                    Container(
                      child: Center(
                        child: Overview(),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Cron(),
                      ),
                    ),
                    Container(
                        child: Center(
                          child: SoilMoisture(),
                        ),
                        ),
                    Container(
                      child: Center(
                        child: Text("Barley"),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text("Barley"),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text("Barley"),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
