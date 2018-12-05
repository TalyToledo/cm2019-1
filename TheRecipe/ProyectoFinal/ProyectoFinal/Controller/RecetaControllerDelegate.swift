//
//  RecetaControllerDelegate.swift
//  ProyectoFinal
//
//  Created by Usuario invitado on 12/3/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import Foundation
import UIKit

protocol RecetaControllerDelegate {
    func didSelectReceta(controller: UITableViewController, unaReceta: [Receta])
}
