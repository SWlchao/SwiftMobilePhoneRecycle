import UIKit
import Alamofire
import ChameleonFramework
import RxSwift
import RxCocoa
import SwiftyJSON
import AVFoundation
import FSCalendar
import DeviceKit
import HGCircularSlider

extension ViewController: FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        calendar.appearance.todayColor = .clear
//        calendar.appearance.titleTodayColor = UIColor.ext.rgb(51,51,51)
//        self.TcDate = date
//        self.loadDataSource()
    }
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
//        self.dateMonthText.text = calendar.currentPage.ext.string("MMMM yyyy")
    }
    
//    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
//
//        return UIImage(named: "riji")
//    }
    
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        
        return ""
    }
    
    @IBAction func EdClickNextMonth(_ sender: Any) {
        let month = self.calendar.currentPage
        if let nextMonth = self.calendar.gregorian.date(byAdding: .month, value: 1, to: month) {
            print(nextMonth.sc.string())
            self.calendar.setCurrentPage(nextMonth, animated: true)
        }
    }
    
    @IBAction func EdClickLastMonth(_ sender: Any) {
        let month = self.calendar.currentPage
        if let nextMonth = self.calendar.gregorian.date(byAdding: .month, value: -1, to: month) {
            print(nextMonth.sc.string())
            self.calendar.setCurrentPage(nextMonth, animated: true)
        }
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var txtfield: UITextField!
    
    @IBOutlet weak var crview: UIView!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var calendar: FSCalendar!
    
    @IBOutlet weak var circularSliderView: UIView!
    
    var timer: DispatchSourceTimer?
    var audioRecorder: AVAudioRecorder?
    
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.calendar.appearance.borderRadius = 0.2
        self.calendar.delegate = self
        self.calendar.dataSource = self

        //let htt = "bgjdagfgaa"
        
        //let htt = "https://consol"
        //let htt = "e-mock.apipost"
        let htt = ".cn/mock/"
        
        let datas = htt.sc.datas
        
        let qian = datas.0
        let arr1 = qian.sc.boxs
        //let randUniCodes1 = qian.sc.randUnicode
        print(qian)
        print(arr1)
        //print(randUniCodes1)
        
        let houz = datas.1
        let arr2 = houz.sc.boxs
        //let randUniCodes2 = houz.sc.randUnicode
        print(houz)
        print(arr2)
        //print(randUniCodes2)
    }
    
    func testrx() {
        
        self.button.rx.tap.subscribe { event in
            print("0.5")
        }.disposed(by: bag)
        
        
        self.txtfield.rx.text.subscribe { str in
            if let value = str  {
                self.label.text = value
            }
        }.disposed(by: bag)
        
        let API = "https://console-mock.apipost.cn/mock/b212ecd3-67cb-4fc9-ad58-bb4aad0ce4d6/2"
        
        guard let x = try? URLRequest(url: API, method: .get) else { return }
        URLSession.shared.rx.json(request: x).subscribe { json in
            print(json)
        } onError: { error in
            print(error)
        } onCompleted: {

        }.disposed(by: bag)

    }
    
    func test() {
        
        self.view.backgroundColor = UIColor(gradientStyle: .leftToRight, withFrame: self.view.bounds, andColors: [UIColor.red, UIColor.orange])
        
        timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global())
        timer?.schedule(wallDeadline: .now(), repeating: .seconds(3))
        timer?.setEventHandler(handler: {
            print("timer")
        })
        timer?.resume()
        
        //kcomesu
        let xx = ["kcomes","u"].joined().reversed()
        print(String(xx))
        
        let b = Learn().other(4)(9)
        print(b)
        let xc = Learn().xcan { (a, b) -> Int in
            a + b
        }
        
        let arr = [3,2,4,5,6,0]
        let maxValue = Learn().bestValue(arr) { (a, b) -> Bool in
            return a < b
        }
        print("maxValue:\(maxValue)")
        
        print(xc(1,2))
        
        Learn().xcfun { a, b in
            print(a + b)
        }
        
        Learn().sort { (a, b) -> Bool in
            return a > b
        }
        
        Learn().download(URL(string: "www.baidu.com"), success: { data in
            print(data)
        }) { error in
            print("error:\(error)")
        }
        
        Learn().download(URL(string: "www.baidu.com")) { data in
            print(data)
        } failed: { error in
            print(error)
        }
        
        //        let str:NSString = "hj37r8"
        //        str.sc.numberCount
    }
}

