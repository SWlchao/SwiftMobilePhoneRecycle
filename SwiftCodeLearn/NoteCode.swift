import Foundation

/*
 //清华大学镜像
 https://mirrors.tuna.tsinghua.edu.cn/help/CocoaPods/
 
 CocoaPods 镜像使用帮助
 CocoaPods 是一个 Cocoa 和 Cocoa Touch 框架的依赖管理器，具体原理和 Homebrew 有点类似，都是从 GitHub 下载索引，然后根据索引下载依赖的源代码。

 对于旧版的 CocoaPods 可以使用如下方法使用 tuna 的镜像：

 $ pod repo remove master
 $ pod repo add master https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git
 $ pod repo update
 新版的 CocoaPods 不允许用pod repo add直接添加master库了，但是依然可以：

 $ cd ~/.cocoapods/repos
 $ pod repo remove master
 $ git clone https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git master
 最后进入自己的工程，在自己工程的podFile第一行加上：

 source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'
    
 */

/*
 // Storyboard, Xib 中添加Key
 titleLabel.numberOfLines  Number = 0
 
 let b = UIButton()
 b.titleLabel?.numberOfLines = 0
 
 // 不可编辑
 self.fileconentTF.isEditable = false
*/



/*
 // 模型分组
 
 let ports = PortStatisticsPt.queryShipModel(object: PortShipModel())
 
 var ships = [Ship]()
 for port in ports {
     ships.append(Ship(type: port.shiptype, name: port.shipname, nums: port.shipnumb, disp: port.shipdisp, date: port.shiptime, arrival: port.shiparrival, imgs: port.shipimgs))
 }
 
 let groups = ships.reduce([String:[Ship]]()) { (res, ship) -> [String:[Ship]] in
     var res = res
     res[ship.date.ext.string()] = (res[ship.date.ext.string()] ?? []) + [ship]
     return res
 }

 var source: [(date: String, ships: [Ship])] = []
 for key in groups.keys {
     let values = groups[key] ?? []
     source.append((key, values))
 }
 
 self.portDailys = source
 */

/*
 // 模态透明控制器
 let UIStoryboard = UIStoryboard(name: "ActivitySummary", bundle: nil)
 guard let vc = UIStoryboard.instantiateInitialViewController() else {
     return
 }
 self.navigationController?.definesPresentationContext = true
 vc.modalPresentationStyle = .overCurrentContext
 self.navigationController?.present(vc, animated: false, completion: nil)
 */


/*
 @IBAction func selectFilmGenre(_ sender: UIButton) {
     for btn in FilmGenres {
         btn.isSelected = sender.tag == btn.tag
         if (sender.tag == btn.tag) {
             
             let type = sender.titleLabel?.text ?? ""
             self.FilmType = FMFilmGenre(rawValue: type) ?? .Science
             self.loadFMFilms(self.FilmType)
             self.FMGenreViewOffsetX(btn.frame.origin.x)
         }
     }
 }
 
 private func FMGenreViewOffsetX(_ x: CGFloat) {
     self.scrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
 }
 */


