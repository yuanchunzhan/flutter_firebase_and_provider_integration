import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_firebase_and_provider_integration/components/info_card.dart';
import 'package:flutter_firebase_and_provider_integration/model/StatusCodeModel.dart';
import 'package:flutter_firebase_and_provider_integration/provider/AuthModel.dart';
import 'package:flutter_firebase_and_provider_integration/screens/index_page.dart';
import 'package:flutter_firebase_and_provider_integration/screens/listviews.dart';
import 'package:flutter_firebase_and_provider_integration/screens/login_page.dart';
import 'package:flutter_firebase_and_provider_integration/screens/paginatedDataTable.dart';
import 'package:provider/provider.dart';
import 'constant.dart';
import 'firebase_options.dart';
import 'main_scaffold.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AuthModel(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'integration',
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: backgroundColor,
            textTheme:
                GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)
                    .apply(bodyColor: basicTextColor),
            canvasColor: secondaryColor,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => MainScaffold(
                  body: IndexPage(),
                  title: 'Home Page',
                  greeting: 'welcome',
                ),
            '/login': (context) => const LoginPage(),
            '/listview': (context) => MainScaffold(
                body: MyListView(),
                title: 'ListView Widget',
                greeting: 'please scroll'),
            '/datatable': (context) => MainScaffold(
                body: const PageDataTable(),
                title: 'Paginated DataTable',
                greeting: 'Hello'),
          },
          onGenerateRoute: (settings) {
            var uri = Uri.parse(settings.name!);
            if (uri.pathSegments.first == 'code') {
              var code = uri.pathSegments[1];
              return MaterialPageRoute(
                  settings: RouteSettings(
                    name: settings.name,
                  ),
                  builder: (context) => MainScaffold(
                        body: InfoCard(StatusCode.getStatusByCode(code)),
                        title: 'Status Code Information',
                        greeting: 'Hello',
                      ));
            }
          },
        ));
  }
}
