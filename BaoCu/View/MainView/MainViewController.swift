//
//  MainViewController.swift
//  BaoCu
//
//  Created by Nguyễn Minh on 02/07/2021.
//

import UIKit
import SideMenu
import SDWebImage
class MainViewController: UIViewController {
    var menu : SideMenuNavigationController?
    var service = NewService()
    var items : [Item] = []
    @IBOutlet weak var tableView: UITableView!
    var url: String = "https://vnexpress.net/rss/tin-moi-nhat.rss"
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        setupSideMenu()
        initUI()
    }
    func setupSideMenu(){
        let vc = MenuTableViewController()
        vc.pickDone = { (url, name) in
            self.url = url
            self.service.parseNew(url: url, completionHandler: { (items) in
               
                self.items = items
               
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.title = name
                }
            })
        }
        menu = SideMenuNavigationController(rootViewController: vc)
        let img = UIImage(systemName: "list.dash")?.withRenderingMode(.alwaysTemplate)
        
        let menuBtn = UIBarButtonItem(image: img, style: .plain, target: self, action: #selector(didTapMenu))
        menuBtn.tintColor = .white
        self.navigationItem.leftBarButtonItem  = menuBtn
        menu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    func initUI(){
        self.title = "Trang chủ"
        tableView.reloadData()
        navigationController?.setNavigationBarHidden(false, animated: true)
        menu?.animationOptions = .curveEaseInOut
        menu?.presentationStyle = .viewSlideOutMenuIn
       
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
       
     
    }
   
    @objc func didTapMenu(sender : UIButton){
        present(menu!, animated: true, completion: nil)
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
//        print(items[indexPath.row].descriptionNews?.urlImg)
        
        cell.initUI(item: items[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stringURL = items[indexPath.row].link?.trimmingCharacters(in: .whitespaces).trimmingCharacters(in: .newlines)
        guard let url = URL(string: stringURL ?? "") else { return }
        print(url)
        UIApplication.shared.open(url)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(translationX: 0, y: cell.frame.height)
        UIView.animate(withDuration: 0.5, delay: 0.05*Double(indexPath.row), usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.1, options: .curveEaseInOut) {
            cell.transform = CGAffineTransform(translationX: 0, y: 0)
        }
    }
}
