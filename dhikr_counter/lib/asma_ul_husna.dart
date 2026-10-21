import 'package:flutter/material.dart'; // Flutter's ready-made blocks

// One name: its Arabic, its English spelling and its English meaning
class DivineName {
  final String arabic; // The name in Arabic
  final String transliteration; // The name spelled in English letters
  final String meaning; // The English meaning
  const DivineName(this.arabic, this.transliteration, this.meaning); // "const" = fixed, never changes
}

// The full list, in order. The number shown in the pop-up is the position in this list.
const List<DivineName> asmaUlHusna = [
  DivineName("اللَّهُ", "ALLAH", "The One True God"),
  DivineName("الرَّحْمَنُ", "AR-RAHMAN", "The Most Gracious"),
  DivineName("الرَّحِيمُ", "AR-RAHIM", "The Most Merciful"),
  DivineName("الْمَلِكُ", "AL-MALIK", "The King, The Sovereign"),
  DivineName("الْقُدُّوسُ", "AL-QUDDUS", "The Most Holy"),
  DivineName("السَّلَامُ", "AS-SALAM", "The Source of Peace"),
  DivineName("الْمُؤْمِنُ", "AL-MU'MIN", "The Granter of Security"),
  DivineName("الْمُهَيْمِنُ", "AL-MUHAYMIN", "The Guardian"),
  DivineName("الْعَزِيزُ", "AL-'AZIZ", "The Almighty"),
  DivineName("الْجَبَّارُ", "AL-JABBAR", "The Compeller"),
  DivineName("الْمُتَكَبِّرُ", "AL-MUTAKABBIR", "The Supreme"),
  DivineName("الْخَالِقُ", "AL-KHALIQ", "The Creator"),
  DivineName("الْبَارِئُ", "AL-BARI'", "The Originator"),
  DivineName("الْمُصَوِّرُ", "AL-MUSAWWIR", "The Fashioner"),
  DivineName("الْغَفَّارُ", "AL-GHAFFAR", "The Ever-Forgiving"),
  DivineName("الْقَهَّارُ", "AL-QAHHAR", "The Subduer"),
  DivineName("الْوَهَّابُ", "AL-WAHHAB", "The Bestower"),
  DivineName("الرَّزَّاقُ", "AR-RAZZAQ", "The Provider"),
  DivineName("الْفَتَّاحُ", "AL-FATTAH", "The Opener"),
  DivineName("الْعَلِيمُ", "AL-'ALIM", "The All-Knowing"),
  DivineName("الْقَابِضُ", "AL-QABID", "The Withholder"),
  DivineName("الْبَاسِطُ", "AL-BASIT", "The Expander"),
  DivineName("الْخَافِضُ", "AL-KHAFID", "The Abaser"),
  DivineName("الرَّافِعُ", "AR-RAFI'", "The Exalter"),
  DivineName("الْمُعِزُّ", "AL-MU'IZZ", "The Giver of Honour"),
  DivineName("الْمُذِلُّ", "AL-MUDHILL", "The Giver of Dishonour"),
  DivineName("السَّمِيعُ", "AS-SAMI", "The All-Hearing"),
  DivineName("الْبَصِيرُ", "AL-BASIR", "The All-Seeing"),
  DivineName("الْحَكَمُ", "AL-HAKAM", "The Judge"),
  DivineName("الْعَدْلُ", "AL-'ADL", "The Utterly Just"),
  DivineName("اللَّطِيفُ", "AL-LATIF", "The Subtle, The Gentle"),
  DivineName("الْخَبِيرُ", "AL-KHABIR", "The All-Aware"),
  DivineName("الْحَلِيمُ", "AL-HALIM", "The Forbearing"),
  DivineName("الْعَظِيمُ", "AL-'AZIM", "The Magnificent"),
  DivineName("الْغَفُورُ", "AL-GHAFUR", "The Much-Forgiving"),
  DivineName("الشَّكُورُ", "ASH-SHAKUR", "The Most Appreciative"),
  DivineName("الْعَلِيُّ", "AL-'ALI", "The Most High"),
  DivineName("الْكَبِيرُ", "AL-KABIR", "The Most Great"),
  DivineName("الْحَفِيظُ", "AL-HAFIZ", "The Preserver"),
  DivineName("الْمُقِيتُ", "AL-MUQIT", "The Sustainer"),
  DivineName("الْحَسِيبُ", "AL-HASIB", "The Reckoner"),
  DivineName("الْجَلِيلُ", "AL-JALIL", "The Majestic"),
  DivineName("الْكَرِيمُ", "AL-KARIM", "The Most Generous"),
  DivineName("الرَّقِيبُ", "AR-RAQIB", "The Watchful"),
  DivineName("الْمُجِيبُ", "AL-MUJIB", "The Responsive One"),
  DivineName("الْوَاسِعُ", "AL-WASI'", "The All-Encompassing"),
  DivineName("الْحَكِيمُ", "AL-HAKIM", "The All-Wise"),
  DivineName("الْوَدُودُ", "AL-WADUD", "The Most Loving"),
  DivineName("الْمَجِيدُ", "AL-MAJÍD", "The Most Glorious"),
  DivineName("الْبَاعِثُ", "AL-BA'ITH", "The Resurrector"),
  DivineName("الشَّهِيدُ", "ASH-SHAHID", "The Witness"),
  DivineName("الْحَقُّ", "AL-HAQQ", "The Absolute Truth"),
  DivineName("الْوَكِيلُ", "AL-WAKIL", "The Trustee"),
  DivineName("الْقَوِيُّ", "AL-QAWI", "The All-Strong"),
  DivineName("الْمَتِينُ", "AL-MATIN", "The Firm, The Steadfast"),
  DivineName("الْوَلِيُّ", "AL-WALÍ", "The Protecting Friend"),
  DivineName("الْحَمِيدُ", "AL-HAMID", "The Praiseworthy"),
  DivineName("الْمُحْصِي", "AL-MUHSI", "The Accounter"),
  DivineName("الْمُبْدِئُ", "AL-MUBDI", "The Originator"),
  DivineName("الْمُعِيدُ", "AL-MU'ID", "The Restorer"),
  DivineName("الْمُحْيِي", "AL-MUHYI", "The Giver of Life"),
  DivineName("الْمُمِيتُ", "AL-MUMIT", "The Bringer of Death"),
  DivineName("الْحَيُّ", "AL-HAYY", "The Ever-Living"),
  DivineName("الْقَيُّومُ", "AL-QAYYUM", "The Self-Subsisting Sustainer"),
  DivineName("الْوَاجِدُ", "AL-WAJID", "The Finder, The Perceiver"),
  DivineName("الْمَاجِدُ", "AL-MÁJID", "The Noble"),
  DivineName("الْوَاحِدُ", "AL-WAHID", "The One"),
  DivineName("الْأَحَدُ", "AL-AHAD", "The Unique"),
  DivineName("الصَّمَدُ", "AS-SAMAD", "The Eternal, The Self-Sufficient"),
  DivineName("الْقَادِرُ", "AL-QADIR", "The All-Capable"),
  DivineName("الْمُقْتَدِرُ", "AL-MUQTADIR", "The All-Determiner"),
  DivineName("الْمُقَدِّمُ", "AL-MUQADDIM", "The Expediter, The Promoter"),
  DivineName("الْمُؤَخِّرُ", "AL-MU'AKHKHIR", "The Delayer"),
  DivineName("الْأَوَّلُ", "AL-AWWAL", "The First"),
  DivineName("الْآخِرُ", "AL-AKHIR", "The Last"),
  DivineName("الظَّاهِرُ", "AZ-ZAHIR", "The Manifest"),
  DivineName("الْبَاطِنُ", "AL-BATIN", "The Hidden"),
  DivineName("الْوَالِي", "AL-WÁLI", "The Governor"),
  DivineName("الْمُتَعَالِي", "AL-MUTA'ALI", "The Self-Exalted"),
  DivineName("الْبَرُّ", "AL-BARR", "The Source of All Goodness"),
  DivineName("التَّوَّابُ", "AT-TAWWAB", "The Ever-Returning, Accepter of Repentance"),
  DivineName("الْمُنْتَقِمُ", "AL-MUNTAQIM", "The Avenger"),
  DivineName("الْعَفُوُّ", "AL-AFU", "The Pardoner"),
  DivineName("الرَّؤُوفُ", "AR-RA'UF", "The Compassionate"),
  DivineName("مَالِكُ الْمُلْكِ", "MALIK AL-MULK", "The Owner of All Sovereignty"),
  DivineName("ذُو الْجَلَالِ وَالْإِكْرَامِ", "DHUL-JALALI WAL-IKRAM", "The Lord of Majesty and Generosity"),
  DivineName("الْمُقْسِطُ", "AL-MUQSIT", "The Equitable"),
  DivineName("الْجَامِعُ", "AL-JAMI", "The Gatherer"),
  DivineName("الْغَنِيُّ", "AL-GHANI", "The Self-Sufficient"),
  DivineName("الْمُغْنِي", "AL-MUGHNI", "The Enricher"),
  DivineName("الْمَانِعُ", "AL-MANI'", "The Preventer"),
  DivineName("الضَّارُّ", "AD-DARR", "The Distresser"),
  DivineName("النَّافِعُ", "AN-NAFI", "The Benefactor"),
  DivineName("النُّورُ", "AN-NUR", "The Light"),
  DivineName("الْهَادِي", "AL-HADI", "The Guide"),
  DivineName("الْبَدِيعُ", "AL-BADI", "The Incomparable Originator"),
  DivineName("الْبَاقِي", "AL-BAQI", "The Everlasting"),
  DivineName("الْوَارِثُ", "AL-WARITH", "The Inheritor"),
  DivineName("الرَّشِيدُ", "AR-RASHID", "The Guide to the Right Path"),
  DivineName("الصَّبُورُ", "AS-SABUR", "The Patient"),
];

