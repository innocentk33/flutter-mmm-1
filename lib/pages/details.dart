import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Désordre page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/notre-salle.jpg',
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 16.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Désordre',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          Text('18 rue de la République'),
                          Text('35000 Rennes'),
                        ],
                      ),
                      FavWidget(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 70,
                          child: Column(
                            children: [Icon(Icons.phone, color: Colors.blue), Text('Appeler')],
                          ),
                        ),
                        Container(
                          height: 70,
                          child: Column(
                            children: [Icon(Icons.pin_drop, color: Colors.blue), Text('Appeler')],
                          ),
                        ),
                        Container(
                          height: 70,
                          child: Column(
                            children: [Icon(Icons.share, color: Colors.blue), Text('Appeler')],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(AppLocalizations.of(context)!.restaurantDescription),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FavWidget extends StatefulWidget {
  const FavWidget({super.key});

  @override
  State<FavWidget> createState() => _FavWidgetState();
}

class _FavWidgetState extends State<FavWidget> {
  bool _liked = false;
  int _nbLikes = 156;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => setState(() {
            _nbLikes = _liked ? (_nbLikes - 1) : (_nbLikes + 1);
            _liked = !_liked;
          }),
          child: Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(
                _liked ? Icons.star : Icons.star_border_outlined,
                color: Colors.redAccent,
              )),
        ),
        Text("$_nbLikes"),
      ],
    );
  }
}
