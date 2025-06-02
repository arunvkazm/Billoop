import 'package:get/get.dart';

import '../../gen/assets.gen.dart';
import '../../routes/app_pages.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;

  final List<Map<String, String>> onboardingData = [
    {
      "image": Assets.svgOnboard1.path,
      "title": "Friends That Split Together, Stick Together",
      "description":
          "Create squads, drop the bills, and let us handle the math. Drama-free expense sharing!",
    },
    {
      "image": Assets.svgOnboarding5.path,
      "title": "Bill? Just Chill & Scan!",
      "description":
          "Snap the bill like a pro, tweak the numbers if needed — no calculator tantrums required.",
    },
    {
      "image": Assets.svgOnboard4.path,
      "title": "Gentle Nudge, Not a Grudge",
      "description":
          "Ping your forgetful pals with classy debt reminders. No more ghosting the group chat!",
    },
  ];

  void nextPage() {
    if (currentPage.value < onboardingData.length - 1) {
      currentPage.value++;
    } else {
      Get.toNamed(Routes.LOGIN);
    }
  }
}
