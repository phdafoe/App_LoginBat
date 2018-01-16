//
//  ICONuevaTareaTableViewController.swift
//  App_LoginBat
//
//  Created by User on 28/1/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import UIKit

class ICONuevaTareaTableViewController: UITableViewController {
    
    
    let fechaHumana = Date()
    

    //MARK: - IBOutlet
    @IBOutlet weak var myImagenPerfil: UIImageView!
    @IBOutlet weak var myUsernamePerfil: UILabel!
    @IBOutlet weak var myFechaHumanoPerfil: UILabel!
    @IBOutlet weak var myImagenPost: UIImageView!
    @IBOutlet weak var myDescripcionFotoTip: UITextView!
    @IBOutlet weak var ocultarImagenBTN: UIButton!

    
    
    
    //MARK: - IBActions
    @IBAction func ocultarVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        myDescripcionFotoTip.delegate = self
        
        
        //Bloque toolBar
        let barraFlexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let colorWB = UIColor.white
        let colorB = CONSTANTES.COLOR_BORRAR_AZUL
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
        toolBar.barStyle = UIBarStyle.blackOpaque
        toolBar.tintColor = colorWB
        toolBar.barTintColor = colorB
        
        let camera = UIBarButtonItem(image: UIImage(named:"camara"), style: .done, target: self, action: #selector(self.pickerFoto))
        let salvarDatos = UIBarButtonItem(title: "Salvar", style: .plain, target: self, action: #selector(self.salvarDatos))
        
        toolBar.items = [camera, barraFlexible, salvarDatos]
        myDescripcionFotoTip.inputAccessoryView = toolBar
        
        myImagenPerfil.image = UIImage(named: "brad-pitt.jpg")
        myUsernamePerfil.text = "@andres_1234"
        let customDateFormater = DateFormatter()
        customDateFormater.dateStyle = .medium
        myFechaHumanoPerfil.text = "fecha" + " " + customDateFormater.string(from: fechaHumana)
        
        let gestureRecog = UITapGestureRecognizer(target: self, action: #selector(self.bajarTeclado))
        tableView.addGestureRecognizer(gestureRecog)
        
    }

   
    func salvarDatos(){
        if myDescripcionFotoTip.text != "" && myImagenPost.image != nil{
            let imageData = UIImageJPEGRepresentation(myImagenPost.image!, 0.1)
            taskManager.tareas.append([CONSTANTES.KEY_TITULO : myDescripcionFotoTip.text  as String])
            taskManager.fotoTarea.append([CONSTANTES.KEY_IMAGEN_TAREA : imageData! as Data])
            
            //taskManager.descripcionTask.append([CONSTANTES.KEY_DESCRIPCION : myDescripcionFotoTip.text as AnyObject])
            //taskManager.prioridadTask.append([CONSTANTES.KEY_PRIORIDAD_TAREA : myDescripcionFotoTip.text as AnyObject])
            dismiss(animated: true, completion: nil)
        }else{
            present(muestraVC(myTitleData: "Atención",
                              myMessageData: "Selecciona rellena todos los campos",
                              myTitleAction: "OK"),
                    animated: true,
                    completion: nil)
        }
        
        
       
    }
    
    func bajarTeclado(){
        myDescripcionFotoTip.resignFirstResponder()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myDescripcionFotoTip.becomeFirstResponder()
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1{
            return UITableViewAutomaticDimension
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }

    
    

}


//MARK: - EXTENSION
extension ICONuevaTareaTableViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
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
            myImagenPost.image = imageData
        }
        dismiss(animated: true, completion: nil)
    }
    
    
}




//MARK: - DELEGATE UITEXTVIEW
extension ICONuevaTareaTableViewController : UITextViewDelegate{
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
            self.navigationController?.setToolbarHidden(true, animated: true)
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "¿Qué está pasando?"
            textView.textColor = UIColor.lightGray
            self.navigationController?.setToolbarHidden(false, animated: true)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let maxtext: Int = 2000
        let comoVoy = myDescripcionFotoTip.text.count + (text.count - range.length)
        //myContadorNegativoLBL.text = String(2000 - comoVoy)
        return comoVoy < maxtext
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let currentOffset = tableView.contentOffset
        UIView.setAnimationsEnabled(false)
        tableView.beginUpdates()
        tableView.endUpdates()
        UIView.setAnimationsEnabled(true)
        tableView.setContentOffset(currentOffset, animated: false)
        
    }
    
}

