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
    var tasks : arrayDiccionarioJSONStandard = [[:]]
    var descripcionTask : arrayDiccionarioJSONStandard = [[:]]
    var prioridadTask : arrayDiccionarioJSONStandard = [[:]]
    var fotoTarea : arrayDiccionarioJSONStandard = [[:]]
    
    func salvarDatos(){
        //UserDefaults.standard.set(tasks, forKey: "tasks")
        CONSTANTES.USER_DEFAULT.set(tasks, forKey: CONSTANTES.KEY_TAREAS)
        CONSTANTES.USER_DEFAULT.set(descripcionTask, forKey: CONSTANTES.KEY_DESCRIPCION)
        CONSTANTES.USER_DEFAULT.set(prioridadTask, forKey: CONSTANTES.KEY_PRIORIDAD_TAREA)
        CONSTANTES.USER_DEFAULT.set(fotoTarea, forKey: CONSTANTES.KEY_IMAGEN_TAREA)
        //cargarDatos()
    }
    
    
    func cargarDatos(){
        if let myArray = CONSTANTES.USER_DEFAULT.array(forKey: CONSTANTES.KEY_TAREAS) as? arrayDiccionarioJSONStandard{
            //Cargaamos nuestro array de diccionario una vez lo solicitamos a UserDefault
            tasks = myArray
        }
        
        if let myArrayDescripcion = CONSTANTES.USER_DEFAULT.array(forKey: CONSTANTES.KEY_DESCRIPCION) as? arrayDiccionarioJSONStandard{
            descripcionTask = myArrayDescripcion
        }
        
        if let myArrayPrioridad = CONSTANTES.USER_DEFAULT.array(forKey: CONSTANTES.KEY_PRIORIDAD_TAREA) as? arrayDiccionarioJSONStandard{
            prioridadTask = myArrayPrioridad
        }
        
        if let myArrayImagenes = CONSTANTES.USER_DEFAULT.array(forKey: CONSTANTES.KEY_IMAGEN_TAREA) as? arrayDiccionarioJSONStandard{
            fotoTarea = myArrayImagenes
        }
        
    }
}
