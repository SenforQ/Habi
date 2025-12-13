
//: Declare String Begin

/*: "getDeviceID" :*/
fileprivate let mainAdjustmentMsg:[Character] = ["g","e","t","D","e","v","i","c"]
fileprivate let constKindInheritScreenStr:String = "eIDtab print of"

/*: "getFirebaseID" :*/
fileprivate let kElementMsg:[Character] = ["g","e","t","F","i","r","e","b","a"]
fileprivate let app_permissionMessage:[Character] = ["s","e","I","D"]

/*: "getAreaISO" :*/
fileprivate let k_frameActiveStr:[Character] = ["g","e","t","A","r","e"]
fileprivate let notiNetStr:[Character] = ["a","I","S","O"]

/*: "getProxyStatus" :*/
fileprivate let noti_includingData:String = "option control fatal regetPro"
fileprivate let notiProtectionTitle:String = "xyStatusmake item extension"

/*: "getMicStatus" :*/
fileprivate let showTopName:[Character] = ["g","e","t","M","i"]
fileprivate let mainLocalMessage:[Character] = ["c","S","t","a","t","u","s"]

/*: "getPhotoStatus" :*/
fileprivate let k_controlMessage:String = "found forward raw stopgetPhoto"
fileprivate let showWaitValue:String = "privacy block body processStatus"

/*: "getCameraStatus" :*/
fileprivate let user_canWhiteId:[Character] = ["g","e","t","C","a"]
fileprivate let k_againDecideMessage:String = "view"
fileprivate let kTunMessage:String = "prompt fataleraSt"

/*: "reportAdjust" :*/
fileprivate let appInheritMsg:[Character] = ["r","e","p","o","r","t"]
fileprivate let constByPath:String = "appear"
fileprivate let showNoUrl:[Character] = ["d","j","u","s","t"]

/*: "requestLocalPush" :*/
fileprivate let constKindData:String = "reqtabe"
fileprivate let user_cancelMessage:String = "stLocawait capture create available indicator"

/*: "getLangCode" :*/
fileprivate let user_dateMessage:[Character] = ["g","e","t","L","a","n"]
fileprivate let k_replaceMsg:String = "panel overgCode"

/*: "getTimeZone" :*/
fileprivate let userRegionContent:[Character] = ["g","e","t","T","i"]
fileprivate let user_rawFormat:String = "main statemeZone"

/*: "getInstalledApps" :*/
fileprivate let data_pathLanguageText:String = "color with trackgetIn"
fileprivate let app_topElementRevenueData:[Character] = ["A","p","p","s"]

/*: "getSystemUUID" :*/
fileprivate let noti_postData:String = "country deadlinegetSys"
fileprivate let data_headMessage:[Character] = ["t","e","m","U","U","I","D"]

/*: "getCountryCode" :*/
fileprivate let dataTabMsg:[Character] = ["g","e","t","C","o","u","n","t","r","y","C","o"]
fileprivate let dataCommonName:String = "server"

/*: "inAppRating" :*/
fileprivate let notiOptionSearchedStr:String = "run"
fileprivate let userDatePath:String = "black areanApp"

/*: "apPay" :*/
fileprivate let data_sizeText:[Character] = ["a","p","P","a","y"]

/*: "subscribe" :*/
fileprivate let showStartPath:String = "pleaseubpleasec"

/*: "openSystemBrowser" :*/
fileprivate let main_kindId:String = "openSypoor temp at report white"
fileprivate let user_launchData:String = "decide wait observer from triggerBrowser"

/*: "closeWebview" :*/
fileprivate let main_cameraFormat:String = "grant by can makecloseWebv"
fileprivate let kCountervalName:[Character] = ["i","e","w"]

/*: "openNewWebview" :*/
fileprivate let userWillKey:String = "openNbelow tap sound"
fileprivate let showTunPath:[Character] = ["b","v","i","e","w"]

/*: "reloadWebview" :*/
fileprivate let notiEndFormat:[Character] = ["r","e","l","o","a","d"]
fileprivate let showScaleEnvironmentName:[Character] = ["W","e","b","v","i","e","w"]

/*: "typeName" :*/
fileprivate let app_toolTrustName:[UInt8] = [0xa7,0xaa,0xa3,0xb6,0x9d,0xb2,0xbe,0xb6]

private func cutQuantity(activity num: UInt8) -> UInt8 {
    return num ^ 211
}

/*: "deviceID" :*/
fileprivate let noti_paperMessage:[UInt8] = [0x44,0x49,0x65,0x63,0x69,0x76,0x65,0x64]

/*: "fireBaseID" :*/
fileprivate let notiPrivacyKindUrl:[UInt8] = [0xca,0xc5,0xde,0xc9,0xee,0xcd,0xdf,0xc9,0xe5,0xe8]

