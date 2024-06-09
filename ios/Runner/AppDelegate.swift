import UIKit
import Flutter
import flutter_local_notifications

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    // notification을 위한 추가 시작
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as?
    UNUserNotificationCenterDelegate
    }
    // notification을 위한 추가 끝
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
