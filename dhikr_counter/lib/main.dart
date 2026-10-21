import 'package:flutter/material.dart'; // Flutter's ready-made blocks
import 'package:flutter/services.dart'; // Gives us the vibration (haptic) feature
import 'package:shared_preferences/shared_preferences.dart'; // The "notebook" package
import 'package:vibration/vibration.dart'; // Direct control of the vibration motor
import 'asma_ul_husna.dart'; // The 99 names page we just made
// The list of duas: each has a title, Arabic text, English meaning and source
const List<Map<String, String>> duas = [
  {
    'title': 'When waking up',
    'arabic': 'الْحَمْدُ لِلَّهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ',
    'meaning': 'All praise is for Allah who gave us life after having taken it from us, and to Him is the resurrection.',
    'source': 'Sahih al-Bukhari 6312',
  },
  {
    'title': 'When leaving the house',
    'arabic': 'بِسْمِ اللَّهِ تَوَكَّلْتُ عَلَى اللَّهِ وَلَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ',
    'meaning': 'In the Name of Allah, I have placed my trust in Allah; there is no might and no power except by Allah.',
    'source': 'Sunan Abi Dawud 5095',
  },
  {
    'title': 'When entering the masjid',
    'arabic': 'اللَّهُمَّ افْتَحْ لِي أَبْوَابَ رَحْمَتِكَ',
    'meaning': 'O Allah, open for me the doors of Your mercy.',
    'source': 'Sahih Muslim 713',
  },
  {
    'title': 'Before sleeping',
    'arabic': 'بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا', // Sahih al-Bukhari 6324, same as Hisn al-Muslim
    'meaning': 'In Your name, O Allah, I die and I live.',
    'source': 'Sahih al-Bukhari 6324',
  },
  {
    'title': 'After eating',
    'arabic': 'الْحَمْدُ لِلَّهِ الَّذِي أَطْعَمَنِي هَذَا وَرَزَقَنِيهِ مِنْ غَيْرِ حَوْلٍ مِنِّي وَلَا قُوَّةٍ',
    'meaning': 'All praise is for Allah who fed me this and provided it for me, without any power or strength from me.',
    'source': 'Jami at-Tirmidhi 3458',
  },
  {
    'title': 'Good in both worlds',
    'arabic': 'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
    'meaning': 'Our Lord, give us good in this world and good in the Hereafter, and protect us from the punishment of the Fire.',
    'source': 'Quran 2:201',
  },
  {
    'title': 'Dua for forgiveness',
    'arabic': 'أَسْتَغْفِرُ اللَّهَ',
    'meaning': 'I seek forgiveness from Allah.',
    'source': 'Sahih Muslim 591',
  },
  {
    'title': 'Dua for parents',
    'arabic': 'رَّبِّ ارْحَمْهُمَا كَمَا رَبَّيَانِي صَغِيرًا',
    'meaning': 'My Lord, have mercy upon them as they brought me up when I was small.',
    'source': 'Quran 17:24',
  },
  {
    'title': 'Dua for knowledge',
    'arabic': 'رَّبِّ زِدْنِي عِلْمًا',
    'meaning': 'My Lord, increase me in knowledge.',
    'source': 'Quran 20:114',
  },
  {
    'title': 'Dua for ease',
    'arabic': 'رَبِّ اشْرَحْ لِي صَدْرِي وَيَسِّرْ لِي أَمْرِي',
    'meaning': 'My Lord, expand for me my chest and ease for me my task.',
    'source': 'Quran 20:25-26',
  },
  {
    'title': 'Dua for trust in Allah',
    'arabic': 'حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ',
    'meaning': 'Sufficient for us is Allah, and He is the best Disposer of affairs.',
    'source': 'Quran 3:173',
  },
  {
    'title': 'Dua when facing difficulty',
    'arabic': 'لَّا إِلَٰهَ إِلَّا أَنتَ سُبْحَانَكَ إِنِّي كُنتُ مِنَ الظَّالِمِينَ',
    'meaning': 'There is no deity except You; exalted are You. Indeed, I have been of the wrongdoers.',
    'source': 'Quran 21:87',
  },
  {
    'title': 'Dua for a pure heart',
    'arabic': 'رَبَّنَا لَا تُزِغْ قُلُوبَنَا بَعْدَ إِذْ هَدَيْتَنَا وَهَبْ لَنَا مِن لَّدُنكَ رَحْمَةً ۚ إِنَّكَ أَنتَ الْوَهَّابُ',
    'meaning': 'Our Lord, let not our hearts deviate after You have guided us and grant us from Yourself mercy. Indeed, You are the Bestower.',
    'source': 'Quran 3:8',
  },
  {
    'title': 'Dua for patience and steadfastness',
    'arabic': 'رَبَّنَا أَفْرِغْ عَلَيْنَا صَبْرًا وَثَبِّتْ أَقْدَامَنَا وَانصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ',
    'meaning': 'Our Lord, pour upon us patience and plant firmly our feet and give us victory over the disbelieving people.',
    'source': 'Quran 2:250',
  },
  {
    'title': 'Dua for repentance',
    'arabic': 'رَبَّنَا ظَلَمْنَا أَنفُسَنَا وَإِن لَّمْ تَغْفِرْ لَنَا وَتَرْحَمْنَا لَنَكُونَنَّ مِنَ الْخَاسِرِينَ',
    'meaning': 'Our Lord, we have wronged ourselves, and if You do not forgive us and have mercy upon us, we will surely be among the losers.',
    'source': 'Quran 7:23',
  },
  {
    'title': 'Dua before eating',
    'arabic': 'بِسْمِ اللَّهِ',
    'meaning': 'In the name of Allah.',
    'source': 'Sahih al-Bukhari 5376',
  },
  {
    'title': 'Dua for protection against harm',
    'arabic': 'أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ مِنْ شَرِّ مَا خَلَقَ',
    'meaning': 'I seek refuge in the perfect words of Allah from the evil of that which He has created.',
    'source': 'Sahih Muslim 2708',
  },
  {
    'title': 'Dua for forgiveness and well-being',
    'arabic': 'اللَّهُمَّ إِنِّي أَسْأَلُكَ الْعَفْوَ وَالْعَافِيَةَ فِي الدُّنْيَا وَالْآخِرَةِ',
    'meaning': 'O Allah, I ask You for pardon and well-being in this world and the Hereafter.',
    'source': 'Sunan Abi Dawud 5074',
  },
  {
    'title': 'Dua for beneficial knowledge',
    'arabic': 'اللَّهُمَّ إِنِّي أَسْأَلُكَ عِلْمًا نَافِعًا، وَرِزْقًا طَيِّبًا، وَعَمَلًا مُتَقَبَّلًا',
    'meaning': 'O Allah, I ask You for knowledge that is of benefit, a good provision, and deeds that will be accepted.',
    'source': 'Sunan Ibn Majah 925',
  },
  {
    'title': 'Dua for a good outcome in all affairs',
    'arabic': 'اللَّهُمَّ أَحْسِنْ عَاقِبَتَنَا فِي الْأُمُورِ كُلِّهَا، وَأَجِرْنَا مِنْ خِزْيِ الدُّنْيَا وَعَذَابِ الْآخِرَةِ',
    'meaning': 'O Allah, make good the outcome of all our affairs, and protect us from disgrace in this world and the punishment of the Hereafter.',
    'source': 'Musnad Ahmad 17628',
  },
  {
    'title': 'Dua for guidance',
    'arabic': 'اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ',
    'meaning': 'Guide us to the straight path.',
    'source': 'Quran 1:6',
  },
  {
    'title': 'Dua for gratitude',
    'arabic': 'رَبِّ أَوْزِعْنِي أَنْ أَشْكُرَ نِعْمَتَكَ الَّتِي أَنْعَمْتَ عَلَيَّ وَعَلَىٰ وَالِدَيَّ',
    'meaning': 'My Lord, enable me to be grateful for Your favor which You have bestowed upon me and upon my parents.',
    'source': 'Quran 27:19',
  },
  {
    'title': 'Dua for relief from anxiety and sorrow',
    'arabic': 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ، وَالْعَجْزِ وَالْكَسَلِ، وَالْبُخْلِ وَالْجُبْنِ، وَضَلَعِ الدَّيْنِ، وَغَلَبَةِ الرِّجَالِ',
    'meaning': 'O Allah, I seek refuge in You from grief and sadness, weakness and laziness, miserliness and cowardice, the burden of debt, and being overpowered by men.',
    'source': 'Sahih al-Bukhari 2893',
  },
  {
    'title': 'Dua for divine provision',
    'arabic': 'رَبِّ إِنِّي لِمَا أَنزَلْتَ إِلَيَّ مِنْ خَيْرٍ فَقِيرٌ',
    'meaning': 'My Lord, indeed I am, for whatever good You would send down to me, in need.',
    'source': 'Quran 28:24',
  },
  {
    'title': 'Dua for steadfastness in faith',
    'arabic': 'يَا مُقَلِّبَ الْقُلُوبِ ثَبِّتْ قَلْبِي عَلَىٰ دِينِكَ',
    'meaning': 'O Turner of the hearts, make my heart firm upon Your religion.',
    'source': 'Jami` at-Tirmidhi 3522',
  },
  {
    'title': 'Dua when exiting the masjid',
    'arabic': 'اللَّهُمَّ إِنِّي أَسْأَلُكَ مِنْ فَضْلِكَ',
    'meaning': 'O Allah, I ask You for Your bounty.',
    'source': 'Sahih Muslim 713',
  },
  {
    'title': 'Dua for parents and all believers',
    'arabic': 'رَبَّنَا اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ الْحِسَابُ',
    'meaning': 'Our Lord, forgive me and my parents and the believers the Day the account is established.',
    'source': 'Quran 14:41',
  },
  {
    'title': 'Dua for protection from Jahannam',
    'arabic': 'رَبَّنَا اصْرِفْ عَنَّا عَذَابَ جَهَنَّمَ ۖ إِنَّ عَذَابَهَا كَانَ غَرَامًا',
    'meaning': 'Our Lord, avert from us the punishment of Hell. Indeed, its punishment is ever adhering.',
    'source': 'Quran 25:65',
  },
  {
    'title': 'Dua for forgiveness and mercy',
    'arabic': 'رَّبِّ اغْفِرْ وَارْحَمْ وَأَنتَ خَيْرُ الرَّاحِمِينَ',
    'meaning': 'My Lord, forgive and have mercy, and You are the best of the merciful.',
    'source': 'Quran 23:118',
  },
  {
    'title': 'Dua for a righteous family and spouse',
    'arabic': 'رَبَّنَا هَبْ لَنَا مِنْ أَزْوَاجِنَا وَذُرِّيَّاتِنَا قُرَّةَ أَعْيُنٍ وَاجْعَلْنَا لِلْمُتَّقِينَ إِمَامًا',
    'meaning': 'Our Lord, grant us from among our wives and offspring comfort to our eyes and make us an example for the righteous.',
    'source': 'Quran 25:74',
  }

];

