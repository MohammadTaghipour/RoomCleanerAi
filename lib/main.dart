import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:room_cleaner/assets.dart';
import 'package:room_cleaner/room.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.ralewayTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const InputScreen(),
    );
  }
}

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final double startOfRoomA = 50;
  final double startOfRoomB = 350;
  double currentPosOfCleaner = 50;
  bool roomASwitch = true;
  bool roomBSwitch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffABC3DB),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'RoomCleaner',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: const Color.fromARGB(255, 0, 52, 95),
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 6),
            Text(
              'Made with ❤️ by Mohammad Taghipour',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: const Color.fromARGB(255, 0, 52, 95),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 15),
            Container(
              width: 700,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                    )
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Please choose options below and then click on CREATE:',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Select the status of Room A: ',
                          style: TextStyle(fontSize: 24),
                        ),
                        const SizedBox(width: 16),
                        Row(
                          children: [
                            const Text(
                              'Clean',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            const SizedBox(width: 8),
                            CupertinoSwitch(
                              trackColor: Colors.black,
                              activeColor: Colors.black,
                              thumbColor:
                                  !roomASwitch ? Colors.green : Colors.red,
                              value: roomASwitch,
                              onChanged: (value) {
                                setState(() {
                                  roomASwitch = value;
                                });
                              },
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Dirty',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Select the status of Room B: ',
                          style: TextStyle(fontSize: 24),
                        ),
                        const SizedBox(width: 16),
                        Row(
                          children: [
                            const Text(
                              'Clean',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            const SizedBox(width: 8),
                            CupertinoSwitch(
                              trackColor: Colors.black,
                              activeColor: Colors.black,
                              thumbColor:
                                  !roomBSwitch ? Colors.green : Colors.red,
                              value: roomBSwitch,
                              onChanged: (value) {
                                setState(() {
                                  roomBSwitch = value;
                                });
                              },
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Dirty',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Text('Select the current room of RoomCleaner:',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 24),
                    Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  currentPosOfCleaner = startOfRoomA;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 20)
                                ]),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: RoomWidget(
                                      RoomObject(RoomLabel.A, roomASwitch),
                                      width: 250),
                                ),
                              ),
                            ),
                            const SizedBox(width: 50),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  currentPosOfCleaner = startOfRoomB;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 20)
                                ]),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: RoomWidget(
                                      RoomObject(RoomLabel.B, roomBSwitch),
                                      width: 250),
                                ),
                              ),
                            ),
                          ],
                        ),
                        AnimatedPositioned(
                            duration: const Duration(seconds: 1),
                            left: currentPosOfCleaner,
                            top: 130,
                            child: Image.asset(
                              cleanerRobot,
                              width: 70,
                            ))
                      ],
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        RoomObject roomA = RoomObject(RoomLabel.A, roomASwitch);
                        RoomObject roomB = RoomObject(RoomLabel.B, roomBSwitch);
                        RoomLabel currentRoom =
                            (currentPosOfCleaner == startOfRoomA)
                                ? RoomLabel.A
                                : RoomLabel.B;
                        Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => MainScreen(
                            roomA: roomA,
                            roomB: roomB,
                            currentRoom: currentRoom,
                          ),
                        ));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Create",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // style: ButtonStyle(
                      //     fixedSize: MaterialStateProperty.all(Size(150, 50))),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  // initialize
  RoomLabel currentRoom;
  final RoomObject roomA;
  int counter = 0;
  final RoomObject roomB;
  RoomObject? currentRoomObject;
  final double startOfRoomA = 0;
  final double endOfRoomA = 470;
  final double startOfRoomB = 770;
  final double endOfRoomB = 1230;
  final double insideRooms = 390;
  double? currentPosLeft;
  String txtLog = '';

  MainScreen(
      {super.key,
      required this.roomA,
      required this.currentRoom,
      required this.roomB}) {
    if (currentRoom == RoomLabel.A) {
      currentRoomObject = roomA;
      currentPosLeft = startOfRoomA;
    } else {
      currentRoomObject = roomB;
      currentPosLeft = startOfRoomB;
    }
  }
  @override
  State<MainScreen> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // widget.currentPosLeft = widget.startOfRoomA;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffABC3DB),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 150),
        child: Column(children: [
          Stack(
            children: [
              Row(
                children: [
                  RoomWidget(widget.roomA),
                  RoomWidget(widget.roomB),
                ],
              ),
              AnimatedPositioned(
                onEnd: () {
                  Future.delayed(const Duration(seconds: 3)).then((value) {
                    startCleaner();
                  });
                },
                duration: const Duration(seconds: 4),
                left: widget.currentPosLeft,
                top: widget.insideRooms,
                child: const CleanerRobot(),
              )
            ],
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              initializeCleaner();
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Start Cleaning",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            // style: ButtonStyle(
            //     fixedSize: MaterialStateProperty.all(Size(150, 50))),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Back",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            // style: ButtonStyle(
            //     fixedSize: MaterialStateProperty.all(Size(150, 50))),
          ),
          const SizedBox(height: 25),
          const Text(''),
        ]),
      ),
    );
  }

  void startCleaner() {
    if (!widget.roomA.isDirty && !widget.roomB.isDirty) {
      // widget.txtLog += 'All Rooms Are Clean!\n';
      if (widget.counter >= 2) {
        return;
      }
      goToNextRoom();
      widget.counter++;
    } else {
      if (widget.currentRoomObject!.isDirty) {
        cleanTheRoom(widget.currentRoomObject!);
      } else {
        goToNextRoom();
      }
    }
  }

  void cleanTheRoom(RoomObject roomObject) {
    if (roomObject.isDirty) {
      {
        if (roomObject.roomLabel == RoomLabel.A) {
          setState(() {
            widget.currentPosLeft = widget.endOfRoomA;
          });
        } else {
          setState(() {
            widget.currentPosLeft = widget.endOfRoomB;
          });
        }
      }
      Future.delayed(const Duration(seconds: 4)).then((value) {
        setState(() {
          roomObject.isDirty = false;
        });
      });
      widget.txtLog += ('Room ${roomObject.roomLabel.name} Cleaned\n');
    } else {
      widget.txtLog += ('Room ${roomObject.roomLabel.name} is CLean\n');
    }
  }

  void goToNextRoom() {
    if (widget.currentRoom == RoomLabel.A) {
      widget.currentRoom = RoomLabel.B;
      setState(() {
        widget.currentPosLeft = widget.startOfRoomB;
        widget.currentRoomObject = widget.roomB;
      });
    } else {
      widget.currentRoom = RoomLabel.A;
      setState(() {
        widget.currentPosLeft = widget.startOfRoomA;
        widget.currentRoomObject = widget.roomA;
      });
    }
    widget.txtLog += ('Going to room: ${widget.currentRoom.name}\n');
    widget.txtLog += ('robot is in room: ${widget.currentRoom.name}\n');
  }

  void initializeCleaner() {
    widget.txtLog = ('Cleaner initialized\n');
    startCleaner();
  }
}

class RoomWidget extends StatelessWidget {
  final RoomObject _roomObject;
  double? width = 0;

  RoomWidget(this._roomObject, {super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(_roomObject.isDirty ? dirtyRoom : cleanRoom,
            width: width == 0 || width == null
                ? MediaQuery.of(context).size.width / 2
                : width),
        Container(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
          decoration: BoxDecoration(
              color: Colors.white70, borderRadius: BorderRadius.circular(15)),
          margin: const EdgeInsets.only(left: 10, top: 10),
          child: Text(
            _roomObject.roomLabel == RoomLabel.A ? 'Room A' : 'Room B',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class CleanerRobot extends StatelessWidget {
  const CleanerRobot({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 20,
          right: 0,
          child: Container(
            height: 3,
            width: 100,
            decoration: const BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)]),
          ),
        ),
        Image.asset(
          cleanerRobot,
          width: 200,
        ),
      ],
    );
  }
}
