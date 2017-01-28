//
//  ICODetalleCollectionViewController.swift
//  AppRecordar1.0
//
//  Created by User on 6/1/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import UIKit


class ICODetalleCollectionViewController: UICollectionViewController {
    
    //MARK: - Variables locales globales
    var listaIconos = arrayDiccionarioJSONStandard()
    var icono = [String]()
    var headerTitleString : String?
    var selectedTask : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listaIconos.append([CONSTANTES.KEY_ICONO_IMAGEN: "img_icono_compra" as AnyObject , CONSTANTES.KEY_TITULO : "Compra" as AnyObject])
        listaIconos.append([CONSTANTES.KEY_ICONO_IMAGEN: "img_icono_economia" as AnyObject , CONSTANTES.KEY_TITULO : "Economia" as AnyObject])
        listaIconos.append([CONSTANTES.KEY_ICONO_IMAGEN: "img_icono_amigos" as AnyObject , CONSTANTES.KEY_TITULO : "Amigos" as AnyObject])
        listaIconos.append([CONSTANTES.KEY_ICONO_IMAGEN: "img_icono_amor" as AnyObject , CONSTANTES.KEY_TITULO : "Amor" as AnyObject])
        listaIconos.append([CONSTANTES.KEY_ICONO_IMAGEN: "img_icono_archivos" as AnyObject , CONSTANTES.KEY_TITULO : "Archivos" as AnyObject])
        listaIconos.append([CONSTANTES.KEY_ICONO_IMAGEN: "img_icono_deportes" as AnyObject , CONSTANTES.KEY_TITULO : "Deportes" as AnyObject])
        listaIconos.append([CONSTANTES.KEY_ICONO_IMAGEN: "img_icono_fechas" as AnyObject , CONSTANTES.KEY_TITULO : "Calendario" as AnyObject])
        listaIconos.append([CONSTANTES.KEY_ICONO_IMAGEN: "img_icono_ideas" as AnyObject , CONSTANTES.KEY_TITULO : "Ideas" as AnyObject])
        listaIconos.append([CONSTANTES.KEY_ICONO_IMAGEN: "img_icono_lugares" as AnyObject , CONSTANTES.KEY_TITULO : "Lugares" as AnyObject])
        listaIconos.append([CONSTANTES.KEY_ICONO_IMAGEN: "img_icono_musica" as AnyObject , CONSTANTES.KEY_TITULO : "Musica" as AnyObject])
        listaIconos.append([CONSTANTES.KEY_ICONO_IMAGEN: "img_icono_vacaciones" as AnyObject , CONSTANTES.KEY_TITULO : "Vacaciones" as AnyObject])
        listaIconos.append([CONSTANTES.KEY_ICONO_IMAGEN: "img_icono_webs" as AnyObject , CONSTANTES.KEY_TITULO : "Webs" as AnyObject])
        
        // Do any additional setup after loading the view.
    }

   

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return listaIconos.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColectionCell", for: indexPath) as! ICOIconCollectionViewCell
    
        let icon = listaIconos[indexPath.row]
        if let iconDes = icon[CONSTANTES.KEY_ICONO_IMAGEN]{
            cell.myImagenIcono.image = UIImage(named: iconDes as! String)
        }
        if let textDes = icon[CONSTANTES.KEY_TITULO]{
            cell.myTextoIcono.text = (textDes as! String)
        }
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionView", for: indexPath) as! ICOHeaderCollectionReusableView
        headerView.myTextoDetalle.text = headerTitleString
        return headerView
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let icono = listaIconos[indexPath.row]
        
        if let selectedTaskDes = selectedTask{
            taskManager.tasks[selectedTaskDes][CONSTANTES.KEY_ICONO_IMAGEN] = icono[CONSTANTES.KEY_ICONO_IMAGEN]
            let _ = navigationController?.popViewController(animated: true)
        }
    }
    
}


extension ICODetalleCollectionViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let maxWidthScreen = collectionView.frame.size.width / 3.5
        return CGSize(width: maxWidthScreen, height: maxWidthScreen)
    }
    
    
}
