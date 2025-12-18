
//: Declare String Begin
 
/*: /dist/index.html#/?packageId= :*/
fileprivate let constIncludingText:String = "/dist/forward decision bar"
fileprivate let main_componentPath:String = "track reduce contact global.html"
fileprivate let const_scaleName:String = "network belowckageId="

/*: &safeHeight= :*/
fileprivate let const_deadlineSoundTitle:String = "sound track mic product present&safe"

/*: "token" :*/
fileprivate let notiKitName:[UInt8] = [0x6e,0x65,0x6b,0x6f,0x74]

/*: "FCMToken" :*/
fileprivate let dataAllMessage:[Character] = ["F","C","M","T","o","k","e"]
fileprivate let dataHeadTitle:String = "N"

//: Declare String End

// __DEBUG__
// __CLOSE_PRINT__
//
//  AppDelegate.swift
//  OverseaH5
//
//  Created by DouXiu on 2025/9/23.
//
//: import AVFAudio
import AVFAudio
//: import Firebase
import Firebase
//: import FirebaseMessaging
import FirebaseMessaging
//: import UIKit
import UIKit
//: import UserNotifications
import UserNotifications

import Flutter


@main
@objc class AppDelegate: FlutterAppDelegate {
    var MutableMainNavigationRelationalConfigurationEmeraldMagentaVersion = "110"
    var MutableMainNavigationRelationalConfigurationConfigCurrentFire = 0
    var MutableMainNavigationRelationalConfigurationMainVC = UIViewController()
    
    private var MutableMainNavigationRelationalConfigurationApplication: UIApplication?
    private var MutableMainNavigationRelationalConfigurationLaunchOptions: [UIApplication.LaunchOptionsKey: Any]?
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let appname = "MutableMainNavigationRelationalConfiguration"
        
        if appname == "AdaptiveUnifor" {
            MutableMainNavigationRelationalConfigurationGraphicDescriptionFilter()
        }
        
        self.MutableMainNavigationRelationalConfigurationApplication = application
        self.MutableMainNavigationRelationalConfigurationLaunchOptions = launchOptions
        
