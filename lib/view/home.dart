import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                  padding: const EdgeInsets.all(0),
                  child: SizedBox(
                    height: constraints.maxHeight * 0.050,
                    width: constraints.maxWidth,
                    child: const Card(
                      margin: EdgeInsets.all(0),
                      child: Text('Menu'),
                    ),
                  )),
              SizedBox(
                height: constraints.maxHeight * 0.050,
                width: constraints.maxWidth * 0.72,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('bestsellers');
                    },
                    child: const Text('Best Sellers')),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: constraints.maxHeight * 0.050,
                width: constraints.maxWidth * 0.72,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('bookreviews');
                    },
                    child: const Text('Book Reviews')),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text(
            'New York Text',
          ),
        ),
        body: SizedBox(
          height: constraints.maxHeight,
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              height: 20,
            ),
            itemCount: 120,
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(10),
              height: constraints.maxHeight * 0.070,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
