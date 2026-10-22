import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:tugas_sesi_3/main.dart';
import 'package:tugas_sesi_3/providers/cart_provider.dart';
import 'package:tugas_sesi_3/providers/theme_provider.dart';

void main() {
  testWidgets('NusaBookstore menampilkan katalog buku', (tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        child: const NusaBookstoreApp(),
      ),
    );

    expect(find.text('NusaBookstore'), findsOneWidget);
    expect(find.text('Katalog Buku'), findsOneWidget);
    expect(find.text('Laskar Pelangi'), findsOneWidget);
  });
}
