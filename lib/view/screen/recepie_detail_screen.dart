import 'package:flutter/material.dart';
import 'package:mr_food/view/widget/ingrident_card_widget.dart';

import '../../controller/model/ingrident_model.dart';
import '../../logic/invoke_ingrident_logic.dart';
import '../widget/title_text_widget.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.image, required this.id});
  final String image;
  final int id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<Ingredients> _ingridentList = [];
  final InvokeIngridentLogic _invokeIngridentLogic = InvokeIngridentLogic();
  var isLoading = false;
  @override
  void initState() {
    super.initState();
    callingIngridentLogic(widget.id);
  }

  callingIngridentLogic(int id) async {
    _ingridentList = await _invokeIngridentLogic.getIngrident(id);
    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const AppBarTitle(firstText: 'Ingrident', secondText: 'List')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ListView.builder(
            itemBuilder: (context, index) {
              final ingrident = _ingridentList[index];
              return IngridentCard(
                ingridentName: ingrident.name ?? 'Error',
                ingridentImage:
                    'https://spoonacular.com/cdn/ingredients_100x100/${ingrident.image}',
                amount: ingrident.amount?.metric?.value.toString() ?? '0',
              );
            },
            itemCount: _ingridentList.length),
      ),
    );
  }
}
// TODO:  get Recipe needs to bee fixed