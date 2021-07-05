//
//  MenuTableViewController.swift
//  BaoCu
//
//  Created by Nguyễn Minh on 02/07/2021.
//

import UIKit

class MenuTableViewController: UITableViewController {
   
    var pickDone : ((_ url: String, _ name: String)->Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
     initUI()
       

    }
    func initUI(){
        let logo = UIImage(named: "bao_cu")
        self.navigationItem.titleView = UIImageView(image: logo)
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9294117647, green: 0.504725523, blue: 0.03921568627, alpha: 1)
        tableView.separatorColor = #colorLiteral(red: 0.9294117647, green: 0.504725523, blue: 0.03921568627, alpha: 1)
        modalPresentationStyle = .fullScreen
        tableView.showsVerticalScrollIndicator = false
    }
   

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return ChannelName.allCases.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = ChannelName.element(at: indexPath.row)?.rawValue
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let channel = ChannelURL.element(at: indexPath.row), let pickDone = pickDone, let name = ChannelName.element(at: indexPath.row)?.rawValue{
            pickDone(channel.rawValue, name)
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    

}

