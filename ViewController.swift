//
//  ViewController.swift
//  Swift5Timer
//
//  Created by 玉城秀大 on 2020/11/06.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    var timer = Timer()
    
    var count = Int()
    
    //imageArrayの中はUIImageというclassのものが入る
    var imageArray = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //stopButtonを押せなくする
        stopButton.isEnabled = false
        
        for i in 0..<5 {
            print (i)
            
            let image = UIImage(named: "\(i)")
            imageArray.append(image!)
        }
        
        imageView.image = UIImage(named: "0")
    }
    
    func startTimer() {
        //タイマーを回す 0.2秒毎にあるメソッドを呼ぶ
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    //0.2秒毎に呼ばれる
    @objc func  timerUpdate() {
        count = count + 1
        
        if count > 4 {
            count = 0
        }
        
        imageView.image = imageArray[count]
        
        
    }

    
    @IBAction func start(_ sender: Any) {
        //imageviewのimageに画像を反映していく
        
        //startButtonを押せなくする
        startButton.isEnabled = false
        stopButton.isEnabled = true
        
        startTimer()
    }
 
    
    @IBAction func stop(_ sender: Any) {
        //imageViewのimageに反映されている画像の出力をストップする
        
        //startButtonを押せるようにする
        startButton.isEnabled = true
        stopButton.isEnabled = false
        
        //タイマーをストップする
        timer.invalidate()
        
    }
    
    
}