void main() => runApp(const DhikrApp()); // Starts the app

class DhikrApp extends StatelessWidget { // The whole app (never changes)
  const DhikrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the red DEBUG ribbon
      title: 'Dhikr Counter', // App name
      theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true), // Light theme
      darkTheme: ThemeData(colorSchemeSeed: Colors.teal, brightness: Brightness.dark, useMaterial3: true), // Dark theme
      themeMode: ThemeMode.system, // Follow the phone's light/dark setting
      home: const CounterScreen(), // First screen
    );
  }
}

class CounterScreen extends StatefulWidget { // The counter screen (can change)
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0; // Current number
  bool vibrate = true; // Is vibration switched on?
  static const int setSize = 33; // One set = 33 taps

  Map<String, String> get duaOfTheDay { // Picks one dua for today
    final now = DateTime.now();
    final dayOfYear = now.difference(DateTime(now.year, 1, 1)).inDays; // 0 on 1 January
    return duas[dayOfYear % duas.length]; // Same dua all day, a new one tomorrow
  }

  @override
  void initState() {
    super.initState();
    loadSaved(); // When the screen opens, read the saved values
  }

  Future<void> loadSaved() async {
    final prefs = await SharedPreferences.getInstance(); // Open the notebook
    setState(() {
      count = prefs.getInt('count') ?? 0; // Saved number (0 if none)
      vibrate = prefs.getBool('vibrate') ?? true; // Saved vibration choice (on if none)
    });
  }

