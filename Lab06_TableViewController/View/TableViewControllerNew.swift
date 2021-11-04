//
//  TableViewControllerNew.swift
//  Lab06_TableViewController
//
//  Created by MAC06 on 2/11/21.
//

import UIKit

/*
class TableViewCellNuevo: UITableViewCell {
    @IBOutlet weak var etiqueta: UILabel!
    @IBOutlet weak var imagenNumeros: UIImageView!
}
 */

class TableViewControllerNew: UITableViewController {
    
    var arregloNumeros: [String] = ["1", "2", "3", "4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = true
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        setEditing(true, animated: true)
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #cantidad de datos
        return arregloNumeros.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = arregloNumeros[indexPath.row]
        switch cell.textLabel?.text {
        case "1":
            cell.imageView?.image = UIImage(named: "iconos/1.jpg")
            cell.detailTextLabel?.text = "Celda num 1"
        case "2":
            cell.imageView?.image = UIImage(named: "iconos/2.jpg")
            cell.detailTextLabel?.text = "Celda num 2"
        case "3":
            cell.imageView?.image = UIImage(named: "iconos/3.jpg")
            cell.detailTextLabel?.text = "Celda num 3"
        case "4":
            cell.imageView?.image = UIImage(named: "iconos/4.jpg")
            cell.detailTextLabel?.text = "Celda num 4"
        default:
            print("No hay mas elementos para llenar imagen")
            cell.detailTextLabel?.text = "Celda fuera de rango"
        }
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    //Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        /*
       if editingStyle == .delete {
            // Delete the row from the data source
            arregloNumeros.remove(at: indexPath.row)
            tableView.reloadData()
            //tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }*/
    }

    //Users/mac06/Downloads/iconos
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let objetoMovido = self.arregloNumeros[fromIndexPath.row]
        arregloNumeros.insert(objetoMovido, at: to.row)
        NSLog("%@", "\(fromIndexPath.row) => \(to.row) \(arregloNumeros)")
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if (self.isEditing){
            self.editButtonItem.title = "Editar"
        }
        else {
            self.editButtonItem.title = "Hecho"
        }
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt
                   indexPath:IndexPath) -> UISwipeActionsConfiguration? {
        let contextItem = UIContextualAction(style: .normal, title: "Insertar"){
            (contextualAction, view, boolValue) in
            let ultimoElemento = self.arregloNumeros[self.arregloNumeros.count-1]
            self.arregloNumeros.append(String(Int(ultimoElemento)! + 1))
            tableView.reloadData()
        }
        let contextItemDelete = UIContextualAction(style: .destructive, title: "Eliminar"){
            (contextualAction, view, boolValue) in
            self.arregloNumeros.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
        let swipeActions = UISwipeActionsConfiguration(actions: [contextItem, contextItemDelete])
        
        return swipeActions
    }
    /*Codigo antiguo
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let btnEliminar = UITableViewRowAction(style: .normal, title: "Eliminar")
            { (accionesFila, indiceFila) in
                self.arregloNumeros.remove(at: indexPath.row)
            tableView.reloadData()
        }
        btnEliminar.backgroundColor = UIColor.red
        let btnInsertar = UITableViewRowAction(style: .normal, title: "Insertar")
            { (accionesFila, indiceFila) in
                let ultimoElemento = self.arregloNumeros[self.arregloNumeros.count-1]
                self.arregloNumeros.append(String(Int(ultimoElemento)! + 1))
                tableView.reloadData()
    }
    */
    
    /*
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextItem = UIContextMenuAction(style: .normal, title: "Insertar"){
            (contextualAction, view, boolValue) in
        }
        
    }*/
    
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
}
