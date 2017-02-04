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
    var listaIconos = arrayDiccionario()
    var icono = [String]()
    var headerTitleString : String?
    var selectedTask : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listaIconos.append([CONSTANTES.KEY_ICONO_IMAGEN: "img_icono_compra", CONSTANTES.KEY_TITULO : "Compra" ])
        listaIconos.append([CONSTANTES.KEY_ICONO_IMAGEN: "img_icono_economia", CONSTANTES.KEY_TITULO : "Economia"])
        listaIconos.append([CONSTANTES.KEY_ICONO_IMAGEN: "img_icono_amigos", CONSTANTES.KEY_TITULO : "Amigos"])
        listaIconos.append([CONSTANTES.KEY_ICONO_IMAGEN: "img_icono_amor", CONSTANTES.KEY_TITULO : "Amor"])
        listaIconos.append([CONSTANTES.KEY_ICONO_IMAGEN: "img_icono_archivos", CONSTANTES.KEY_TITULO : "Archivos"])
        listaIconos.append([CONSTANTES.KEY_ICONO_IMAGEN: "img_icono_deportes", CONSTANTES.KEY_TITULO : "Deportes"])
        listaIconos.append([CONSTANTES.KEY_ICONO_IMAGEN: "img_icono_fechas", CONSTANTES.KEY_TITULO : "Calendario"])
        listaIconos.append([CONSTANTES.KEY_ICONO_IMAGEN: "img_icono_ideas", CONSTANTES.KEY_TITULO : "Ideas"])
        listaIconos.append([CONSTANTES.KEY_ICONO_IMAGEN: "img_icono_lugares", CONSTANTES.KEY_TITULO : "Lugares"])
        listaIconos.append([CONSTANTES.KEY_ICONO_IMAGEN: "img_icono_musica", CONSTANTES.KEY_TITULO : "Musica"])
        listaIconos.append([CONSTANTES.KEY_ICONO_IMAGEN: "img_icono_vacaciones", CONSTANTES.KEY_TITULO : "Vacaciones"])
        listaIconos.append([CONSTANTES.KEY_ICONO_IMAGEN: "img_icono_webs", CONSTANTES.KEY_TITULO : "Webs"])
        
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