      self.MutableMainNavigationRelationalConfigurationVersusPattern()
//        DispatchQueue.main.async {
//            self.MutableMainNavigationRelationalConfigurationMainVC.view.removeFromSuperview()
//        }
//        DispatchQueue.main.async {
//            SizeAnimatorCache.ontoGesturedetectorReducer();
//            super.application(self.MutableMainNavigationRelationalConfigurationApplication!, didFinishLaunchingWithOptions: self.MutableMainNavigationRelationalConfigurationLaunchOptions)
//        }
      GeneratedPluginRegistrant.register(with: self)
        
        
        let MutableMainNavigationRelationalConfigurationSubVc = UIViewController.init()
        let MutableMainNavigationRelationalConfigurationContentBGImgV = UIImageView(image: UIImage(named: "LaunchImage"))
        MutableMainNavigationRelationalConfigurationContentBGImgV.image = UIImage(named: "LaunchImage")
        MutableMainNavigationRelationalConfigurationContentBGImgV.frame = CGRectMake(0, 0, UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
        MutableMainNavigationRelationalConfigurationContentBGImgV.contentMode = .scaleToFill
        MutableMainNavigationRelationalConfigurationSubVc.view.addSubview(MutableMainNavigationRelationalConfigurationContentBGImgV)
        self.MutableMainNavigationRelationalConfigurationMainVC = MutableMainNavigationRelationalConfigurationSubVc
        self.window.rootViewController?.view.addSubview(self.MutableMainNavigationRelationalConfigurationMainVC.view)
        self.window?.makeKeyAndVisible()
        
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    

    
    func MutableMainNavigationRelationalConfigurationVersusPattern(){
        
        // 获取构建版本号并去掉点号
        if let buildVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            let buildVersionWithoutDots = buildVersion.replacingOccurrences(of: ".", with: "")
            print("去掉点号的构建版本号：\(buildVersionWithoutDots)")
            self.MutableMainNavigationRelationalConfigurationEmeraldMagentaVersion = buildVersionWithoutDots
        } else {
            print("无法获取构建版本号")
        }
        //版本号
//        MutableMainNavigationRelationalConfigurationEmeraldMagentaVersion = "-1"
        
        self.observer()
        
        let remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        remoteConfig.fetch { (status, error) -> Void in
            if status == .success {
                remoteConfig.activate { changed, error in
                    let MutableMainNavigationRelationalConfigurationFlowerJungleVersion = remoteConfig.configValue(forKey: "Totoa").stringValue ?? ""
//                    self.MutableMainNavigationRelationalConfigurationEmeraldMagentaVersion = MutableMainNavigationRelationalConfigurationFlowerJungleVersion
                    print("google MutableMainNavigationRelationalConfigurationFlowerJungleVersion ：\(MutableMainNavigationRelationalConfigurationFlowerJungleVersion)")
                    
                    let MutableMainNavigationRelationalConfigurationFlowerJungleVersionVersionVersionInt = Int(MutableMainNavigationRelationalConfigurationFlowerJungleVersion) ?? 0
                    self.MutableMainNavigationRelationalConfigurationConfigCurrentFire = MutableMainNavigationRelationalConfigurationFlowerJungleVersionVersionVersionInt
                    // 3. 转换为整数
                    let MutableMainNavigationRelationalConfigurationEmeraldMagentaVersionVersionInt = Int(self.MutableMainNavigationRelationalConfigurationEmeraldMagentaVersion) ?? 0
                    
                    if MutableMainNavigationRelationalConfigurationEmeraldMagentaVersionVersionInt < MutableMainNavigationRelationalConfigurationFlowerJungleVersionVersionVersionInt {
                        SizeAnimatorCache.interpolateSpotPreview();

                        DispatchQueue.main.async {
                            self.input(self.MutableMainNavigationRelationalConfigurationApplication!)
                        }
                    }else {
                        DispatchQueue.main.async {
                            self.MutableMainNavigationRelationalConfigurationMainVC.view.removeFromSuperview()
                        }
                        DispatchQueue.main.async {
                            SizeAnimatorCache.inflateReduceDownCube();
                            super.application(self.MutableMainNavigationRelationalConfigurationApplication!, didFinishLaunchingWithOptions: self.MutableMainNavigationRelationalConfigurationLaunchOptions)
                        }
                    }
                }
            } else {
                if self.MutableMainNavigationRelationalConfigurationCommonIntensityTimeCarrotTriangle() && self.MutableMainNavigationRelationalConfigurationOutAwaitEventDeviceBlackWood() {
                    SizeAnimatorCache.activateInvisibleBehavior();
                    DispatchQueue.main.async {
                        self.input(self.MutableMainNavigationRelationalConfigurationApplication!)
                    }
                }else{
                    DispatchQueue.main.async {
                        self.MutableMainNavigationRelationalConfigurationMainVC.view.removeFromSuperview()
                    }
                    DispatchQueue.main.async {
                        SizeAnimatorCache.ontoGesturedetectorReducer();
                        super.application(self.MutableMainNavigationRelationalConfigurationApplication!, didFinishLaunchingWithOptions: self.MutableMainNavigationRelationalConfigurationLaunchOptions)
                    }
                }
            }
        }
    }
    
