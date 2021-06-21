import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  // navega para outra tela
  void _selectCategory(BuildContext context) {
    print('teste');
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoriesMealsScreen(
    //         category: category,
    //       );
    //     },
    //   ),
    // );
    Navigator.of(context).pushNamed(
      AppRoutes.CATEGORIES_MEALS,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {_selectCategory(context)},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        // margin: EdgeInsets.fromLTRB(10, 25, 10, 0),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.5),
                category.color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
      ),
    );
  }
}