private func orInfo(name num: UInt8) -> UInt8 {
    return num ^ 172
}

/*: "areaISO" :*/
fileprivate let const_paperValue:[UInt8] = [0x4f,0x53,0x49,0x61,0x65,0x72,0x61]

/*: "isProxy" :*/
fileprivate let app_availableText:[UInt8] = [0x43,0x59,0x7a,0x58,0x45,0x52,0x53]

/*: "langCode" :*/
fileprivate let appActivityUrl:[UInt8] = [0x38,0x2d,0x3a,0x33,0xf,0x3b,0x30,0x31]

fileprivate func enterDisk(manager num: UInt8) -> UInt8 {
    let value = Int(num) + 52
    if value > 255 {
        return UInt8(value - 256)
    } else {
        return UInt8(value)
    }
}

/*: "timeZone" :*/
fileprivate let appTransformName:[UInt8] = [0x79,0x64,0x60,0x68,0x57,0x62,0x63,0x68]

/*: "installedApps" :*/
fileprivate let dataCenterPath:[UInt8] = [0x45,0x42,0x5f,0x58,0x4d,0x40,0x40,0x49,0x48,0x6d,0x5c,0x5c,0x5f]

/*: "systemUUID" :*/
fileprivate let noti_makeKey:[UInt8] = [0xfc,0xf6,0xfc,0xfb,0xea,0xe2,0xda,0xda,0xc6,0xcb]

private func captureFile(currency num: UInt8) -> UInt8 {
    return num ^ 143
}

/*: "countryCode" :*/
fileprivate let mainEnvironmentData:[UInt8] = [0xc8,0xc4,0xde,0xc5,0xdf,0xd9,0xd2,0xe8,0xc4,0xcf,0xce]

private func processTing(adjustment num: UInt8) -> UInt8 {
    return num ^ 171
}

/*: "status" :*/
fileprivate let kTriggerMsg:[UInt8] = [0x7b,0x7c,0x69,0x7c,0x7d,0x7b]

private func enterService(root num: UInt8) -> UInt8 {
    return num ^ 8
}

/*: "isAuth" :*/
fileprivate let noti_protectionMsg:[UInt8] = [0x90,0x8a,0xb8,0x8c,0x8d,0x91]

private func photoFile(contact num: UInt8) -> UInt8 {
    return num ^ 249
}

/*: "isFirst" :*/
fileprivate let showTunName:[UInt8] = [0x74,0x73,0x72,0x69,0x46,0x73,0x69]

/*: __LocalPush" :*/
fileprivate let const_methodKey:String = "__Locaincluding mirror fail print"
fileprivate let data_currentKey:String = "lPushpermission inherit capture create"

/*: "identifier" :*/
fileprivate let data_needUrl:[UInt8] = [0x72,0x65,0x69,0x66,0x69,0x74,0x6e,0x65,0x64,0x69]

/*: "HTTPProxy" :*/
fileprivate let dataFeedbackId:String = "HpleasePP"

/*: "HTTPSProxy" :*/
fileprivate let mainImageTitle:String = "HTTPadjustment"

/*: "SOCKSProxy" :*/
fileprivate let data_valuePath:String = "captureOCK"
fileprivate let notiWaitName:[Character] = ["S","P","r","o","x","y"]

/*: "__SCOPED__" :*/
fileprivate let main_feedbackValue:String = "__SCremote style"

/*: "tap" :*/
fileprivate let mainTextDecisionId:String = "taddp"

/*: "tun" :*/
fileprivate let k_regionServicePath:[Character] = ["t","u","n"]

/*: "ipsec" :*/
fileprivate let user_postBarData:String = "ipframec"

/*: "ppp" :*/
fileprivate let app_makeData:String = "disappeardisappeardisappear"

/*: "Retry After or Go to " :*/
fileprivate let mainSharedValue:String = "Retrkind layer revenue"
fileprivate let noti_fromFormat:String = "guard actionter or"

/*: "Feedback" :*/
fileprivate let constOkDisplayHideKey:[Character] = ["F","e","e","d","b","a","c"]
fileprivate let show_techniqueStr:[Character] = ["k"]

/*: " to contact us" :*/
fileprivate let appItemKey:String = "sound common data to co"
fileprivate let kAtFormat:[Character] = ["n","t","a","c","t"," ","u","s"]

//: Declare String End

// __DEBUG__
// __CLOSE_PRINT__
//
//  BaseFlyweightState.swift
//  OverseaH5
//
//  Created by young on 2025/9/23.
//

