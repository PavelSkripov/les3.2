//
//  NewViewController.swift
//  les3.2(1)
//
//  Created by Павел on 24.11.2020.
//

import UIKit

class NewViewController: UIViewController {
    
    var rectangleTopAchor: NSLayoutConstraint?
    var isActive : Bool = true
    var rectView = UIView()
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
    private var lastTranslation: CGFloat = 0

    private lazy var panGestureRecognizer: UIPanGestureRecognizer = UIPanGestureRecognizer (
        target: self,
        action: #selector(tappableSlide(_:))
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label1()
        rect()
        rectView.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc func tappableSlide (_ sender: UIPanGestureRecognizer){
        switch sender.state {
        case .began:
            print("began")
            
        case .changed:
            label.text = "\(abs(lastTranslation + sender.translation(in: rectView).y))"
            
        case .ended:
            lastTranslation = sender.translation(in: rectView).y
        
        default:break
        }
        
    }
    
    func label1() {
     
      //  label.center = CGPoint(x: 190, y: 120)
        label.textColor = #colorLiteral(red: 0.9466800094, green: 0.3168402612, blue: 0.2236361504, alpha: 1)
        label.text = "1"
        label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        self.view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
            //let centerHorizontally = NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        
        let centerHorizontally = label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        let topAnchor = label.topAnchor.constraint(equalTo: view.topAnchor, constant: 60)
        
        NSLayoutConstraint.activate([topAnchor, centerHorizontally])
        
    }
    
    func rect() {
        
        

        rectView.backgroundColor = .orange
        view.addSubview(rectView)
        rectView.translatesAutoresizingMaskIntoConstraints = false
  
        rectangleTopAchor = rectView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130)
                rectangleTopAchor?.isActive = true
                
                rectView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
                
        rectView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
                
        rectView.heightAnchor.constraint(equalToConstant: 150).isActive = true
            }

    
        
       
    }
    
    




