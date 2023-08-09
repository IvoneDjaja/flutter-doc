import 'package:flutter/material.dart';

import '../drawer.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        drawer: const MainDrawer(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('List Page'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Grid List'),
              Tab(text: 'Horizontal List'),
              Tab(text: 'Mixed List'),
              Tab(text: 'Floating App Bar List'),
              Tab(text: 'Spaced List'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _GridList(),
            _HorizontalList(),
            _MixedList(),
            _FloatingAppBarList(),
            _SpacedList(),
          ],
        ),
      ),
    );
  }
}

class _GridList extends StatelessWidget {
  const _GridList();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        100,
        (index) {
          return Center(
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          );
        },
      ),
    );
  }
}

class _HorizontalList extends StatelessWidget {
  const _HorizontalList();

  @override
  Widget build(BuildContext context) {
    // The TabBarView creates a page view with one child per tab and PageView
    // forces the child to be the same size as the viewport, hence Center is
    // added so that the size of Center is affected and not the SizedBox.
    return Center(
      child: SizedBox(
        height: 300,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 300,
              color: Colors.red,
            ),
            Container(
              width: 300,
              color: Colors.blue,
            ),
            Container(
              width: 300,
              color: Colors.green,
            ),
            Container(
              width: 300,
              color: Colors.yellow,
            ),
            Container(
              width: 300,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}

class _MixedList extends StatelessWidget {
  const _MixedList();

  @override
  Widget build(BuildContext context) {
    final items = List<ListItem>.generate(
      1000,
      (i) => i % 6 == 0
          ? HeadingItem('Heading $i')
          : MessageItem('Sender $i', 'Message body $i'),
    );
    return ListView.builder(
        prototypeItem: ListTile(
          title: items.first.buildTitle(context),
          subtitle: items.first.buildSubtitle(context),
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return ListTile(
            title: item.buildTitle(context),
            subtitle: item.buildSubtitle(context),
          );
        });
  }
}

class _FloatingAppBarList extends StatelessWidget {
  const _FloatingAppBarList();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          title: Text('Floating App Bar'),
          floating: true,
          flexibleSpace: Placeholder(),
          expandedHeight: 200,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(title: Text('Item #$index')),
            childCount: 1000,
          ),
        )
      ],
    );
  }
}

// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains a data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}

class _SpacedList extends StatelessWidget {
  const _SpacedList();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: const IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ItemWidget(text: 'Item 1'),
                Spacer(),
                ItemWidget(text: 'Item 2'),
                Expanded(
                  child: ItemWidget(text: 'Item 3'),
                ),
                ItemWidget(text: 'Item 4'),
                ItemWidget(text: 'Item 5'),
                ItemWidget(text: 'Item 6'),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        child: Center(child: Text(text)),
      ),
    );
  }
}