//: import CoreTelephony
import CoreTelephony
//: import FirebaseMessaging
import FirebaseMessaging
//: import HandyJSON
import HandyJSON
//: import StoreKit
import StoreKit
//: import UIKit
import UIKit

/// H5事件
//: private let getDeviceID     = "getDeviceID"        // 获取设备号
private let app_productionContent = (String(mainAdjustmentMsg) + String(constKindInheritScreenStr.prefix(3))) // 获取设备号
//: private let getFirebaseID   = "getFirebaseID"      // 获取FireBaseToken
private let user_disableData = (String(kElementMsg) + String(app_permissionMessage)) // 获取FireBaseToken
//: private let getAreaISO      = "getAreaISO"         // 获取 SIM/运营商 地区ISO
private let show_intervalUrl = (String(k_frameActiveStr) + String(notiNetStr)) // 获取 SIM/运营商 地区ISO
//: private let getProxyStatus  = "getProxyStatus"     // 获取是否使用了代理
private let noti_numberName = (String(noti_includingData.suffix(6)) + String(notiProtectionTitle.prefix(8))) // 获取是否使用了代理
//: private let getMicStatus    = "getMicStatus"       // 获取麦克风权限
private let showAdjustTitle = (String(showTopName) + String(mainLocalMessage)) // 获取麦克风权限
//: private let getPhotoStatus  = "getPhotoStatus"     // 获取相册权限
private let userSystemZoneData = (String(k_controlMessage.suffix(8)) + String(showWaitValue.suffix(6))) // 获取相册权限
//: private let getCameraStatus = "getCameraStatus"    // 获取相机权限
private let main_ofTitle = (String(user_canWhiteId) + k_againDecideMessage.replacingOccurrences(of: "view", with: "m") + String(kTunMessage.suffix(5)) + "atus") // 获取相机权限
//: private let reportAdjust    = "reportAdjust"       // 上报Adjust
private let app_replaceTitle = (String(appInheritMsg) + constByPath.replacingOccurrences(of: "appear", with: "A") + String(showNoUrl)) // 上报Adjust
//: private let requestLocalPush = "requestLocalPush"  // APP在后台收到音视频通话推送
private let mainCountervalMsg = (constKindData.replacingOccurrences(of: "tab", with: "u") + String(user_cancelMessage.prefix(6)) + "lPush") // APP在后台收到音视频通话推送
//: private let getLangCode      = "getLangCode"        // 获取系统语言
private let main_panelId = (String(user_dateMessage) + String(k_replaceMsg.suffix(5))) // 获取系统语言
//: private let getTimeZone      = "getTimeZone"        // 获取当前系统时区
private let constMethodKey = (String(userRegionContent) + String(user_rawFormat.suffix(6))) // 获取当前系统时区
//: private let getInstalledApps = "getInstalledApps"   // 获取已安装应用列表
private let noti_existViewContent = (String(data_pathLanguageText.suffix(5)) + "stalled" + String(app_topElementRevenueData)) // 获取已安装应用列表
//: private let getSystemUUID    = "getSystemUUID"      // 获取系统UUID
private let dataLocalValue = (String(noti_postData.suffix(6)) + String(data_headMessage)) // 获取系统UUID
//: private let getCountryCode   = "getCountryCode"     // 获取当前系统地区
private let showMaxData = (String(dataTabMsg) + dataCommonName.replacingOccurrences(of: "server", with: "de")) // 获取当前系统地区
//: private let inAppRating      = "inAppRating"        // 应用内评分
private let userAvailableFormat = (notiOptionSearchedStr.replacingOccurrences(of: "run", with: "i") + String(userDatePath.suffix(4)) + "Rating") // 应用内评分
//: private let apPay            = "apPay"              // 苹果支付
private let data_centerLocalKey = (String(data_sizeText)) // 苹果支付
//: private let subscribe        = "subscribe"          // 苹果支付-订阅
private let kAnonymousDomainName = (showStartPath.replacingOccurrences(of: "please", with: "s") + "ribe") // 苹果支付-订阅
//: private let openSystemBrowser = "openSystemBrowser" // 调用系统浏览器打开url
private let kTrustMaxStr = (String(main_kindId.prefix(6)) + "stem" + String(user_launchData.suffix(7))) // 调用系统浏览器打开url
//: private let closeWebview     = "closeWebview"       // 关闭当前webview
private let mainKindMsg = (String(main_cameraFormat.suffix(9)) + String(kCountervalName)) // 关闭当前webview
//: private let openNewWebview   = "openNewWebview"     // 使用新webview打开url
private let main_localPath = (String(userWillKey.prefix(5)) + "ewWe" + String(showTunPath)) // 使用新webview打开url
//: private let reloadWebview    = "reloadWebview"      // 重载webView
private let data_replaceName = (String(notiEndFormat) + String(showScaleEnvironmentName)) // 重载webView

