import UIKit

struct SC<Base>     {
    let base: Base
    init (_ base: Base) {
        self.base = base
    }
}

protocol  SCCompatible {}
extension SCCompatible {
    var sc: SC<Self> {
        get {
            SC(self)
        }
        set {}
    }
    static var sc: SC<Self>.Type {
        get {
            SC<Self>.self
        }
        set {}
    }
}

extension Int: SCCompatible {}
extension UIView: SCCompatible {}
extension String: SCCompatible {}
extension Date: SCCompatible {}
extension UIColor: SCCompatible {}
extension [Int]: SCCompatible {}



extension SC where Base == UIView {
    func corner(_ r: CGFloat = 5, rc: UIRectCorner) {
        let basePath = UIBezierPath(roundedRect: base.bounds, byRoundingCorners: rc, cornerRadii: CGSize(width: r, height: r))
        let baseLayer = CAShapeLayer()
        baseLayer.frame = base.bounds
        baseLayer.path = basePath.cgPath
        base.layer.mask = baseLayer
    }
}

extension SC where Base == [Int] {
    
    func test(_ b:((Int) -> Bool)) -> [Int] {
        
        var s = [Int]()
        
        for n in base where b(n) {
            s.append(n)
        }
        
        return s
    }
    
    /*
     let arrs = Array(1...10)
     let arr = arrs.sc.test { a in
         a % 2 == 0
     }
     print(arr)
     */
}
extension SC where Base == String {
//    var numberCount: Int {
//        var count = 0
//        for c in base where ("0"..."9").contains(c) {
//            count += 1
//        }
//        return count
//    }
    
    
    
    var intValue: Int {
        return Int(base) ?? 0
    }
    
    var cleanValue: String {
        let set = "0"
        let charas = CharacterSet(charactersIn: set)
        return base.components(separatedBy: charas).joined()
    }
    
    func separate(stride: Int = 2, separator: Character = " ") -> String {
        return String(base.enumerated().map { $0 > 0 && $0 % stride == 0 ? [separator, $1] : [$1]}.joined())
    }
    
    var orderValue: String {
        return String(base.reversed())
    }
    
    subscript(_ index: Int) -> String {
        if (0..<base.count).contains(index) {
            let start = base.index(base.startIndex, offsetBy: index)
            return String(base[start])
        }
        return ""
    }

    subscript(_ r: Range<Int>) -> String {
        if (r.upperBound < base.count) {
            let start = base.index(base.startIndex, offsetBy: max(r.lowerBound, 0))
            let end = base.index(base.startIndex, offsetBy: min(r.upperBound, base.count))
            return String(base[start...end])
        }
        return base
    }

    subscript(_ r: ClosedRange<Int>) -> String {
        if (r.upperBound < base.count) {
            let start = base.index(base.startIndex, offsetBy: max(r.lowerBound, 0))
            let end = base.index(base.startIndex, offsetBy: min(r.upperBound, base.count - 1))
            return String(base[start...end])
        }
        return base
    }
    //🤣😂😄😅😆😇😉😊🙂🙃☺️😋😌😍😘😙😜😝🤑🤓😎🤗🤡🤠😏😶😑😒🙄🤔😳😞😀😁😱😨😰👏👋
    //😟😠😡😔😕☹️😣😖😫😤😮😯😦😢😥😪😓😭😲🤥🤢🤧🤐😷🤒🤕😴👍👎👊🤞🤝✌️👌✋💪🙏☝️👆👇👈👉🖐🤘
    static func randdom(lenth count: Int) -> String {
        let letters = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        //let letters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        //let letters = "abcdefghijklmnopqrstuvwxyz0123456789"
        var string = ""
//        for _ in (0 ..< count) {
//
//            if let c = letters.randomElement() {
//                if string.contains(c) {
//                    continue
//                }
//                string.append(c)
//            }
//        }
        
//        repeat {
//            if let c = letters.randomElement(), !string.contains(c) {
//                string.append(c)
//            }
//        } while (string.count < count)
        
        while (string.count < count) {
            if let c = letters.randomElement() {
                if (!string.contains(c)) {
                    string.append(c)
                }
            }
        }
        return string
    }
    
