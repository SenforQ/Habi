
//: Declare String Begin

/*: "callnoop" :*/
fileprivate let kRawMsg:String = "cafieldfield"

/*: "982" :*/
fileprivate let kDecidePath:String = "98your"

/*: "s81c3d6xqi9s" :*/
fileprivate let show_grantStr:String = "action"
fileprivate let noti_globalKey:String = "1c3d6document protection large var"

/*: "vglzz3" :*/
fileprivate let app_activityKey:String = "vglzztag"

/*: "1.9.1" :*/
fileprivate let const_fullFilterValue:String = "1.9.1"

/*: "https://m. :*/
fileprivate let dataThirdId:String = "HTTPS"
fileprivate let user_adjustRatingKey:String = "://m.document clear instance hand succeed"

/*: .com" :*/
fileprivate let mainAddBlockUrl:[Character] = [".","c","o","m"]

/*: "CFBundleShortVersionString" :*/
fileprivate let showNetworkMessage:String = "CFBundfilter never end frame"
fileprivate let app_remoteKey:String = "end padrtVer"
fileprivate let showSceneName:[Character] = ["t","r","i","n","g"]

/*: "CFBundleDisplayName" :*/
fileprivate let main_scriptAnonymousId:String = "system global version copy reportCFBun"
fileprivate let noti_allMsg:String = "isplselect"
fileprivate let app_toolName:String = "center package all revenue categoryName"

/*: "CFBundleVersion" :*/
fileprivate let app_environmentId:[Character] = ["C","F","B","u","n","d"]
fileprivate let app_existValue:[Character] = ["l","e","V","e","r","s","i","o","n"]

/*: "weixin" :*/
fileprivate let notiSubVerticalMsg:[Character] = ["w","e","i","x","i"]
fileprivate let k_versionKey:String = "push"

/*: "wxwork" :*/
fileprivate let mainPackageContent:String = "create"
fileprivate let const_originalStr:String = "XWORK"

/*: "dingtalk" :*/
fileprivate let appNowStr:String = "DING"

/*: "lark" :*/
fileprivate let show_indicatorId:String = "larprogress"

//: Declare String End

// __DEBUG__
// __CLOSE_PRINT__
//
//  CommonServiceKind.swift
//  OverseaH5
//
//  Created by young on 2025/9/24.
//

//: import KeychainSwift
import KeychainSwift
//: import UIKit
import UIKit

/// 域名
//: let ReplaceUrlDomain = "callnoop"
let noti_kindName = (kRawMsg.replacingOccurrences(of: "field", with: "l") + "noop")
/// 包ID
//: let PackageID = "982"
let notiMaxName = (kDecidePath.replacingOccurrences(of: "your", with: "2"))
/// Adjust
//: let AdjustKey = "s81c3d6xqi9s"
let show_zoneMessage = (show_grantStr.replacingOccurrences(of: "action", with: "s8") + String(noti_globalKey.prefix(5)) + "xqi9s")
//: let AdInstallToken = "vglzz3"
let user_scaleMagnitudeValue = (app_activityKey.replacingOccurrences(of: "tag", with: "3"))

/// 网络版本号
//: let AppNetVersion = "1.9.1"
let mainShouldSystemId = (const_fullFilterValue.capitalized)
//: let H5WebDomain = "https://m.\(ReplaceUrlDomain).com"
let show_appText = (dataThirdId.lowercased() + String(user_adjustRatingKey.prefix(5))) + "\(noti_kindName)" + (String(mainAddBlockUrl))
//: let AppVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
let constFoundStatusId = Bundle.main.infoDictionary![(String(showNetworkMessage.prefix(6)) + "leSho" + String(app_remoteKey.suffix(5)) + "sionS" + String(showSceneName))] as! String
//: let AppBundle = Bundle.main.bundleIdentifier!
let show_countryText = Bundle.main.bundleIdentifier!
//: let AppName = Bundle.main.infoDictionary!["CFBundleDisplayName"] ?? ""
let k_itMessage = Bundle.main.infoDictionary![(String(main_scriptAnonymousId.suffix(5)) + "dleD" + noti_allMsg.replacingOccurrences(of: "select", with: "ay") + String(app_toolName.suffix(4)))] ?? ""
//: let AppBuildNumber = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
let dataIncludingUrl = Bundle.main.infoDictionary![(String(app_environmentId) + String(app_existValue))] as! String

