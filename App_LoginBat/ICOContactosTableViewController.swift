//
//  ICOContactosTableViewController.swift
//  App_TaskVersion2.0
//
//  Created by formador on 27/6/16.
//  Copyright © 2016 Cice. All rights reserved.
//  info@andresocampo.com / info@icologic.co / aocampo@icologic.co

import UIKit

class ICOContactosTableViewController: UITableViewController {
    
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var arrayContactos : arrayDiccionario = []
    var dictionarioContactos : diccionario = [:]
    
    
    //MARK: - LIFE VC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Aqui Colocamos el boton en la barra de navegacion
        let customButtonNVC = UIButton(type: .custom)
        customButtonNVC.setImage(UIImage(named: "brad-pitt.jpg"), for: .normal)
        customButtonNVC.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        customButtonNVC.layer.cornerRadius = customButtonNVC.frame.width / 2
        customButtonNVC.imageView!.contentMode = .scaleAspectFill
        customButtonNVC.clipsToBounds = true
        customButtonNVC.addTarget(self, action: #selector(muestraMiPerfilGenerico), for: .touchUpInside)
        let barButtonNC = UIBarButtonItem(customView: customButtonNVC)
        navigationItem.rightBarButtonItem = barButtonNC
        
        
        let path = Bundle.main.path(forResource: "Contactos", ofType: "plist")
        arrayContactos = NSArray(contentsOfFile: path!)! as! arrayDiccionario
        self.title = "Mis Contactos"
    }
    
   
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayContactos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ICOContactosCustomCell

        // Configure the cell...
        dictionarioContactos = arrayContactos[indexPath.row]
        
        let firstName = dictionarioContactos["firstName"]
        let lastName = dictionarioContactos["lastName"]
        let imageProfile = dictionarioContactos["imageProfile"]
        
        let imageCustom = UIImage(named: imageProfile! as! String)
        
        cell.myNombreLBL.text = firstName as! String?
        cell.myApellidoLBL.text = lastName as! String?
        cell.myImagenContactoIV.image = imageCustom
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detalleContactosVC = self.storyboard?.instantiateViewController(withIdentifier: "detalleContactosVC") as! ICODetalleContactoViewController
        dictionarioContactos = arrayContactos[indexPath.row]
        detalleContactosVC.diccionarioData = dictionarioContactos
        self.navigationController?.pushViewController(detalleContactosVC, animated: true)
    }
    
    func muestraVCPerfilPropio(){
        let detallePerfilVC = storyboard?.instantiateViewController(withIdentifier: "PerfilViewController") as! ICOPerfilViewController
        present(detallePerfilVC, animated: true, completion: nil)
    }
    
    func muestraMiPerfilGenerico(){
        APIMetodosGenericos.sharedInstance.estaEsUnaFuncion(storyboard: storyboard!, modal: self)
    }

    

       
    
    


}
