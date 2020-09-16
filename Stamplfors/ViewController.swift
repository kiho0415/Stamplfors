//
//  ViewController.swift
//  Stamplfors
//
//  Created by 森田貴帆 on 2020/09/16.
//  Copyright © 2020 森田貴帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var imageNameArray:[String] = ["hana","hoshi","onpu","shitumon"]
    var imageIndex:Int = 0//選択しているスタンプの番号
    @IBOutlet var haikeiImageview:UIImageView!//背景画像を表示させる
    var imageview:UIImageView!//スタンプが入る

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //タッチされたいちを取得
        let touch : UITouch = touches.first!
        let location: CGPoint = touch.location(in: self.view)
        //imageINdexが0でない、押すスタンプが選ばれている時
        if imageIndex != 0{
            //サイズを正方形に
            imageview = UIImageView(frame: CGRect(x:0, y: 0, width: 40, height: 40))
            let image: UIImage = UIImage(named: imageNameArray[imageIndex - 1])!
            imageview.image = image
            //タッチした位置に画像を置く
            imageview.center = CGPoint(x: location.x, y: location.y)
            //画像を表示する
            self.view.addSubview(imageview)
        }
    }
    
    @IBAction func selectedfirst(){
        imageIndex = 1
    }
    @IBAction func selectedsecond(){
        imageIndex = 2
    }
    @IBAction func selectedthird(){
        imageIndex = 3
    }
    @IBAction func selectedforth(){
        imageIndex = 4
    }
    @IBAction func back(){
        self.imageview.removeFromSuperview()
    }
    @IBAction func selectBackground(){
        let imagePickerController: UIImagePickerController = UIImagePickerController()
        //フォトライブラリを設定
        imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        //フォトライブラリを呼び出す
        self.present(imagePickerController, animated: true,completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        haikeiImageview.image = image
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(){
        //画面場のスクショを取得
        let rect:CGRect = CGRect(x: 0, y: 65, width: 414, height: 471)
        UIGraphicsBeginImageContext(rect.size)
        self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let capture = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //フォトライブラるぶ保存
        UIImageWriteToSavedPhotosAlbum(capture!, nil, nil, nil)
    }


}

