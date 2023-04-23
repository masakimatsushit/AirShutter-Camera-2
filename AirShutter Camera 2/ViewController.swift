//
//  ViewController.swift
//  AirShutter Camera 2
//
//  Created by matsushitamasaki on 2023/04/07.
//

import UIKit
import AVFoundation
import CoreMotion

class ViewController: UIViewController,UIGestureRecognizerDelegate{
    
    
    
    
    
    let motionManager = CMMotionManager()

    var rateint = 0

    
    @IBOutlet weak var photorate: UIButton!
    
    
    @IBOutlet weak var photorate2: UIButton!
    
    
    @IBOutlet weak var photorate3: UIButton!
    
    
    @IBAction func changeRAte(_ sender: Any) {
        rateint = UserDefaults.standard.integer(forKey: "rate")
        
        
        if photorate3.alpha != 0{
            zoom.alpha = 1
            flashbotton.alpha = 1
            
            photorate2.alpha = 0
            photorate3.alpha = 0
            
            
        }else{
            zoom.alpha = 0
            flashbotton.alpha = 0
            
            photorate2.alpha = 1
            photorate3.alpha = 1
            
            if rateint == 0{
                photorate2.setTitleColor(UIColor.yellow, for: .normal)
                photorate3.setTitleColor(UIColor.white, for: .normal)
                
            }else if rateint == 1{
                photorate3.setTitleColor(UIColor.yellow, for: .normal)
                
                photorate2.setTitleColor(UIColor.white, for: .normal)
            }
            
        }
        
    }
    
    
    
    @IBAction func changeRAte2(_ sender: Any) {
        
        if rateint == 0{
            
        }else{
            
            
            rateint = 0
            
            UserDefaults.standard.set(rateint, forKey: "rate")
            captureSession.stopRunning()
            
            let newZoomFactdor = self.currentDevice?.minAvailableVideoZoomFactor
            
            do {
                try self.currentDevice?.lockForConfiguration()
                self.currentDevice?.ramp(toVideoZoomFactor: newZoomFactdor!, withRate: 32.0)
                self.currentDevice?.unlockForConfiguration()
            } catch {
                print("Failed to change zoom factor.")
            }
            slider.value = Float(newZoomFactdor!)
            
            self.captureSession.inputs.forEach { input in
                self.captureSession.removeInput(input)
            }
            self.captureSession.outputs.forEach { output in
                self.captureSession.removeOutput(output)
            }
            setupCaptureSession()
            setupDevice()
            setupInputOutput()
            setupPreviewLayer()
            DispatchQueue.global(qos: .background).async {
                self.captureSession.startRunning()
            }
            
            self.setupPinchGestureRecognizer()
        }
        
        
               photorate.setTitle("4:3", for: .normal)
        
        photorate2.alpha = 0
        photorate3.alpha = 0
        
        
        zoom.alpha = 1
        flashbotton.alpha = 1
        
        
        
        
            
            lineView.frame = CGRect(x: view.frame.width/162, y: view.frame.height/20*3, width: 0.7, height: view.frame.height/60*2)
            
            lineView.backgroundColor = UIColor.white
            self.view.addSubview(lineView)
            
            lineView2.frame = CGRect(x: view.frame.width/162, y: view.frame.height/20*3, width: view.frame.height/60*2, height: 0.7)
            
            lineView2.backgroundColor = UIColor.white
            self.view.addSubview(lineView2)
            
            
            lineView3.frame = CGRect(x: view.frame.width/162 + (view.frame.width-view.frame.width/81), y: view.frame.height/20*3, width: 0.7, height: view.frame.height/60*2)
            
            lineView3.backgroundColor = UIColor.white
            self.view.addSubview(lineView3)
            
            lineView4.frame = CGRect(x: view.frame.width/162 + (view.frame.width-view.frame.width/81), y: view.frame.height/20*3, width: -(view.frame.height/60*2), height: 0.7)
            
            lineView4.backgroundColor = UIColor.white
            self.view.addSubview(lineView4)
            
            lineView5.frame = CGRect(x: view.frame.width/162, y: view.frame.height/20*3 + (view.frame.height-view.frame.height/5*2), width: 0.7, height: -(view.frame.height/60*2))
            
            lineView5.backgroundColor = UIColor.white
            self.view.addSubview(lineView5)
            
            
        lineView6.frame = CGRect(x: view.frame.width/162, y: view.frame.height/20*3 + (view.frame.height-view.frame.height/5*2), width: view.frame.height/60*2, height: 0.7)
            
            lineView6.backgroundColor = UIColor.white
            self.view.addSubview(lineView6)
            
            lineView7.frame = CGRect(x: view.frame.width/162 + (view.frame.width-view.frame.width/81), y: view.frame.height/20*3 + (view.frame.height-view.frame.height/5*2), width: 0.7, height: -(view.frame.height/60*2))
            
            lineView7.backgroundColor = UIColor.white
            self.view.addSubview(lineView7)
            
            
        lineView8.frame = CGRect(x: view.frame.width/162 + (view.frame.width-view.frame.width/81), y: view.frame.height/20*3 + (view.frame.height-view.frame.height/5*2), width: -(view.frame.height/60*2), height: 0.7)
            
            lineView8.backgroundColor = UIColor.white
            self.view.addSubview(lineView8)
        
        
    }
    
    
    
