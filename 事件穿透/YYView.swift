//
//  YYView.swift
//  事件穿透
//
//  Created by 董知樾 on 2017/2/22.
//  Copyright © 2017年 董知樾. All rights reserved.
//

import UIKit

class YYView: UIView {

    var imageView : UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView = UIImageView()
        addSubview(imageView)
        imageView.snp.makeConstraints({ (make) in
            make.edges.equalTo(self)
        })
        imageView.image = UIImage(named : "alpha")
        imageView.contentMode = .scaleAspectFit
        
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        
        //代码来自
        //http://stackoverflow.com/questions/33214508/how-do-i-get-the-rgb-value-of-a-pixel-using-cgcontext
        
        var pixel:[CUnsignedChar] = [0]//,0,0,0]
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        
        if let context = CGContext(data: &pixel, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace,bitmapInfo: bitmapInfo.rawValue) {
            
            context.translateBy(x: -point.x, y: -point.y)
            imageView.layer.render(in: context)
        }
        
        
        
//        let red : CGFloat = CGFloat(pixel[0])/255.0
//        let green : CGFloat = CGFloat(pixel[1])/255.0
//        let blue : CGFloat = CGFloat(pixel[2])/255.0
        let alpha : CGFloat = CGFloat(pixel[0])/255.0

        return alpha > 0.01
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("\(NSStringFromClass(self.classForCoder))---touchesBegan")
    }
    

}
