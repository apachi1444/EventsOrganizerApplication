import 'package:flutter/material.dart';
import 'package:pfs/screens/guestPages/home/homePageParts/professionalBoxInHomePage.dart';
import 'package:pfs/screens/guestPages/professional/professionalDetail.dart';
import 'package:pfs/screens/guestPages/searchPage/filterPage.dart';

import '../../../extensions/constants.dart';
import '../../../services/professionalDbService.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void clearSearch() {
      searchController.clear();
    }

    void searchPost(query) {
      // final postsWanted = listPosts.where((post){
      //   final postTitle = post.title.toLowerCase();
      //   final input = query.toLowerCase();
      // }).toList();
      // setState(() {
      //   listPosts = postsWanted;
      // });
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.5,
          title: const Text("This is the Search Page"),
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
              // const Icon(Icons.search, size: 200),
              // const Text(
              //   'Search Twitter...',
              //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              // ),
              // Container(
              //     margin: const EdgeInsets.only(right: 5),
              //     width: MediaQuery.of(context).size.width * 0.1,
              //     height: MediaQuery.of(context).size.height * 0.1,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(15),
              //       color: Colors.white,
              //     ),
              //     child: IconButton(
              //       icon: const Icon(Icons.menu,
              //           color: Color(ConstantColors.KPinkColor)),
              //       onPressed: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const FilterPage()),
              //         );
              //       },
              //     )),
              Expanded(
                  child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Color(ConstantColors.KPinkColor),
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ListTile(
                          tileColor: Colors.white,
                          leading: const Image(
                            image: NetworkImage(
                                'https://jardin-secrets.com/image.php?/12435/photo-dracaena-fragrans_krzysztof-ziarnek.jpg'),
                          ),
                          title: const Text('DJ Category'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(height: 6),
                              Text('Yessine Jaoua'),
                              SizedBox(height: 6),
                              Text('Price : 200'),
                            ],
                          ),
                          isThreeLine: true,
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProfessionalDetail()),
                              );
                            },
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                primary: const Color(ConstantColors.KPinkColor),
                                // Background color
                                onPrimary: Colors
                                    .white, // Text Color (Foreground color)
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ProfessionalDetail()),
                                );
                              },

                              icon: const Icon(
                                Icons.remove_red_eye_sharp,
                                size: 15.0,
                              ),
                              label: const Text('See More'), // <-- Text
                            ),
                          )),
                    ),
                  );
                },
              ))
            ],
          ),
        ));
  }
}