    @IBAction func changeRAte3(_ sender: Any) {
        
        if rateint == 1{
            
        }else{
            
            rateint = 1
            UserDefaults.standard.set(rateint, forKey: "rate")
            
            captureSession.stopRunning()
            
            let newZoomFactdor = self.currentDevice?.minAvailableVideoZoomFactor
            
            do {
                try self.currentDevice?.lockForConfiguration()
                self.currentDevice?.ramp(toVideoZoomFactor: newZoomFactdor!, withRate: 32.0)
                self.currentDevice?.unlockForConfiguration()
            } catch {
                print("Failed to change zoom factor.")
            }
            slider.value = Float(newZoomFactdor!)
            
            
            self.captureSession.inputs.forEach { input in
                self.captureSession.removeInput(input)
            }
            self.captureSession.outputs.forEach { output in
                self.captureSession.removeOutput(output)
            }
            setupCaptureSession()
            setupDevice()
            setupInputOutput()
            setupPreviewLayer()
            DispatchQueue.global(qos: .background).async {
                self.captureSession.startRunning()
            }
            
            self.setupPinchGestureRecognizer()
        }
        photorate.setTitle("1:1", for: .normal)
        
        photorate2.alpha = 0
        photorate3.alpha = 0
        
        
        zoom.alpha = 1
        flashbotton.alpha = 1
        
        
        
        lineView.frame = CGRect(x: view.frame.width/162, y: view.frame.height/5, width: 0.7, height: view.frame.height/60*2)
        
        lineView.backgroundColor = UIColor.white
        self.view.addSubview(lineView)
        
        lineView2.frame = CGRect(x: view.frame.width/162, y: view.frame.height/5, width: view.frame.height/60*2, height: 0.7)
        
        lineView2.backgroundColor = UIColor.white
        self.view.addSubview(lineView2)
        
        
        lineView3.frame = CGRect(x: view.frame.width/162 + (view.frame.width-view.frame.width/81), y: view.frame.height/5, width: 0.7, height: view.frame.height/60*2)
        
        lineView3.backgroundColor = UIColor.white
        self.view.addSubview(lineView3)
        
        lineView4.frame = CGRect(x: view.frame.width/162 + (view.frame.width-view.frame.width/81), y: view.frame.height/5, width: -(view.frame.height/60*2), height: 0.7)
        
        lineView4.backgroundColor = UIColor.white
        self.view.addSubview(lineView4)
        
        lineView5.frame = CGRect(x: view.frame.width/162, y: view.frame.height/5 + (view.frame.width-view.frame.width/81), width: 0.7, height: -(view.frame.height/60*2))
        
        lineView5.backgroundColor = UIColor.white
        self.view.addSubview(lineView5)
        
        
    lineView6.frame = CGRect(x: view.frame.width/162, y: view.frame.height/5 + (view.frame.width-view.frame.width/81), width: view.frame.height/60*2, height: 0.7)
        
        lineView6.backgroundColor = UIColor.white
        self.view.addSubview(lineView6)
        
        lineView7.frame = CGRect(x: view.frame.width/162 + (view.frame.width-view.frame.width/81), y: view.frame.height/5 + (view.frame.width-view.frame.width/81), width: 0.7, height: -(view.frame.height/60*2))
        
        lineView7.backgroundColor = UIColor.white
        self.view.addSubview(lineView7)
        
        
    lineView8.frame = CGRect(x: view.frame.width/162 + (view.frame.width-view.frame.width/81), y: view.frame.height/5 + (view.frame.width-view.frame.width/81), width: -(view.frame.height/60*2), height: 0.7)
        
        lineView8.backgroundColor = UIColor.white
        self.view.addSubview(lineView8)
        
        
    }
    
    
    
    var customslider2 = customslider()
    
    
    
    @IBOutlet weak var slider: UISlider!
    
    
    
    var thumbRadius: CGFloat = 13
    
