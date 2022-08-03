// import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruitmarket/firebase_storage2.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'Data/ini_data_from_could.dart';
import 'Data/mockdata2.dart';
import 'Models/Category Items/category_items.dart';
import 'Models/item_product.dart';
import 'Views/Home Screen UI/home_page5.dart';
import 'Data/initmock_data.dart';
import 'Views/Splash Screen Turtorial/loading_page28.dart';
import 'cloudstorages.dart';
import 'firebase_storage.dart';
import 'get_object_from_cloud.dart';
import 'localstorage.dart';
import 'thu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //init firebase
  await Firebase.initializeApp().whenComplete(() {
    print("Init firebase completed!");
  });

  //init data
  initdata();


  //init Hive
  await Hive.initFlutter();
  Hive.registerAdapter(ItemProductAdapter());
  Hive.registerAdapter(CategoryItemAdapter());
  await Hive.openBox<ItemProduct>('itemproduct');


  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // await FirebaseAppCheck.instance.activate(
  //   webRecaptchaSiteKey: 'recaptcha-v3-site-key',
  // );
  runApp(AppHomePage());
}

class AppHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Full App
    // return MaterialApp(
    //   title: "Fruit Market",
    //   debugShowCheckedModeBanner: false,
    //   home: FirstScreen(),
    // );

    //apart app
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );

    //first screen, ok
    // return MaterialApp(home: FirstScreen(),);

    //man hinh login, ok
    // return MaterialApp(debugShowCheckedModeBanner: false,home: LoginScreen(),);

    //man hinh enter, ok
    // return MaterialApp(home: EnterPhoneScreen(),);

    //man hinh verify, ok
    // return MaterialApp(home: VerifyPhoneScreen(),);

    //man hinh enter info, ok
    // return MaterialApp(home: EnterInfoScreen(),);

    //man hinh Home Screen
    // return MaterialApp(home: HomeScreen(),debugShowCheckedModeBanner: false,);

    //man hinh Home Page
    // return MaterialApp(home: HomePage(),);

    //man hinh Detail sam pham, ok
    // return MaterialApp(home: DetailItem(),);

    //man hinh my account, ok
    // return MaterialApp(home: MyAccountScreen(),);

    //man hinh MyOrder, ok
    // return MaterialApp(home: MyOrder(),);

    //man hinh SettingsScreen, ok
    // return MaterialApp(home: SettingsScreen(),);

    //man hinh AccountSettingsScreen, ok
    // return MaterialApp(home: AccountSettingsScreen(),);

    //man hinh Favourites, ok
    // return MaterialApp(debugShowCheckedModeBanner: false,home: FavouritesScreen(),);

    //man hinh NotificationsScreen, ok
    // return MaterialApp(home: NotificationsScreen(),);

    //man hinh NotificationSettingScreen, ok
    // return MaterialApp(home: NotificationSettingScreen(),);

    //man hinh LanguageSettingScreen, ok
    // return MaterialApp(home: LanguageSettingScreen(),);

    //man hinh ChangeAddressScreen, ok
    // return MaterialApp(home: ChangeAddressScreen(),);

    //man hinh ShoppingCartScreen, ok
    // return MaterialApp(home: ShoppingCartScreen(),debugShowCheckedModeBanner: false,);

    //man hinh HelpScreen, ok
    // return MaterialApp(home: HelpScreen(),);

    //man hinh AddYourCardScreen, ok
    // return MaterialApp(home: AddYourCardScreen(),);

    //man hinh WishListScreen, ok
    // return MaterialApp(home: WishListScreen(billNumber: 999,),);

    //man hinh SplashScreen, ok
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: SplashsScreen(),
    // );

    //man hinh splash screen FirstScreen loadingpage28
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: FirstScreen(),
    // );

    //man hinh loader animated2
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: LoaderAnimated(),
    // );

    //hive storages
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Hivesaves(),
    // );


    //cloud storage
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Firebasetesting(),
    // );

    //test get object
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: GetObjectFromCloud(),
    // );

    //image saving tested
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: FirebaseStorageScreen2(),
    // );

    //man hinh Thu, testing tabbar
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Thu(),
    );
  }

}