  Future<void> saveCount() async {
    final prefs = await SharedPreferences.getInstance(); // Open the notebook
    await prefs.setInt('count', count); // Write the number
  }

  Future<void> saveVibrate() async {
    final prefs = await SharedPreferences.getInstance(); // Open the notebook
    await prefs.setBool('vibrate', vibrate); // Write the on/off choice
  }

  void addOne() {
    setState(() { count++; }); // Add 1 and redraw
    if (vibrate) {
      if (count % setSize == 0) {
        Vibration.vibrate(duration: 300); // Long buzz on every 33rd tap
      } else {
        Vibration.vibrate(duration: 30); // Short buzz on a normal tap
      }
    }
    saveCount(); // Save it
  }

  void reset() {
    setState(() { count = 0; }); // Back to zero and redraw
    saveCount(); // Save the zero
  }

  void toggleVibrate() {
    setState(() { vibrate = !vibrate; }); // Flip on/off and redraw
    saveVibrate(); // Save the choice
  }

  @override
  Widget build(BuildContext context) {
    final dua = duaOfTheDay; // Today's dua
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dhikr Counter'), // Title bar
        actions: [
          IconButton(
            icon: Icon(vibrate ? Icons.vibration : Icons.mobile_off), // Icon changes with the setting
            tooltip: 'Vibration on/off',
            onPressed: toggleVibrate, // Tap to switch
          ),
          TextButton.icon(
            icon: const Icon(Icons.menu_book), // Book icon
            label: const Text('AZKAR'), // The word beside the icon
            onPressed: () {
              Navigator.push( // Open the azkar page on top of this one
                context,
                MaterialPageRoute(builder: (context) => const DuasScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView( // Scrolls on small screens instead of overflowing
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity, // Card uses the full width
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      children: [
                        Text('Dua of the day: ${dua['title']}', style: const TextStyle(fontWeight: FontWeight.bold)), // Heading
                        const SizedBox(height: 8),
                        Text(
                          dua['arabic']!,
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl, // Right-to-left for Arabic
                          style: const TextStyle(fontSize: 22, height: 1.8),
                        ),
                        const SizedBox(height: 6),
                        Text(dua['meaning']!, textAlign: TextAlign.center), // English meaning
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text('$count', style: const TextStyle(fontSize: 96)), // Big number
              Text('Sets of $setSize completed: ${count ~/ setSize}'), // Whole number of finished sets
              const SizedBox(height: 30),
              SizedBox(
                width: 200,
                height: 200,
                child: FilledButton(
                  onPressed: addOne, // Tap adds 1
                  style: FilledButton.styleFrom(shape: const CircleBorder()), // Round button
                  child: const Text('Tap', style: TextStyle(fontSize: 32)),
                ),
              ),
              const SizedBox(height: 20),
              TextButton.icon(
                onPressed: reset, // Reset to 0
                icon: const Icon(Icons.refresh),
                label: const Text('Reset'),
              ),
              const SizedBox(height: 10),
              OutlinedButton( // Opens the names page
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AsmaUlHusnaScreen()),
                  );
                },
                child: const Text('Asma ul Husna'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DuasScreen extends StatelessWidget { // The duas page (never changes)
  const DuasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daily Duas')), // Back arrow appears automatically
      body: ListView.builder( // Scrolling list
        padding: const EdgeInsets.all(12),
        itemCount: duas.length, // How many cards to draw
        itemBuilder: (context, index) {
          final dua = duas[index]; // The dua for this card
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dua['title']!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), // Heading
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight, // Arabic sits on the right
                    child: Text(
                      dua['arabic']!,
                      textDirection: TextDirection.rtl, // Right-to-left for Arabic
                      style: const TextStyle(fontSize: 26, height: 1.8),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(dua['meaning']!), // English meaning
                  const SizedBox(height: 8),
                  Text(dua['source']!, style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey)), // Source
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}