    private lazy var thumbView: UIView = {
           
           // つまみのデザイン
           let thumb = UIView()
           thumb.layer.shadowOpacity = 1.0
           thumb.layer.shadowRadius = 3
           thumb.layer.backgroundColor = UIColor.white.cgColor
           thumb.layer.shadowOffset = CGSize(width: 0, height: 1)
           thumb.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
           return thumb
       }()
    
        

    
    
    
    private func thumbImage(diameter: CGFloat) -> UIImage {
        
        thumbView.frame = CGRect(x: 0, y: 0, width: diameter, height: diameter)
        thumbView.layer.cornerRadius = diameter / 2
        
        // つまみを描写（大きさ自体は直径の1.5倍にして、その分x、y座標をずらす。
        let renderer = UIGraphicsImageRenderer(bounds: CGRect(x: 0, y: 0, width: diameter * 1, height: diameter * 1))
        return renderer.image { rendererContext in
            thumbView.layer.render(in: rendererContext.cgContext)
        }
    }
    
    
    @IBOutlet weak var imageyo: UIImageView!
    
    
    
     let audioSession = AVAudioSession.sharedInstance()

         var audioPlayer: AVAudioPlayer?

         var savedVolume: Float = 0
    
    var motionxyz:Double = 0
    
    
    var imagArray = [UIImage]()
    
    
    private var baseZoomFanctor: CGFloat = 1.0

    
    var previewLayer: AVCaptureVideoPreviewLayer? = nil
      
    
    @IBAction func chaneZoom(_ sender: UISlider) {
        do {
            try self.currentDevice?.lockForConfiguration()
            self.currentDevice?.ramp(toVideoZoomFactor: CGFloat(sender.value), withRate: 32.0)
            self.currentDevice?.unlockForConfiguration()
        } catch {
            print("Failed to change zoom factor.")
        }
        
        
        
        
    }
    
    
    // デバイスからの入力と出力を管理するオブジェクトの作成
    var captureSession = AVCaptureSession()
    // カメラデバイスそのものを管理するオブジェクトの作成
    // メインカメラの管理オブジェクトの作成
    var mainCamera: AVCaptureDevice?
    
    // 現在使用しているカメラデバイスの管理オブジェクトの作成
    var currentDevice: AVCaptureDevice?
    // キャプチャーの出力データを受け付けるオブジェクト
    var photoOutput : AVCapturePhotoOutput?
    // プレビュー表示用のレイヤ
    var cameraPreviewLayer : AVCaptureVideoPreviewLayer?
    
    
    
    
    var isMoved = false
    
    
    @IBOutlet weak var zoom: UIButton!
    
