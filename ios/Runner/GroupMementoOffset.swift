
//: Declare String Begin

/*: "Net Error, Try again later" :*/
fileprivate let dataMessagePointReplaceMsg:[Character] = ["N","e","t"," ","E","r","r","o","r",","," ","T","r","y"," ","a","g","a","i","n"," ","l","a","t","e","r"]

/*: "data" :*/
fileprivate let show_languageData:String = "dittit"

/*: ":null" :*/
fileprivate let app_largePath:[Character] = [":","n","u","l","l"]

/*: "json error" :*/
fileprivate let main_fireStr:String = "jsodomain"
fileprivate let constSumName:String = "OR"

/*: "platform=iphone&version= :*/
fileprivate let mainNameStr:String = "pdataatf"
fileprivate let app_cornerPath:String = "phonindicator"
fileprivate let user_confirmBackExistTitle:String = "siomain"
fileprivate let noti_systemMsg:String = "="

/*: &packageId= :*/
fileprivate let data_deviceId:String = "tool adjustment&packa"

/*: &bundleId= :*/
fileprivate let main_objectData:String = "&bunerror succeed reduce object scale"
fileprivate let noti_failureValue:String = "dleId=other appear"

/*: &lang= :*/
fileprivate let show_minimumLoadValue:[Character] = ["&","l","a","n","g","="]

/*: ; build: :*/
fileprivate let app_launchValue:[Character] = [";"," ","b"]
fileprivate let appInstancePath:String = "uild:make where link"

/*: ; iOS  :*/
fileprivate let notiEventUrl:[Character] = [";"," ","i","O","S"," "]

//: Declare String End

//: import Alamofire
import Alamofire
//: import CoreMedia
import CoreMedia
//: import HandyJSON
import HandyJSON
// __DEBUG__
// __CLOSE_PRINT__
//: import UIKit
import UIKit

//: typealias FinishBlock = (_ succeed: Bool, _ result: Any?, _ errorModel: AppErrorResponse?) -> Void
typealias FinishBlock = (_ succeed: Bool, _ result: Any?, _ errorModel: DailyErrorResponse?) -> Void

//: @objc class AppRequestTool: NSObject {
@objc class GroupMementoOffset: NSObject {
    /// 发起Post请求
    /// - Parameters:
    ///   - model: 请求参数
    ///   - completion: 回调
    //: class func startPostRequest(model: AppRequestModel, completion: @escaping FinishBlock) {
    class func fireStop(model: PostRequestModel, completion: @escaping FinishBlock) {
        //: let serverUrl = self.buildServerUrl(model: model)
        let serverUrl = self.filter(model: model)
        //: let headers = self.getRequestHeader(model: model)
        let headers = self.makeModel(model: model)
        //: AF.request(serverUrl, method: .post, parameters: model.params, headers: headers, requestModifier: { $0.timeoutInterval = 10.0 }).responseData { [self] responseData in
        AF.request(serverUrl, method: .post, parameters: model.params, headers: headers, requestModifier: { $0.timeoutInterval = 10.0 }).responseData { [self] responseData in
            //: switch responseData.result {
            switch responseData.result {
            //: case .success:
            case .success:
                //: func__requestSucess(model: model, response: responseData.response!, responseData: responseData.data!, completion: completion)
                field(model: model, response: responseData.response!, responseData: responseData.data!, completion: completion)

            //: case .failure:
            case .failure:
                //: completion(false, nil, AppErrorResponse.init(errorCode: RequestResultCode.NetError.rawValue, errorMsg: "Net Error, Try again later"))
                completion(false, nil, DailyErrorResponse(errorCode: DescribeMeasurable.NetError.rawValue, errorMsg: (String(dataMessagePointReplaceMsg))))
            }
        }
    }