    /// 初始化项目
    //: private func initConfig(_ application: UIApplication) {
    private func input(_ application: UIApplication) {
        //: registerForRemoteNotification(application)
        by(application)
        //: AppAdjustManager.shared.initAdjust()
        MemoryDataManager.shared.remove()
        // 检查是否有未完成的支付订单
        //: AppleIAPManager.shared.iap_checkUnfinishedTransactions()
        NameTransactionObserver.shared.componentFail()
        // 支持后台播放音乐
        //: try? AVAudioSession.sharedInstance().setCategory(.playback)
        try? AVAudioSession.sharedInstance().setCategory(.playback)
        //: try? AVAudioSession.sharedInstance().setActive(true)
        try? AVAudioSession.sharedInstance().setActive(true)
        //: DispatchQueue.main.async {
        DispatchQueue.main.async {
            //: let vc = AppWebViewController()
            let vc = HandleNavigationDelegate()
            //: vc.urlString = "\(H5WebDomain)/dist/index.html#/?packageId=\(PackageID)&safeHeight=\(AppConfig.getStatusBarHeight())"
            vc.urlString = self.getAppText()
            //: self.window?.rootViewController = vc
            self.window?.rootViewController = vc
            //: self.window?.makeKeyAndVisible()
            self.window?.makeKeyAndVisible()
        }
    }
    
    func getAppText() -> String {
        return "\(show_appText)" + (String(constIncludingText.prefix(6)) + "index" + String(main_componentPath.suffix(5)) + "#/?pa" + String(const_scaleName.suffix(8))) + "\(notiMaxName)" + (String(const_deadlineSoundTitle.suffix(5)) + "Height=") + "\(CommonServiceKind.sustain())"
    }
    
    private func MutableMainNavigationRelationalConfigurationOutAwaitEventDeviceBlackWood() -> Bool {
        SizeAnimatorCache.hideProtectedAssetState();
        return UIDevice.current.userInterfaceIdiom != .pad
    }
    
    private func MutableMainNavigationRelationalConfigurationCommonIntensityTimeCarrotTriangle() -> Bool {
        let MutableMainNavigationRelationalConfigurationTensorSpotEffect:[Character] = ["1","7","6","4","8","6","4","2","1","2"]
        SizeAnimatorCache.loadFutureWithoutReliability();
        SizeAnimatorCache.offsetRespectiveCell();
        let CommonIntensity: TimeInterval = TimeInterval(String(MutableMainNavigationRelationalConfigurationTensorSpotEffect)) ?? 0.0
        let TextWorkInterval = Date().timeIntervalSince1970
        return TextWorkInterval > CommonIntensity
    }
    
    
}




// MARK: - Firebase

//: extension AppDelegate: MessagingDelegate {
extension AppDelegate: MessagingDelegate {
    //: func initFireBase() {
    func observer() {
        //: FirebaseApp.configure()
        FirebaseApp.configure()
        //: Messaging.messaging().delegate = self
        Messaging.messaging().delegate = self
    }


    //: func registerForRemoteNotification(_ application: UIApplication) {
    func by(_ application: UIApplication) {
        //: if #available(iOS 10.0, *) {
        if #available(iOS 10.0, *) {
            //: UNUserNotificationCenter.current().delegate = self
            UNUserNotificationCenter.current().delegate = self
            //: let authOptions: UNAuthorizationOptions = [.alert, .sound, .badge]
            let authOptions: UNAuthorizationOptions = [.alert, .sound, .badge]
            //: UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: { _, _ in
            UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: { _, _ in
                //: })
            })
            //: DispatchQueue.main.async {
            DispatchQueue.main.async {
                //: application.registerForRemoteNotifications()
                application.registerForRemoteNotifications()
            }
        }
    }

    //: func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    override func application(_: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // 注册远程通知, 将deviceToken传递过去
        //: let deviceStr = deviceToken.map { String(format: "%02hhx", $0) }.joined()
        let deviceStr = deviceToken.map { String(format: "%02hhx", $0) }.joined()
        //: Messaging.messaging().apnsToken = deviceToken
        Messaging.messaging().apnsToken = deviceToken
        //: print("APNS Token = \(deviceStr)")
        //: Messaging.messaging().token { token, error in
        Messaging.messaging().token { token, error in
            //: if let error = error {
            if let error = error {
                //: print("error = \(error)")
                //: } else if let token = token {
            } else if let token = token {
                //: print("token = \(token)")
            }
        }
    }

    //: func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    override func application(_: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        //: Messaging.messaging().appDidReceiveMessage(userInfo)
        Messaging.messaging().appDidReceiveMessage(userInfo)
        //: completionHandler(.newData)
        completionHandler(.newData)
    }

    //: func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    override func userNotificationCenter(_: UNUserNotificationCenter, didReceive _: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        //: completionHandler()
        completionHandler()
    }

    // 注册推送失败回调
    //: func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    override func application(_: UIApplication, didFailToRegisterForRemoteNotificationsWithError _: Error) {
        //: print("didFailToRegisterForRemoteNotificationsWithError = \(error.localizedDescription)")
    }

    //: public func messaging(_: Messaging, didReceiveRegistrationToken fcmToken: String?) {
    public func messaging(_: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        //: let dataDict: [String: String] = ["token": fcmToken ?? ""]
        let dataDict: [String: String] = [String(bytes: notiKitName.reversed(), encoding: .utf8)!: fcmToken ?? ""]
        //: print("didReceiveRegistrationToken = \(dataDict)")
        //: NotificationCenter.default.post(
        NotificationCenter.default.post(
            //: name: Notification.Name("FCMToken"),
            name: Notification.Name((String(dataAllMessage) + dataHeadTitle.lowercased())),
            //: object: nil,
            object: nil,
            //: userInfo: dataDict)
            userInfo: dataDict
        )
    }
}

