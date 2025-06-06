import 'package:get/get.dart';

import '../modules/addCost/add_cost_binding.dart';
import '../modules/addCost/add_cost_view.dart';
import '../modules/addCost/views/bill_scanner_view.dart';
import '../modules/confirmSpilt/confirm_spilt_binding.dart';
import '../modules/confirmSpilt/confirm_spilt_view.dart';
import '../modules/groupSplit/group_split_binding.dart';
import '../modules/groupSplit/group_split_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_view.dart';
import '../modules/onboarding/onboarding_binding.dart';
import '../modules/onboarding/onboarding_view.dart';
import '../modules/otpVerification/otp_verification_binding.dart';
import '../modules/otpVerification/otp_verification_view.dart';
import '../modules/split/split_binding.dart';
import '../modules/split/split_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARDING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VERIFICATION,
      page: () => const OtpVerificationView(),
      binding: OtpVerificationBinding(),
    ),
    GetPage(
      name: _Paths.ADD_COST,
      page: () => const AddCostView(),
      binding: AddCostBinding(),
    ),
    GetPage(
      name: _Paths.BILL_SCANNER,
      page: () => const BillScannerView(),
      binding: AddCostBinding(),
    ),
    GetPage(
      name: _Paths.GROUP_SPLIT,
      page: () => const GroupSplitView(),
      binding: GroupSplitBinding(),
    ),
    GetPage(
      name: _Paths.SPLIT,
      page: () => const SplitView(),
      binding: SplitBinding(),
    ),
    GetPage(
      name: _Paths.CONFIRM_SPILT,
      page: () => const ConfirmSpiltView(),
      binding: ConfirmSpiltBinding(),
    ),
  ];
}
