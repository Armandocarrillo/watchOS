//
//  DetailInterfaceController.swift
//  ejemplo 1 WatchKit Extension
//
//  Created by Armando Carrillo on 22/12/19.
//  Copyright © 2019 Armando Carrillo. All rights reserved.
//

import WatchKit
import Foundation


class DetailInterfaceController: WKInterfaceController {

    @IBOutlet var textLabel: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
     if let contextDictionary = context as? [String: String]
     { textLabel.setText(contextDictionary["note"] ?? "")
        let index = contextDictionary["index"] ?? "1"
        setTitle("Note \(index)")//setTitle muesta el titulo en la parte superior de la pantalla, ddebajo del reloj
    }
    
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
