import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // TODO: Add your Google Maps API key
    GMSServices.provideAPIKey("AIzaSyDtWzYAt_uG2ad_g304N4lt-OOFhXdYxwU")
    UIApplication.shared.setMinimumBackgroundFetchInterval(TimeInterval(3600))
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
