//
//  InterfaceController.swift
//  ejemplo 1 WatchKit Extension
//
//  Created by Armando Carrillo on 18/12/19.
//  Copyright © 2019 Armando Carrillo. All rights reserved.
// apple watch 44mm (6.1.1)
//para usar digital crown para navegar entre notas, marcar la casilla Vertical Detail Paging en los atributos de la tabla

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet var table: WKInterfaceTable!
    var notes = [String]()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context) //arga la pantalla graafica
        // Configure interface objects here.
        /*(cambio por notes.count
        table.setNumberOfRows(10, withRowType: "Row")//en el objeto "table" llama la funcion definida en WatchKit "setNumber..."(acepta un parametro entero y llama al identificador Row) )*/
        
        table.setNumberOfRows(notes.count, withRowType: "Row")

        //for rowIndex in 0 ..< 10 { //ciclo for con celdas definidas
        for rowIndex in 0 ..< notes.count { //cilo for con contador de notes
            set(row: rowIndex, to: notes[rowIndex])//selecciona celdas para rowindex set(row: 0, to: notes[0], then set(row: 1, to: notes[1]
        }
        /*guard let row = table.rowController(at: rowIndex) as? //muestra lo que hay en row,
        NoteSelectRow else { continue } //si no enuetra nada continua
            row.textLabel.setText("Hello, row \(rowIndex)")// , escribe "hello,row" con el metodo setText y la cantidad de ejecuciones del ciclo for
            */ //valor cambiado por func set
            
        }
    
        func set(row rowIndex: Int, to text: String) {
            guard let row = table.rowController(at: rowIndex) as?
            NoteSelectRow else {return} //return sale del metodo
             row.textLabel.setText(text) //toma var text
        }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {//contextForSegue devuelve cualquierr dato con un segue
    return ["index": String(rowIndex + 1), "note": notes[rowIndex]]//index es el numero que viene de la tabla y note es la nota tomada
        
    }
    
    @IBAction func addNewNote() {
        // 1: request user input
        presentTextInputController(withSuggestions: nil,allowedInputMode: .plain) {//metodo para trascribir voz a texto-emoji-aniemoji
        [unowned self] result in
        // 2: convert the returned item to a string if possible,otherwise bail out
        guard let result = result?.first as? String else { return } //convierte en string
        // 3: insert a new row at the end of our table
        self.table.insertRows(at: IndexSet(integer: self.notes.count), withRowType: "Row")//lo guarda al final de la celda
        // 4: give our new row the correct text
        print(result)
        self.set(row: self.notes.count, to: result)//coloca texto
        // 5: append the new note to our array
        self.notes.append(result)//la guarda en un arreglo
            
        }
    }
    
}

