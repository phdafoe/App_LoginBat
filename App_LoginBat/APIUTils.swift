//
//  APIUTils.swift
//  AppRecordar1.0
//
//  Created by User on 6/1/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import Foundation
import UIKit

//Variables Externas
let CONSTANTES = Constantes()
let taskManager = APITaskManager.sharedInstance
typealias arrayDiccionario = [diccionario]
typealias diccionario = [String : Any]
var cabeceraAnimacion : UIViewPropertyAnimator!



struct Constantes {
    
    let KEY_TAREAS = "tasks"
    let KEY_TITULO = "titulo"
    let KEY_ICONO_IMAGEN = "icono"
    
    let KEY_USERNAME = "username"
    let KEY_CONTRASEGNA = "contraseña"
    let KEY_FONDO_PERFIL = "fondo_perfil"
    
    let KEY_DESCRIPCION = "descripcion"
    let KEY_IMAGEN_TAREA = "imagen"
    
    
    let USER_DEFAULT = UserDefaults.standard
    let COLOR_BORRAR_AZUL = UIColor(red: 26/255, green: 71/255, blue: 102/255, alpha: 1.0)
    
}


func muestraVC(myTitleData : String, myMessageData : String, myTitleAction : String) -> UIAlertController{
    let alertVC = UIAlertController(title: myTitleData, message: myMessageData, preferredStyle: .alert)
    alertVC.addAction(UIAlertAction(title: myTitleAction, style: .default, handler: nil))
    return alertVC
}


func muestraAnimacion(_ myFloat : Float, myView : UIView ){
    cabeceraAnimacion = UIViewPropertyAnimator(duration: TimeInterval(myFloat),
                                               curve: .easeInOut,
                                               animations: {
                                                myView.layer.opacity = 1
                                                myView.transform = CGAffineTransform.identity
    })
    cabeceraAnimacion.startAnimation()
}


class APIMetodosGenericos {
    static let sharedInstance = APIMetodosGenericos()
    func estaEsUnaFuncion(storyboard : UIStoryboard, modal : UIViewController){
        let detallePerfilVC = storyboard.instantiateViewController(withIdentifier: "PerfilViewController") as! ICOPerfilViewController
        modal.present(detallePerfilVC, animated: true, completion: nil)
    }
}