    override func viewDidLoad() {
    
        
        super.viewDidLoad()
        
        photorate.layer.cornerRadius = 10
        photorate.layer.borderWidth = 0.8
        photorate.layer.borderColor = UIColor.white.cgColor
        
        photorate.setTitle("4:3", for: .normal)
        
        rateint = UserDefaults.standard.integer(forKey: "rate")
        
        if rateint == 0{
            photorate.setTitle("4:3", for: .normal)
        }else if rateint == 1{
            photorate.setTitle("1:1", for: .normal)
            
        }else if rateint == 2{
            photorate.setTitle("16:9", for: .normal)
            
        }
        
        photorate2.setTitle("4:3", for: .normal)
              
              photorate2.setTitleColor(UIColor.white, for: .normal)
        photorate3.setTitle("1:1", for: .normal)
              
        
        
        photorate2.alpha = 0
        
        photorate3.alpha = 0
        
        
        slider.value = Float(baseZoomFanctor)
        
        zoom.setTitle("", for: .normal)
        
        
        flashbotton.setTitle("", for: .normal)
        
        
        
        
        
        
        flashbotton.alpha = 1
        
       
        
        
        UIApplication.shared.isIdleTimerDisabled = true
        
        
        selsectItem = UserDefaults.standard.bool(forKey: "flash")
        
        
        if selsectItem {
            
            let images = UIImage(systemName: "bolt.circle.fill")
           
            flashbotton.tintColor = UIColor.systemYellow
            flashbotton.setImage(images, for: .normal)
        }else{
            
            
            let images = UIImage(systemName: "bolt.slash.circle")
            
            
            flashbotton.tintColor = UIColor.white
            flashbotton.setImage(images, for: .normal)
            
            
            
        }
        setupCaptureSession()
        setupDevice()
        setupInputOutput()
        setupPreviewLayer()
        
        DispatchQueue.global(qos: .background).async {
            self.captureSession.startRunning()
        }
        
        self.setupPinchGestureRecognizer()
      
        
        if trueor == true{
            zoom.setImage(UIImage(systemName: "arrow.down.right.and.arrow.up.left.circle"), for: .normal)
        }else{
            zoom.setImage(UIImage(systemName: "arrow.up.left.and.arrow.down.right.circle"), for: .normal)
        }
        
        
        UIDevice.current.isProximityMonitoringEnabled = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(proximitySensorState), name: UIDevice.proximityStateDidChangeNotification, object: nil)
        
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(foreground(notification:)),
                                               name: UIApplication.willEnterForegroundNotification,
                                               object: nil
        )
        
        NotificationCenter.default.addObserver(self,
                                                      selector: #selector(background(notification:)),
                                                      name: UIApplication.didEnterBackgroundNotification,
                                                      object: nil
               )
        
        
        
        imageyo.isUserInteractionEnabled = true
        imageyo.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:))))

        imageyo.layer.cornerRadius = 4
        
        
        
        motionManager.accelerometerUpdateInterval = 1/10
        // 加速度の取得を開始.
        motionManager.startAccelerometerUpdates(to: OperationQueue.main, withHandler: { [self](accelerometerData, error) in
            if error != nil {
                
                return
            }
            guard let data = accelerometerData else {
                return
            }
           
            
           if data.acceleration.x >= 0.7 && data.acceleration.x <= 1.00{
             kaitenn = 1
               //右
           }
           if data.acceleration.x <= -0.7 && data.acceleration.x >= -1.00{
               kaitenn = 2
               
               //左
           }
            if data.acceleration.y >= 0.7 && data.acceleration.y <= 1.00{
               kaitenn = 3
                
               //下
           }
            if data.acceleration.y <= -0.7 && data.acceleration.y >= -1.00{
              kaitenn = 0
                //縦
                
            }
            
            
            motionxyz = abs(data.acceleration.x) + abs(data.acceleration.y) + abs(data.acceleration.z)
            
            if motionxyz > 1.5 && isMoved == false{
                isMoved = true
                autoreset()
            }
            
       })
        
       
        // つまみの設定
        let thumb = thumbImage(diameter: thumbRadius)
        slider.setThumbImage(thumb, for: .normal)
        
        // （オプション）つまみのドラッグ中の設定（1.2倍大きくする）
        let heighLightThumb = thumbImage(diameter: thumbRadius * 1.2)
        slider.setThumbImage(heighLightThumb, for: .highlighted)
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapForcus(_:))))

       self.view.addSubview(forcusView)
             
              forcusView.frame = CGRect(x: 0, y: 0, width: view.bounds.width * 0.16, height: view.bounds.width * 0.16)
              forcusView.backgroundColor = .clear
        forcusView.layer.borderWidth = 1.4
              forcusView.layer.borderColor = UIColor.systemYellow.cgColor
              forcusView.isHidden = true
        
        
        
        
        if rateint == 0{
            
            lineView.frame = CGRect(x: view.frame.width/162, y: view.frame.height/20*3, width: 0.7, height: view.frame.height/60*2)
            
            lineView.backgroundColor = UIColor.white
            self.view.addSubview(lineView)
            
            lineView2.frame = CGRect(x: view.frame.width/162, y: view.frame.height/20*3, width: view.frame.height/60*2, height: 0.7)
            
            lineView2.backgroundColor = UIColor.white
            self.view.addSubview(lineView2)
            
            
            lineView3.frame = CGRect(x: view.frame.width/162 + (view.frame.width-view.frame.width/81), y: view.frame.height/20*3, width: 0.7, height: view.frame.height/60*2)
            
            lineView3.backgroundColor = UIColor.white
            self.view.addSubview(lineView3)
            
            lineView4.frame = CGRect(x: view.frame.width/162 + (view.frame.width-view.frame.width/81), y: view.frame.height/20*3, width: -(view.frame.height/60*2), height: 0.7)
            
            lineView4.backgroundColor = UIColor.white
            self.view.addSubview(lineView4)
            
            lineView5.frame = CGRect(x: view.frame.width/162, y: view.frame.height/20*3 + (view.frame.height-view.frame.height/5*2), width: 0.7, height: -(view.frame.height/60*2))
            
            lineView5.backgroundColor = UIColor.white
            self.view.addSubview(lineView5)
            
            
        lineView6.frame = CGRect(x: view.frame.width/162, y: view.frame.height/20*3 + (view.frame.height-view.frame.height/5*2), width: view.frame.height/60*2, height: 0.7)
            
            lineView6.backgroundColor = UIColor.white
            self.view.addSubview(lineView6)
            
            lineView7.frame = CGRect(x: view.frame.width/162 + (view.frame.width-view.frame.width/81), y: view.frame.height/20*3 + (view.frame.height-view.frame.height/5*2), width: 0.7, height: -(view.frame.height/60*2))
            
            lineView7.backgroundColor = UIColor.white
            self.view.addSubview(lineView7)
            
            
        lineView8.frame = CGRect(x: view.frame.width/162 + (view.frame.width-view.frame.width/81), y: view.frame.height/20*3 + (view.frame.height-view.frame.height/5*2), width: -(view.frame.height/60*2), height: 0.7)
            
            lineView8.backgroundColor = UIColor.white
            self.view.addSubview(lineView8)
            
            
        }else if rateint == 1{
            
            lineView.frame = CGRect(x: view.frame.width/162, y: view.frame.height/5, width: 0.7, height: view.frame.height/60*2)
            
            lineView.backgroundColor = UIColor.white
            self.view.addSubview(lineView)
            
            lineView2.frame = CGRect(x: view.frame.width/162, y: view.frame.height/5, width: view.frame.height/60*2, height: 0.7)
            
            lineView2.backgroundColor = UIColor.white
            self.view.addSubview(lineView2)
            
            
            lineView3.frame = CGRect(x: view.frame.width/162 + (view.frame.width-view.frame.width/81), y: view.frame.height/5, width: 0.7, height: view.frame.height/60*2)
            
            lineView3.backgroundColor = UIColor.white
            self.view.addSubview(lineView3)
            
            lineView4.frame = CGRect(x: view.frame.width/162 + (view.frame.width-view.frame.width/81), y: view.frame.height/5, width: -(view.frame.height/60*2), height: 0.7)
            
            lineView4.backgroundColor = UIColor.white
            self.view.addSubview(lineView4)
            
            lineView5.frame = CGRect(x: view.frame.width/162, y: view.frame.height/5 + (view.frame.width-view.frame.width/81), width: 0.7, height: -(view.frame.height/60*2))
            
            lineView5.backgroundColor = UIColor.white
            self.view.addSubview(lineView5)
            
            
        lineView6.frame = CGRect(x: view.frame.width/162, y: view.frame.height/5 + (view.frame.width-view.frame.width/81), width: view.frame.height/60*2, height: 0.7)
            
            lineView6.backgroundColor = UIColor.white
            self.view.addSubview(lineView6)
            
            lineView7.frame = CGRect(x: view.frame.width/162 + (view.frame.width-view.frame.width/81), y: view.frame.height/5 + (view.frame.width-view.frame.width/81), width: 0.7, height: -(view.frame.height/60*2))
            
            lineView7.backgroundColor = UIColor.white
            self.view.addSubview(lineView7)
            
            
        lineView8.frame = CGRect(x: view.frame.width/162 + (view.frame.width-view.frame.width/81), y: view.frame.height/5 + (view.frame.width-view.frame.width/81), width: -(view.frame.height/60*2), height: 0.7)
            
            lineView8.backgroundColor = UIColor.white
            self.view.addSubview(lineView8)
            
            
        }
                    
        
        
    }
    
    
    
    
    
    @objc func tapForcus(_ recognizer:UITapGestureRecognizer) {
        let pointInView = recognizer.location(in: recognizer.view)
        forcusView.alpha = 1
        
        let inorout = cameraPreviewLayer?.frame.contains(pointInView)
        if inorout! {
            
            guard currentDevice != nil else {
                return
            }
            
            do {
                try currentDevice!.lockForConfiguration()
            } catch {
                return
            }
            
            let devicePoint = cameraPreviewLayer!.captureDevicePointConverted(fromLayerPoint: pointInView)
            
            if currentDevice!.isFocusPointOfInterestSupported && currentDevice!.isFocusModeSupported(currentDevice!.focusMode) {
                currentDevice!.focusPointOfInterest = devicePoint
                currentDevice!.focusMode = .autoFocus
            }
            
            if currentDevice!.isExposurePointOfInterestSupported && currentDevice!.isExposureModeSupported(currentDevice!.exposureMode) {
                currentDevice!.exposurePointOfInterest = devicePoint
                currentDevice!.exposureMode = .autoExpose
            }
            forcusView.center = pointInView // タップしたポイントへ移動する
            forcusView.isHidden = false // 現れる
            
            
            currentDevice!.unlockForConfiguration()
            
          
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [self] in
                forcusView.alpha = 0.4
            }
            
            return
        }
    }
     
     
        func autoreset(){
            
            
                
                guard currentDevice != nil else {
                    return
                }
                
                do {
                    try currentDevice!.lockForConfiguration()
                    
                } catch let error {
                    print(error)
                }
                
                if currentDevice!.isFocusPointOfInterestSupported && currentDevice!.isFocusModeSupported(currentDevice!.focusMode) {
                    
                    currentDevice!.focusMode = .continuousAutoFocus
                }
                
                if currentDevice!.isExposurePointOfInterestSupported && currentDevice!.isExposureModeSupported(currentDevice!.exposureMode) {
                    
                    currentDevice!.exposureMode = .continuousAutoExposure
                }
                
                
                
                currentDevice!.unlockForConfiguration()
                
                forcusView.isHidden = true
       
        isMoved = false
     }
    
    
    
    var forcusView = UIView()


    var kaitenn = 0
    
    
    let vieww = UIView()

    
    @objc func background(notification: Notification) {
       
         
         vieww.backgroundColor = UIColor.black
              // ぼかし効果Viewのframeをviewのframeに合わせる
             vieww.frame = view.frame

        autoreset()
        
        isMoved = false
        
              // viewにぼかし効果viewを追加
              view.addSubview(vieww)
     }
    
    
    @objc func foreground(notification: Notification) {
        
        print("フォアグラウンド")
        
        print("oooi")
        let newZoomFactdor = self.currentDevice?.minAvailableVideoZoomFactor
        
        do {
            try self.currentDevice?.lockForConfiguration()
            self.currentDevice?.ramp(toVideoZoomFactor: newZoomFactdor!, withRate: 32.0)
            self.currentDevice?.unlockForConfiguration()
        } catch {
            print("Failed to change zoom factor.")
        }
        slider.value = Float(newZoomFactdor!)
        vieww.removeFromSuperview()
        
        UIDevice.current.isProximityMonitoringEnabled = true
        
        
    }
    
    
    
    private func setupPinchGestureRecognizer() {
           // pinch recognizer for zooming
           let pinchGestureRecognizer: UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(self.onPinchGesture(_:)))
           self.view.addGestureRecognizer(pinchGestureRecognizer)
       }

    @objc private func onPinchGesture(_ sender: UIPinchGestureRecognizer) {
        
        if sender.state == .began {
            self.baseZoomFanctor = (self.currentDevice?.videoZoomFactor)!
        }
        
        let tempZoomFactor: CGFloat = self.baseZoomFanctor * sender.scale
        let newZoomFactdor: CGFloat
        if tempZoomFactor < (self.currentDevice?.minAvailableVideoZoomFactor)! {
            newZoomFactdor = (self.currentDevice?.minAvailableVideoZoomFactor)!
        } else if 5.0 < tempZoomFactor {
            newZoomFactdor = 5.0
        } else {
            newZoomFactdor = tempZoomFactor
        }
        print(newZoomFactdor)
        do {
            try self.currentDevice?.lockForConfiguration()
            self.currentDevice?.ramp(toVideoZoomFactor: newZoomFactdor, withRate: 32.0)
            self.currentDevice?.unlockForConfiguration()
        } catch {
            print("Failed to change zoom factor.")
        }
        
        slider.value = Float(newZoomFactdor)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIDevice.current.isProximityMonitoringEnabled = false
        slider.value = Float(baseZoomFanctor)
        
        
    }
    
    
    @IBOutlet weak var flashbotton: UIButton!
    
    
    @IBAction func flash(_ sender: Any) {
        selsectItem = UserDefaults.standard.bool(forKey: "flash")
        
        if selsectItem {
            selsectItem = false
            UserDefaults.standard.set(selsectItem, forKey: "flash")
            let images = UIImage(systemName: "bolt.slash.circle")
            
            flashbotton.tintColor = UIColor.white
            flashbotton.setImage(images, for: .normal)
        }else{
            selsectItem = true
            UserDefaults.standard.set(selsectItem, forKey: "flash")
            let images = UIImage(systemName: "bolt.circle.fill")
            
            flashbotton.tintColor = UIColor.systemYellow
            flashbotton.setImage(images, for: .normal)
        }
        
    }
    
    
    
    var selsectItem = false
    
    @objc func proximitySensorState() {
        
            if UIDevice.current.proximityState == true{
                    let settings = AVCapturePhotoSettings()
                    
                    // フラッシュの設定
                    if (currentDevice!.isFlashAvailable) && selsectItem {
                        settings.flashMode = .on
                    }
                    else {
                        settings.flashMode = .off
                    }
                    // 撮影された画像をdelegateメソッドで処理
                    self.photoOutput?.capturePhoto(with: settings, delegate: self as AVCapturePhotoCaptureDelegate)
                    
                    
                
            
            }
    }
    
    var trueor = false
    
    
    @IBAction func change(_ sender: Any) {
        
        if !trueor{
            trueor = true
            zoom.setImage(UIImage(systemName: "arrow.down.right.and.arrow.up.left.circle"), for: .normal)
        }else{
            trueor = false
            zoom.setImage(UIImage(systemName: "arrow.up.left.and.arrow.down.right.circle"), for: .normal)
        }
        slider.value = 1
        UserDefaults.standard.set(trueor, forKey: "trueor")
        captureSession.stopRunning()
        self.captureSession.inputs.forEach { input in
            self.captureSession.removeInput(input)
            }
        self.captureSession.outputs.forEach { output in
            self.captureSession.removeOutput(output)
            }
        setupCaptureSession()
        setupDevice()
        setupInputOutput()
        
        setupPreviewLayer()
        captureSession.startRunning()
    }
    
    
    
    @objc func imageViewTapped(_ sender: UITapGestureRecognizer) {
        print("タップ")
        if imagArray.count != 0{
                   let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! checkViewController
                   
                   secondViewController.image = imagArray
                   
            secondViewController.touch = 1
            
                   self.present(secondViewController, animated: true, completion: nil)
        
               }else{
                   return
               }
        
        
    }
    
    
    
    var lineView = UIView()
    var lineView2 = UIView()
    var lineView3 = UIView()
    var lineView4 = UIView()
    var lineView5 = UIView()
    var lineView6 = UIView()
    var lineView7 = UIView()
    var lineView8 = UIView()
    
    
    
    
    
    
}