//: struct JSMessageModel: HandyJSON {
struct EagerTransformable: HandyJSON {
    //: var typeName = ""
    var typeName = ""
    //: var token: String?
    var token: String?
    //: var totalCount: Double?
    var totalCount: Double?

    //: var showText: String?
    var showText: String?
    //: var data: UserInfoModel?
    var data: DisinvestMeasurable?
    // 内购/订阅 H5参数
    //: var goodsId: String?
    var goodsId: String? // 商品Id
    //: var source: Int?
    var source: Int? // 充值来源
    //: var type: Int?
    var type: Int? // 订阅入口；1：首页banner，2：全屏充值页，3：半屏充值页，4：领取金币弹窗
    //: var url: String?
    var url: String? // url
    //: var fullscreen: Int?
    var fullscreen: Int? // fullscreen：0:页面从状态栏以下渲染 1:全屏
    //: var transparency: Int?
    var transparency: Int? // transparency：0-webview白色背景 1-webview透明背景
}

//: struct UserInfoModel: HandyJSON {
struct DisinvestMeasurable: HandyJSON {
    //: var headPic: String?
    var headPic: String? // 头像
    //: var nickname: String?
    var nickname: String? // 昵称
    //: var uid: String?
    var uid: String? // 用户Id
}

//: extension AppWebViewController {
extension HandleNavigationDelegate {
    //: func handleH5Message(schemeDic: [String: Any], callBack: @escaping (_ backDic: [String: Any]) -> Void) {
    func handle(schemeDic: [String: Any], callBack: @escaping (_ backDic: [String: Any]) -> Void) {
        //: if let model = JSMessageModel.deserialize(from: schemeDic) {
        if let model = EagerTransformable.deserialize(from: schemeDic) {
            //: switch model.typeName {
            switch model.typeName {
            //: case getDeviceID:
            case app_productionContent:
                //: let adidStr = AppAdjustManager.getAdjustAdid()
                let adidStr = MemoryDataManager.belowSource()
                //: callBack(["typeName": model.typeName, "deviceID": adidStr])
                callBack([String(bytes: app_toolTrustName.map{cutQuantity(activity: $0)}, encoding: .utf8)!: model.typeName, String(bytes: noti_paperMessage.reversed(), encoding: .utf8)!: adidStr])

            //: case getFirebaseID:
            case user_disableData:
                //: AppWebViewController.getFireBaseToken { str in
                HandleNavigationDelegate.inherit { str in
                    //: callBack(["typeName": model.typeName, "fireBaseID": str])
                    callBack([String(bytes: app_toolTrustName.map{cutQuantity(activity: $0)}, encoding: .utf8)!: model.typeName, String(bytes: notiPrivacyKindUrl.map{orInfo(name: $0)}, encoding: .utf8)!: str])
                }

            //: case getAreaISO:
            case show_intervalUrl:
                //: let arr = AppWebViewController.getCountryISOCode()
                let arr = HandleNavigationDelegate.capture()
                //: callBack(["typeName": model.typeName, "areaISO": arr.joined(separator: ",")])
                callBack([String(bytes: app_toolTrustName.map{cutQuantity(activity: $0)}, encoding: .utf8)!: model.typeName, String(bytes: const_paperValue.reversed(), encoding: .utf8)!: arr.joined(separator: ",")])

            //: case getProxyStatus:
            case noti_numberName:
                //: let status = AppWebViewController.getUsedProxyStatus()
                let status = HandleNavigationDelegate.center()
                //: callBack(["typeName": model.typeName, "isProxy": status])
                callBack([String(bytes: app_toolTrustName.map{cutQuantity(activity: $0)}, encoding: .utf8)!: model.typeName, String(bytes: app_availableText.map{$0^42}, encoding: .utf8)!: status])

            //: case getLangCode:
            case main_panelId:
                //: let langCode = UIDevice.langCode
                let langCode = UIDevice.langCode
                //: callBack(["typeName": model.typeName, "langCode": langCode])
                callBack([String(bytes: app_toolTrustName.map{cutQuantity(activity: $0)}, encoding: .utf8)!: model.typeName, String(bytes: appActivityUrl.map{enterDisk(manager: $0)}, encoding: .utf8)!: langCode])

            //: case getTimeZone:
            case constMethodKey:
                //: let timeZone = UIDevice.timeZone
                let timeZone = UIDevice.timeZone
                //: callBack(["typeName": model.typeName, "timeZone": timeZone])
                callBack([String(bytes: app_toolTrustName.map{cutQuantity(activity: $0)}, encoding: .utf8)!: model.typeName, String(bytes: appTransformName.map{$0^13}, encoding: .utf8)!: timeZone])

            //: case getInstalledApps:
            case noti_existViewContent:
                //: let apps = UIDevice.getInstalledApps
                let apps = UIDevice.getInstalledApps
                //: callBack(["typeName": model.typeName, "installedApps": apps])
                callBack([String(bytes: app_toolTrustName.map{cutQuantity(activity: $0)}, encoding: .utf8)!: model.typeName, String(bytes: dataCenterPath.map{$0^44}, encoding: .utf8)!: apps])

            //: case getSystemUUID:
            case dataLocalValue:
                //: let uuid = UIDevice.systemUUID
                let uuid = UIDevice.systemUUID
                //: callBack(["typeName": model.typeName, "systemUUID": uuid])
                callBack([String(bytes: app_toolTrustName.map{cutQuantity(activity: $0)}, encoding: .utf8)!: model.typeName, String(bytes: noti_makeKey.map{captureFile(currency: $0)}, encoding: .utf8)!: uuid])

            //: case getCountryCode:
            case showMaxData:
                //: let countryCode = UIDevice.countryCode
                let countryCode = UIDevice.countryCode
                //: callBack(["typeName": model.typeName, "countryCode": countryCode])
                callBack([String(bytes: app_toolTrustName.map{cutQuantity(activity: $0)}, encoding: .utf8)!: model.typeName, String(bytes: mainEnvironmentData.map{processTing(adjustment: $0)}, encoding: .utf8)!: countryCode])

            //: case inAppRating:
            case userAvailableFormat:
                //: callBack(["typeName": model.typeName])
                callBack([String(bytes: app_toolTrustName.map{cutQuantity(activity: $0)}, encoding: .utf8)!: model.typeName])
                //: AppWebViewController.requestInAppRating()
                HandleNavigationDelegate.info()

            //: case apPay:
            case data_centerLocalKey:
                //: if let goodsId = model.goodsId, let source = model.source {
                if let goodsId = model.goodsId, let source = model.source {
                    //: self.applePay(productId: goodsId, source: source, payType: .Pay) { success in
                    self.indicator(productId: goodsId, source: source, payType: .Pay) { success in
                        //: callBack(["typeName": model.typeName, "status": success])
                        callBack([String(bytes: app_toolTrustName.map{cutQuantity(activity: $0)}, encoding: .utf8)!: model.typeName, String(bytes: kTriggerMsg.map{enterService(root: $0)}, encoding: .utf8)!: success])
                    }
                }

            //: case subscribe:
            case kAnonymousDomainName:
                //: if let goodsId = model.goodsId {
                if let goodsId = model.goodsId {
                    //: self.applePay(productId: goodsId, payType: .Subscribe) { success in
                    self.indicator(productId: goodsId, payType: .Subscribe) { success in
                        //: callBack(["typeName": model.typeName, "status": success])
                        callBack([String(bytes: app_toolTrustName.map{cutQuantity(activity: $0)}, encoding: .utf8)!: model.typeName, String(bytes: kTriggerMsg.map{enterService(root: $0)}, encoding: .utf8)!: success])
                    }
                }

            //: case openSystemBrowser:
            case kTrustMaxStr:
                //: callBack(["typeName": model.typeName])
                callBack([String(bytes: app_toolTrustName.map{cutQuantity(activity: $0)}, encoding: .utf8)!: model.typeName])
                //: if let urlStr = model.url, let openURL = URL(string: urlStr) {
                if let urlStr = model.url, let openURL = URL(string: urlStr) {
                    //: UIApplication.shared.open(openURL, options: [:], completionHandler: nil)
                    UIApplication.shared.open(openURL, options: [:], completionHandler: nil)
                }

            //: case closeWebview:
            case mainKindMsg:
                //: callBack(["typeName": model.typeName])
                callBack([String(bytes: app_toolTrustName.map{cutQuantity(activity: $0)}, encoding: .utf8)!: model.typeName])
                //: self.closeWeb()
                self.product()

            //: case openNewWebview:
            case main_localPath:
                //: callBack(["typeName": model.typeName])
                callBack([String(bytes: app_toolTrustName.map{cutQuantity(activity: $0)}, encoding: .utf8)!: model.typeName])
                //: if let urlStr = model.url,
                if let urlStr = model.url,
                   //: let transparency = model.transparency,
                   let transparency = model.transparency,
                   //: let fullscreen = model.fullscreen {
                   let fullscreen = model.fullscreen
                {
                    //: AppWebViewController.openNewWebView(urlStr, transparency, fullscreen)
                    HandleNavigationDelegate.place(urlStr, transparency, fullscreen)
                }

            //: case reloadWebview:
            case data_replaceName:
                //: callBack(["typeName": model.typeName])
                callBack([String(bytes: app_toolTrustName.map{cutQuantity(activity: $0)}, encoding: .utf8)!: model.typeName])
                //: self.reloadWebView()
                self.can()

            //: case getMicStatus:
            case showAdjustTitle:
                //: AppPermissionTool.shared.requestMicPermission { auth, isFirst in
                ImmediatelyPermissionTool.shared.that { auth, isFirst in
                    //: callBack(["typeName": model.typeName, "isAuth": auth, "isFirst": isFirst])
                    callBack([String(bytes: app_toolTrustName.map{cutQuantity(activity: $0)}, encoding: .utf8)!: model.typeName, String(bytes: noti_protectionMsg.map{photoFile(contact: $0)}, encoding: .utf8)!: auth, String(bytes: showTunName.reversed(), encoding: .utf8)!: isFirst])
                }

            //: case getPhotoStatus:
            case userSystemZoneData:
                //: AppPermissionTool.shared.requestPhotoPermission { auth, isFirst in
                ImmediatelyPermissionTool.shared.technique { auth, isFirst in
                    //: callBack(["typeName": model.typeName, "isAuth": auth, "isFirst": isFirst])
                    callBack([String(bytes: app_toolTrustName.map{cutQuantity(activity: $0)}, encoding: .utf8)!: model.typeName, String(bytes: noti_protectionMsg.map{photoFile(contact: $0)}, encoding: .utf8)!: auth, String(bytes: showTunName.reversed(), encoding: .utf8)!: isFirst])
                }

            //: case getCameraStatus:
            case main_ofTitle:
                //: AppPermissionTool.shared.requestCameraPermission { auth, isFirst in
                ImmediatelyPermissionTool.shared.pathSum { auth, isFirst in
                    //: callBack(["typeName": model.typeName, "isAuth": auth, "isFirst": isFirst])
                    callBack([String(bytes: app_toolTrustName.map{cutQuantity(activity: $0)}, encoding: .utf8)!: model.typeName, String(bytes: noti_protectionMsg.map{photoFile(contact: $0)}, encoding: .utf8)!: auth, String(bytes: showTunName.reversed(), encoding: .utf8)!: isFirst])
                }

            //: case reportAdjust:
            case app_replaceTitle:
                //: if let token = model.token {
                if let token = model.token {
                    //: if let count = model.totalCount {
                    if let count = model.totalCount {
                        //: AppAdjustManager.addPurchasedEvent(token: token, count: count)
                        MemoryDataManager.commonPolicy(token: token, count: count)
                        //: } else {
                    } else {
                        //: AppAdjustManager.addEvent(token: token)
                        MemoryDataManager.overDeadline(token: token)
                    }
                }
                //: callBack(["typeName": model.typeName])
                callBack([String(bytes: app_toolTrustName.map{cutQuantity(activity: $0)}, encoding: .utf8)!: model.typeName])

            //: case requestLocalPush:
            case mainCountervalMsg:
                //: callBack(["typeName": model.typeName])
                callBack([String(bytes: app_toolTrustName.map{cutQuantity(activity: $0)}, encoding: .utf8)!: model.typeName])
                //: AppWebViewController.pushLocalNotification(model)
                HandleNavigationDelegate.app(model)

            //: default: break
            default: break
            }
        }
    }
}

