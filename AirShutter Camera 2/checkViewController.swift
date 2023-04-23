//
//  checkViewController.swift
//  AirShutter Camera 2
//
//  Created by matsushitamasaki on 2023/04/07.
//


import UIKit
import StoreKit

class checkViewController: UIViewController,UIGestureRecognizerDelegate , UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate{
    
    @IBOutlet weak var view7: UIView!
    
    var reviewCount = 0
    
    let vieww = UIView()
    
    var image = [UIImage]()
    
    var count:Int!
    
    
    
    @IBAction func doneDo(_ sender: Any) {
        print("opdhdjnc")
        self.dismiss(animated: true)
        
        
    }
    
    
    var touch = 0
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if touch == 1{
            scrollView2.contentOffset = CGPoint(x: UIScreen.main.bounds.width * CGFloat(image.count-1), y: 0.0)
            
        touch = 0
        }
        if UIDevice.current.userInterfaceIdiom == .phone {
            // 使用デバイスがiPhoneの場合
            reviewCount = UserDefaults.standard.integer(forKey: "reviewCount")
            reviewCount += 1
            UserDefaults.standard.set(reviewCount, forKey: "reviewCount")
            if reviewCount == 4 || reviewCount == 19 || reviewCount == 67{
                if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                    SKStoreReviewController.requestReview(in: scene)
                }
            }
        }
        
        
        
        
    }
    
    @objc func background(notification: Notification) {
        print("バックグラウンド")
        UIDevice.current.isProximityMonitoringEnabled = false
        vieww.backgroundColor = UIColor.black
        // ぼかし効果Viewのframeをviewのframeに合わせる
        vieww.frame = view.frame
        
        // viewにぼかし効果viewを追加
        view.addSubview(vieww)
        
        self.dismiss(animated: false)
    }
    @objc func foreground(notification: Notification) {
        UIDevice.current.isProximityMonitoringEnabled = true
        vieww.removeFromSuperview()
        
    }
    
    var imgcount = [UIImageView]()
    let scrollView2 = UIScrollView()

    
    var scrollBeginingPoint:CGPoint!
    
    var scrolltrue = false
    
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        scrollBeginingPoint = scrollView.contentOffset;
        
   // println("スクロールスタート")
        scrolltrue = true
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if(scrolltrue){
            print("asasasasasas")
            if(scrollBeginingPoint.x>scrollView.contentOffset.x){
                print("opopopoppo")
                
                
                if(imgcount.count - Int(scrollView2.contentOffset.x/view.frame.width) - 1 != imgcount.count){
                    
    
                    imgcount[imgcount.count - Int(scrollView2.contentOffset.x/view.frame.width) - 1].frame = CGRect(x: UIScreen.main.bounds.width * CGFloat(image.count - (imgcount.count - Int(scrollView2.contentOffset.x/view.frame.width)))-50, y: 0.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/9*8)
                    
                }
                
                
            }else{
                
                if(imgcount.count - Int(scrollView2.contentOffset.x/view.frame.width) - 2 != -1){
                    imgcount[imgcount.count - Int(scrollView2.contentOffset.x/view.frame.width) - 2].frame = CGRect(x: UIScreen.main.bounds.width * CGFloat(image.count - (imgcount.count - Int(scrollView2.contentOffset.x/view.frame.width)) + 1)+50, y: 0.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/9*8)
                }
                    
                
                
                
            }
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
     
        
        UIView.animate(withDuration: 0.5, // アニメーションの秒数
                       delay: 0, // アニメーションが開始するまでの秒数
                       options: [.curveLinear], // アニメーションのオプション 等速 | 繰り返し
                       animations: { [self] in
                        // アニメーション処理
            for i in 0...image.count-1{
            imgcount[i].frame = CGRect(x: UIScreen.main.bounds.width * CGFloat(image.count - (i + 1)), y: 0.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/9*8)
            
            
        }
                        
        }, completion: { (finished: Bool) in
        })
        
        
        
        
        
        
        scrolltrue = false
    }
    
    
    @IBOutlet weak var barButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        barButton.title = ""
        
        scrollView2.maximumZoomScale = 4
        scrollView2.minimumZoomScale = 1
        scrollView2.delegate = self
        
        
        
        for i in 0...image.count-1{
            
            let imgview = UIImageView()
            
            imgcount.append(imgview)
            
            imgcount[i].image = image[image.count - (i+1)]
            imgcount[i].frame = CGRect(x: UIScreen.main.bounds.width * CGFloat(image.count - (i + 1)), y: 0.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/9*8)
            
            
            imgcount[i].contentMode = UIView.ContentMode.scaleAspectFit
            scrollView2.addSubview(imgcount[i])
            
            
        }
        
        
       
        scrollView2.frame = CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
              
        scrollView2.contentSize = CGSize(width: UIScreen.main.bounds.width * CGFloat(image.count), height: UIScreen.main.bounds.height)
            
        scrollView2.isPagingEnabled = true
        
        self.view7.addSubview(scrollView2)
        
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(background(notification:)),
                                               name: UIApplication.didEnterBackgroundNotification,
                                               object: nil
        )
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(foreground(notification:)),
                                               name: UIApplication.willEnterForegroundNotification,
                                               object: nil
        )
    }
    
}



