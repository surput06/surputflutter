import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surput/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    return Scaffold(
        appBar: AppBar(),
        body: Body(
          child: Column(
            children: [
              const Text("List From Api"),
              if (provider.isLoading)
                ListView.separated(
                  itemBuilder: (context, index) {
                    final products = provider.products.products![index];
                    return ListTile(
                      title: Text("$products.title"),
                      isThreeLine: true,
                      subtitle: Text(products.price.toString()),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 50),
                  itemCount: provider.products.products!.length,
                ),
              if (!provider.isLoading) Text("data"),
            ],
          ),
        ));
  }
}

class Body extends StatelessWidget {
  final Widget child;
  const Body({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: child,
      ),
    );
  }
}
