//
//  ViewController.swift
//  DownloadTaskNSURLSession
//
//  Created by jyotishankar sahoo on 26/07/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController , NSURLSessionDownloadDelegate , NSURLSessionTaskDelegate , UIDocumentInteractionControllerDelegate{

    @IBOutlet weak var progressBar: UIProgressView!
    
    var downloadTask : NSURLSessionDownloadTask!
    var backgroundSession : NSURLSession!
    
    //MARK: - Outlet Actions
    
    @IBAction func startDownload(sender: AnyObject) {
        downloadTask = backgroundSession.downloadTaskWithURL(NSURL(string: "http://publications.gbdirect.co.uk/c_book/thecbook.pdf")!)
        downloadTask.resume()
    }
    
    @IBAction func stopDownload(sender: AnyObject) {
        if downloadTask != nil {
            downloadTask.cancel()
        }
    }
    
    @IBAction func pauseDownload(sender: AnyObject) {
        if downloadTask != nil {
            downloadTask.suspend()
        }
    }
    
    @IBAction func resumeDownload(sender: AnyObject) {
        if downloadTask != nil {
            downloadTask.resume()
        }
    }
    
    //MARK: - Controller LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupBackgroundSession()
        self.progressBar.setProgress(0.0, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - NSURLSessionDownloadDelegate 
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL){
        var path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let documentDirectory = path[0]
        let destinationPath = NSURL(fileURLWithPath: documentDirectory.stringByAppendingString("/file.pdf"))
        let fileManager = NSFileManager.defaultManager()
        if fileManager.fileExistsAtPath(destinationPath.path!){
            self.showDownloadedFile(destinationPath.path!)
        }else{
            do {
                try fileManager.moveItemAtURL(location, toURL: destinationPath)
                self.showDownloadedFile(destinationPath.path!)
            }catch{
                print("Got error while moving the file ")
            }
        }
    }
    
    // Track the progress
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64){
        self.progressBar.setProgress(Float(totalBytesWritten)/Float(totalBytesExpectedToWrite), animated: true)
    }
    
    //MARK: - NSURLSessionTaskDelegate
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?){
        downloadTask = nil
       self.progressBar.setProgress(0.0, animated: true)
        if error != nil{
            print(error?.description)
        }else{
            print("Data Downloaded successfully")
        }
    }
    
    //MARK: - UIDocumentInteractionControllerDelegate

    func documentInteractionControllerViewControllerForPreview(controller: UIDocumentInteractionController) -> UIViewController{
        return self
    }
    
    //MARK: - Utility Action
    
    func setupBackgroundSession()  {
        backgroundSession = NSURLSession(configuration: NSURLSessionConfiguration.backgroundSessionConfigurationWithIdentifier("backGroundSession"), delegate: self, delegateQueue: NSOperationQueue.mainQueue())
    }
    
    func showDownloadedFile(path : String)  {
        let isFileFound = NSFileManager.defaultManager().fileExistsAtPath(path)
        if isFileFound {
            let documentViewer = UIDocumentInteractionController(URL: NSURL(fileURLWithPath: path))
            documentViewer.delegate = self
            documentViewer.presentPreviewAnimated(true)
        }
    }
    
    
}

