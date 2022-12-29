//
//  ViewController.swift
//  Yeasir_30021
//
//  Created by bjit on 27/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var downloadsTitle: UILabel!
    @IBOutlet weak var tasksView: UIView!
    @IBOutlet weak var mainDownloadPrgress: UIProgressView!
    @IBOutlet weak var downloadsView: UIView!
    var timer = Timer()
    @IBOutlet weak var taskProgressOne: UIProgressView!
    @IBOutlet weak var taskProgressTwo: UIProgressView!
    @IBOutlet weak var taskProgressThree: UIProgressView!
    @IBOutlet weak var taskProgressFour: UIProgressView!
    var v2: Float = 0.0
    let customSerialQ = DispatchQueue(label: "com.custom.serial")
    
    let globalQ = DispatchQueue.global()
    
    let mainQ = DispatchQueue.main
    
    var progressValue: Float  = 0.00
    var taskOneProgressValue: Float = 0.00
    var taskTwoProgressValue: Float = 0.00
    var taskThreeProgressValue: Float = 0.00
    var taskFourProgressValue: Float = 0.00
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
       startProgress()
        
    }
    
     
    
    
    func startProgress(){
        let globalQueue = DispatchQueue.global()
        DispatchQueue.global().async {
            globalQueue.async {
                for _ in 1...100{
                    DispatchQueue.main.async {[weak self] in
                        self?.setProgressOne(progessRate: (1.0/100.0))
                        self?.setOverallProgress(progessRate: 1.0/400)
                    }
                    Thread.sleep(forTimeInterval: 0.02)
                }
            }
            
            globalQueue.async {
                for _ in 1...100{
                    DispatchQueue.main.async {[weak self] in
                        self?.setProgressTwo(progessRate: (1.0/100.0))
                        self?.setOverallProgress(progessRate: 1.0/400)
                        
                    }
                    Thread.sleep(forTimeInterval: 0.02)
                }
            }
            globalQueue.async {
                for _ in 1...100{
                    DispatchQueue.main.async {[weak self] in
                        self?.setProgressThree(progessRate: (1.0/100.0))
                        self?.setOverallProgress(progessRate: 1.0/400)
                        
                    }
                    Thread.sleep(forTimeInterval: 0.02)
                }
            }
            globalQueue.async {
                for _ in 1...100{
                    DispatchQueue.main.async {[weak self] in
                        self?.setProgressFour(progessRate: (1.0/100.0))
                        self?.setOverallProgress(progessRate: 1.0/400)
                        
                    }
                    Thread.sleep(forTimeInterval: 0.02)
                }
            }
        }
    }
    
    func setProgressOne(progessRate: Double){
        taskOneProgressValue = taskOneProgressValue + Float(progessRate)
        taskProgressOne.setProgress(Float(taskOneProgressValue), animated: true)
        print(taskOneProgressValue)
        if taskOneProgressValue >= 0.99{
            taskProgressOne.progressTintColor = UIColor.green
        }
    }
    
    func setProgressTwo(progessRate: Double){
        taskTwoProgressValue = taskTwoProgressValue + Float(progessRate)
        taskProgressTwo.setProgress(Float(taskTwoProgressValue), animated: true)
        if taskTwoProgressValue >= 0.99{
            taskProgressTwo.progressTintColor = UIColor.green
        }
    }
    
    func setProgressThree(progessRate: Double){
        taskThreeProgressValue = taskThreeProgressValue + Float(progessRate)
        taskProgressThree.setProgress(Float(taskThreeProgressValue), animated: true)
        if taskThreeProgressValue >= 0.99{
            taskProgressThree.progressTintColor = UIColor.green
        }
    }
    func setProgressFour(progessRate: Double){
        taskFourProgressValue = taskFourProgressValue + Float(progessRate)
        taskProgressFour.setProgress(Float(taskFourProgressValue), animated: true)
        if taskFourProgressValue >= 0.99{
            taskProgressFour.progressTintColor = UIColor.green
        }
    }
    
    func setOverallProgress(progessRate: Double){
        progressValue = progressValue + Float(progessRate)
        mainDownloadPrgress.setProgress(Float(progressValue), animated: true)
    }
    
    
    

    
    
    
    
  
    
    
    @IBAction func downloadButtonPressed(_ sender: Any) {
        showAlert()
    }
    
    
    

    
    

    
    fileprivate func configUI() {
        topView.layer.cornerRadius = 20
        topView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        tasksView.layer.cornerRadius = 8
        
        downloadsView.layer.cornerRadius = 8
        
        mainDownloadPrgress.transform = mainDownloadPrgress.transform.scaledBy(x: 1, y: 8)
        
        taskProgressOne.transform = taskProgressOne.transform.scaledBy(x: 1, y: 10)
        taskProgressTwo.transform = taskProgressTwo.transform.scaledBy(x: 1, y: 10)
        taskProgressThree.transform = taskProgressThree.transform.scaledBy(x: 1, y: 10)
        taskProgressFour.transform = taskProgressFour.transform.scaledBy(x: 1, y: 10)
    }
    
    
    func showAlert(){
            let alertVC = UIAlertController(title: "Available Actions", message: "Select Actions", preferredStyle: .actionSheet)
            let globalQueueConcurrentSync = UIAlertAction(title: "globalQueueConcurrentSync", style: .destructive){ [weak self]_ in
//                self?.progressRunning()
            }
            let globalQueueConcurrentAsync = UIAlertAction(title: "globalQueueConcurrentAsync", style: .destructive){ [weak self]_ in
//                self?.globalQueueConcurrentAsync()
            }
            let customPrivateQueueSerialSync = UIAlertAction(title: "customPrivateQueueSerialSync", style: .destructive){ [weak self]_ in
//                self?.customPrivateQueueSerialSync()
            }
            let customPrivateQueueSerialAsync = UIAlertAction(title: "customPrivateQueueSerialAsync", style: .destructive){ [weak self]_ in
//                self?.customPrivateQueueSerialAsync()
            }
            let customPrivateQueueConcurrentAsync = UIAlertAction(title: "customPrivateQueueConcurrentAsync", style: .destructive){ [weak self]_ in
//                self?.customPrivateQueueConcurrentAsync()
            }
            let goBackAction = UIAlertAction(title: "Go Back", style: .destructive){_ in
                alertVC.dismiss(animated: true)
            }
            alertVC.addAction(globalQueueConcurrentSync)
            alertVC.addAction(globalQueueConcurrentAsync)
            alertVC.addAction(customPrivateQueueSerialSync)
            alertVC.addAction(customPrivateQueueSerialAsync)
            alertVC.addAction(customPrivateQueueConcurrentAsync)
            alertVC.addAction(goBackAction)
            present(alertVC, animated: true)
        }

}

/**
 if taskOneProgressValue < 1.0 {
     taskOneProgressValue += 0.01
     taskProgressOne.progress = taskOneProgressValue
 }
 if taskTwoProgressValue < 1.0 {
     taskTwoProgressValue += 0.01
     taskProgressTwo.progress = taskTwoProgressValue
 }
 if taskThreeProgressValue < 1.0 {
     taskThreeProgressValue += 0.01
     taskProgressThree.progress = taskThreeProgressValue
 }
 if taskFourProgressValue < 1.0 {
     taskFourProgressValue += 0.01
     taskProgressFour.progress = taskFourProgressValue
 }
 */

