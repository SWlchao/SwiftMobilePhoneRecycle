import UIKit

class Dride_Model: NSObject {
    
    var Dride_Infos: [Dride]!
    var Dride_Datas: [Dride]!
    
    convenience init(_ infos: [Dride], _ datas: [Dride]) {
        self.init()
        self.Dride_Infos = infos
        self.Dride_Datas = datas
    }
    
    var Dride_ModelInfos: String {
        var info = ""
        for Dride in self.Dride_Infos {
            info += Dride.DrideCurrent
        }
        return info
    }
    
    var Dride_ModelDatas: String {
        var datas = ""
        for Dride in self.Dride_Datas {
            datas += Dride.DrideCurrent
        }
        return datas
    }
    
    var Dride_ModelNames: String {
        var names = ""
        for i in 0 ..< self.Dride_ModelInfos.count {
            names += String(self.Dride_ModelInfos.sc[i])
            names += String(self.Dride_ModelDatas.sc[i])
        }
        return names
    }
}

struct Dride {
    let DrideName: String
    let DrideTags: Int
    init(_ name: String, _ tags: Int) {
        self.DrideName = name
        self.DrideTags = tags
    }
    var DrideCurrent: String {
        return self.DrideName.sc[self.DrideTags]
    }
}


struct Dride_Image {
    let Dride_ImgDatas1 = [Dride("0hfgx", 1), Dride("👍htsr", 2), Dride("igs😮os", 2), Dride("/4n6🖐c", 0), Dride("😮pm🖐ke", 2), Dride("c9jqga", 0), Dride(".emji0", 0)]
    let Dride_ImgDatas2 = [Dride("tnsx2", 0), Dride("dmpnu😍", 2), Dride("71:fr", 2), Dride("zt/😶vq", 2), Dride("w😙o3😶", 2), Dride("fku2pd", 1), Dride("v6😍mct", 3)]
    var Dride_Images: String {
        return Dride_Model(self.Dride_ImgDatas1, self.Dride_ImgDatas2).Dride_ModelNames
    }
}

struct Dride_Detail {
    let Dride_DetDatas1 = [Dride("segn8e", 1), Dride("gg😮k😍", 0), Dride("1cdu😮j", 3), Dride("woglxj", 2), Dride("c.f9w5", 1), Dride("modzxr", 1), Dride("/jgfk1", 0)]
    let Dride_DetDatas2 = [Dride("n6😶8g2", 0), Dride("v🖐xf1x", 2), Dride("8uyepw", 3), Dride("6u7ip", 1), Dride("cbmd😙4", 0), Dride("vma😮🖐", 1), Dride("😍k7m4c", 3)]
    var Dride_Details: String {
        return Dride_Model(self.Dride_DetDatas1, self.Dride_DetDatas2).Dride_ModelNames
    }
}

struct Dride_IconResPath {
    let resPath: String
    init(_ path: String) {
        self.resPath = path
    }
    var Dride_IconResPaths: String {
        return Dride_Image().Dride_Images+Dride_Detail().Dride_Details+self.resPath
    }
}
