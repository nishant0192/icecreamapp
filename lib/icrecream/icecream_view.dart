import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icecreamapp/icrecream/model/icecream.dart';

class IcecreamView extends StatelessWidget {
  const IcecreamView({super.key});

  Future<List<Icecream>> loadIcecreams() async {
    final rawIcecream = await rootBundle.loadString("assets/icecream.json");
    await Future.delayed(const Duration(seconds: 1));
    final icecreams = IcecreamList.fromJson(rawIcecream);
    return icecreams.icecreams;
  }

  @override
  Widget build(BuildContext context) {
    Icecream? selectedIcream;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Icecream",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "We have something yummy for you",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FutureBuilder(
                  future: loadIcecreams(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      final icecreams = snapshot.data;
                      selectedIcream = icecreams![0];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: MediaQuery.sizeOf(context).width * 2,
                              height: MediaQuery.sizeOf(context).height / 3,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  final icecream = icecreams[index];
                                  return IcecreamCard(icecream: icecream);
                                },
                                scrollDirection: Axis.horizontal,
                                itemCount: icecreams!.length,
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Toppings for you",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final topping = selectedIcream!.toppings[index];
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(selectedIcream!.image),
                                ),
                                title: Text(topping),
                              );
                            },
                            scrollDirection: Axis.vertical,
                            itemCount: selectedIcream!.toppings.length,
                          )
                        ],
                      );
                    } else {
                      return const Center(
                          child: CircularProgressIndicator.adaptive());
                    }
                  })
            ],
          ))
        ],
      ),
    );
  }
}

class IcecreamCard extends StatelessWidget {
  const IcecreamCard({
    super.key,
    required this.icecream,
  });

  final Icecream icecream;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Colors.amber.shade100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(icecream.image, fit: BoxFit.cover),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      icecream.flavor,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text("\$${icecream.price.toString()}",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
