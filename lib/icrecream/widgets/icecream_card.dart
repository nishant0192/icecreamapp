import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:icecreamapp/icrecream/model/icecream.dart';

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
            Hero(
                tag: icecream.image,
                child: CachedNetworkImage(
                    imageUrl: icecream.image, fit: BoxFit.cover)),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
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
