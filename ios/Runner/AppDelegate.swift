import UIKit
import Flutter
import FirebaseCore

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)
    // [GIDSignIn sharedInstance].clientID = @"127296977891-q9u8jpm7gv0rjjm11pcav1ii1535qil2.apps.googleusercontent.com";
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
