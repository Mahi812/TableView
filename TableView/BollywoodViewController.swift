//
//  BollywoodViewController.swift
//  TableView
//
//  Created by Suram venkata siva raja mahendra reddyeddy on 23/11/1942 Saka.
//  Copyright © 1942 Suram venkata siva raja mahendra reddy. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class BollywoodViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableViewObj:UITableView!
    var boly = [Mahi]()
    var urlReq:URLRequest!
    var dataTaskObj:URLSessionDataTask!
    var poster2 = [String]()
    var titles2 = [String]()
    var actors2 = [String]()
    var a = 0
    
    override func viewDidLoad() {
        
        uiView()
        super.viewDidLoad()
        
        
        print(convertedData.count)
        
        valj()
        
        // Do any additional setup after loading the view.
    }
    func valj(){
        for i in 0..<convertedData.count{
        if convertedData[i].industry == "Bollywood"{
            
            self.boly.append(convertedData[i])
            print("bollywood \(boly.count)")
             print("ouwdgdhn huhhjy")
            }
        }
        
        print("ouwdgdhn huy")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
        print("ghghjgghfghf")
        return boly.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "abc")
            
            
        cell.textLabel?.text = "\(boly[indexPath.row].title!)"
        cell.detailTextLabel?.text = "\(boly[indexPath.row].actors!)"
//
//               print(poster2.count)
               
               
        let poster = URLSession.shared.dataTask(with:URL(string: "https://services.brninfotech.com/tws/\(boly[indexPath.row].posters![0])".replacingOccurrences(of: " ", with: "%20"))!) { (data1, res, err)  in
                   
                   DispatchQueue.main.async {
                       
                       cell.imageView?.image = UIImage(data: data1!)
                       
                   }
               }
               poster.resume()
              
                   DispatchQueue.main.async {
                       
                    cell.detailTextLabel?.text = "\(self.boly[indexPath.row].title!)".replacingOccurrences(of: ",", with: "\n").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
                   }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pos1 = rrrViewController()
        pos1.movieDetails = boly[indexPath.row]
           navigationController?.pushViewController(pos1, animated: true)
           

        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func uiView(){
        
        tableViewObj = UITableView(frame: view.frame, style: UITableView.Style.plain)


        
        tableViewObj.delegate = self
        tableViewObj.dataSource = self
        
        tableViewObj.backgroundColor = .blue
        view.addSubview(tableViewObj)
        
        
    }
  
}
