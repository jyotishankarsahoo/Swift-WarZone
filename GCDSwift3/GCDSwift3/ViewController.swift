//
//  ViewController.swift
//  GCDSwift3
//
//  Created by jyotishankar sahoo on 10/02/17.
//  Copyright © 2017 jyotishankar sahoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var inActiveQueue : DispatchQueue!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.simpleQueue()
        //self.queueWithQos()
        //self.concurrentQueue()
        //if let anotherQueue = inActiveQueue{
        //    anotherQueue.activate()
        //}
        //self.delayedQueue()
        //self.globalQueue()
        //self.fetchImage()
        self.useWorkItem()
    }
    
    //MARK: Simple Dispatch Queue
    func simpleQueue()  {
        let queue = DispatchQueue(label: "com.app.queue");
        queue.async {
            for i in 0..<10{
                print("🔴 \(i)")
            }
        }
        for i in 100..<110{
            print("Ⓜ️ \(i)")
        }
    }
    
    //MARK: Quality Of Service In Action
    func queueWithQos(){
        let queue1 = DispatchQueue(label: "com.app.queue1",qos : .userInitiated)
        let queue2 = DispatchQueue(label: "com.app.queue2",qos : .background)
        
        queue1.async {
            for i in 0..<10{
                print("🔴 \(i)")
            }
        }
        
        queue2.async {
            for i in 100..<110{
                print("🔵\(i)")
            }
        }
        
        for i in 1000..<1010{
            print("Ⓜ️\(i)")
        }
    }
    
    //MARK: Cocurrent Queue and Inactive Queue
    func concurrentQueue(){
        let anotherQueue = DispatchQueue(label: "com.app.concurrent", qos : .utility, attributes : [.concurrent, .initiallyInactive])
        inActiveQueue = anotherQueue
        anotherQueue.async {
            for i in 0..<10{
                print("🔴 \(i)")
            }
        }
        anotherQueue.async {
            for i in 100..<110{
                print("🔵\(i)")
            }
        }
        anotherQueue.async {
           for i in 1000..<1010{
                print("⚫️\(i)")
            }
        }
    }
    
    //MARK: Dispatch With Delay
    func delayedQueue(){
        let delayedQueue = DispatchQueue(label: "com.app.delayed", qos : .userInteractive)
        print(Date())
        let delayedTime : DispatchTimeInterval =  .seconds(3)
        delayedQueue.asyncAfter(deadline: .now() + delayedTime) {
            print(Date())
        }
    }
    
    //MARK: Global Queue and Main Queue
    func globalQueue(){
        //Global Queue
        let globalQueue = DispatchQueue.global(qos : .background)
        globalQueue.async {
            for i in 1..<10{
                print("🔴 \(i)")
            }
        }
        //Main Queue
        DispatchQueue.main.async {
            for i in 100..<110{
                print("Ⓜ️ \(i)")
            }
        }
    }
    
    //MARK: Getting data From Background and Updating the UI on Main Thread
    func fetchImage(){
        let imageURL : URL = URL(string: "http://www.appcoda.com/wp-content/uploads/2015/12/blog-logo-dark-400.png")!
        let session = URLSession(configuration: .default)
        session.dataTask(with: imageURL) { (data, resposne, error) in
            if let responseData = data{
                print("Image data downloaded")
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: responseData)
                }
            }
            if let serverError = error{
                print("Error : \(serverError.localizedDescription)")
            }
        }.resume()
    }
    
    //MARK: Use of Work Item
    func useWorkItem(){
        var value = 10
        
        let workItem = DispatchWorkItem { 
            value += 5
        }
        //Dispatch to the main Queue
        workItem.perform()
        
        let globalQueue = DispatchQueue.global(qos : .utility)
        globalQueue.async(execute: workItem)
        
        workItem.notify(queue: DispatchQueue.main) { 
            print("value = \(value)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