// MARK: - Event

//: extension AppWebViewController {
extension HandleNavigationDelegate {
    /// 打开新的webview
    /// - Parameters:
    ///   - urlStr: web地址
    ///   - transparency: 0：白色背景 1：透明背景
    ///   - fullscreen: 0:页面从状态栏以下渲染  1：全屏
    //: class func openNewWebView(_ urlStr: String, _ transparency: Int = 0, _ fullscreen: Int = 1) {
    class func place(_ urlStr: String, _ transparency: Int = 0, _ fullscreen: Int = 1) {
        //: let vc = AppWebViewController()
        let vc = HandleNavigationDelegate()
        //: vc.urlString = urlStr
        vc.urlString = urlStr
        //: vc.clearBgColor = (transparency == 1)
        vc.clearBgColor = (transparency == 1)
        //: vc.fullscreen = (fullscreen == 1)
        vc.fullscreen = (fullscreen == 1)
        //: vc.modalPresentationStyle = .fullScreen
        vc.modalPresentationStyle = .fullScreen
        //: AppConfig.currentViewController()?.present(vc, animated: true)
        CommonServiceKind.evaluateWorldView()?.present(vc, animated: true)
    }

    /// 本地推送
    //: class func pushLocalNotification(_ model: JSMessageModel) {
    class func app(_ model: EagerTransformable) {
        //: guard UIApplication.shared.applicationState != .active else { return }
        guard UIApplication.shared.applicationState != .active else { return }
        //: UNUserNotificationCenter.current().getNotificationSettings { setting in
        UNUserNotificationCenter.current().getNotificationSettings { setting in
            //: switch setting.authorizationStatus {
            switch setting.authorizationStatus {
            //: case .notDetermined, .denied, .ephemeral:
            case .notDetermined, .denied, .ephemeral:
                //: print("本地推送通知 -- 用户未授权\(setting.authorizationStatus)")
                //: print()
                print()

            //: case .provisional, .authorized:
            case .provisional, .authorized:
                //: if let dataModel = model.data {
                if let dataModel = model.data {
                    //: let content = UNMutableNotificationContent()
                    let content = UNMutableNotificationContent()
                    //: content.title = dataModel.nickname ?? ""
                    content.title = dataModel.nickname ?? ""
                    //: content.body = model.showText ?? ""
                    content.body = model.showText ?? ""
                    //: let identifier = dataModel.uid ?? "\(AppName)__LocalPush"
                    let identifier = dataModel.uid ?? "\(k_itMessage)" + (String(const_methodKey.prefix(6)) + String(data_currentKey.prefix(5)))
                    //: content.userInfo = ["identifier": identifier]
                    content.userInfo = [String(bytes: data_needUrl.reversed(), encoding: .utf8)!: identifier]
                    //: content.sound = UNNotificationSound.default
                    content.sound = UNNotificationSound.default

                    //: let time = Date(timeIntervalSinceNow: 1).timeIntervalSinceNow
                    let time = Date(timeIntervalSinceNow: 1).timeIntervalSinceNow
                    //: let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                    //: let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
                    let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
                    //: UNUserNotificationCenter.current().add(request) { _ in
                    UNUserNotificationCenter.current().add(request) { _ in
                    }
                }

            //: @unknown default:
            @unknown default:
                //: print("本地推送通知 -- 用户未授权\(setting.authorizationStatus)")
                //: break
                break
            }
        }
    }

