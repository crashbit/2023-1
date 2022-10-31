//
//  ViewController.swift
//  mpoo_pokemon_01
//
//  Created by Germán Santos Jaimes on 26/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }

    func getData(){
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon")
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            let json = JSONDecoder()
            let datos = try? json.decode(Result.self, from: data!)
            print(datos!.results.count)
            for nombre in datos!.results{
                print(nombre.name)
            }
        }
        task.resume()
    }
}