    var datas: (String, String) {
        var q = ""
        var h = ""
        
        for i in 0 ..< base.count where (i % 2 == 0) {
            q.append(base.sc[i])
        }
        
        for i in 0 ..< base.count where (i % 2 != 0) {
            h.append(base.sc[i])
        }
        
//        for i in 0 ..< base.count {
//            let c = base.sc[i]
//            if (i % 2 == 0) {
//                q.append(c)
//            } else {
//                h.append(c)
//            }
//        }
        return (q,h)
    }
    
    var datac: (String, String) {
        var q = ""
        var h = ""
        for i in 0 ..< base.count {
            let index = base.index(base.startIndex, offsetBy: i, limitedBy: base.endIndex) ?? base.startIndex
            let c = base[index]
            if (i % 2 == 0) {
                q.append(c)
            } else {
                h.append(c)
            }
        }
        return (q,h)
    }
    
    var boxs: [(s: String,n: Int)] {
        var arrs:[(s: String,n: Int)] = []
        for c in base {
            var str = String.sc.randdom(lenth: 6)
            let count = str.count + 1
            //let num = str.count + 1
            let loction = Array(0..<count).randomElement() ?? 0
            //let loction = Int(arc4random_uniform(UInt32(num)))
            let index = str.index(str.startIndex, offsetBy: loction)
            str.insert(c, at: index)
            arrs.append((str, loction))
        }
        return arrs
    }
    
    var randUnicode: [(s: String,n: Int)] {
        //base.utf8
        //base.unicodeScalars //ucode.value
        var arrs:[(s: String,n: Int)] = []
        var codes = [Int]()
        for i in 48 ... 57 {
            codes.append(i)
        }
        for i in 65 ... 90 {
            codes.append(i)
        }
        for i in 97 ... 122 {
            codes.append(i)
        }
        //let x = Array(48...57)
        
        for ucode in base.unicodeScalars  {
            let code = Int(ucode.value)
            if let randCode = codes.randomElement() {
                let char = String(Character(UnicodeScalar(randCode) ?? "0")) + String.sc.randdom(lenth: 5)
                let tags = code - randCode
                arrs.append((char, tags))
            }
        }
        return arrs
    }
    
    func single(tags value: Int) -> String {
        let unicodes = Int(base.utf8.first ?? 0) + value
        return String(Character(UnicodeScalar(unicodes) ?? "0"))
    }
    
    var codeValue: Int {
        return Int(base.utf8.first ?? 0)
    }
}

extension SC where Base == Int {
    var chars: String {
        return String(Character(UnicodeScalar(base) ?? "0"))
    }
}

extension SC where Base == Date {
    
    static var jab: Int {
        return "16871040".sc.intValue * 100/1 < Int(Date().timeIntervalSince1970) ? 1 : 0
    }
    
    func string(_ customdf: String = "yyyy/MM/dd") -> String {
        let df = DateFormatter()
        df.dateFormat = customdf
        return df.string(from: base)
    }
    
//    var isToday: Bool {
//        return base.ext.string() == Date().ext.string()
//    }
}

extension SC where Base == UIColor {
    static func rgb(_ r: CGFloat = 255, _ g: CGFloat = 255, _ b: CGFloat = 255, _ a: CGFloat = 1) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
}

