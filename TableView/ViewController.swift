//
//  ViewController.swift
//  TableView
//
//  Created by Suram venkata siva raja mahendra reddyeddy on 21/11/1942 Saka.
//  Copyright © 1942 Suram venkata siva raja mahendra reddy. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
var convertedData = [Mahi]()
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate {
    
    var tolly:UITableView!
    var toly = [Mahi]()
    var urlReq:URLRequest!
    var dataTaskObj:URLSessionDataTask!
    var imgVew:UIImageView!
    var a = 0
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table()
        navigationController?.delegate = self
        tolly.delegate = self
        tolly.dataSource = self
    }
    var val = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        print(toly.count)
        return toly.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = "\(toly[indexPath.row].title!)"
        cell.detailTextLabel?.text = "\(toly[indexPath.row].actors!)"
        
        let poster = URLSession.shared.dataTask(with:URL(string: "https://services.brninfotech.com/tws/\(self.toly[indexPath.row].posters![0])".replacingOccurrences(of: " ", with: "%20"))!) { (data1, res, err)  in
            
            DispatchQueue.main.async {
                
                cell.imageView?.image = UIImage(data: data1!)
                
            }
        }
        poster.resume()
       
            DispatchQueue.main.async {
                
                cell.detailTextLabel?.text = "\(self.toly[indexPath.row].actors!)".replacingOccurrences(of: ",", with: "\n").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
            }
       
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let pos = rrrViewController()
        pos.movieDetails = toly[indexPath.row]
        navigationController?.pushViewController(pos, animated: true)
      
         
    }
    
    func table(){
        
        tolly = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        
        //  tolly.backgroundColor = .blue
        view.addSubview(tolly)
        
        
        
        urlReq = URLRequest(url: URL(string: "https://services.brninfotech.com/tws/MovieDetails2.php?mediaType=movies")!)
        
        urlReq.httpMethod = "POST"
        
        dataTaskObj = URLSession.shared.dataTask(with: urlReq!, completionHandler: { (data, response, err) in
            print("got data")
            
            
            do{
                
                let JSONDecoderObj = JSONDecoder()
                
                convertedData = try JSONDecoderObj.decode([Mahi].self, from: data!)
                
                DispatchQueue.main.async {
                   
                    for i in 0..<convertedData.count{
                        
                        if convertedData[i].industry == "Tollywood"{
                            self.toly.append(convertedData[i])
                            
                            print(self.toly.count)
                        }
                        
                    }
                     self.tolly.reloadData()
                }
                
            }
            catch{
                
                print("something went wrong")
            }
            
            
        })
        self.dataTaskObj.resume()
        
        
    }
    
    
    
}