//: class AppConfig: NSObject {
class CommonServiceKind: NSObject {
    /// 获取状态栏高度
    //: class func getStatusBarHeight() -> CGFloat {
    class func sustain() -> CGFloat {
        //: if #available(iOS 13.0, *) {
        if #available(iOS 13.0, *) {
            //: if let statusBarManager = UIApplication.shared.windows.first?
            if let statusBarManager = UIApplication.shared.windows.first?
                //: .windowScene?.statusBarManager
                .windowScene?.statusBarManager
            {
                //: return statusBarManager.statusBarFrame.size.height
                return statusBarManager.statusBarFrame.size.height
            }
            //: } else {
        } else {
            //: return UIApplication.shared.statusBarFrame.size.height
            return UIApplication.shared.statusBarFrame.size.height
        }
        //: return 20.0
        return 20.0
    }

    /// 获取window
    //: class func getWindow() -> UIWindow {
    class func localAfter() -> UIWindow {
        //: var window = UIApplication.shared.windows.first(where: {
        var window = UIApplication.shared.windows.first(where: {
            //: $0.isKeyWindow
            $0.isKeyWindow
            //: })
        })
        // 是否为当前显示的window
        //: if window?.windowLevel != UIWindow.Level.normal {
        if window?.windowLevel != UIWindow.Level.normal {
            //: let windows = UIApplication.shared.windows
            let windows = UIApplication.shared.windows
            //: for windowTemp in windows {
            for windowTemp in windows {
                //: if windowTemp.windowLevel == UIWindow.Level.normal {
                if windowTemp.windowLevel == UIWindow.Level.normal {
                    //: window = windowTemp
                    window = windowTemp
                    //: break
                    break
                }
            }
        }
        //: return window!
        return window!
    }

    /// 获取当前控制器
    //: class func currentViewController() -> (UIViewController?) {
    class func evaluateWorldView() -> (UIViewController?) {
        //: var window = AppConfig.getWindow()
        var window = CommonServiceKind.localAfter()
        //: if window.windowLevel != UIWindow.Level.normal {
        if window.windowLevel != UIWindow.Level.normal {
            //: let windows = UIApplication.shared.windows
            let windows = UIApplication.shared.windows
            //: for windowTemp in windows {
            for windowTemp in windows {
                //: if windowTemp.windowLevel == UIWindow.Level.normal {
                if windowTemp.windowLevel == UIWindow.Level.normal {
                    //: window = windowTemp
                    window = windowTemp
                    //: break
                    break
                }
            }
        }
        //: let vc = window.rootViewController
        let vc = window.rootViewController
        //: return currentViewController(vc)
        return show(vc)
    }

    //: class func currentViewController(_ vc: UIViewController?)
    class func show(_ vc: UIViewController?)
        //: -> UIViewController?
        -> UIViewController?
    {
        //: if vc == nil {
        if vc == nil {
            //: return nil
            return nil
        }
        //: if let presentVC = vc?.presentedViewController {
        if let presentVC = vc?.presentedViewController {
            //: return currentViewController(presentVC)
            return show(presentVC)
            //: } else if let tabVC = vc as? UITabBarController {
        } else if let tabVC = vc as? UITabBarController {
            //: if let selectVC = tabVC.selectedViewController {
            if let selectVC = tabVC.selectedViewController {
                //: return currentViewController(selectVC)
                return show(selectVC)
            }
            //: return nil
            return nil
            //: } else if let naiVC = vc as? UINavigationController {
        } else if let naiVC = vc as? UINavigationController {
            //: return currentViewController(naiVC.visibleViewController)
            return show(naiVC.visibleViewController)
            //: } else {
        } else {
            //: return vc
            return vc
        }
    }
}

// MARK: - Device

