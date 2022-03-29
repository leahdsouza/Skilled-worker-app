import 'package:flutter/material.dart';
import 'package:skilled_worker_app/shared/bottom_navigation.dart';

class WorkerListScreen extends StatefulWidget {
  const WorkerListScreen({Key? key}) : super(key: key);

  @override
  State<WorkerListScreen> createState() => _WorkerListScreenState();
}

class _WorkerListScreenState extends State<WorkerListScreen> {

  static final List<String> workerName = ['Name1', 'Name2', 'Name3',];
  List<String> locationName = ['Andheri', 'Dadar','Virar',];
  List<int> workerPrice = [200, 300, 400];
  List<String> workerImage = [
    'https://c8.alamy.com/comp/M4KDT8/handsome-indian-carpenter-or-wood-worker-in-action-isolated-over-white-M4KDT8.jpg',
    'https://c8.alamy.com/comp/M4KDT8/handsome-indian-carpenter-or-wood-worker-in-action-isolated-over-white-M4KDT8.jpg',
    'https://c8.alamy.com/comp/M4KDT8/handsome-indian-carpenter-or-wood-worker-in-action-isolated-over-white-M4KDT8.jpg',
  ];

  final List<bool> _isFavorited = List.filled(workerName.length, false);
  final List<bool> outline = List.filled(workerName.length,false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF210D41),
        title: Text("Workers", style: TextStyle(fontSize: 22 , color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      bottomNavigationBar: BottomNavigation(currentIndex: 0,),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: workerName.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image(
                                  height: 100,
                                  width: 100,
                                  image: NetworkImage(workerImage[index].toString()),
                                ),
                                // SizedBox(width: 10,),

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(" " +workerName[index].toString(),
                                      style: TextStyle(fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    //
                                    SizedBox(height: 5,),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Icon(Icons.location_on_sharp, size: 22),
                                          ),
                                          TextSpan(
                                            text: " "+locationName[index].toString(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text("  ₹" + workerPrice[index].toString(),
                                      style: TextStyle(fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),

                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        alignment: Alignment.topRight,
                                        onPressed: () =>
                                            setState(() => _isFavorited[index] = !_isFavorited[index]),
                                        icon: _isFavorited[index]
                                            ? Icon(Icons.favorite)
                                            : Icon(Icons.favorite_border),
                                        color: Colors.red,
                                      ),

                                      IconButton(
                                        alignment: Alignment.bottomRight,
                                        onPressed: () =>
                                            setState(() => outline[index] = !outline[index]),
                                        icon: outline[index]
                                            ? Icon(Icons.bookmark)
                                            : Icon(Icons.bookmark_border),
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  })
          )
        ],
      ),
    );
  }
}