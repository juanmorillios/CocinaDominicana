//
//  DetailViewController.swift
//  CocinaDominicana
//
//  Created by Juan Morillo on 23/8/16.
//  Copyright © 2016 JuanMorillios. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var recetaDetailImageView: UIImageView!
    @IBOutlet weak var tableViewDetailRecetas: UITableView!
        var receta : Recetas!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Asignamos nombre de la receta
        self.title = receta.nombre
        
        //Asignamos la imagen de la portada recetas detalle
       self.recetaDetailImageView.image = self.receta.image

        //Asignamos el color para personalizar nuestras celdas de la tabla detalle recetas.
       self.tableViewDetailRecetas.backgroundColor = UIColor(colorLiteralRed: 0.9, green: 0.9, blue: 0.9, alpha: 0.25)
        //Nos permite borrar las celdas después de la última no tenga tamaño, no aparezcan
        self.tableViewDetailRecetas.tableFooterView = UIView(frame: CGRect.zero)
        
        self.tableViewDetailRecetas.separatorColor = UIColor(colorLiteralRed: 0.9, green: 0.9, blue: 0.9, alpha: 0.75)

        
        //Ajustar la fila para el tamaño standar de la celda
        self.tableViewDetailRecetas.estimatedRowHeight = 44.0
        self.tableViewDetailRecetas.rowHeight = UITableViewAutomaticDimension

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setToolbarHidden(false, animated: true)
    }
    
    
    //Ocultar StatusBar
   override var prefersStatusBarHidden:  Bool {
        
        return true
        
    }
    
    @IBAction func close(segue: UIStoryboardSegue) {
        
        
        
    }
    
    
    
    
}


extension DetailViewController : UITableViewDataSource, UITableViewDelegate {


    func numberOfSections(in tableView: UITableView) -> Int {
        return 3    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        switch section {
        case 0:
            return 3
        case 1:
            return self.receta.ingredientes.count
        case 2:
            return self.receta.pasos.count
        default:
            return 0
        }
        
           }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRecetasCell", for: indexPath) as! RecetasDetailViewCell
        
        //Anulamos cualquier color que quede de la celda.
        cell.backgroundColor = UIColor.clear
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.keyValueLabel.text = "Nombre:"
                cell.ValueLabel.text = self.receta.nombre
            case 1:
                cell.keyValueLabel.text = "Tiempo:"
                cell.ValueLabel.text = "\(self.receta.tiempoCocion!)"
            case 2:
                cell.keyValueLabel.text = "Favorita:"
                if self.receta.isFavorite {
                cell.ValueLabel.text = "Si"
                }else {
                cell.ValueLabel.text = "No"
                
                }
                
            default:
                break
            }
            
        case 1:
            if indexPath.row == 0 {
             cell.keyValueLabel.text = "Ingredientes:"
            
            
            } else {
                cell.keyValueLabel.text = ""
        }
            cell.ValueLabel.text = self.receta.ingredientes[indexPath.row]
        case 2:
            if indexPath.row == 0 {
            
                cell.keyValueLabel.text = "Pasos:"
            
            } else {
              cell.keyValueLabel.text = ""
         }
            cell.ValueLabel.text = self.receta.pasos[indexPath.row]
     
        default:
            break
            
        } 
        return  cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //Proceso para mostrar el contenido de los objetos array
        var title = ""
        switch section {
        case 1:
            title = "Ingredientes"
        case 2:
            title = "Pasos"
               default:
            break
        }
        return title
    }

}