//MARK: カメラ設定メソッド
extension ViewController{
    // カメラの画質の設定
    func setupCaptureSession() {
        
        captureSession.beginConfiguration()
        
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        
        captureSession.commitConfiguration()
        
    }
    
    // デバイスの設定
    func setupDevice() {
        // カメラデバイスのプロパティ設定
        let deviceDiscoverySession1 = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)
        // プロパティの条件を満たしたカメラデバイスの取得
        let devices1 = deviceDiscoverySession1.devices
        
        
        var defaultVideoDevice: AVCaptureDevice?
        
        trueor = UserDefaults.standard.bool(forKey: "trueor")
        
        if trueor == true{
            if let tripleCameraDevice = AVCaptureDevice.default(.builtInTripleCamera, for: .video, position: .back) {
                //トリプルカメラ
                defaultVideoDevice = tripleCameraDevice
            } else if let dualCameraDevice = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back) {
                //デュアルカメラ（広角・望遠）
                defaultVideoDevice = dualCameraDevice
            } else if let dualWideCameraDevice = AVCaptureDevice.default(.builtInDualWideCamera, for: .video, position: .back) {
                //デュアルカメラ（広角・超広角）
                defaultVideoDevice = dualWideCameraDevice
            } else if let backCameraDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) {
                //シングルカメラ
                defaultVideoDevice = backCameraDevice
            }  else if let frontCameraDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) {
                //インカメラ
                defaultVideoDevice = frontCameraDevice
            }
        }else{
            defaultVideoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
        }
        
        
        
        
        
        
        for _ in devices1 {
                mainCamera = defaultVideoDevice
        }
        
            currentDevice = mainCamera
    }
    
    // 入出力データの設定
    func setupInputOutput() {
        do {
            // 指定したデバイスを使用するために入力を初期化
            let captureDeviceInput = try AVCaptureDeviceInput(device: currentDevice!)
            // 指定した入力をセッションに追加
            captureSession.addInput(captureDeviceInput)
            // 出力データを受け取るオブジェクトの作成
            photoOutput = AVCapturePhotoOutput()
            // 出力ファイルのフォーマットを指定
            photoOutput!.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey : AVVideoCodecType.jpeg])], completionHandler: nil)
            
            
            
            captureSession.addOutput(photoOutput!)
        } catch {
            print(error)
        }
    }
    
    // カメラのプレビューを表示するレイヤの設定
    func setupPreviewLayer() {
        // 指定したAVCaptureSessionでプレビューレイヤを初期化
        
        
        rateint = UserDefaults.standard.integer(forKey: "rate")
        
        self.cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        if rateint == 0{
            self.cameraPreviewLayer?.frame = CGRect(x: view.frame.width/162, y: view.frame.height/20*3, width: view.frame.width-view.frame.width/81, height: view.frame.height-view.frame.height/5*2)
        }else if rateint == 1{
            self.cameraPreviewLayer?.frame = CGRect(x: view.frame.width/162, y: view.frame.height/25*5, width: view.frame.width-view.frame.width/81, height: view.frame.width-view.frame.width/81)
            
        }
        // プレビューレイヤが、カメラのキャプチャーを縦横比を維持した状態で、表示するように設定
        self.cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        // プレビューレイヤの表示の向きを設定
        self.cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        
        self.view.layer.insertSublayer(self.cameraPreviewLayer!, at: 0)
    }
    
    
}
extension ViewController: AVCapturePhotoCaptureDelegate{
    