/*
 func loadCircleView() {
     let circlePath = UIBezierPath(arcCenter: CGPoint(x: crview.bounds.width * 0.5, y: crview.bounds.height * 0.5), radius: (self.crview.bounds.width - 10)/2, startAngle: Double.pi / 4 + Double.pi / 2, endAngle: Double.pi / 4, clockwise: true)
     
     circlePath.lineWidth = 10
     circlePath.stroke()
     
     let bgLayer = CAShapeLayer()
     bgLayer.frame = self.crview.bounds
     bgLayer.fillColor = UIColor.clear.cgColor//填充色 -  透明
     bgLayer.lineWidth = 10
     bgLayer.strokeColor = UIColor.white.cgColor//线条颜色
     bgLayer.strokeStart = 0//起始点
     bgLayer.strokeEnd = 1//终点
     bgLayer.lineCap = CAShapeLayerLineCap.square//让线两端是圆滑的状态
     bgLayer.path = circlePath.cgPath//这里就是把背景的路径设为之前贝塞尔曲线的那个路径
     self.crview.layer.addSublayer(bgLayer)
     
     let crLayer = CAShapeLayer()
     crLayer.frame = self.crview.bounds
     crLayer.fillColor = UIColor.clear.cgColor//填充色 -  透明
     crLayer.lineWidth = 10
     crLayer.strokeColor = UIColor.kz.rgb(9, 122, 255).cgColor//线条颜色
     crLayer.strokeStart = 0//起始点
     crLayer.strokeEnd = 0//终点
     crLayer.lineCap = CAShapeLayerLineCap.square//让线两端是圆滑的状态
     crLayer.path = circlePath.cgPath//这里就是把背景的路径设为之前贝塞尔曲线的那个路径
     self.crview.layer.addSublayer(crLayer)
     self.crlayer = crLayer
     
     self.loadTotals()
 }
 */



/*
 iOS  苹芳字体
 苹方提供了六个字重，font-family 定义如下：
 苹方-简 常规体
 font-family: PingFangSC-Regular, sans-serif;
 苹方-简 极细体
 font-family: PingFangSC-Ultralight, sans-serif;
 苹方-简 细体
 font-family: PingFangSC-Light, sans-serif;
 苹方-简 纤细体
 font-family: PingFangSC-Thin, sans-serif;
 苹方-简 中黑体
 font-family: PingFangSC-Medium, sans-serif;
 苹方-简 中粗体
 font-family: PingFangSC-Semibold, sans-serif;
 
 func resetPlaceholderStyle() {
     if let font = UIFont(name: "PingFangSC-Regular", size: 15) {
         let color = UIColor.ext.rgb(51,51,51)
         let attrs = [
             NSAttributedString.Key.foregroundColor : UIColor.ext.rgb(51,51,51),
             .font : font,
         ]
         self.nameTF.attributedPlaceholder = NSAttributedString(string: "Trade name", attributes: attrs)
         self.priceTF.attributedPlaceholder = NSAttributedString(string: "Today's price", attributes: attrs)
     }
 }
 */


/*
 模拟加载进度
 func showConnectProgress(_ finish: @escaping (() -> Void)) {
     let hub = MBProgressHUD.showAdded(to: self.view, animated: true)
     hub.mode = .annularDeterminate
     hub.detailsLabel.text = "正在连接..."
     
     DispatchQueue.global(qos: .userInitiated).async {
         self.doSomeWorkWithProgress()
         DispatchQueue.main.async {
             finish()
             hub.hide(animated: true)
         }
     }
 }
 
 func doSomeWorkWithProgress() {
     var progress: Float = 0
     while progress < 1 {
         progress += 0.01
         DispatchQueue.main.async {
             MBProgressHUD.forView(self.view)?.progress = progress
         }
         usleep(50000)
     }
 }
 */

/*
 
 
 // 周转数字 1日 2一 3二 4三 5四 6五 7六
 self.date.ext.string("e")
 
 
 FSCalendar 上月， 下月
 
 @IBAction func EdClickNextMonth(_ sender: Any) {
     let month = self.calendar.currentPage
     if let nextMonth = self.calendar.gregorian.date(byAdding: .month, value: 1, to: month) {
         self.calendar.setCurrentPage(nextMonth, animated: true)
     }
 }
 
 @IBAction func EdClickLastMonth(_ sender: Any) {
     let month = self.calendar.currentPage
     if let nextMonth = self.calendar.gregorian.date(byAdding: .month, value: -1, to: month) {
         self.calendar.setCurrentPage(nextMonth, animated: true)
     }
 }
 */


/*
 
 设备判断
 import DeviceKit
 
     let device = Device.current
     print(device)
     if device.isPad {
         print("isPad")
     }
     
     if device.isPhone {
         print("isPhone")
     }
 
 */