// Opens the pop-up for one name, with Previous and Next buttons
void showNameDialog(BuildContext context, int startIndex) {
  int index = startIndex; // The name currently shown
  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder( // Lets the pop-up redraw itself when Previous or Next is pressed
        builder: (context, setDialogState) {
          final name = asmaUlHusna[index]; // The name to show now
          final isDark = Theme.of(context).brightness == Brightness.dark;
          final arabicColor = isDark ? Colors.amber.shade300 : Colors.amber.shade800;
          final mainColor = Theme.of(context).colorScheme.primary;
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${index + 1} of ${asmaUlHusna.length}', style: TextStyle(fontSize: 18, color: mainColor)), // Position in the list
                const SizedBox(height: 24),
                Text(
                  name.arabic,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl, // Arabic is read right to left
                  style: TextStyle(fontSize: 52, height: 1.6, color: arabicColor),
                ),
                const SizedBox(height: 16),
                Text(
                  name.transliteration,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: mainColor),
                ),
                const SizedBox(height: 6),
                Text('(${name.meaning})', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: mainColor)),
              ],
            ),
            actionsAlignment: MainAxisAlignment.spaceBetween,
            actions: [
              TextButton(
                onPressed: index > 0 ? () => setDialogState(() { index--; }) : null, // Disabled on the first name
                child: const Text('Previous'),
              ),
              TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
              TextButton(
                onPressed: index < asmaUlHusna.length - 1 ? () => setDialogState(() { index++; }) : null, // Disabled on the last name
                child: const Text('Next'),
              ),
            ],
          );
        },
      );
    },
  );
}

// The page with the grid of names
class AsmaUlHusnaScreen extends StatelessWidget {
  const AsmaUlHusnaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final arabicColor = isDark ? Colors.amber.shade300 : Colors.amber.shade800;
    final mainColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
      appBar: AppBar(title: const Text('Al Asma ul Husna')), // Back arrow appears automatically
      body: Directionality(
        textDirection: TextDirection.rtl, // Fills the grid from right to left, like Arabic is read
        child: GridView.builder( // A scrolling grid
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 cards per row
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.95, // Card shape: almost square
          ),
          itemCount: asmaUlHusna.length, // One card per name
          itemBuilder: (context, index) {
            final name = asmaUlHusna[index];
            return Card(
              margin: EdgeInsets.zero,
              clipBehavior: Clip.antiAlias,
              child: InkWell( // Makes the card tappable
                onTap: () => showNameDialog(context, index), // Tap opens the pop-up
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: FittedBox( // Shrinks long names so they fit the card
                            fit: BoxFit.scaleDown,
                            child: Text(name.arabic, style: TextStyle(fontSize: 30, height: 1.6, color: arabicColor)),
                          ),
                        ),
                      ),
                      Text(
                        name.transliteration,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: mainColor),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}