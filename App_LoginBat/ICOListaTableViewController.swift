//
//  ICOListaTableViewController.swift
//  AppRecordar1.0
//
//  Created by User on 2/1/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import UIKit

class ICOListaTableViewController: UITableViewController {
    
    
    //MARK: - IBActions
    @IBAction func añadirNuevaTarea(_ sender: Any) {
        
        let nuevoPostVC = self.storyboard?.instantiateViewController(withIdentifier: "NuevaTareaTableViewController") as! ICONuevaTareaTableViewController
        let navController = UINavigationController(rootViewController: nuevoPostVC)
        self.present(navController, animated: true, completion: nil)
        
    }
    
    @IBAction func limpiaUserDefault(_ sender: Any) {
        
        print("Aqui")
        CONSTANTES.USER_DEFAULT.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ICOTareaCustomCell", bundle: nil), forCellReuseIdentifier: "TareaCustomCell")
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
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
        return taskManager.tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tareaCustomCell = tableView.dequeueReusableCell(withIdentifier: "TareaCustomCell", for: indexPath) as! ICOTareaCustomCell

        let tareas = taskManager.tasks[indexPath.row]
        let fotoTareas = taskManager.fotoTarea[indexPath.row]

        
        tareaCustomCell.myDescripcionLBL.text = tareas[CONSTANTES.KEY_TITULO] as! String?
        
        if let imagenDes = tareas[CONSTANTES.KEY_ICONO_IMAGEN]{
            tareaCustomCell.myIconoTarea.image = UIImage(named: imagenDes as! String)
        }else{
            tareaCustomCell.myIconoTarea.image = UIImage(named: "img_no_icon")
        }
        
        
        if let imagenTareaDes = fotoTareas[CONSTANTES.KEY_IMAGEN_TAREA] as? Data{
            let storage = imagenTareaDes
            tareaCustomCell.myImagenTarea.image = UIImage(data: storage)
        }
        
        return tareaCustomCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 405
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let borrar = UITableViewRowAction(style: .normal, title: "Borrar", handler: { (action, indexPath)  in
            taskManager.tasks.remove(at: indexPath.row)
            taskManager.fotoTarea.remove(at: indexPath.row)
            self.tableView.reloadData()
        })
        borrar.backgroundColor = CONSTANTES.COLOR_BORRAR_AZUL
        return [borrar]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let indexPathDes = self.tableView.indexPathForSelectedRow{
            let destinationVC = storyboard?.instantiateViewController(withIdentifier: "DetalleCollectionViewController") as! ICODetalleCollectionViewController
            let tareaSeleccionada = taskManager.tasks[indexPathDes.row]
            destinationVC.headerTitleString = tareaSeleccionada[CONSTANTES.KEY_TITULO] as! String?
            destinationVC.selectedTask = indexPathDes.row
            self.navigationController?.pushViewController(destinationVC, animated: true)
        }
    }
    


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetalle"{
            if let indexPathDes = self.tableView.indexPathForSelectedRow{
                let destinationVC = segue.destination as! ICODetalleCollectionViewController
                let tareaSeleccionada = taskManager.tasks[indexPathDes.row]
                destinationVC.headerTitleString = tareaSeleccionada[CONSTANTES.KEY_TITULO] as! String?
                destinationVC.selectedTask = indexPathDes.row
            }
        }
        
    }*/
    

}
