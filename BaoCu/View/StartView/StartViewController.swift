//
//  StartViewController.swift
//  BaoCu
//
//  Created by Nguyễn Minh on 02/07/2021.
//

import UIKit

class StartViewController: UIViewController {
    var items : [Item]?
    var url: String = "https://vnexpress.net/rss/tin-moi-nhat.rss"
    func setUpData(){
        NewService.shared.parseNew(url: url) { (items) in
            self.items = items
            if self.items != nil{
                DispatchQueue.main.async {
                    let vc = MainViewController()
                    vc.items = self.items!
                    self.navigationController?.pushViewController(vc, animated: true)}
                
            }else{
                let alert = UIAlertController(title: "Loading error", message: "Can not load data, check your internet connection", preferredStyle: .alert)
                let action = UIAlertAction(title: "Try again", style: .cancel) { (action) in
                    alert.dismiss(animated: true, completion: nil)
                    self.setUpData()
                }
                alert.addAction(action)
                DispatchQueue.main.async {
                    self.present(alert, animated: true, completion: nil)
                }
                
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
        setupNoti()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    func setupNoti(){
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            
        }
        let contents = UNMutableNotificationContent()
        contents.title = "Đọc tin tức mới nhát"
        contents.body = "Đọc tin tức mới nhát ngay thôi"
        contents.badge = NSNumber(value: 12)
     
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current

        dateComponents.hour = 9
        dateComponents.minute = 30
           
    
        let trigger = UNCalendarNotificationTrigger(
                 dateMatching: dateComponents, repeats: true)
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString,
                    content: contents, trigger: trigger)
        
        center.add(request) { (error) in
           if error != nil {
             print(error)
           }
           else{
            print("ok")
           }
           
        }
    }

    
}