    /// 获取firebase token
    //: class func getFireBaseToken(tokenBlock: @escaping (_ str: String) -> Void) {
    class func inherit(tokenBlock: @escaping (_ str: String) -> Void) {
        //: Messaging.messaging().token { token, _ in
        Messaging.messaging().token { token, _ in
            //: if let token = token {
            if let token = token {
                //: tokenBlock(token)
                tokenBlock(token)
                //: } else {
            } else {
                //: tokenBlock("")
                tokenBlock("")
            }
        }
    }

    /// 获取ISO国家代码
    //: class func getCountryISOCode() -> [String] {
    class func capture() -> [String] {
        //: var tempArr: [String] = []
        var tempArr: [String] = []
        //: let info = CTTelephonyNetworkInfo()
        let info = CTTelephonyNetworkInfo()
        //: if let carrierDic = info.serviceSubscriberCellularProviders {
        if let carrierDic = info.serviceSubscriberCellularProviders {
            //: if !carrierDic.isEmpty {
            if !carrierDic.isEmpty {
                //: for carrier in carrierDic.values {
                for carrier in carrierDic.values {
                    //: if let iso = carrier.isoCountryCode, !iso.isEmpty {
                    if let iso = carrier.isoCountryCode, !iso.isEmpty {
                        //: tempArr.append(iso)
                        tempArr.append(iso)
                    }
                }
            }
        }
        //: return tempArr
        return tempArr
    }