//: extension UIDevice {
extension UIDevice {
    //: static var modelName: String {
    static var modelName: String {
        //: var systemInfo = utsname()
        var systemInfo = utsname()
        //: uname(&systemInfo)
        uname(&systemInfo)
        //: let machineMirror = Mirror(reflecting: systemInfo.machine)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        //: let identifier = machineMirror.children.reduce("") {
        let identifier = machineMirror.children.reduce("") {
            //: identifier, element in
            identifier, element in
            //: guard let value = element.value as? Int8, value != 0 else {
            guard let value = element.value as? Int8, value != 0 else {
                //: return identifier
                return identifier
            }
            //: return identifier + String(UnicodeScalar(UInt8(value)))
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        //: return identifier
        return identifier
    }

    /// 获取当前系统时区
    //: static var timeZone: String {
    static var timeZone: String {
        //: let currentTimeZone = NSTimeZone.system
        let currentTimeZone = NSTimeZone.system
        //: return currentTimeZone.identifier
        return currentTimeZone.identifier
    }

    /// 获取当前系统语言
    //: static var langCode: String {
    static var langCode: String {
        //: let language = Locale.preferredLanguages.first
        let language = Locale.preferredLanguages.first
        //: return language ?? ""
        return language ?? ""
    }

    /// 获取接口语言
    //: static var interfaceLang: String {
    static var interfaceLang: String {
        //: let lang = UIDevice.getSystemLangCode()
        let lang = UIDevice.system()
        //: if ["en", "ar", "es", "pt"].contains(lang) {
        if ["en", "ar", "es", "pt"].contains(lang) {
            //: return lang
            return lang
        }
        //: return "en"
        return "en"
    }

    /// 获取当前系统地区
    //: static var countryCode: String {
    static var countryCode: String {
        //: let locale = Locale.current
        let locale = Locale.current
        //: let countryCode = locale.regionCode
        let countryCode = locale.regionCode
        //: return countryCode ?? ""
        return countryCode ?? ""
    }

    /// 获取系统UUID（每次调用都会产生新值，所以需要keychain）
    //: static var systemUUID: String {
    static var systemUUID: String {
        //: let key = KeychainSwift()
        let key = KeychainSwift()
        //: if let value = key.get(AdjustKey) {
        if let value = key.get(show_zoneMessage) {
            //: return value
            return value
            //: } else {
        } else {
            //: let value = NSUUID().uuidString
            let value = NSUUID().uuidString
            //: key.set(value, forKey: AdjustKey)
            key.set(value, forKey: show_zoneMessage)
            //: return value
            return value
        }
    }

    /// 获取已安装应用信息
    //: static var getInstalledApps: String {
    static var getInstalledApps: String {
        //: var appsArr: [String] = []
        var appsArr: [String] = []
        //: if UIDevice.canOpenApp("weixin") {
        if UIDevice.trackApp((String(notiSubVerticalMsg) + k_versionKey.replacingOccurrences(of: "push", with: "n"))) {
            //: appsArr.append("weixin")
            appsArr.append((String(notiSubVerticalMsg) + k_versionKey.replacingOccurrences(of: "push", with: "n")))
        }
        //: if UIDevice.canOpenApp("wxwork") {
        if UIDevice.trackApp((mainPackageContent.replacingOccurrences(of: "create", with: "w") + const_originalStr.lowercased())) {
            //: appsArr.append("wxwork")
            appsArr.append((mainPackageContent.replacingOccurrences(of: "create", with: "w") + const_originalStr.lowercased()))
        }
        //: if UIDevice.canOpenApp("dingtalk") {
        if UIDevice.trackApp((appNowStr.lowercased() + "talk")) {
            //: appsArr.append("dingtalk")
            appsArr.append((appNowStr.lowercased() + "talk"))
        }
        //: if UIDevice.canOpenApp("lark") {
        if UIDevice.trackApp((show_indicatorId.replacingOccurrences(of: "progress", with: "k"))) {
            //: appsArr.append("lark")
            appsArr.append((show_indicatorId.replacingOccurrences(of: "progress", with: "k")))
        }
        //: if appsArr.count > 0 {
        if appsArr.count > 0 {
            //: return appsArr.joined(separator: ",")
            return appsArr.joined(separator: ",")
        }
        //: return ""
        return ""
    }

    /// 判断是否安装app
    //: static func canOpenApp(_ scheme: String) -> Bool {
    static func trackApp(_ scheme: String) -> Bool {
        //: let url = URL(string: "\(scheme)://")!
        let url = URL(string: "\(scheme)://")!
        //: if UIApplication.shared.canOpenURL(url) {
        if UIApplication.shared.canOpenURL(url) {
            //: return true
            return true
        }
        //: return false
        return false
    }

    /// 获取系统语言
    /// - Returns: 国际通用语言Code
    //: @objc public class func getSystemLangCode() -> String {
    @objc public class func system() -> String {
        //: let language = NSLocale.preferredLanguages.first
        let language = NSLocale.preferredLanguages.first
        //: let array = language?.components(separatedBy: "-")
        let array = language?.components(separatedBy: "-")
        //: return array?.first ?? "en"
        return array?.first ?? "en"
    }
}
