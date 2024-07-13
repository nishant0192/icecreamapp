import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:icecreamapp/icrecream/model/icecream.dart';

class IcecreamDetailView extends StatelessWidget {
  const IcecreamDetailView({super.key, required this.icecream});

  final Icecream icecream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(icecream.flavor),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Hero(
                    tag: icecream.image,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                          CachedNetworkImageProvider(icecream.image),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "\$${icecream.price.toString()}",
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(icecream.description,
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Toppings :",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Chip(label: Text(icecream.toppings[index])),
                    );
                  },
                  itemCount: icecream.toppings.length,
                ),
              ),
              const Text(
                "Ingredients : ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final ing = icecream.ingredients[index];
                  return ListTile(
                    title: Text(ing.name),
                    subtitle: Text("Quantity : ${ing.quantity}"),
                  );
                },
                itemCount: icecream.ingredients.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
