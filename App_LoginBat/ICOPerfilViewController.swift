//
//  ICOPerfilViewController.swift
//  App_LoginBat
//
//  Created by User on 28/1/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import UIKit

class ICOPerfilViewController: UIViewController {
    
    let urlData = "http://www.andresocampo.com"
    
    
    //MARK: - IBOUTLET
    @IBOutlet weak var degradadoImageView: UIImageView!
    @IBOutlet weak var myImagePerfilIV: UIImageView!
    @IBOutlet weak var myTwitterCountLBL: UILabel!
    @IBOutlet weak var myNombreLBL: UILabel!
    @IBOutlet weak var myApellidoLBL: UILabel!
    @IBOutlet weak var myCreadoEnLBL: UILabel!
    @IBOutlet weak var myExpeirenciaLBL: UILabel!
    @IBOutlet weak var myDescripcionLBL: UILabel!
    @IBOutlet weak var myTelefonoMovilLBL: UILabel!
    @IBOutlet weak var myTrabajoLBL: UILabel!
    @IBOutlet weak var myEmailLBL: UILabel!
    @IBOutlet weak var myLinkedinLBL: UILabel!
    @IBOutlet weak var myFondoPerfil: UIImageView!
    @IBOutlet weak var myNumeroSeguidores: UILabel!
    @IBOutlet weak var myCamaraFondoPerfil: UIImageView!

    @IBAction func ocultaVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func muestraWeb(_ sender: Any) {
        
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        myImagePerfilIV.layer.cornerRadius = myImagePerfilIV.frame.width / 8
        myImagePerfilIV.layer.borderColor = UIColor.white.cgColor
        myImagePerfilIV.layer.borderWidth = 1.5
        
        
        degradadoImageView.layer.cornerRadius = degradadoImageView.frame.width / 8
        degradadoImageView.clipsToBounds = true
        
        
        myFondoPerfil.image = UIImage(named: "brad-pitt.jpg")
        
        myImagePerfilIV.image = UIImage(named: "brad-pitt.jpg")
        myNombreLBL.text = "Andres"
        myApellidoLBL.text = "Ocampo"
        myTwitterCountLBL.text = "@andresOCampoElj"
        myCreadoEnLBL.text = "18 de Octubre de 2017"
        myExpeirenciaLBL.text = "Junior iOS Developer en CICE"
        myDescripcionLBL.text = ""
        myTelefonoMovilLBL.text = "65 39 40 573"
        myTrabajoLBL.text = "iOS developer / UX Designer / ASO Consulting en Miotek"
        myEmailLBL.text = "andres.ocampo@miotek.es"
        myLinkedinLBL.text = "andres@linkedin.com"
        myNumeroSeguidores.text = "1234M"
        
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "muestraWebVC"{
            let webVC = segue.destination as! ICOWebViewController
            webVC.urlString = urlData
        }
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
