//
//  BollyViewController.swift
//  TableView
//
//  Created by Suram venkata siva raja mahendra reddyeddy on 22/11/1942 Saka.
//  Copyright © 1942 Suram venkata siva raja mahendra reddy. All rights reserved.
//

import UIKit

class BollyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
      var bolly:UITableView!
         
         var convertedData = [Mahi]()
         
          var titles21 = [String]()
          var poster12 = [String]()
         
         var urlReq:URLRequest!
         var dataTaskObj:URLSessionDataTask!
         var imgVew:UIImageView!
      override func viewDidLoad() {
             
             table11()
             super.viewDidLoad()
             // Do any additional setup after loading the view.
                   
                   
      }
      var val = 0
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          
          
     for i in 0..<convertedData.count{
        
        
        if convertedData[i].industry == "Bollywood"{
      let mahi = "\(convertedData[i].title!)"
      
      titles21.append(mahi)
      
      print("\(titles21.count) rtuasdffdsdssdds")
      
      let tab = "\(convertedData[i].posters![0])"
      
      poster12.append(tab)
      
      print(poster12)
        }
        }
        print("\(titles21.count)asgasggahshjdgsgadsgdgsdgsjgdgds")
          return poster12.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
          let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: nil)
          cell.textLabel?.text = "\(titles21[indexPath.row])"
        cell.backgroundColor = .yellow
          print(poster12.count)
          let posters = URLSession.shared.dataTask(with:URL(string: "https://services.brninfotech.com/tws/\(poster12[indexPath.row])".replacingOccurrences(of: " ", with: "%20"))!) {(posters, res1, err1)  in
        
                                  
          DispatchQueue.main.async {
              
              cell.imageView?.image = UIImage(data: posters!)
              
              }
              }
              posters.resume()
          
          return cell
          
      }
          var a = 0
     
      func table11(){
          
        bolly = UITableView(frame:view.frame,style: .plain)
                 view.addSubview(bolly)
        bolly.backgroundColor = .red
                 bolly.delegate = self
                 bolly.dataSource = self
         
                                            
        DispatchQueue.main.async {
            self.bolly.reloadData()
        }
                                    
                
              
         
          
          
      }


}
