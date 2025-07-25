//
//  BinaryTimer1App.swift
//  BinaryTimer1
//
//  Created by Developer on 2024/01/18.
//

import SwiftUI
import GoogleMobileAds

//google-mobile-ads-sdkの初期化処理
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        FirebaseApp.configure()
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        return true
    }
}

@main
struct BinaryTimer1App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var appOpen = AppOpen()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: appOpen.appOpenAdLoaded) { newValue in
            appOpen.presentAppOpenAd()
        }
    }
}
