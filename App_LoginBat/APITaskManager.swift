//
//  APITaskManager.swift
//  AppRecordar1.0
//
//  Created by User on 6/1/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import Foundation


class APITaskManager{
    //contiene un objeto del tipo APITaskManager - con static se consigue que se ejecute una unica vez
    static let sharedInstance = APITaskManager()
    
    //Creamos un Array de diccionarios
    var tasks : arrayDiccionario = [[:]]
    var fotoTarea : arrayDiccionario = [[:]]
    
    func salvarDatos(){
        //UserDefaults.standard.set(tasks, forKey: "tasks")
        CONSTANTES.USER_DEFAULT.set(tasks, forKey: CONSTANTES.KEY_TAREAS)
        CONSTANTES.USER_DEFAULT.set(fotoTarea, forKey: CONSTANTES.KEY_IMAGEN_TAREA)
        //cargarDatos()
    }
    
    
    func cargarDatos(){
        if let myArray = CONSTANTES.USER_DEFAULT.array(forKey: CONSTANTES.KEY_TAREAS) as? arrayDiccionario{
            //Cargamos nuestro array de diccionario una vez lo solicitamos a UserDefault
            tasks = myArray
        }
        
        if let myArrayImagenes = CONSTANTES.USER_DEFAULT.array(forKey: CONSTANTES.KEY_IMAGEN_TAREA) as? arrayDiccionario{
            fotoTarea = myArrayImagenes
        }
        
    }
}
