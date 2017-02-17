//
//  ViewController.swift
//  ConcurrencyDemoSwift3
//
//  Created by jyotishankar sahoo on 17/02/17.
//  Copyright © 2017 jyotishankar sahoo. All rights reserved.
//

import UIKit

class ImageDownloader {
    
    class func getImageFromURL(imageURL : String) -> UIImage{
        let data = NSData(contentsOf: URL(string: imageURL)!)
        return UIImage(data: data as! Data)!
}
}

class ViewController: UIViewController {

    let imageURLs = ["http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg", "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg", "http://adriatic-lines.com/wp-content/uploads/2015/03/Brijuni-by-Astral-074.jpg", "http://adriatic-lines.com/wp-content/uploads/2015/03/Brijuni-by-Astral-073.jpg"]
    
    @IBOutlet weak var imageView1 : UIImageView!
    @IBOutlet weak var imageView2 : UIImageView!
    @IBOutlet weak var imageView3 : UIImageView!
    @IBOutlet weak var imageView4 : UIImageView!
     let queue = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func mainClicked(sender : UIButton){
        self.resetImages()
        self.updateImagesOnImageViewOnMainThread()
    }
    @IBAction func gcdClicked(sender : UIButton){
        self.resetImages()
        self.updateImageOnImageViewUsingGCD()
    }
    @IBAction func operationClicked(sender : UIButton){
        self.resetImages()
        self.updateImageOnImageViewUsingOperation()
    }
    
    @IBAction func cancelClicked(sender : UIButton){
        self.queue.cancelAllOperations()
    }
    
    func resetImages(){
        self.imageView1.image = nil
        self.imageView2.image = nil
        self.imageView3.image = nil
        self.imageView4.image = nil

    }
    
    func updateImagesOnImageViewOnMainThread(){
        
        let image1 = ImageDownloader.getImageFromURL(imageURL: imageURLs[0])
        self.imageView1.image = image1
        
        let image2 = ImageDownloader.getImageFromURL(imageURL: imageURLs[1])
        self.imageView2.image = image2
        
        let image3 = ImageDownloader.getImageFromURL(imageURL: imageURLs[2])
        self.imageView3.image = image3
        
        let image4 = ImageDownloader.getImageFromURL(imageURL: imageURLs[3])
        self.imageView4.image = image4
    }

    func updateImageOnImageViewUsingGCD(){
        let queue = DispatchQueue(label: "com.app.concurrent" , attributes: .concurrent)
        queue.async {
            let image = ImageDownloader.getImageFromURL(imageURL: self.imageURLs[0])
            DispatchQueue.main.async {
                self.imageView1.image = image
            }
        }
        queue.async {
            let image = ImageDownloader.getImageFromURL(imageURL: self.imageURLs[1])
            DispatchQueue.main.async {
                self.imageView2.image = image
            }
        }
        queue.async {
            let image = ImageDownloader.getImageFromURL(imageURL: self.imageURLs[2])
            DispatchQueue.main.async {
                self.imageView3.image = image
            }
        }
        queue.async {
            let image = ImageDownloader.getImageFromURL(imageURL: self.imageURLs[3])
            DispatchQueue.main.async {
                self.imageView4.image = image
            }
        }
    }
    
    func updateImageOnImageViewUsingOperation(){
       
        let blockOperation1 = BlockOperation {
            let image = ImageDownloader.getImageFromURL(imageURL: self.imageURLs[0])
            OperationQueue.main.addOperation({
                self.imageView1.image = image
            })
        }
        blockOperation1.completionBlock = {
            print("Image 1 download Completed, Cancelled \(blockOperation1.isCancelled)")
        }
        queue.addOperation(blockOperation1)
        
        let blockOperation2 = BlockOperation {
            let image = ImageDownloader.getImageFromURL(imageURL: self.imageURLs[1])
            OperationQueue.main.addOperation({
                self.imageView2.image = image
            })
        }
        blockOperation2.addDependency(blockOperation1)
        blockOperation2.completionBlock = {
            print("Image 2 download Completed, Cancelled \(blockOperation2.isCancelled)")
        }
        queue.addOperation(blockOperation2)
        
        let blockOperation3 = BlockOperation {
            let image = ImageDownloader.getImageFromURL(imageURL: self.imageURLs[2])
            OperationQueue.main.addOperation({
                self.imageView3.image = image
            })
        }
        blockOperation3.addDependency(blockOperation2)
        blockOperation3.completionBlock = {
            print("Image 3 download Completed, Cancelled \(blockOperation3.isCancelled)")
        }
        queue.addOperation(blockOperation3)
        
        let blockOperation4 = BlockOperation {
            let image = ImageDownloader.getImageFromURL(imageURL: self.imageURLs[3])
            OperationQueue.main.addOperation({
                self.imageView4.image = image
            })
        }
        blockOperation4.completionBlock = {
            print("Image 4 download Completed, Cancelled \(blockOperation4.isCancelled)")
        }
        queue.addOperation(blockOperation4)
    }
}

