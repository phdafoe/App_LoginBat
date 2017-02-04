//
//  AppDelegate.swift
//  App_LoginBat
//
//  Created by User on 16/1/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var puedoRotar = false
    var orientacionDisponible : UIInterfaceOrientationMask = .portrait

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //Aqui cargamos el metodo cargarDatos() que vienen de Disco
        APITaskManager.sharedInstance.cargarDatos()
        //taskManager.cargarDatos()
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        //Aqui salvamos los datos
        APITaskManager.sharedInstance.salvarDatos()
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        //Aqui salvamos los datos
        APITaskManager.sharedInstance.salvarDatos()
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        //Aqui cargamos el metodo cargarDatos() que vienen de Disco
        APITaskManager.sharedInstance.cargarDatos()
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        //Aqui cargamos el metodo cargarDatos() que vienen de Disco
        APITaskManager.sharedInstance.cargarDatos()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        //Aqui salvamos los datos
        APITaskManager.sharedInstance.salvarDatos()
    }
    
    //MARK: - Orientacion del dispositivo
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        if puedoRotar == true{
            return .all
        }else{
            return orientacionDisponible
        }
    }
    
        


}

