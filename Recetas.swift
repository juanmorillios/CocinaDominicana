//
//  Recetas.swift
//  iRecetas
//
//  Created by Juan Morillo on 21/8/16.
//  Copyright © 2016 JuanMorillios. All rights reserved.
//

import UIKit

class Recetas: NSObject {
   
    //Creamos la propiedades del objeto
    var nombre: String!
    var image : UIImage!
    var tiempoCocion : Int!
    var ingredientes : [String]!
    var pasos : [String]!
    var isFavorite: Bool = false

    
    
    //Creamos el constructor de la clase
    init(nombre: String, image: UIImage, tiempoCocion: Int, ingredientes: [String], pasos: [String]) {
        self.nombre = nombre
        self.image = image
        self.tiempoCocion = tiempoCocion
        self.ingredientes = ingredientes
        self.pasos = pasos
        
    }
    
}


