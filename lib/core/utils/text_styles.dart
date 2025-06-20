// Add this import at the top of your file
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Method 1: Create a TextStyles class with Google Fonts
class TextStyles {
  static TextStyle small(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).textTheme.bodySmall?.color,
    );
  }

  static TextStyle medium(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).textTheme.bodyMedium?.color,
    );
  }

  static TextStyle large(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).textTheme.bodyLarge?.color,
    );
  }

  static TextStyle extraLarge(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).textTheme.headlineSmall?.color,
    );
  }

  // Bold variants
  static TextStyle smallBold(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).textTheme.bodySmall?.color,
    );
  }

  static TextStyle mediumBold(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).textTheme.bodyMedium?.color,
    );
  }

  static TextStyle largeBold(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).textTheme.bodyLarge?.color,
    );
  }

  // Different font variants
  static TextStyle heading1(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).textTheme.headlineLarge?.color,
    );
  }

  static TextStyle heading2(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).textTheme.headlineMedium?.color,
    );
  }

  static TextStyle subtitle(BuildContext context) {
    return GoogleFonts.openSans(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).textTheme.titleMedium?.color,
    );
  }

  static TextStyle caption(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.7),
    );
  }
}

// Method 2: Extension on BuildContext for cleaner usage
extension TextStyleExtension on BuildContext {
  TextStyle get smallText => TextStyles.small(this);
  TextStyle get mediumText => TextStyles.medium(this);
  TextStyle get largeText => TextStyles.large(this);
  TextStyle get extraLargeText => TextStyles.extraLarge(this);

  TextStyle get smallBoldText => TextStyles.smallBold(this);
  TextStyle get mediumBoldText => TextStyles.mediumBold(this);
  TextStyle get largeBoldText => TextStyles.largeBold(this);

  // New Google Fonts variants
  TextStyle get heading1 => TextStyles.heading1(this);
  TextStyle get heading2 => TextStyles.heading2(this);
  TextStyle get subtitle => TextStyles.subtitle(this);
  TextStyle get caption => TextStyles.caption(this);
}

// Method 3: Google Fonts constants (theme-independent)
class AppTextStyles {
  static TextStyle small = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  static TextStyle medium = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static TextStyle large = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static TextStyle extraLarge = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  // Bold variants
  static TextStyle smallBold = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  static TextStyle mediumBold = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle largeBold = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  // Different Google Fonts for variety
  static TextStyle heading1 = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static TextStyle heading2 = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );

  static TextStyle subtitle = GoogleFonts.openSans(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static TextStyle caption = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.normal,
  );
}

// Method 4: Font-specific classes for better organization
class RobotoStyles {
  static TextStyle small = GoogleFonts.roboto(fontSize: 12);
  static TextStyle medium = GoogleFonts.roboto(fontSize: 16);
  static TextStyle large = GoogleFonts.roboto(fontSize: 20);
  static TextStyle extraLarge = GoogleFonts.roboto(fontSize: 24);
}

class PoppinsStyles {
  static TextStyle small = GoogleFonts.poppins(fontSize: 12);
  static TextStyle medium = GoogleFonts.poppins(fontSize: 16);
  static TextStyle large = GoogleFonts.poppins(fontSize: 20);
  static TextStyle extraLarge = GoogleFonts.poppins(fontSize: 24);
}

class OpenSansStyles {
  static TextStyle small = GoogleFonts.openSans(fontSize: 12);
  static TextStyle medium = GoogleFonts.openSans(fontSize: 16);
  static TextStyle large = GoogleFonts.openSans(fontSize: 20);
  static TextStyle extraLarge = GoogleFonts.openSans(fontSize: 24);
}

// Example 8: Setting app-wide Google Font theme
// Add this to your MaterialApp's theme:
/*
MaterialApp(
  theme: ThemeData(
    textTheme: GoogleFonts.robotoTextTheme(
      Theme.of(context).textTheme,
    ),
  ),
  // ... rest of your app
)
*/

// Setup Instructions:
/*
1. Add to pubspec.yaml:
   dependencies:
     google_fonts: ^6.1.0

2. Run: flutter pub get

3. Import in your dart file:
   import 'package:google_fonts/google_fonts.dart';

4. Popular Google Fonts to try:
   - GoogleFonts.roboto()
   - GoogleFonts.poppins()
   - GoogleFonts.openSans()
   - GoogleFonts.lato()
   - GoogleFonts.montserrat()
   - GoogleFonts.inter()
   - GoogleFonts.nunito()
   - GoogleFonts.sourceCodePro() // for code
*/
