//
//  ICODetalleContactoViewController.swift
//  App_TaskVersion2.0
//
//  Created by formador on 27/6/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import UIKit

class ICODetalleContactoViewController: UIViewController {

    //MARK: - VARIABLES LOCALES GLOBALES
    var diccionarioData : jsonStandard = [:]
    
    
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
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCamaraFondoPerfil.isUserInteractionEnabled = true
        let gestRecog = UITapGestureRecognizer(target: self, action: #selector(self.muestraCamara))
        myCamaraFondoPerfil.addGestureRecognizer(gestRecog)
        
        
        
        myImagePerfilIV.layer.cornerRadius = myImagePerfilIV.frame.width / 8
        myImagePerfilIV.layer.borderColor = UIColor.white.cgColor
        myImagePerfilIV.layer.borderWidth = 1.5
        
        
        degradadoImageView.layer.cornerRadius = degradadoImageView.frame.width / 8
        degradadoImageView.clipsToBounds = true
        
        let imagePerfil = diccionarioData["imageProfile"]
        let imagePerfilCustom = UIImage(named: imagePerfil!)
        
        myFondoPerfil.image = UIImage(named: diccionarioData["imagePost"]!)
                
        myImagePerfilIV.image = imagePerfilCustom
        myNombreLBL.text = diccionarioData["firstName"]
        myApellidoLBL.text = diccionarioData["lastName"]
        myTwitterCountLBL.text = diccionarioData["usernameTwitter"]
        myCreadoEnLBL.text = diccionarioData["createdPost"]
        myExpeirenciaLBL.text = diccionarioData["experienciaCV"]
        myDescripcionLBL.text = diccionarioData["description"]
        myTelefonoMovilLBL.text = diccionarioData["telefonoMovil"]
        myTrabajoLBL.text = diccionarioData["telefonoTrabajo"]
        myEmailLBL.text = diccionarioData["email"]
        myLinkedinLBL.text = diccionarioData["cuentaLinkedin"]
        myNumeroSeguidores.text = diccionarioData["numeroSeguidores"]
        
        
        
        self.title = diccionarioData["firstName"]

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        /*if let storageImage = CONSTANTES.USER_DEFAULT.object(forKey: CONSTANTES.KEY_FONDO_PERFIL) as? Data{
            myFondoPerfil.image = UIImage(data: storageImage)
        }*/
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func muestraCamara(){
        pickerFoto()
    }

    
}

//MARK: - EXTENSION
extension ICODetalleContactoViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func pickerFoto(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            muestraMenu()
        }else{
            muestraLibreria()
        }
    }
    
    func muestraMenu(){
        let menuVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        menuVC.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        menuVC.addAction(UIAlertAction(title: "Camara de Fotos", style: .default, handler: { Void in
            self.muestraCamaraFotos()
        }))
        menuVC.addAction(UIAlertAction(title: "Libreria de Fotos", style: .default, handler: { Void in
            self.muestraLibreria()
        }))
        present(menuVC, animated: true, completion: nil)
    }
    
    
    func muestraLibreria(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func muestraCamaraFotos(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imageData = info[UIImagePickerControllerOriginalImage] as? UIImage{
            myFondoPerfil.image = imageData
            
            let imageDataUD = UIImageJPEGRepresentation(myFondoPerfil.image!, 0.1)
            CONSTANTES.USER_DEFAULT.setValue(imageDataUD, forKey: CONSTANTES.KEY_FONDO_PERFIL)
            
        }
        dismiss(animated: true, completion: nil)
    }
    
    
}