    func photoOutput(_ output: AVCapturePhotoOutput, willCapturePhotoFor resolvedSettings: AVCaptureResolvedPhotoSettings) {
        
        
        AudioServicesDisposeSystemSoundID(1108) // ここだけ実装すると、無音シャッターになる
        
        AudioServicesPlaySystemSound(1104)
    }
    
   // 撮影した画像データが生成されたときに呼び出されるデリゲートメソッド
   func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
      
       

       
       
       
       if let imageData = photo.fileDataRepresentation() {
           
           var uiImage = UIImage(data: imageData)!
           
           if rateint == 1{
               let cgImage = uiImage.cgImage
               var newWidth = CGFloat(cgImage!.width)
               var newHeight = CGFloat(cgImage!.height)
               if newWidth > newHeight {
                   newWidth = newHeight
               } else {
                   newHeight = newWidth
               }
               let x = (CGFloat(cgImage!.width) - newWidth)/2
               let y = (CGFloat(cgImage!.height) - newHeight)/2
               let rect = CGRect(x: x, y: y, width: newHeight, height: newWidth)
               let croppedCGImage = cgImage!.cropping(to: rect)!
               
               
            uiImage = UIImage(cgImage: croppedCGImage, scale: 1, orientation: uiImage.imageOrientation)
           }
           
           if (UIDevice.current.orientation == .landscapeLeft || kaitenn == 2) && currentDevice == mainCamera{
               let image = UIImage(cgImage: uiImage.cgImage!, scale: uiImage.scale, orientation: .up)
               //画面遷移が起きると呼ばれるメソッド
               
               imagArray.append(image)
               
               // 写真ライブラリに画像を保存
               UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
               
               
               
           } else if (UIDevice.current.orientation == .landscapeRight || kaitenn == 1) && currentDevice == mainCamera{
               let image = UIImage(cgImage: uiImage.cgImage!, scale: uiImage.scale, orientation: .down)
               
               imagArray.append(image)
               
               // 写真ライブラリに画像を保存
               UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
           }else if (UIDevice.current.orientation == .portraitUpsideDown || kaitenn == 3) && currentDevice == mainCamera{
               let image = UIImage(cgImage: uiImage.cgImage!, scale: uiImage.scale, orientation: .left)
               
               imagArray.append(image)
               // 写真ライブラリに画像を保存
               UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
           } else if (UIDevice.current.orientation == .portrait || kaitenn == 0) && currentDevice == mainCamera{
               
               imagArray.append(uiImage)
               // 写真ライブラリに画像を保存
               UIImageWriteToSavedPhotosAlbum(uiImage, self, nil, nil)
           }else{
               
               imagArray.append(uiImage)
               // 写真ライブラリに画像を保存
               UIImageWriteToSavedPhotosAlbum(uiImage, self, nil, nil)
               
           }
           imageyo.image = imagArray[imagArray.count-1]
           
       }
 
       
   }

    
}





