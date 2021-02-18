//
//  PosterViewController.swift
//  NAVTAB
//
//  Created by Suram venkata siva raja mahendra reddyeddy on 19/11/1942 Saka.
//  Copyright © 1942 Suram venkata siva raja mahendra reddy. All rights reserved.
//

import UIKit
import AVKit

class PosterViewController: UIViewController {
        var movieDetails:Mahi?
    var actors:UILabel!
        var director = UILabel()
        var industry = UILabel()
        var story = UILabel()
        var views = UIScrollView()
        var audio:AVPlayerViewController!
        var trailor:AVPlayerViewController!
        var audioArr = [AVPlayerViewController]()
        var song:UILabel!
        var btn = UIButton()
        var a = 0
        
        var view1:ViewController!
        override func viewDidLoad() {
            super.viewDidLoad()
              avplayer()
            print(movieDetails!.actors!)
              pos2()
            
            // Do any additional setup after loading the view.
        }
        func avplayer()  {
            
            views.frame = CGRect(x: 0, y: 0, width: 900, height: 1000)
            views.backgroundColor = .systemPink
            views.contentSize = CGSize(width: view.frame.size.width, height: 2000 )
            view.addSubview(views)
            actors = UILabel()
            actors.frame = CGRect(x: 20, y: 250, width: view.frame.width-50, height:200 )
             actors.numberOfLines = 0
            views.addSubview(actors)
            
            director.frame = CGRect(x: 20, y: 300, width: view.frame.width-50, height:200 )
              director.numberOfLines = 0
            views.addSubview(director)
            
            industry.frame = CGRect(x: 20, y: 350, width: view.frame.width-50, height: 200)
            industry.numberOfLines = 0
            views.addSubview(industry)
            
            story.frame = CGRect(x: 20, y: 470, width: view.frame.width-50, height:300 )
            story.numberOfLines = 0
            views.addSubview(story)
        }

         func pos2(){
                 
                 actors.text = "\(movieDetails!.actors!)"
                 story.text = "\(movieDetails!.story!)"
                 industry.text = "\(movieDetails!.industry!)"
                 trailor = AVPlayerViewController()
                 trailor.player = AVPlayer(url: URL(string: "https://services.brninfotech.com/tws/\(movieDetails!.trailers![0])".replacingOccurrences(of: " ", with: "%20"))!)
                 trailor.view.frame = CGRect(x: 30, y: 120, width: 300, height: 200)
                 trailor.player?.play()
                 views.addSubview(trailor.view)
                 
                 
                 for i in 0..<movieDetails!.songs!.count{
                     audio = AVPlayerViewController()
                     audio.view.frame = CGRect(x: 200, y: 750+self.a, width: 210, height: 50)
                     audio.player = AVPlayer(url: URL(string: "https://services.brninfotech.com/tws/\(movieDetails!.songs![0])".replacingOccurrences(of: " ", with: "%20"))!)
                     views.addSubview(audio.view)
                     audioArr.append(audio)
                     song = UILabel()
                     song.frame = CGRect(x: 10, y: 750+self.a, width: 150, height: 50)
                     song.textColor = .black
                     song.text = "\(movieDetails!.songs![i].split(separator: "/")[3])"
                     views.addSubview(song)
                     
                     self.a+=100
                     
                 }

                 
         }
    }

