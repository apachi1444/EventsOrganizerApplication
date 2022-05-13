import "package:flutter/material.dart";

class HomePageGuest extends StatefulWidget {
  const HomePageGuest({Key? key}) : super(key: key);

  @override
  State<HomePageGuest> createState() => _HomePageGuestState();
}

class _HomePageGuestState extends State<HomePageGuest> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFFF8),
      body: SingleChildScrollView(
        child: Center(
            child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(0),
                      topLeft: Radius.circular(0),
                      bottomRight: Radius.circular(35),
                      bottomLeft: Radius.circular(35)),
                  color: Color(0XFFFF006B),
                ),
                padding: const EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20.0,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/googleIcon.png"),
                        radius: 17.0,
                      ),
                    ),
                    Text("Welcome Micheal Boston"),
                    ClipOval(
                      child: Material(
                        color: Colors.blue, // Button color
                        child: InkWell(
                          splashColor: Colors.red, // Splash color
                          onTap: () {
                            print("sdlkf");
                          },
                          child: SizedBox(
                              width: 56, height: 56, child: Icon(Icons.menu)),
                        ),
                      ),
                    )
                  ],
                )),

            SizedBox(height: 30),

            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: TextField(
                      autofocus: false,
                      style:
                          TextStyle(fontSize: 15.0, color: Color(0XFFF8F4F4)),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search By Category',
                        filled: true,
                        fillColor: Color(0XFFF8F4F4),
                        prefixIcon: Icon(Icons.search),
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 0.0, top: 14.0, right: 14),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.filter),
                    label: Text("")
                ),
              ],
            ),

            const SizedBox(height: 20),

            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0XFFF8F4F4),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            blurRadius: 0.6,
                            spreadRadius: 0.8,
                            offset: Offset(0, 4))
                      ]),
                )),

            const SizedBox(height: 20),

            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0XFFF8F4F4),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            blurRadius: 0.6,
                            spreadRadius: 0.8,
                            offset: Offset(0, 4))
                      ]),
                )),

            SizedBox(height: 20),

            // this part for the line of forget password and remember me !

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 43.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: [
                          Text("Remember Me "),
                        ],
                      ),
                    ),
                    Container(
                        child: Text("Forget Password?",
                            style: TextStyle(color: Colors.grey[600])))
                  ]),
            ),

            SizedBox(height: 25),

            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0XFFFF006B),
                    borderRadius: BorderRadius.circular(40),
                  ),
                )),

            // this for the line indicating the OR Text with the lines next to the text

            SizedBox(height: 10),

            Row(children: <Widget>[
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 30.0, right: 20.0),
                    child: Divider(
                      color: Colors.black,
                      height: 50,
                    )),
              ),
              Text("OR"),
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 30.0),
                    child: Divider(
                      color: Colors.black,
                      height: 36,
                    )),
              ),
            ]),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/googleIcon.png"),
                    radius: 15,
                    backgroundColor: Color(0xFFC7D0D8),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/facebookIcon.png"),
                    radius: 15,
                    backgroundColor: Color(0xFFC7D0D8),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/instagramIcon.png"),
                    radius: 15,
                    backgroundColor: Color(0xFFC7D0D8),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),
          ]),
        )),
      ),
    );
  }
}
