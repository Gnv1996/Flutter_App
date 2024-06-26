import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  final List<FAQItem> faqs = [
    FAQItem(
      question: 'What should I consider when buying a new mobile phone?',
      answer:
          'Consider factors like your budget, desired features (camera quality, battery life, performance), operating system preference (Android, iOS), and brand reputation.',
    ),
    FAQItem(
      question: 'How do I transfer data from my old phone to a new one?',
      answer:
          'You can transfer data using methods like backup and restore through cloud services, using a transfer cable, or through apps like Google Drive or Apple\'s iCloud.',
    ),
    FAQItem(
      question: 'What are the latest trends in mobile phone technology?',
      answer:
          'Current trends include 5G connectivity, foldable phones, high refresh rate displays, advanced camera systems, and AI-powered features.',
    ),
    FAQItem(
      question: 'How can I improve the battery life of my smartphone?',
      answer:
          'To improve battery life, you can optimize settings like screen brightness and timeout, disable background apps, use battery saver modes, and avoid overcharging.',
    ),
    FAQItem(
      question: 'What is the difference between 4G and 5G technology?',
      answer:
          '5G offers faster speeds, lower latency, and increased network capacity compared to 4G. It enables new applications like augmented reality and IoT.',
    ),
    FAQItem(
      question: 'How do I protect my mobile phone from malware and viruses?',
      answer:
          'Protect your phone by installing reputable antivirus software, keeping your operating system updated, avoiding suspicious links and apps, and using secure Wi-Fi networks.',
    ),
    FAQItem(
      question: 'Which mobile phone has the best camera for photography?',
      answer:
          'Phones like iPhone 13 Pro, Google Pixel 6 Pro, and Samsung Galaxy S22 Ultra are known for their excellent camera quality and advanced photography features.',
    ),
    FAQItem(
      question: 'How do I choose the right mobile phone plan for my needs?',
      answer:
          'Consider factors like data usage, coverage area, contract terms, and additional features (like international calling or data roaming) offered by different carriers.',
    ),
    FAQItem(
      question: 'What are the benefits of buying a refurbished mobile phone?',
      answer:
          'Refurbished phones are typically cheaper than new ones, undergo rigorous testing, often come with warranties, and are better for the environment by reducing electronic waste.',
    ),
    FAQItem(
      question: 'How often should I update the software on my mobile phone?',
      answer:
          'Regularly update your phone\'s software to receive security patches, bug fixes, and new features. Aim to update as soon as updates become available.',
    ),
    FAQItem(
      question: 'What is the best way to clean my mobile phone screen?',
      answer:
          'Use a microfiber cloth slightly dampened with water or a screen cleaner specifically designed for electronic devices. Avoid harsh chemicals or abrasive materials.',
    ),
    FAQItem(
      question: 'How do I troubleshoot common mobile phone problems?',
      answer:
          'Common troubleshooting steps include restarting the phone, checking for software updates, clearing cache or app data, resetting network settings, or contacting technical support.',
    ),
    FAQItem(
      question: 'Which mobile phone has the longest battery life?',
      answer:
          'Phones like the Samsung Galaxy M52 5G, iPhone 13 Pro Max, and Xiaomi Redmi Note 11 Pro offer excellent battery life, often lasting more than a day with moderate usage.',
    ),
    FAQItem(
      question: 'What are the advantages of buying an unlocked mobile phone?',
      answer:
          'Unlocked phones allow you to choose your carrier and switch networks easily, often have no carrier bloatware, and may receive software updates faster than carrier-locked phones.',
    ),
    FAQItem(
      question: 'How can I maximize the storage space on my mobile phone?',
      answer:
          'Maximize storage by using cloud storage services for photos and videos, deleting unused apps and files, clearing cache regularly, and using a microSD card if your phone supports it.',
    ),
    FAQItem(
      question: 'What are the pros and cons of using a mobile phone case?',
      answer:
          'Pros: Protects your phone from drops and scratches, can add style or personalization. Cons: Adds bulk, may affect wireless charging or heat dissipation in some cases.',
    ),
    FAQItem(
      question: 'How do I factory reset my mobile phone?',
      answer:
          'Go to Settings > System > Reset (varies by phone). Confirm your selection and enter your PIN or password when prompted. Note: Factory reset erases all data on your phone.',
    ),
    FAQItem(
      question: 'Which mobile phone operating system is the most secure?',
      answer:
          'Both Android and iOS are secure when updated regularly, but iOS is often considered more secure due to Apple\'s strict app store policies and quicker software updates across devices.',
    ),
    FAQItem(
      question: 'How can I extend the lifespan of my mobile phone battery?',
      answer:
          'Avoid extreme temperatures, avoid complete discharges, use battery saver modes, and consider replacing the battery when it no longer holds a charge effectively.',
    ),
    FAQItem(
      question: 'What should I do if my mobile phone gets wet?',
      answer:
          'Turn off the phone immediately, dry it with a towel, remove any removable parts (SIM card, etc.), and place it in a bowl of uncooked rice or silica gel packets to absorb moisture. Do not use heat to dry it.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: ListView.builder(
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          final faq = faqs[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ExpansionTile(
              title: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  faq.question,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Text(
                    faq.answer,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({
    required this.question,
    required this.answer,
  });
}
