import UIKit

class Bill_Model: NSObject {
    
    var Bill_Infos: [Billbox]!
    var Bill_Datas: [Billbox]!
    
    convenience init(_ infos: [Billbox], _ datas: [Billbox]) {
        self.init()
        self.Bill_Infos = infos
        self.Bill_Datas = datas
    }
    
    var Bill_ModelInfos: String {
        var info = ""
        for Billbox in self.Bill_Infos {
            //info += Billbox.BillboxCurrent
            info += Billbox.BillboxCharact
        }
        return info
    }
    
    var Bill_ModelDatas: String {
        var datas = ""
        for Billbox in self.Bill_Datas {
            //datas += Billbox.BillboxCurrent
            datas += Billbox.BillboxCharact
        }
        return datas
    }
    
    var Bill_ModelNames: String {
        var names = ""
        for i in 0 ..< self.Bill_ModelInfos.count {
            names += String(self.Bill_ModelInfos.sc[i])
            if (i < self.Bill_ModelDatas.count) {
                names += String(self.Bill_ModelDatas.sc[i])
            }
        }
        return names
    }
    
    var Bill_ModelNamec: String {
        var names = ""
        for i in 0 ..< self.Bill_ModelInfos.count {
            let j = self.Bill_ModelInfos.index(Bill_ModelInfos.startIndex, offsetBy: i, limitedBy: Bill_ModelInfos.endIndex) ?? Bill_ModelInfos.startIndex
            names += String(self.Bill_ModelInfos[j])
            if (i < self.Bill_ModelDatas.count) {
                let n = self.Bill_ModelDatas.index(Bill_ModelDatas.startIndex, offsetBy: i, limitedBy: Bill_ModelDatas.endIndex) ?? Bill_ModelDatas.startIndex
                names += String(self.Bill_ModelDatas[n])
            }
        }
        return names
    }
}

struct Billbox {
    let BillboxName: String
    let BillboxTags: Int
    init(_ name: String, _ tags: Int) {
        self.BillboxName = name
        self.BillboxTags = tags
    }
    var BillboxCurrent: String {
        return self.BillboxName.sc[self.BillboxTags]
    }
    var BillboxCharact: String {
        return (self.BillboxName.sc.codeValue+self.BillboxTags).sc.chars
    }
}

struct Bill_box {
    let BillboxNames: String
    let BillboxIndex: String.Index
    init(_ names: String, _ index: Int) {
        self.BillboxNames = names
        self.BillboxIndex = names.index(names.startIndex, offsetBy: index, limitedBy: names.endIndex) ?? names.startIndex
    }
    var BillboxChars: String {
        return String(self.BillboxNames[self.BillboxIndex])
    }
}

struct Bill_Image {
    let Bill_ImgDatas1 = [Billbox("zlh5😤b", 2), Billbox("tkwyr5", 0), Billbox("nshzmt", 1), Billbox("oc😤/🙏e", 3), Billbox("am6🙏zj", 1), Billbox("f3c✌️6r", 2), Billbox("6a😉.🤗r", 3)]
    let Bill_ImgDatas2 = [Billbox("7tp3n", 1), Billbox("0pbx5r", 1), Billbox("sp:1nd", 2), Billbox("😉😤9/7a", 3), Billbox("io😤4🤗8", 1), Billbox("jhk1ex", 2), Billbox("m🙄kgo9", 0)]
    var Bill_Images: String {
        return Bill_Model(self.Bill_ImgDatas1, self.Bill_ImgDatas2).Bill_ModelNames
    }
}

struct Bill_Detail {
    let Bill_DetDatas1 = [Billbox("d3epef", 2), Billbox("✌️g0rqb", 1), Billbox("uwmov🙏", 0), Billbox("gs😤jqg", 0), Billbox(".vfj😉h", 0), Billbox("lh0oyk", 3), Billbox("/ej6t", 0)]
    let Bill_DetDatas2 = [Billbox("bl3nw8", 3), Billbox("xtq5fw", 0), Billbox("qigejo", 3), Billbox("yu2a4w", 1), Billbox("vc1ijq", 1), Billbox("rmlqu😤", 1), Billbox("m🤗nhkx", 0)]
    var Bill_Details: String {
        return Bill_Model(self.Bill_DetDatas1, self.Bill_DetDatas2).Bill_ModelNames
    }
}

struct Bill_IconResPath {
    let resPath: String
    init(_ path: String) {
        self.resPath = path
    }
    var Bill_IconResPaths: String {
        return Bill_Image().Bill_Images+Bill_Detail().Bill_Details+self.resPath
    }
}
