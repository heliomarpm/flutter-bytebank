import 'package:flutter/material.dart';


class ListDemo extends StatelessWidget {
  const ListDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(16),
                child: Stack(
                  children: <Widget>[
                    Card(
                      elevation: 12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      color: Colors.white,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 36),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: const LinearGradient(
                              colors: [Color(0xFF213B6C), Color(0xFF0059A5)]),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const FlutterLogo(size: 48),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Title of the Card',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(color: Colors.white),
                                  ),
                                  Text('Some description',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(color: Colors.white)),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.navigate_next,
                              size: 36,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 8,
                      top: 8,
                      child: Icon(
                        Icons.star,
                        size: 32,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class ColumnDemo extends StatelessWidget {
  const ColumnDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Center(
          child: Card(
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const FlutterLogo(size: 48),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Title of the Card',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text('Some description',
                          style: Theme.of(context).textTheme.headline6),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RowDemo extends StatelessWidget {
  const RowDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(16),
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36),
              child: Row(
                children: <Widget>[
                  const FlutterLogo(size: 48),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Title of the Card',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text('Some description',
                            style: Theme.of(context).textTheme.headline6),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.navigate_next,
                    size: 36,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StackDemo extends StatelessWidget {
  const StackDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Stack(
              children: <Widget>[
                Opacity(
                  opacity: 1,
                  child: Card(
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 36),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const FlutterLogo(size: 48),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Title of the Card',
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                Text('Some description',
                                    style:
                                        Theme.of(context).textTheme.headline6),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.navigate_next,
                            size: 36,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 8,
                  top: 8,
                  child: Icon(Icons.star, color: Colors.amber, size: 36),
                ),
                // Positioned.fill(
                //     child: Icon(
                //   Icons.block,
                //   size: 72,
                // )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Stack(
              children: <Widget>[
                Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 36),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF213B6C), Color(0xFF0059A5)]),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.pink,
                            blurRadius: 12,
                            offset: Offset(3, 12)),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const FlutterLogo(size: 48),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Title of the Card',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.white),
                              ),
                              Text('Some description',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(color: Colors.white)),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.navigate_next,
                          size: 36,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  left: 8,
                  top: 8,
                  child: Icon(
                    Icons.star,
                    size: 32,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
