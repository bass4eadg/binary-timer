//
//  Config.swift
//  BinaryTimer1
//
//  機密情報の管理
//

import Foundation

struct AdConfig {
    // 本番用広告ユニットID（環境変数から取得、デフォルトはテスト用）
    static let appOpenAdUnitID = Bundle.main.object(forInfoDictionaryKey: "APP_OPEN_AD_UNIT_ID") as? String ?? "ca-app-pub-3940256099942544/5662855259"
    
    // Google AdMob アプリケーションID（環境変数から取得、デフォルトはテスト用）
    static let applicationID = Bundle.main.object(forInfoDictionaryKey: "GAD_APPLICATION_IDENTIFIER") as? String ?? "ca-app-pub-3940256099942544~1458002511"
}