class customslider: UISlider {
    
    var truefalse = false
    
    
    // バーの高さ
    @IBInspectable var trackHeight: CGFloat = 2.5
    
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {

          var newRect = super.trackRect(forBounds: bounds)
          newRect.size.height = trackHeight
          return newRect
      }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
          var wideBounds = bounds
        
            UserDefaults.standard.set(wideBounds.size.width, forKey: "width")
        
            UserDefaults.standard.set(wideBounds.size.height, forKey: "height")
        if wideBounds.contains(point){
            truefalse = true
        }else{
            wideBounds.size.height += 49.0
            
            if wideBounds.contains(point){
                truefalse = true
            }else{
                
                wideBounds.size.height -= 98.0
                if wideBounds.contains(point){
                    truefalse = true
                }else{
                    wideBounds.size.width = -37
                }
                
                
            }
            
        }
        
        
        wideBounds.size.height = CGFloat(UserDefaults.standard.integer(forKey: "height"))
        
        
        
        if wideBounds.contains(point){
            truefalse = true
        }else{
            wideBounds.size.height += 49.0
            
            if wideBounds.contains(point){
                truefalse = true
            }else{
                
                wideBounds.size.height -= 98.0
                if wideBounds.contains(point){
                    truefalse = true
                }else{
                    
                    
                    truefalse = false
                    
                }
                
                
            }
            
        }
        wideBounds.size.width = CGFloat(UserDefaults.standard.integer(forKey: "width"))
       
        wideBounds.size.height = CGFloat(UserDefaults.standard.integer(forKey: "height"))
       
        
        return truefalse
        
      }
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
          return true // どんなtouchでもスライダー調節を行う
      }
}


