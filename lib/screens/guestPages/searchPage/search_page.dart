import 'package:flutter/material.dart';
import 'package:pfs/screens/guestPages/home/homePageParts/professionalBoxInHomePage.dart';
import 'package:pfs/screens/guestPages/professional/professionalDetail.dart';
import 'package:pfs/screens/guestPages/searchPage/filterPage.dart';

import '../../../extensions/constants.dart';
import '../../../services/professionalDbService.dart';
import 'boxOfProfessionalService.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List listPosts = [
      {
        'category': 'Dj',
        'name': 'Yessine Jaoua',
        'price': '200',
        'image':
            'https://jardin-secrets.com/image.php?/12435/photo-dracaena-fragrans_krzysztof-ziarnek.jpg'
      },
      {
        'category': 'Traiteur',
        'name': 'Yessine JAOUAOUAA',
        'price': '500',
        'image':
        'https://jardin-secrets.com/image.php?/12435/photo-dracaena-fragrans_krzysztof-ziarnek.jpg'
      }
    ];
    void searchPost(query) {
      final postsWanted = listPosts.where((post) {
        final postCategory = post.category.toLowerCase();
        final postPrice = post.price.toLowerCase();
        final input = query.toLowerCase();
        return postCategory.contains(input) ||postPrice.contains(input);
      }).toList();
      setState(() {
        listPosts = postsWanted;
      });
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.5,
          title: const Text('This is the Search Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 25),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: TextField(
                        onChanged: searchPost,
                        controller: searchController,
                        autofocus: false,
                        style: const TextStyle(
                            fontSize: 15.0, color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search By Category',
                          filled: true,
                          fillColor: const Color(0XFFF8F4F4),
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.clear,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              searchController.clear();
                            },
                          ),
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 0.0, top: 14.0, right: 14),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Ink(
                    decoration: const ShapeDecoration(
                      color: Color(ConstantColors.KPinkColor),
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FilterPage()),
                        );
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      iconSize: 20.0,
                    ),
                  )
                ],
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const BoxOfProfessionalService();
                },
              ))
            ],
          ),
        ));
  }
}
