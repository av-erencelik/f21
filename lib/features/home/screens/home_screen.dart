import 'package:f21_demo/core/common/loading_screen.dart';
import 'package:f21_demo/features/auth/controller/auth_controller.dart';
import 'package:f21_demo/features/auth/screens/example_profile_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool toggle = false;
  void logOut(WidgetRef ref) {
    ref.read(authControllerProvider.notifier).logout();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    return user == null
        ? const LoadingScreen()
        : user.birthDate == null
            ? const ExampleProfileData()
            : Scaffold(
                //backgroundColor: const Color(0xFF42A5F5),
                body: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          //padding: EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: Color(0xff764abc),
                            //borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff764def),
                                offset: Offset(0, 7),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              color: Color(0xff764abc),
                              //borderRadius: BorderRadius.circular(40),
                            ),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Çocukların sağlıklı gelişimi için düzenli beslenme, '
                                'yeterli uyku ve oyunlaştırılmış öğrenme ortamları sağlamak önemlidir.'
                                ' Ayrıca, çocukların sağlıklı gelişimini desteklemek için düzenli uyku alışkanlıkları '
                                'oluşturulmalı ve yaşlarına uygun uyku süresi sağlanmalıdır. Bunun yanı sıra, çocuklara'
                                ' oyunlaştırılmış öğrenme ortamları sunularak keşfetme, sosyal etkileşim ve yaratıcılık'
                                ' becerileri geliştirilmelidir.',
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.only(top: 30),
                          decoration: const BoxDecoration(
                            color: Color(0xff764abc),
                            //borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff764def),
                                offset: Offset(0, 7),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                appBar: AppBar(
                  backgroundColor: const Color(0xFF9533FF),
                  actions: [
                    IconButton(
                        icon: toggle
                            ? const Icon(Icons.notifications_off)
                            : const Icon(
                                Icons.notifications_active,
                              ),
                        onPressed: () {
                          setState(() {
                            toggle = !toggle;
                          });
                        }),
                    IconButton(
                        onPressed: () {
                          logOut(ref);
                        },
                        icon: const Icon(Icons.logout)),
                  ],
                  title: const Text('Anasayfa'),
                ),
                //-------------------------------------
                drawer: Drawer(
                  // Add a ListView to the drawer. This ensures the user can scroll
                  // through the options in the drawer if there isn't enough vertical
                  // space to fit everything.
                  child: ListView(
                    // Important: Remove any padding from the ListView.
                    padding: EdgeInsets.zero,
                    children: [
                      const UserAccountsDrawerHeader(
                        decoration: BoxDecoration(color: Color(0xFF9533FF)),
                        accountName: Text(
                          "Adjsnfc Dsdjksf",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        accountEmail: Text(
                          "hdgcjdsgv@gmail.com",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        currentAccountPicture: Icon(Icons.person),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.person,
                        ),
                        title: const Text('Profilim'),
                        onTap: () {
                          // Update the state of the app
                          // ...
                          // Then close the drawer
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.camera,
                        ),
                        title: const Text('Fotoğraflarım'),
                        onTap: () {
                          // Update the state of the app
                          // ...
                          // Then close the drawer
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.settings,
                        ),
                        title: const Text('Ayarlar'),
                        onTap: () {
                          // Update the state of the app
                          // ...
                          // Then close the drawer
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.logout,
                        ),
                        title: const Text('Çıkış yap'),
                        onTap: () {
                          // Update the state of the app
                          // ...
                          // Then close the drawer
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.delete,
                        ),
                        title: const Text('Hesabı sil'),
                        onTap: () {
                          // Update the state of the app
                          // ...
                          // Then close the drawer
                          Navigator.pop(context);
                        },
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: const Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            "İletişim Bilgileri",
                            //style: Theme.of(context).textTheme.caption,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      const AboutListTile(
                        icon: Icon(
                          Icons.info,
                        ),
                        applicationIcon: Icon(
                          Icons.local_play,
                        ),
                        applicationName: 'Biberon App',
                        applicationVersion: '1.0.0',
                        applicationLegalese: '© 2023 Company',
                        aboutBoxChildren: [
                          ///Content goes he.re..
                        ],
                        child: Text('About app'),
                      ),
                      ListTile(
                        leading: const Icon(Icons.privacy_tip),
                        title: const Text("Privacy Policy"),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.contact_mail),
                        title: const Text("Contact us"),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),

                //--------------------------------------

                bottomNavigationBar: ConvexAppBar(
                  backgroundColor: const Color(0xFF9533FF),
                  items: const [
                    TabItem(icon: Icons.child_friendly, title: 'Bebeğim'),
                    TabItem(icon: Icons.home, title: 'Anasayfa'),
                    TabItem(icon: Icons.celebration, title: 'Etkinlik Yolculuğu'),
                  ],
                  onTap: (int i) => print('click index=$i'),
                ),
              );
  }
}