//
//  CICLoginViewController.swift
//  App_LoginBat
//
//  Created by User on 17/1/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import UIKit

class CICLoginViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var iconoBatman: UIImageView!
    @IBOutlet weak var tituloBatman: UIImageView!
    @IBOutlet weak var myUsuarioLBL: UILabel!
    @IBOutlet weak var myNombreUsuarioTF: UITextField!
    @IBOutlet weak var myContrasenaLBL: UILabel!
    @IBOutlet weak var myContrasenaTF: UITextField!
    @IBOutlet weak var myEntrarBTN: UIButton!
    
    //MARK: - IBActions
    @IBAction func saltaHomeTabConrtoller(_ sender: Any) {
        if myNombreUsuarioTF.text != "" && myContrasenaTF.text != ""{
            CONSTANTES.USER_DEFAULT.set(myNombreUsuarioTF.text, forKey: CONSTANTES.KEY_USERNAME)
            CONSTANTES.USER_DEFAULT.set(myContrasenaTF.text, forKey: CONSTANTES.KEY_CONTRASEGNA)
            self.limpiarCampos()
            self.iniciaAnimacionBoton()
        }else{
            present(muestraVC(myTitleData: "Oops!", myMessageData: "Batamigo No has completado los datos correctamente", myTitleAction: "Vaya"), animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myEntrarBTN.layer.cornerRadius = 3
        
        objetosSinOpacidad()
        objetosDesplazados()
    }
    
    func objetosSinOpacidad(){
        iconoBatman.layer.opacity = 0
        tituloBatman.layer.opacity = 0
        myUsuarioLBL.layer.opacity = 0
        myNombreUsuarioTF.layer.opacity = 0
        myContrasenaLBL.layer.opacity = 0
        myContrasenaTF.layer.opacity = 0
        myEntrarBTN.layer.opacity = 0
    }
    
    func objetosDesplazados(){
        iconoBatman.transform = CGAffineTransform(translationX: 0, y: 620)
        tituloBatman.transform = CGAffineTransform(translationX: 0, y: 620)
        myUsuarioLBL.transform = CGAffineTransform(translationX: 0, y: 620)
        myNombreUsuarioTF.transform = CGAffineTransform(translationX: 0, y: 620)
        myContrasenaLBL.transform = CGAffineTransform(translationX: 0, y: 620)
        myContrasenaTF.transform = CGAffineTransform(translationX: 0, y: 620)
        myEntrarBTN.transform = CGAffineTransform(translationX: 0, y: 620)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        iniciaAnimacion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func iniciaAnimacion(){
        muestraAnimacion(0.6, myView: iconoBatman)
        muestraAnimacion(0.7, myView: tituloBatman)
        muestraAnimacion(0.8, myView: myUsuarioLBL)
        muestraAnimacion(0.9, myView: myNombreUsuarioTF)
        muestraAnimacion(1.0, myView: myContrasenaLBL)
        muestraAnimacion(1.1, myView: myContrasenaTF)
        muestraAnimacion(1.2, myView: myEntrarBTN)
    }
    
    func limpiarCampos(){
        myNombreUsuarioTF.text = ""
        myContrasenaTF.text = ""
    }
    
    
    func iniciaAnimacionBoton(){
        let customBounds = myEntrarBTN.bounds
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 10,
                       options: .curveEaseOut,
                       animations: {
                        self.myEntrarBTN.bounds = CGRect(x: customBounds.origin.x - 20,
                                                         y: customBounds.origin.y,
                                                         width: customBounds.width + 20,
                                                         height: customBounds.height)
        }, completion: { Void in
            let tabVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeTabBarControllerViewController") as! CICHomeTabBarControllerViewController
            tabVC.modalTransitionStyle = .crossDissolve
            self.present(tabVC, animated: true, completion: nil)
        })
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    
    
    
   
    
    
    

}
