//
//  CICIntroViewController.swift
//  App_LoginBat
//
//  Created by User on 17/1/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import UIKit

class CICIntroViewController: UIViewController {
    
    
    @IBOutlet weak var myImageLogoBatman: UIImageView!
    @IBOutlet weak var myEtiquetaInstrucciones: UILabel!
    
    //Creamos una Property animator
    var viewAnimator : UIViewPropertyAnimator!
    //let desbloqueGesto = UIPanGestureRecognizer()
    var desbloqueGesto = Timer()
    
    //Ocultamos el estatus bar
    override var prefersStatusBarHidden: Bool{
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //desbloqueGesto.addTarget(self, action: #selector(self.manejador(_:)))
        //view.addGestureRecognizer(desbloqueGesto)
        
        
        
        viewAnimator = UIViewPropertyAnimator(duration: 1.0,
                                              curve: .easeInOut,
                                              animations: nil)
        viewAnimator.addAnimations {
            //Aqui hacemos que nuestra eqtiqueta se quede completamente trasnparente
            self.myEtiquetaInstrucciones.layer.opacity = 0
            //Aqui reescalamos nuestra imagen de manera proporcional
            self.myImageLogoBatman.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            self.desbloqueGesto = Timer.scheduledTimer(timeInterval: 1.5,
                                                  target: self,
                                                  selector: #selector(self.manejadorAutomatico),
                                                  userInfo: nil,
                                                  repeats: false)
        }
        
        //Aqui podemos probar nuestra animacion
        viewAnimator.startAnimation()
    }
    
    func manejador(_ pan : UIPanGestureRecognizer){
        
        //podemos controlar que cantidad de pan podemos usar
        let  velocidad : CGFloat = 2.0
        
        switch pan.state {
        case .began:
            //Cuando comenzamos nuestro paneo que queremos hacer
            //la dejamos en pausa
            viewAnimator.pauseAnimation()
        case .changed:
            //creamos una variable para ver que cantidade movimiento esta teniendo
            //queremos comprobar en la vista en la que estamos haciendo el "Pan" en el eje vertical y lo queremos dividir por la velocidad que es la mitad, para que vaya un poco mas despacio de lo normal
            let translacion = pan.translation(in: pan.view).y / velocidad
            //aqui comprobamos la cantidad de animacion que lleva transcurrida que va entre 0 y 1 asi que lo tomamos y lo dividimos entre 100
            viewAnimator.fractionComplete = translacion / 100
            //Una vez que termina nuestro calculo y que ha llegado a 1 pues debemos comprobar y construir nuestra resto de animacion
            if viewAnimator.fractionComplete >= 0.99{
                //buildAnimation()
            }
        default:
            //que se salga y ya esta
            break
        }
    }
    
    func manejadorAutomatico(){
        //creamos otra animacion
        let logoAnimacion = UIViewPropertyAnimator(duration: 0.5,
                                                   curve: .easeIn) {
                                                    self.myImageLogoBatman.transform = CGAffineTransform(scaleX: 25,
                                                                                                         y: 25)
        }
        logoAnimacion.startAnimation()
        //Ahora debemos cargar la otra vista
        logoAnimacion.addCompletion { Void in
            self.beginApp()
        }
    }
    
    
    
    func beginApp(){
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! CICLoginViewController
        loginVC.modalTransitionStyle = .crossDissolve
        present(loginVC, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
