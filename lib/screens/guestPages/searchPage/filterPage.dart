import 'package:flutter/material.dart';

import '../../../extensions/constants.dart';

var listOfPrices = [
  {'Price': 200},
  {'Price': 200}
];

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filter Your Results')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 15),
        child: Column(
          children: [
            Row(
              children: const [
                Text('Price',
                    style: TextStyle(
                        color: Color(ConstantColors.KPinkColor),
                        fontWeight: FontWeight.bold,
                        fontSize: 25)),
              ],
            ),
            const SizedBox(height : 15),
            const CustomPriceFilter(),
            const SizedBox(height : 15),
            Row(
              children: const [
                Text('Category',
                    style: TextStyle(
                        color: Color(ConstantColors.KPinkColor),
                        fontWeight: FontWeight.bold,
                        fontSize: 25)),
              ],
            ),
            const SizedBox(height : 15),
            const CustomCategoryFilter(),
            const SizedBox(height : 15),
            FloatingActionButton.extended(
              onPressed: () {
                print('hi');
              },
              icon: const Icon(Icons.verified_user),
              label: const Text('Apply Filters'),
              backgroundColor: const Color(ConstantColors.KPinkColor),
            )
          ],
        ),
      ),
    );
  }
}

class CustomCategoryFilter extends StatelessWidget {
  const CustomCategoryFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(spacing: 5, runSpacing: 3, children: const [
        ChoiceChipSelect(name:"Dj"),
        SizedBox(width : 13),
        ChoiceChipSelect(name:"Dj"),
        SizedBox(width : 13),
        ChoiceChipSelect(name:"Dj"),
        SizedBox(width: 15),
        ChoiceChipSelect(name: "Dj"),
      ]),
    );
    // return const ChoiceOfCategoryFilter(name: 'Dj');
  }
}

class CustomPriceFilter extends StatelessWidget {
  const CustomPriceFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        RectangleOfPriceFilter(name : " > 200"),
        RectangleOfPriceFilter(name : " <300 "),
        RectangleOfPriceFilter(name : " <300 "),
      ],
    );
  }
}

class RectangleOfPriceFilter extends StatelessWidget {
  const RectangleOfPriceFilter({Key? key, required this.name}) : super(key: key);
  final String name ;
  @override
  Widget build(BuildContext context) {
    // return InkWell(
    //   onTap: () {
    //     print('hey man');
    //   },
    //   child: Container(
    //       margin: const EdgeInsets.only(top: 10, bottom: 10),
    //       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    //       decoration: BoxDecoration(
    //           color: Colors.white, borderRadius: BorderRadius.circular(15)),
    //       child: const Text(' < 200 ',
    //           style: TextStyle(
    //               color: Color(ConstantColors.KGreenColor), fontSize: 21))),
    // );
    return ChoiceChip(
      label: const Text("<200"),
      labelPadding: const EdgeInsets.all(16),
      labelStyle: const TextStyle(
          color: Color(ConstantColors.KPinkColor),
          fontSize: 16,
          fontWeight: FontWeight.bold),
      onSelected: (bool? newValue) {
        print('hi there!');
      },
      selectedColor: const Color(ConstantColors.KGreenColor),
      clipBehavior: Clip.hardEdge,
      selected: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}

class ChoiceOfCategoryFilter extends StatelessWidget {
  const ChoiceOfCategoryFilter({Key? key, required this.name})
      : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Dj', style: Theme.of(context).textTheme.headline5),
              SizedBox(
                  height: 25,
                  child: Checkbox(
                    value: false,
                    onChanged: (bool? newValue) {},
                  ))
            ],
          ),
        ));
  }
}

class ChoiceChipSelect extends StatelessWidget {
  const ChoiceChipSelect({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(name),
      labelPadding: const EdgeInsets.symmetric(horizontal :25 , vertical : 8),
      labelStyle: const TextStyle(
          color: Color(ConstantColors.KPinkColor),
          fontSize: 16,
          fontWeight: FontWeight.bold),
      onSelected: (bool? newValue) {
        print('hi there!');
      },
      selectedColor: const Color(ConstantColors.KGreenColor),
      clipBehavior: Clip.hardEdge,
      selected: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