    //: class func func__requestSucess(model: AppRequestModel, response: HTTPURLResponse, responseData: Data, completion: @escaping FinishBlock) {
    class func field(model _: PostRequestModel, response _: HTTPURLResponse, responseData: Data, completion: @escaping FinishBlock) {
        //: var responseJson = String(data: responseData, encoding: .utf8)
        var responseJson = String(data: responseData, encoding: .utf8)
        //: responseJson = responseJson?.replacingOccurrences(of: "\"data\":null", with: "\"data\":{}")
        responseJson = responseJson?.replacingOccurrences(of: "\"" + (show_languageData.replacingOccurrences(of: "it", with: "a")) + "\"" + (String(app_largePath)), with: "" + "\"" + (show_languageData.replacingOccurrences(of: "it", with: "a")) + "\"" + ":{}")
        //: if let responseModel = JSONDeserializer<AppBaseResponse>.deserializeFrom(json: responseJson) {
        if let responseModel = JSONDeserializer<ActiveHandyJSON>.deserializeFrom(json: responseJson) {
            //: if responseModel.errno == RequestResultCode.Normal.rawValue {
            if responseModel.errno == DescribeMeasurable.Normal.rawValue {
                //: completion(true, responseModel.data, nil)
                completion(true, responseModel.data, nil)
                //: } else {
            } else {
                //: completion(false, responseModel.data, AppErrorResponse.init(errorCode: responseModel.errno, errorMsg: responseModel.msg ?? ""))
                completion(false, responseModel.data, DailyErrorResponse(errorCode: responseModel.errno, errorMsg: responseModel.msg ?? ""))
                //: switch responseModel.errno {
                switch responseModel.errno {
//                case DescribeMeasurable.NeedReLogin.rawValue:
//                    NotificationCenter.default.post(name: DID_LOGIN_OUT_SUCCESS_NOTIFICATION, object: nil, userInfo: nil)
                //: default:
                default:
                    //: break
                    break
                }
            }
            //: } else {
        } else {
            //: completion(false, nil, AppErrorResponse.init(errorCode: RequestResultCode.NetError.rawValue, errorMsg: "json error"))
            completion(false, nil, DailyErrorResponse(errorCode: DescribeMeasurable.NetError.rawValue, errorMsg: (main_fireStr.replacingOccurrences(of: "domain", with: "n") + " err" + constSumName.lowercased())))
        }
    }

    //: class func buildServerUrl(model: AppRequestModel) -> String {
    class func filter(model: PostRequestModel) -> String {
        //: var serverUrl: String = model.requestServer
        var serverUrl: String = model.requestServer
        //: let otherParams = "platform=iphone&version=\(AppNetVersion)&packageId=\(PackageID)&bundleId=\(AppBundle)&lang=\(UIDevice.interfaceLang)"
        let otherParams = (mainNameStr.replacingOccurrences(of: "data", with: "l") + "orm=i" + app_cornerPath.replacingOccurrences(of: "indicator", with: "e") + "&ver" + user_confirmBackExistTitle.replacingOccurrences(of: "main", with: "n") + noti_systemMsg.capitalized) + "\(mainShouldSystemId)" + (String(data_deviceId.suffix(6)) + "geId=") + "\(notiMaxName)" + (String(main_objectData.prefix(4)) + String(noti_failureValue.prefix(6))) + "\(show_countryText)" + (String(show_minimumLoadValue)) + "\(UIDevice.interfaceLang)"
        //: if !model.requestPath.isEmpty {
        if !model.requestPath.isEmpty {
            //: serverUrl.append("/\(model.requestPath)")
            serverUrl.append("/\(model.requestPath)")
        }
        //: serverUrl.append("?\(otherParams)")
        serverUrl.append("?\(otherParams)")

        //: return serverUrl
        return serverUrl
    }

    /// 获取请求头参数
    /// - Parameter model: 请求模型
    /// - Returns: 请求头参数
    //: class func getRequestHeader(model: AppRequestModel) -> HTTPHeaders {
    class func makeModel(model _: PostRequestModel) -> HTTPHeaders {
        //: let userAgent = "\(AppName)/\(AppVersion) (\(AppBundle); build:\(AppBuildNumber); iOS \(UIDevice.current.systemVersion); \(UIDevice.modelName))"
        let userAgent = "\(k_itMessage)/\(constFoundStatusId) (\(show_countryText)" + (String(app_launchValue) + String(appInstancePath.prefix(5))) + "\(dataIncludingUrl)" + (String(notiEventUrl)) + "\(UIDevice.current.systemVersion); \(UIDevice.modelName))"
        //: let headers = [HTTPHeader.userAgent(userAgent)]
        let headers = [HTTPHeader.userAgent(userAgent)]
        //: return HTTPHeaders(headers)
        return HTTPHeaders(headers)
    }
}
