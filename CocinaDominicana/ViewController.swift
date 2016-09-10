//
//  ViewController.swift
//  iRecetas
//
//  Created by Juan Morillo on 21/8/16.
//  Copyright © 2016 JuanMorillios. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    //Array donde almacenaremos todas las recetas
    var recetas : [Recetas] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Personalizamos el boton de atrás de la App,
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
              
        navigationController?.hidesBarsOnSwipe = true
        
       
      
        //Lista de recetas  a mostrar
        var receta = Recetas(nombre: "Sancocho Dominicano",
                             image: #imageLiteral(resourceName: "Sancocho"),
                             tiempoCocion: 12,
                             ingredientes: ["1 libra carne de chivo","1 libra longaniza","1 libra carne de cerdo", "2 libras carne de res con hueso", "1 pollo entero de 2 libras", "2 libras de costilas"],
                             pasos: ["Paso1: Hervir las patatas y Huevos","Paso2: Mezclarlo todo","Paso3: Poner mayonesa + huevos + atún"])
        recetas.append(receta)
    
        receta = Recetas(nombre: "Pasteles en Hoja", image: #imageLiteral(resourceName: "pasteles"),
                                            tiempoCocion: 45,
                                            ingredientes: ["Patata","Huevos","Margarina"],
                                            pasos: ["Paso1: Hervir las patatas y Huevos","Paso2: Mezclarlo todo","Paso3: Poner mayonesa + huevos + atún"])
        recetas.append(receta)
        
         receta = Recetas(nombre: "Habichuelas con dulce", image: #imageLiteral(resourceName: "Habichuelas "),
                                                        tiempoCocion: 50,
                                                        ingredientes: ["Patata","Huevos","Margarina", "Sal"],
                                                        pasos: ["Paso1: Hervir las patatas y Huevos","Paso2: Mezclarlo todo","Paso3: Poner mayonesa + huevos + atún"])
        recetas.append(receta)
        
         receta = Recetas(nombre: "Pastelón de Carne", image: #imageLiteral(resourceName: "Pastelon"),
                                                            tiempoCocion: 28,
                                                            ingredientes:["Patata","Huevos","Margarina"],
                                                            pasos: ["Paso1: Hervir las patatas y Huevos","Paso2: Mezclarlo todo","Paso3: Poner mayonesa + huevos + atún"])
        recetas.append(receta)
        
        receta = Recetas(nombre: "Arepa dominicana", image: #imageLiteral(resourceName: "arepa"),
                         tiempoCocion: 60,
                         ingredientes:["Patata","Huevos","Margarina"],
                         pasos: ["Paso1: Hervir las patatas y Huevos","Paso2: Mezclarlo todo","Paso3: Poner mayonesa + huevos + atún"])
        recetas.append(receta)

        
        receta = Recetas(nombre: "Dulce de coco con piña", image: #imageLiteral(resourceName: "dulcecoco"),
                         tiempoCocion: 56,
                         ingredientes:["Patata","Huevos","Margarina"],
                         pasos: ["Paso1: Hervir las patatas y Huevos","Paso2: Mezclarlo todo","Paso3: Poner mayonesa + huevos + atún"])
        recetas.append(receta)

        receta = Recetas(nombre: "Moro de guandules verdes", image: #imageLiteral(resourceName: "moro"),
                         tiempoCocion: 65,
                         ingredientes:["Patata","Huevos","Margarina"],
                         pasos: ["Paso1: Hervir las patatas y Huevos","Paso2: Mezclarlo todo","Paso3: Poner mayonesa + huevos + atún"])
        recetas.append(receta)

        receta = Recetas(nombre: "Pan de maiz dominicano", image: #imageLiteral(resourceName: "pandemaiz"),
                         tiempoCocion: 25,
                         ingredientes:["Patata","Huevos","Margarina"],
                         pasos: ["Paso1: Hervir las patatas y Huevos","Paso2: Mezclarlo todo","Paso3: Poner mayonesa + huevos + atún"])
        recetas.append(receta)
    }
    
    //Actualizar para animar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }

    
    // MARK: UITableViewDataSource
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    
        return recetas.count
    
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    
      let recetas = self.recetas[indexPath.row]
    
      let cellID = "cellRecetas"
        
      let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecetaCell
     // cell.textLabel?.text = recetas.nombre
     // cell.imageView?.image = recetas.image
       
       cell.smallimage.image = recetas.image
       cell.nameLabel.text = recetas.nombre
       cell.timeLabel.text = "\(recetas.tiempoCocion!) min."
       cell.ingredientesLabel.text = "Ingredientes: \(recetas.ingredientes.count)"
       
      //Aplicar cambios a la imagen para que sea Circular por código
      //cell.smallimage.layer.cornerRadius = 58.0
       //cell.smallimage.layer.borderWidth = 0.2
      //cell.smallimage.clipsToBounds = true
        
       //Asignamos la imagen que representa fvorito a la receta.
        if recetas.isFavorite {
            
            cell.accessoryType = .checkmark
        
        } else {
        
            cell.accessoryType = .none
        
        }
        
        return cell
    
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //Configuración Botón de comprartir
        
        let compartirAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            
            let compartirDefaultText = "Estoy mirando la receta de \(self.recetas[indexPath.row].nombre!) en la App Recetas Cocina Dominicana"
            
            let activityController = UIActivityViewController(activityItems: [compartirDefaultText, self.recetas[indexPath.row].image], applicationActivities: nil)
            
            self.present(activityController, animated: true, completion: nil)
            
            
        
        }
        

        //Cambiamos el color del fondo del botón Compartir
        compartirAction.backgroundColor = UIColor(red: 30.0/255.0, green: 164.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        
        // Boton Borrar
        
        
        let borrarAction = UITableViewRowAction(style: .default, title: "Borrar") { (action) in
            
            self.recetas.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        
        //Cambiamos el color del fondo del botón Borrar
        borrarAction.backgroundColor = UIColor(colorLiteralRed: 145.0/255.0, green: 114.0/255.0, blue: 120.0/255.0, alpha: 1.0)
        
        return [compartirAction, borrarAction]
        
    }

    
    
    
    //Implementación function para eliminar recetas
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
        
        
            self.recetas.remove(at: indexPath.row)
        
        }
        
        self.tableView.deleteRows(at: [indexPath], with: .fade)
    
    }

    //MARK: UITableViewDelegate
    
 override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let receta = self.recetas[indexPath.row]
        
        
        let alertViewController = UIAlertController(title: "\(receta.nombre!)", message: "Valora ésta receta", preferredStyle: .alert)
        
        
        var favoriteActionTitle = "Favorito"
        var favouriteActionStyle = UIAlertActionStyle.default
        
        
        if receta.isFavorite {
        
        favoriteActionTitle = "No es favorito"
        favouriteActionStyle = UIAlertActionStyle.destructive
       
        }
        
    
        let favoriteAction = UIAlertAction(title: favoriteActionTitle, style: favouriteActionStyle) {(action) in
            
        //Recuperamos el número de celda seleccionada
        let receta = self.recetas[indexPath.row]
        
        //Cambiamos el estado de la receta de normal a favorita
        receta.isFavorite = !receta.isFavorite
        
        //Actualizamos toda la tabla después de haber seleccionada como receta favorita
        self.tableView.reloadData()
        
        
    }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertViewController.addAction(cancelAction)
        
        alertViewController.addAction(favoriteAction)
        self.present(alertViewController, animated: true, completion: nil)
        
    }     
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
    
        if segue.identifier == "showrRcetaDetail" {
        
            if let IndexPath = self.tableView.indexPathForSelectedRow {
            
                let selectReceta = self.recetas[IndexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.receta = selectReceta
                
            }
        }
    }
    
    
    
    //Ocultar StatusBar
  override var prefersStatusBarHidden:  Bool {
        
        return true
        
    }


  





    
}
