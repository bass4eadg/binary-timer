//
//  AppOpen.swift
//
//
//
//

import GoogleMobileAds

class AppOpen: NSObject, GADFullScreenContentDelegate, ObservableObject {
    
    @Published var appOpenAdLoaded: Bool = false
    var appOpenAd: GADAppOpenAd?
    
    override init() {
        super.init()
        loadAppOpenAd()
    }
    
    func loadAppOpenAd() {
        let request = GADRequest()
        GADAppOpenAd.load(
            // 設定ファイルから広告ユニットIDを取得
            withAdUnitID: AdConfig.appOpenAdUnitID,
            request: request,
            orientation: UIInterfaceOrientation.portrait
        ) { appOpenAdIn, _ in
            self.appOpenAd = appOpenAdIn
            self.appOpenAd?.fullScreenContentDelegate = self
            self.appOpenAdLoaded = true
            print("🍊: 準備完了しました")
        }
    }
    
    func presentAppOpenAd() {
        guard let root = self.appOpenAd else { return }
        root.present(fromRootViewController: (UIApplication.shared.windows.first?.rootViewController)!)
    }
    
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        self.loadAppOpenAd()
        print("😭: エラー -> \(error)")
    }
    
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        self.loadAppOpenAd()
        print("🍅: 閉じました")
    }
}


