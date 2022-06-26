import 'package:flutter/material.dart';
import 'package:pfs/extensions/utils.dart';

import '../../../extensions/constants.dart';
import '../../../sharedPreferences/SearchFiltersPreferences.dart';

var listOfPrices = [
  {'Price': 200},
  {'Price': 200}
];

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.5,
          title: const Text('Filter Your Results'),
          backgroundColor: const Color(ConstantColors.KPinkColor),
        ),
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
              const SizedBox(height: 15),
              const CustomPriceFilter(),
              const SizedBox(height: 15),
              Row(
                children: const [
                  Text('Category',
                      style: TextStyle(
                          color: Color(ConstantColors.KPinkColor),
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                ],
              ),
              const SizedBox(height: 15),
              const CustomCategoryFilter(),
              const SizedBox(height: 15),
              Row(
                children: const [
                  Text('Localisation',
                      style: TextStyle(
                          color: Color(ConstantColors.KPinkColor),
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                ],
              ),
              const SizedBox(height: 15),
              const CustomLocalisationFilter(),
              const SizedBox(height: 15),
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
        RectangleOfLocalisationFilter(name: 'Dj', image: 'assets/djPhoto.jpg'),
        SizedBox(width: 5),
        RectangleOfLocalisationFilter(
            name: 'Traiteur', image: 'assets/traiteur.jpg'),
        SizedBox(width: 5),
        RectangleOfLocalisationFilter(
            name: 'Neggafa', image: 'assets/neggafa.jpg'),
        SizedBox(width: 5),
        RectangleOfLocalisationFilter(
            name: 'Fiancee', image: 'assets/fiancee.jpg'),
      ]),
    );
    // return const ChoiceOfCategoryFilter(name: 'Dj');
  }
}

class CustomPriceFilter extends StatelessWidget {
  const CustomPriceFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(spacing: 5, runSpacing: 3, children: const [
        RectangleOfLocalisationFilter(
            name: 'Under200', image: 'assets/dollar.png'),
        // SizedBox(width: 5),
        // RectangleOfLocalisationFilter(name: '>200', image: 'assets/dollar.png'),
      ]),
    );
  }
}

class RectangleOfPriceFilter extends StatelessWidget {
  const RectangleOfPriceFilter({Key? key, required this.name})
      : super(key: key);
  final String name;

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
      label: const Text('Under200'),
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

class RectangleOfLocalisationFilter extends StatefulWidget {
  const RectangleOfLocalisationFilter(
      {Key? key, required this.name, required this.image})
      : super(key: key);
  final String name;
  final String image;

  @override
  State<RectangleOfLocalisationFilter> createState() =>
      _RectangleOfLocalisationFilterState();
}

class _RectangleOfLocalisationFilterState
    extends State<RectangleOfLocalisationFilter> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final String keyPreference = '_key' + widget.name;
    print('this is the value of the key in the preference');
    print(keyPreference);
    return ChoiceChip(
      avatar: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(widget.image,
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.17,
                fit: BoxFit.cover)),
      ),
      label: Text(widget.name),
      labelPadding: const EdgeInsets.all(20),
      labelStyle: isSelected
          ? const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)
          : const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      onSelected: (bool newValue) {
        Utils.toggleTheParameterOfSearchPreference(keyPreference, isSelected);
        print(SearchFiltersPreferences.getDj());
        print(Utils.displayValueOfFilterKey(keyPreference));
        setState(() {
          isSelected = !isSelected;
        });
      },
      clipBehavior: Clip.hardEdge,
      selectedColor: const Color(ConstantColors.KGreenColor),
      selected: isSelected,
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
      labelPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
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

class CustomLocalisationFilter extends StatelessWidget {
  const CustomLocalisationFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(spacing: 3, runSpacing: 2, children: const [
        RectangleOfLocalisationFilter(
            name: 'Casablanca', image: 'assets/casablance.jpg'),
        SizedBox(width: 2),
        RectangleOfLocalisationFilter(
            name: 'Agadir', image: 'assets/agadir.jpg'),
        SizedBox(width: 2),
        RectangleOfLocalisationFilter(
            name: 'Marrakech', image: 'assets/marrakech.jpg'),
        SizedBox(width: 8),
      ]),
    );
  }
}
