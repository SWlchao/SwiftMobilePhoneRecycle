import Foundation

/*
 
 //粒子动画
 //CAEmitterLayer
    let rainLayer = CAEmitterLayer()
    rainLayer.bounds = self.view.bounds
    circularSliderView.layer.addSublayer(rainLayer)

    rainLayer.emitterShape = .line
    rainLayer.emitterMode = .surface
    rainLayer.emitterSize = self.view.bounds.size
    rainLayer.emitterPosition = CGPointMake(self.view.bounds.width * 0.5, -10)

    let cell = CAEmitterCell()
    cell.contents = UIImage(named: "riji")?.cgImage
    //cell.contents = UIImage(named: "riji")
    cell.birthRate = 1
    cell.lifetime = 30
    cell.speed = 2
    cell.velocity = 10
    cell.velocityRange = 10
    cell.yAcceleration = 60
    //cell.scale = 0.05
    //cell.scaleRange = 0.1
    rainLayer.emitterCells = [cell]
 
 //CircularSlider
 
     let circularSlider = RangeCircularSlider(frame: circularSliderView.bounds)
     //let circularSlider = CircularSlider(frame: CGRect(origin: CGPoint.init(x: 100, y: 100), size: CGSize(width: 200, height: 200)))

     circularSlider.backgroundColor = .white
     circularSlider.minimumValue = 10
     circularSlider.maximumValue = 100
     circularSlider.endPointValue = 10
     circularSlider.diskFillColor = .white
     circularSlider.diskColor = .white
     //circularSlider.distance = 50
     circularSlider.trackColor = UIColor.sc.rgb(235, 235, 235)
     circularSlider.trackFillColor = UIColor.sc.rgb(255, 144, 80)
     circularSlider.lineWidth = 10
     circularSlider.backtrackLineWidth = 10
     circularSlider.thumbRadius = 0
     circularSlider.endThumbStrokeColor = .clear
     circularSlider.endThumbStrokeHighlightedColor = .clear
     circularSliderView.addSubview(circularSlider)
 
 /* 纯代码画3/4圆形进度条 */
     let circlePath = UIBezierPath(arcCenter: CGPoint(x: crview.bounds.width * 0.5, y: crview.bounds.height * 0.5 + 25), radius: (self.crview.bounds.width - 10)/2, startAngle: Double.pi / 4 + Double.pi / 2, endAngle: Double.pi / 4, clockwise: true)

     circlePath.lineWidth = 15
     circlePath.stroke()

     let bgLayer = CAShapeLayer()
     bgLayer.frame = self.crview.bounds
     bgLayer.fillColor = UIColor.clear.cgColor//填充色 -  透明
     bgLayer.lineWidth = 15
     bgLayer.strokeColor = UIColor.white.cgColor//线条颜色
     bgLayer.strokeStart = 0//起始点
     bgLayer.strokeEnd = 1//终点
     bgLayer.lineCap = CAShapeLayerLineCap.round//让线两端是圆滑的状态
     bgLayer.path = circlePath.cgPath//这里就是把背景的路径设为之前贝塞尔曲线的那个路径
     self.crview.layer.addSublayer(bgLayer)

     let bgLayer1 = CAShapeLayer()
     bgLayer1.frame = self.crview.bounds
     bgLayer1.fillColor = UIColor.clear.cgColor//填充色 -  透明
     bgLayer1.lineWidth = 15
     bgLayer1.strokeColor = UIColor.sc.rgb(163, 198, 255).cgColor//线条颜色
     bgLayer1.strokeStart = 0//起始点
     bgLayer1.strokeEnd = 0.8//终点
     bgLayer1.lineCap = CAShapeLayerLineCap.round//让线两端是圆滑的状态
     bgLayer1.path = circlePath.cgPath//这里就是把背景的路径设为之前贝塞尔曲线的那个路径
     self.crview.layer.addSublayer(bgLayer1)
 */

/*
  分贝
 
     if AVCaptureDevice.authorizationStatus(for: .audio) == .notDetermined {
         AVAudioSession.sharedInstance().requestRecordPermission { bool in
         }
     }
     
     do {
        try AVAudioSession.sharedInstance().setCategory(.playAndRecord)
     } catch {
         print(error)
     }
     
     var url: URL!
     if #available(iOS 16.0, *) {
         url = URL(filePath: "/dev/null")
     } else {
         // Fallback on earlier versions
     }
     
     let settings: [String : Any] = [
         AVSampleRateKey:NSNumber(44100.0),
         AVFormatIDKey:NSNumber(value: kAudioFormatAppleLossless),
         AVNumberOfChannelsKey:NSNumber(2),
         AVEncoderAudioQualityKey:NSNumber(value: kAudioCodecQuality_Max),
     ]
     
     do {
         try self.audioRecorder = AVAudioRecorder(url: url, settings: settings)
     } catch {
         print(error)
     }
     
     self.audioRecorder?.isMeteringEnabled = true
     self.audioRecorder?.prepareToRecord()
     self.audioRecorder?.record()
     
     Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
         if (self.audioRecorder?.isRecording ?? false) {
             self.audioRecorder?.updateMeters()
             let peakPower = self.audioRecorder?.peakPower(forChannel: 0) ?? 0
             self.button.setTitle("\(-peakPower)db", for: .normal)
         }
     }
 
 */
