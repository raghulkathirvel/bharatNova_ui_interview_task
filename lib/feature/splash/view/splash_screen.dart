import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:social_media_ui/feature/location/controller/location_controller.dart';


import '../../../../utils/core_export.dart';
import '../../../helper/responsive_helper.dart';
import '../../../route/app_route_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await Get.find<LocationController>().getLocation();
    _navigate();
  }
  void _navigate() async {
    await Future.delayed(const Duration(seconds: 3));
      context.pushReplacementNamed(AppRoute.bottomNav.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {

            final logoSize = ResponsiveHelper.isTablet(context)  ?  ResponsiveHelper.width(context)* 0.5 : ResponsiveHelper.width(context) * 0.65;

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  //Image.asset(Images.splashLogo2,width: logoSize,height: logoSize,),

                  const SizedBox(height: 24),

                  Text(
                      AppConstants.appName,
                      style: interSemiBold.copyWith(
                        fontSize: ResponsiveHelper.isTablet(context) ? 26 : 20,
                        letterSpacing: 0.5,
                      )
                  ),

                  const SizedBox(height: 8),

                  // Text(
                  //   'Quality • Accuracy • Trust',
                  //   style: interSemiBold.copyWith(
                  //     fontSize: ResponsiveHelper.isTablet(context) ? 16 : 14,
                  //
                  //     color: Colors.grey.shade600,
                  //   ),
                  // ),
                  //
                  // const SizedBox(height: 40),

                  /// Loader
                  //const CircularProgressIndicator(strokeWidth: 2),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