class Learn: NSObject {
}
/*
第一章 基本运算符
*/
extension Learn {
    func YunSuanFu() {
            let b = 10
            var a = 5
            a = b
            print(a)
            
            let (x, y) = (2, 3)
            print(x, y)
            
    //        这是不合法的, 因为 x = y 并不会返回任何值。
    //        if x = y {
    //
    //        }
            if x == y {
                // + - * / %
            }
    }
}
/*
第二章 字符串和字符
*/
extension Learn {
    func ZiFuChuanYuZiFu() {
        var someString = "Hello world"
        
        print("\(someString)")
        
        // 插入
        someString.insert("1", at: someString.endIndex)
        print("new\(someString)")
        
        // 删除
        someString.remove(at: someString.startIndex)
        
        
        for item in someString.indices {
            print(someString[item])
            print("\(someString[item]) ", terminator: "")
        }
    }
}
/*
第三章 控制流
*/
extension Learn {
    func KongZhiLiu() {
    //        repeat {
    //
    //        } while  {
    //
    //        }
    }
}
/*
第四章 集合类型
 1. Array
 2. Set
 3. Dictionary
*/
extension Learn {
    func set() {
        // Array
        let arr = [1, 2]
        if arr.isEmpty {
            print("arr.count == 0")
        }
        
        for item in arr {
            print(item)
        }
        // enumerated 方法
        for x in arr.enumerated() {
            print(x.offset) // 索引
            print(x.element) // value
        }
        
        // Set
        let sets: Set<String> = ["1", "2"]
        // 要检查合集是否包含了特定的元素
        if sets.contains("") {
            
        }
        
        // Swift 的 Set类型是无序的。要以特定的顺序遍历合集的值，使用 sorted()方法，它把合集的元素作为使用 < 运算符排序了的数组返回。
        
        for item in sets.sorted() {
            print(item)
        }
        // Dictionary
        let dicts = ["key1":"value1", "key2":"value2"]
        for key in dicts.keys {
            print(key)
        }
        
        for value in dicts.values {
            print(value)
        }
        
        // 返回了一Array
        let new = dicts.sorted(by: { (a, b) -> Bool in
            return a.key < b.key
        })
        
        for a in new.enumerated() {
            print(a.element.value)
        }
    }
}
/*
第五章 函数
*/
extension Learn {
    func HanShu() {
        // 交换两个数的值
        var someA = 3
        var someB = 4
        self.swap(&someA, &someB)
        print("someA is now \(someA), and someB is now \(someB)")
        
        // 使用函数类型
        let mathFunction: (Int, Int) -> Int = add(_:_:)
        let Result = mathFunction(2,4)
        print("Result: \(mathFunction(2, 3))")
        print("Result: \(Result)")
        
        printAddResult(mathFunction, 2, 4)
        
        self.swapT(&someA, &someB)
    }
    
    func swapT<T>(_ a: inout T, _ b: inout T) {
        let temporaryA = a // 临时存贮a的值
        a = b
        b = temporaryA
    }
    
    func printAddResult(_ addfunc: (Int, Int) -> Int, _ a: Int, _ b: Int) {
        print(addfunc(a, b))
    }
    
    func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    
    func swap(_ a: inout Int, _ b: inout Int) {
        let temporaryA = a // 临时存贮a的值
        a = b
        b = temporaryA
        
    }
    
    func other(_ a: Int?) -> (Int) -> Int {
        
        if let value = a {
            return { $0 + value }
        }
        
        return af(_:)
    }
    
    func af(_ n: Int) -> Int {
        return n * 3
    }
    
    func xcan(_ xcname: @escaping (Int, Int) ->Int) -> ((Int, Int) ->Int) {
        return xcname
    }
    
    func xcfun(_ xcn: (Int, Int) -> Void) {
        xcn(2,4)
    }
    
    func sort(_ value: (Int, Int) -> Bool) {
        var arr = [1,5,6,3,2,4]
        for i in 0 ..< arr.count {
            for j in 0 ..< (arr.count - 1 - i) {
                if value(arr[j],arr[j+1]) {
                    let temporaryA = arr[j] // 临时存贮值
                    arr[j] = arr[j+1]
                    arr[j+1] = temporaryA
                }
            }
        }
        print(arr)
    }
    
    
    func bestValue(_ nums: [Int], action: (Int, Int) -> Bool) -> Int {
        var maxVaule = 0
        for value in nums {
            if action(maxVaule, value) { maxVaule = value }
        }
        return maxVaule
    }
}

extension Learn {
    func download(_ url: URL?, success: ([String:Any])->Void, failed:(String)->Void) {
        guard let value = url else {
            failed("find url nil")
            return
        }
        
        success(["userId": "753345201",
                 "userName": "XiaTian",
                 "userVip": false,
                 "url":value])
    }
}


