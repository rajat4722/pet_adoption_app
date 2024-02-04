import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption_app/presentation/utils/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailsScreen extends StatefulWidget {
  final Map<String, dynamic> petDetails;
  final Function(bool isAdopted, String dateAdopted) onAdoptStatusChanged;

  const DetailsScreen({
    Key? key,
    required this.petDetails,
    required this.onAdoptStatusChanged,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late bool isAdopted;
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 2));

    isAdopted = widget.petDetails["isAdopted"] ?? false;
  }

  void _loadAdoptionStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isAdopted =
          prefs.getBool('adoption_status_${widget.petDetails["id"]}') ?? false;
    });
  }

  void _saveAdoptionStatus(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('adoption_status_${widget.petDetails["id"]}', value);
  }

  void _showAdoptionConfirmationPopup(String petName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blueGrey[900],
          title: const Text(
            'Adoption Successful',
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            'You\'ve now adopted $petName!',
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: const [Colors.red, Colors.blue, Colors.green],
            ),
            Container(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
              ),
            ),
          ],
        );
      },
    );
    // Play the confetti effect when the dialog is shown
    _confettiController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  ConfettiWidget(
                    confettiController: _confettiController,
                    blastDirectionality: BlastDirectionality.explosive,
                    shouldLoop: false,
                    colors: const [Colors.red, Colors.blue, Colors.green],
                  ),
                  Container(
                    width: double.infinity,
                    height: constraints.maxWidth > 600 ? 500 : 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Hero(
                        tag: widget.petDetails["image"],
                        child: Image.network(
                          widget.petDetails["image"],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 120,
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      children: [
                        Card(
                          elevation: 10,
                          color: Colors.grey[900],
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Price",
                                  style: TextStyle(
                                    color: Colors.orangeAccent,
                                  ),
                                ),
                                Text(
                                  pets[10]["price"],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 10,
                          color: Colors.grey[900],
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Age",
                                  style: TextStyle(
                                    color: Colors.orangeAccent,
                                  ),
                                ),
                                Text(
                                  pets[11]["age"],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 10,
                          color: Colors.grey[900],
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Color",
                                  style: TextStyle(
                                    color: Colors.orangeAccent,
                                  ),
                                ),
                                Text(
                                  pets[12]["color"],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    color: Colors.white,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                offset: const Offset(00, 00),
                                blurRadius: 20,
                                spreadRadius: 0,
                                color: Colors.orangeAccent.withOpacity(.25),
                              ),
                            ]),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.blueGrey[900],
                              child: const Icon(
                                Icons.pets_rounded,
                                size: 15,
                                color: Color(0xff53E88B),
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Column(
                            children: [
                              Text(
                                "Rajat Shukla",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text("Pet's Owner",
                                  style: TextStyle(fontSize: 10)),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                offset: const Offset(00, 00),
                                blurRadius: 20,
                                spreadRadius: 0,
                                color: Colors.grey.withOpacity(.25),
                              ),
                            ]),
                            child: const CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.message_rounded,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red[
                                  400], // Set your desired background color
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.call,
                              size: 20,
                              color: Colors.white,
                            ),
                            label: const Text(
                              'Call',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    pets[4]["description"],
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[400]),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.play_arrow_rounded,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: isAdopted
                            ? null
                            : () {
                                // Toggle adoption status when the button is tapped
                                setState(() {
                                  isAdopted = true;
                                });

                                // Notify the parent about the adoption status change
                                widget.onAdoptStatusChanged(
                                    true, DateTime.now().toString());

                                // Show the adoption confirmation popup
                                _showAdoptionConfirmationPopup(
                                    widget.petDetails["name"]);
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isAdopted ? Colors.grey : Colors.red[400],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          child: Text(
                            isAdopted ? 'Adopted' : 'Adopt Me',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }));
  }
}