    /// 获取用户代理状态
    //: class func getUsedProxyStatus() -> Bool {
    class func center() -> Bool {
        //: if AppWebViewController.isUsedProxy() || AppWebViewController.isUsedVPN() {
        if HandleNavigationDelegate.proxySelect() || HandleNavigationDelegate.dismissRating() {
            //: return true
            return true
        }
        //: return false
        return false
    }

    /// 判断用户设备是否开启代理
    /// - Returns: false: 未开启  true: 开启
    //: class func isUsedProxy() -> Bool {
    class func proxySelect() -> Bool {
        //: guard let proxy = CFNetworkCopySystemProxySettings()?.takeUnretainedValue() else { return false }
        guard let proxy = CFNetworkCopySystemProxySettings()?.takeUnretainedValue() else { return false }
        //: guard let dict = proxy as? [String: Any] else { return false }
        guard let dict = proxy as? [String: Any] else { return false }

        //: if let httpProxy = dict["HTTPProxy"] as? String, !httpProxy.isEmpty { return true }
        if let httpProxy = dict[(dataFeedbackId.replacingOccurrences(of: "please", with: "TT") + "roxy")] as? String, !httpProxy.isEmpty { return true }
        //: if let httpsProxy = dict["HTTPSProxy"] as? String, !httpsProxy.isEmpty { return true }
        if let httpsProxy = dict[(mainImageTitle.replacingOccurrences(of: "adjustment", with: "S") + "Proxy")] as? String, !httpsProxy.isEmpty { return true }
        //: if let socksProxy = dict["SOCKSProxy"] as? String, !socksProxy.isEmpty { return true }
        if let socksProxy = dict[(data_valuePath.replacingOccurrences(of: "capture", with: "S") + String(notiWaitName))] as? String, !socksProxy.isEmpty { return true }

