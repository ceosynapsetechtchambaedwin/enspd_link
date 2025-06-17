import 'package:enspd_link/viewmodels/news_viewmodel.dart';
import 'package:enspd_link/widgets/publication_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PublicationListScreen extends StatelessWidget {
  const PublicationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Publications")),
      body: Consumer<NewsViewmodel>(
        builder: (context, vm, _) {
          if (vm.isLoading) return Center(child: CircularProgressIndicator());
          if (vm.publications.isEmpty)
            return Center(child: Text("Aucune publication validée"));
          return ListView.builder(
            itemCount: vm.publications.length,
            itemBuilder: (context, index) {
              return PublicationCard(newsModel: vm.publications[index]);
            },
          );
        },
      ),
    );
  }
}
