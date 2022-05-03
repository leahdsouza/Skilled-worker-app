import 'package:flutter/material.dart';
import 'package:skilled_worker_app/models/worker.dart';


class WorkerCard extends StatefulWidget {

  final Worker worker;
  final int index;

  WorkerCard({required this.worker, required this.index});

  @override
  State<WorkerCard> createState() => _WorkerCardState();
}

class _WorkerCardState extends State<WorkerCard> {
  @override
  Widget build(BuildContext context) {

    final List<bool> _isFavorited = List.filled(widget.worker.name.length, false);
    final List<bool> outline = List.filled(widget.worker.name.length,false);


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
                  image: NetworkImage('https://c8.alamy.com/comp/M4KDT8/handsome-indian-carpenter-or-wood-worker-in-action-isolated-over-white-M4KDT8.jpg'),
                ),
                // SizedBox(width: 10,),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.worker.name,
                      style: TextStyle(fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    //
                    SizedBox(height: 5,),
                    Text(widget.worker.category,
                      style: TextStyle(fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.location_on_sharp, size: 22),
                          ),
                          // TextSpan(
                          //   text: widget.worker.name,
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text("\₹${widget.worker.rate}",
                      style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),

                  ],
                ),
                // Expanded(
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.end,
                //     children: [
                //       IconButton(
                //         alignment: Alignment.topRight,
                //         onPressed: () =>
                //             setState(() => _isFavorited[widget.index] = !_isFavorited[widget.index]),
                //         icon: _isFavorited[widget.index]
                //             ? Icon(Icons.favorite)
                //             : Icon(Icons.favorite_border),
                //         color: Colors.red,
                //       ),
                //
                //       IconButton(
                //         alignment: Alignment.bottomRight,
                //         onPressed: () =>
                //             setState(() => outline[widget.index] = !outline[widget.index]),
                //         icon: outline[widget.index]
                //             ? Icon(Icons.bookmark)
                //             : Icon(Icons.bookmark_border),
                //         color: Colors.black,
                //       ),
                //     ],
                //   ),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