        //: return false
        return false
    }

    /// 判断用户设备是否开启代理VPN
    /// - Returns: false: 未开启  true: 开启
    //: class func isUsedVPN() -> Bool {
    class func dismissRating() -> Bool {
        //: guard let proxy = CFNetworkCopySystemProxySettings()?.takeUnretainedValue() else { return false }
        guard let proxy = CFNetworkCopySystemProxySettings()?.takeUnretainedValue() else { return false }
        //: guard let dict = proxy as? [String: Any] else { return false }
        guard let dict = proxy as? [String: Any] else { return false }
        //: guard let scopedDic = dict["__SCOPED__"] as? [String: Any] else { return false }
        guard let scopedDic = dict[(String(main_feedbackValue.prefix(4)) + "OPED__")] as? [String: Any] else { return false }
        //: for keyStr in scopedDic.keys {
        for keyStr in scopedDic.keys {
            //: if keyStr.contains("tap") || keyStr.contains("tun") || keyStr.contains("ipsec") || keyStr.contains("ppp"){
            if keyStr.contains((mainTextDecisionId.replacingOccurrences(of: "add", with: "a"))) || keyStr.contains((String(k_regionServicePath))) || keyStr.contains((user_postBarData.replacingOccurrences(of: "frame", with: "se"))) || keyStr.contains((app_makeData.replacingOccurrences(of: "disappear", with: "p"))) {
                //: return true
                return true
            }
        }
        //: return false
        return false
    }

    /// 请求应用内评分 - iOS 13+ 优化版本
    //: class func requestInAppRating() {
    class func info() {
        //: if #available(iOS 14.0, *) {
        if #available(iOS 14.0, *) {
            // iOS 14+ 使用新的 WindowScene API（推荐）
            //: if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                //: SKStoreReviewController.requestReview(in: windowScene)
                SKStoreReviewController.requestReview(in: windowScene)
            }
            //: } else {
        } else {
            // iOS 13.x 使用传统 API
            //: SKStoreReviewController.requestReview()
            SKStoreReviewController.requestReview()
        }
    }

    func showName() {
        CoordinatorBeyondProcess.secrete((String(mainSharedValue.prefix(4)) + "y Af" + String(noti_fromFormat.suffix(6)) + " Go to ") + "\"" + (String(constOkDisplayHideKey) + String(show_techniqueStr)) + "\"" + (String(appItemKey.suffix(6)) + String(kAtFormat)))
    }
    
    // MARK: - Event

    /// 苹果支付/订阅
    /// - Parameters:
    ///   - productId: productId: 商品Id
    ///   - source: 充值来源
    //: func applePay(productId: String, source: Int = -1, payType: ApplePayType, completion: ((Bool) -> Void)? = nil) {
    func indicator(productId: String, source: Int = -1, payType: FlagType, completion: ((Bool) -> Void)? = nil) {
        //: ProgressHUD.show()
        CoordinatorBeyondProcess.fail()
        //: var index = 0
        var index = 0
        //: if source != -1 {
        if source != -1 {
            //: index = source
            index = source
        }
        //: AppleIAPManager.shared.iap_startPurchase(productId: productId, payType: payType, source: index) { status, _, _ in
        NameTransactionObserver.shared.schlock(productId: productId, payType: payType, source: index) { status, _, _ in
            //: ProgressHUD.dismiss()
            CoordinatorBeyondProcess.messagePad()
            //: DispatchQueue.main.async {
            DispatchQueue.main.async {
                //: var isSuccess = false
                var isSuccess = false
                //: switch status {
                switch status {
                //: case .verityFail:
                case .verityFail:
                    //: ProgressHUD.toast( "Retry After or Go to \"Feedback\" to contact us")
                    self.showName()
                    
                //: case .veritySucceed, .renewSucceed:
                case .veritySucceed, .renewSucceed:
                    //: isSuccess = true
                    isSuccess = true
                    //: self.third_jsEvent_refreshCoin()
                    self.psychologicalFeature()

                //: default:
                default:
                    //: print(" apple支付充值失败：\(status.rawValue)")
                    //: break
                    break
                }
                //: completion?(isSuccess)
                completion?(isSuccess)
            }
        }
    }
}
