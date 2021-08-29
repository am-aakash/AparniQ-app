// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
// import 'package:provider/provider.dart';
import 'package:ship_qarte/components/colors.dart';

// import 'orders/order.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  ScrollController? _scrollController;
  var top = 0.0;
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _uid;
  String? _name;
  String? _email;
  String? _joinedAt;
  String? _userImageUrl;
  int? _phoneNumber;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController?.addListener(() {
      setState(() {});
    });
    // getData();
  }

  void getData() async {
    // User user = _auth.currentUser;
    _uid = "5725721";

    // print('user.displayName ${user.displayName}');
    // print('user.photoURL ${user.photoURL}');
    // final DocumentSnapshot userDoc = user.isAnonymous
    //     ? null
    //     : await FirebaseFirestore.instance.collection('users').doc(_uid).get();
    // if (userDoc == null) {
    //   return;
    // } else {
    //   setState(() {
    //     _name = userDoc.get('name');
    //     _email = user.email;
    //     _joinedAt = userDoc.get('joinedAt');
    //     _phoneNumber = userDoc.get('phoneNumber');
    //     _userImageUrl = userDoc.get('imageUrl');
    //   });
    // }
    // print("name $_name");
    setState(() {
      _name = "Aakash Chaudhary";
      _email = "akash12121@gmail.com";
      _joinedAt = "12 Sep";
      _phoneNumber = 8255367882;
      _userImageUrl = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    //final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                // leading: Icon(Icons.ac_unit_outlined),
                // automaticallyImplyLeading: false,
                elevation: 0,
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  top = constraints.biggest.height;

                  return Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [COLORS.blueDark, COLORS.blackDark],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp,
                      ),
                    ),
                    child: FlexibleSpaceBar(
                      // collapseMode: CollapseMode.parallax,
                      centerTitle: true,
                      title: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: top <= 110.0 ? 1.0 : 0,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              height: kToolbarHeight / 1.8,
                              width: kToolbarHeight / 1.8,
                              // ignore: prefer_const_constructors
                              decoration: BoxDecoration(
                                // ignore: prefer_const_literals_to_create_immutables
                                boxShadow: [
                                  const BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 1.0,
                                  ),
                                ],
                                shape: BoxShape.circle,
                                // ignore: prefer_const_constructors
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        AssetImage('assets/images/person.png')
                                    //image: NetworkImage(_userImageUrl ??'https://t3.ftcdn.net/jpg/01/83/55/76/240_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg'),
                                    ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              // 'top.toString()',
                              _name ?? 'Guest',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      background: Image(
                        image: AssetImage('assets/images/person.png'),
                        // image: NetworkImage(_userImageUrl ??'https://t3.ftcdn.net/jpg/01/83/55/76/240_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: userTitle(title: 'User Bag')),
                    Divider(thickness: 1, color: Colors.grey),
                    const Material(
                      color: Colors.transparent,
                      child: InkWell(
                        // onTap: () => Navigator.of(context)
                        //     .pushNamed(WishlistScreen.routeName),
                        splashColor: Colors.red,
                        child: ListTile(
                          title: Text('Wishlist'),
                          trailing: Icon(Icons.chevron_right_rounded),
                          leading: Icon(
                            Icons.favorite,
                            color: COLORS.blueDark,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        //Navigator.of(context).pushNamed(CartScreen.routeName);
                      },
                      title: Text('Cart'),
                      trailing: Icon(Icons.chevron_right_rounded),
                      leading: const Icon(
                        Icons.shopping_cart,
                        color: COLORS.blueDark,
                      ),
                    ),
                    const ListTile(
                      // onTap: () => Navigator.of(context)
                      //     .pushNamed(OrderScreen.routeName),
                      title: Text('My Orders'),
                      trailing: Icon(Icons.chevron_right_rounded),
                      leading: Icon(
                        Icons.shopping_bag_outlined,
                        color: COLORS.blueDark,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: userTitle(title: 'User Information'),
                    ),
                    Divider(thickness: 1, color: Colors.grey),
                    userListTile(
                        'Email', _email ?? 'abcdeg@xyz.com', 0, context),
                    userListTile('Phone number', '8849982788', 1, context),
                    userListTile('Shipping address', 'XYZ COLONY, Block 1, XYZ',
                        2, context),
                    userListTile(
                        'joined date', _joinedAt ?? '12 Aug 2021', 3, context),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: userTitle(title: 'User settings'),
                    ),
                    Divider(thickness: 1, color: Colors.grey),
                    ListTileSwitch(
                      // value: themeChange.darkTheme,
                      value: false,
                      leading: Icon(
                        Ionicons.md_moon,
                        color: COLORS.blueDark,
                      ),
                      onChanged: (value) {
                        // setState(() {
                        //   themeChange.darkTheme = value;
                        // });
                      },
                      visualDensity: VisualDensity.comfortable,
                      switchType: SwitchType.cupertino,
                      switchActiveColor: Colors.indigo,
                      title: Text('Dark theme'),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Theme.of(context).splashColor,
                        child: ListTile(
                          onTap: () async {
                            // Navigator.canPop(context)? Navigator.pop(context):null;
                            showDialog(
                                context: context,
                                builder: (BuildContext ctx) {
                                  return AlertDialog(
                                    title: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 6.0),
                                          child: Image.network(
                                            'https://image.flaticon.com/icons/png/128/1828/1828304.png',
                                            height: 20,
                                            width: 20,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Sign out'),
                                        ),
                                      ],
                                    ),
                                    content: Text('Do you wanna Sign out?'),
                                    actions: [
                                      TextButton(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cancel')),
                                      TextButton(
                                          onPressed: () async {
                                            // await _auth.signOut().then(
                                            //     (value) =>
                                            //         Navigator.pop(context));
                                          },
                                          child: Text(
                                            'Ok',
                                            style: TextStyle(color: Colors.red),
                                          ))
                                    ],
                                  );
                                });
                          },
                          title: Text('Logout'),
                          leading: Icon(
                            Icons.exit_to_app_rounded,
                            color: COLORS.blueDark,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          _buildFab()
        ],
      ),
    );
  }

  Widget _buildFab() {
    const double defaultTopMargin = 200.0 - 4.0;
    const double scaleStart = 160.0;
    const double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1;
    // if (_scrollController.hasClients) {
    //   double offset = _scrollController.offset;
    //   top -= offset;
    //   if (offset < defaultTopMargin - scaleStart) {
    //     //offset small => don't scale down

        // scale = 1.0;
    //   } else if (offset < defaultTopMargin - scaleEnd) {
    //     //offset between scaleStart and scaleEnd => scale down

    //     scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
    //   } else {
    //     //offset passed scaleEnd => hide fab
    //     scale = 0.0;
    //   }
    // }

    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          backgroundColor: COLORS.blueDark,
          heroTag: "btn1",
          onPressed: () {},
          child: Icon(Icons.camera_alt_outlined),
        ),
      ),
    );
  }

  // ignore: prefer_final_fields
  List<IconData> _userTileIcons = [
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app_rounded
  ];

  Widget userListTile(
      String title, String subTitle, int index, BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(title),
      subtitle: Text(subTitle),
      leading: Icon(
        _userTileIcons[index],
        color: COLORS.blueDark,
      ),
    );
  }

  Widget userTitle({required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 15),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
      ),
    );
  }
}
