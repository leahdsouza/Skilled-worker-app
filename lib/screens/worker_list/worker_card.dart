import 'package:flutter/material.dart';
import 'package:skilled_worker_app/models/worker.dart';
import 'package:skilled_worker_app/screens/worker_list/Destination.dart';


class WorkerCard extends StatefulWidget {

  final Destination worker;
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


    return GestureDetector(
      onTap:() {
        Navigator.pushNamed(context, '/workerProfile',arguments: {
          'category': widget.worker.category,
          'rate': widget.worker.rate,
          'address': widget.worker.address,
          'distance':widget.worker.distance,
          'name': widget.worker.name
        });
      },
      child: Card(
      color: Colors.grey[100],
      shadowColor: Colors.black,
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
                    CircleAvatar(
                    backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                    // backgroundImage: AssetImage('assets/profile_image.webp'),
                    radius: 45,
                    ),
                  // Image(
                  //   height: 100,
                  //   width: 100,
                  //   image: NetworkImage('https://c8.alamy.com/comp/M4KDT8/handsome-indian-carpenter-or-wood-worker-in-action-isolated-over-white-M4KDT8.jpg'),
                  // ),
                  SizedBox(width: 20,),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.worker.name,
                      style: TextStyle(fontSize: 18,
                          color: Color(0xFF210D41),
                          fontWeight: FontWeight.bold),

                    ),
                    //
                    SizedBox(height: 3,),
                    Text(widget.worker.category,
                      style: TextStyle(fontSize: 16,
                          color: Colors.deepPurple.shade600,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.8
                      ),
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Icon(Icons.location_on_sharp,color: Colors.red, size: 22),
                        SizedBox(width: 6,),
                        Text(
                          "${widget.worker.distance.toStringAsFixed(2)} Km",
                          style: TextStyle(fontSize: 15,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    SizedBox(height: 5,),
                    Text("\₹${widget.worker.rate}",
                      style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16,),
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
    ));
  }
}