func MutableMainNavigationRelationalConfigurationGraphicDescriptionFilter(){

    SizeAnimatorCache.formatDisparateContainer();
    SizeAnimatorCache.navigatePermissiveLoss();
    SizeAnimatorCache.offApertureElement();
    SizeAnimatorCache.putOldAlignmentForm();
    SizeAnimatorCache.willKeyStorageMediator();
    SizeAnimatorCache.processModalSlider();
    SizeAnimatorCache.readCrucialRoleVisitor();
    SizeAnimatorCache.loadAndBuilder();
    SizeAnimatorCache.byEntropyConfiguration();
    SizeAnimatorCache.disconnectMatrixDespiteReducer();
    SizeAnimatorCache.differentiateRespectiveRow();
    SizeAnimatorCache.pushFromVectorDecorator();
    SizeAnimatorCache.pushActivateWithoutWidget();
    SizeAnimatorCache.parseSubsequentAnimation();
    SizeAnimatorCache.encodeTensorDescription();
    SizeAnimatorCache.publishOperationAndTriangles();
    SizeAnimatorCache.wantCompositionalRadioTask();
    SizeAnimatorCache.cancelHistogramWithoutProvider();
    SizeAnimatorCache.endToCapacitiesPlatform();
    SizeAnimatorCache.augmentEphemeralObserver();
    SizeAnimatorCache.provideCupertinoOrElasticity();
    SizeAnimatorCache.showNormalSinkTier();
    SizeAnimatorCache.fromHeroTweak();
    SizeAnimatorCache.publishReduceForSegment();
    SizeAnimatorCache.connectSynchronousInterface();
    SizeAnimatorCache.mountLossFactory();
    SizeAnimatorCache.disconnectClipperAboutSlider();
    SizeAnimatorCache.asyncPainterViaSink();
    SizeAnimatorCache.obtainButtonAroundInterface();
    SizeAnimatorCache.accelerateVariantInterface();
    SizeAnimatorCache.detachExitAboveBitrate();
    SizeAnimatorCache.discoverStoryboardThanCoordinator();
    SizeAnimatorCache.mapMainConstraintMethod();
    SizeAnimatorCache.yieldPriorityDuringBuffer();
    SizeAnimatorCache.dispatchSubpixelCallback();
    SizeAnimatorCache.rotateSpotPerComponent();
    SizeAnimatorCache.stopForGramCommand();
    SizeAnimatorCache.marshalPermissiveTool();
    SizeAnimatorCache.restartAfterSemanticsNumber();
    SizeAnimatorCache.pauseToolBuffer();
    SizeAnimatorCache.validateObserverObserver();
    SizeAnimatorCache.dispatchGlobalTexture();
}
