//
//  ICOWebViewController.swift
//  App_LoginBat
//
//  Created by User on 2/2/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import UIKit

class ICOWebViewController: UIViewController {
    
    //MARK: - Variables locales
    var urlString : String?
    let batDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    //MARK: - IBOutlet
    @IBOutlet weak var myWebView: UIWebView!
    
    //MARK: - IBActions
    @IBAction func irAdelante(_ sender: Any) {
        myWebView.goForward()
    }
    
    
    @IBAction func irAtras(_ sender: Any) {
        myWebView.goBack()
    }
    
    @IBAction func recargarWeb(_ sender: Any) {
        myWebView.reload()
    }
    
    @IBAction func cerrarVC(_ sender: Any) {
        batDelegate.puedoRotar = false
        batDelegate.setDisponibilidadOrientaciones(orientationMask: .portrait, defaultOrientation: .portrait)
        
        dismiss(animated: true, completion: nil)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        batDelegate.puedoRotar = true
        

        let urlFinal = URL(string: urlString!)
        let request = URLRequest(url: urlFinal!)
        myWebView.loadRequest(request)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //DEBERIA AUTORITARSE
    override var shouldAutorotate: Bool{
        return true
    }
    //SOPORTA DISTINTAS ORIENTACIONES
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .all
    }
    

    

}
