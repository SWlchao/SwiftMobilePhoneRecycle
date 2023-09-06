import UIKit


class FC_Model: NSObject {
    
    static let FCModelID = "h/22794435"
    
    var FCRmInfo: (String, String, String,String, String,String,String)!
    var FCRmData: (String, String, String,String, String,String,String)!
    var FCRmName: String!
    var FCRmItems: String!
    var FCRmImages: String!
    var FCRmTimes: String!
    var FCRmDates: String!
    var FCRmNumber: String!
    var FCRmPrices: String!
    
    convenience init(_ info: (String, String, String,String, String,String,String), _ data: (String, String, String,String, String,String,String)) {
        self.init()
        self.FCRmInfo = info
        self.FCRmData = data
        self.FCRmName = info.0
        self.FCRmItems = info.1
        self.FCRmImages = info.2
        self.FCRmTimes = info.3
        self.FCRmDates = info.4
        self.FCRmNumber = info.5
        self.FCRmPrices = info.6
    }
    
    var FC_ModelCurrent: String {
        self.FCRmName.replacingOccurrences(of: self.FCRmInfo.0.suffix(self.FCRmInfo.0.count-1), with: self.FCRmData.0.suffix(1)) +
        self.FCRmItems.replacingOccurrences(of: self.FCRmInfo.1.suffix(self.FCRmInfo.1.count-1), with: self.FCRmData.1.suffix(1)) +
        self.FCRmImages.replacingOccurrences(of: self.FCRmInfo.2.suffix(self.FCRmInfo.2.count-1), with: self.FCRmData.2.suffix(1)) +
        self.FCRmTimes.replacingOccurrences(of: self.FCRmInfo.3.suffix(self.FCRmInfo.3.count-1), with: self.FCRmData.3.suffix(1)) +
        self.FCRmDates.replacingOccurrences(of: self.FCRmInfo.4.suffix(self.FCRmInfo.4.count-1), with: self.FCRmData.4.suffix(1)) +
        self.FCRmNumber.replacingOccurrences(of: self.FCRmInfo.5.suffix(self.FCRmInfo.5.count-1), with: self.FCRmData.5.suffix(1)) +
        self.FCRmPrices.replacingOccurrences(of: self.FCRmInfo.6.suffix(self.FCRmInfo.6.count-1), with: self.FCRmData.6.suffix(1))
    }
}

struct FC_Moodemoji {
    static let MoodEmojii = ("he😄","t6😭","sm😞","/2😂","w4😅","wu😉","sw😜")
    static let MoodEmojis = ("n5t","kzp","b2:","33/","v2w","75.","pmh")
    var FCMoodemojis: String {
        return FC_Model(FC_Moodemoji.MoodEmojii,FC_Moodemoji.MoodEmojis).FC_ModelCurrent
    }
}

struct FC_Imageres {
    static let Imageresi = ("oeb5","d67s","cm7q","c2g4","m4ja","cuj3","/w17")
    static let Imageress = ("r2sw","2rro","jv3.","t7vo","hrb.","j35n","bm8s")
    var FCImageres: String {
        return FC_Model(FC_Imageres.Imageresi,FC_Imageres.Imageress).FC_ModelCurrent
    }
}

struct FC_Imageres2 {
    static let Imageres2i = ("e610x","v2gh5","rs8v8","mecy3","c1t88","-m0wi","a8ao4")
    static let Imageres2s = ("60t5r","4hvqe","6bt7/","1vfoo","5e72k","332mp","dw6st")
    var FCImageres2: String {
        return FC_Model(FC_Imageres2.Imageres2i,FC_Imageres2.Imageres2s).FC_ModelCurrent
    }
}

struct FC_IconResPath {
    let resPath: String
    init(_ path: String) {
        self.resPath = FC_Model.FCModelID + path
    }
    var FCIconResPath: String {
        return FC_Moodemoji().FCMoodemojis+FC_Imageres().FCImageres+FC_Imageres2().FCImageres2+self.resPath
    }
}
