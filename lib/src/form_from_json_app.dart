import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../form_from_json.dart';
import 'core/services/clients/uno_client.dart';
import 'data_by_url/domain/usecases/get_data_by_url_usecase.dart';
import 'data_by_url/external/datasources/get_data_by_url_datasource.dart';
import 'data_by_url/infra/repositories/get_data_by_url_repository.dart';
import 'form_converter/domain/usecases/component_from_json_usecase.dart';
import 'form_converter/infra/repositories/form_from_json_repository.dart';
import 'form_converter/presenter/page/form_widget_page.dart';
import 'form_converter/presenter/store/form_widget_store.dart';

class FormFromJsonApp extends StatelessWidget {
  final Submission submission;
  final FormData data;
  const FormFromJsonApp({
    Key? key,
    required this.submission,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => UnoClient()),
        Provider(
          create: (context) => GetDataByUrlDatasource(
            context.read<UnoClient>(),
          ),
        ),
        Provider(
          create: (context) => GetDataByUrlRepository(
            context.read<GetDataByUrlDatasource>(),
          ),
        ),
        Provider(
          create: (context) => GetDataByUrlUsecase(
            context.read<GetDataByUrlRepository>(),
          ),
        ),
        Provider(
          create: (context) => GlobalFormController(
            context: context,
            formData: data,
            submission: submission,
          ),
        ),
        Provider(
          create: (context) => FormFromJsonRepository(),
        ),
        Provider(
          create: (context) => FormFromJsonUsecase(
            repository: context.read<FormFromJsonRepository>(),
          ),
        ),
        Provider(
          create: (context) => FormWidgetStore(
            usecase: context.read<FormFromJsonUsecase>(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xff6360FE),
          //mudar o theme das tabs
          tabBarTheme: const TabBarTheme(
            labelColor: Color(0xff6360FE),
            unselectedLabelColor: Color(0xff6D6D6D),
          ),
          appBarTheme: AppBarTheme(
            titleTextStyle: GoogleFonts.dmSans(
              fontSize: 18,
              color: const Color(0xff929292),
            ),
            iconTheme: const IconThemeData(
              color: Color(0xff6360FE),
            ),
          ),
          textTheme: TextTheme(
            headline1: GoogleFonts.dmSans(
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
            headline2: GoogleFonts.dmSans(
              fontSize: 12,
            ),
            headline3: GoogleFonts.dmSans(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff6D6D6D),
            ),
            headline4: GoogleFonts.dmSans(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            headline5: GoogleFonts.dmSans(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        home: const FormWidgetPage(),
      ),
    );
  }
}
