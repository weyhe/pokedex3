//
//  PokemonDetailVCViewController.swift
//  pokedex3
//
//  Created by Martin Weyhe Christiansen on 09/01/2017.
//  Copyright © 2017 Martin Weyhe Christiansen. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoLbl: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name.capitalized
    
        let img = UIImage(named: "\(pokemon.pokedexId)")
        
        
        mainImg.image = img
        
        
        currentEvoImg.image = img
        
        
        pokedexLbl.text = "\(pokemon.pokedexId)"
        
        pokemon.downloadPokemonDetail {
                        
            self.updateUI()
            
        }
    }
    
    func updateUI() {

        baseAttackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        
        if pokemon.nextEvolutionId == "" {
            
            evoLbl.text = "No Evolution"
            nextEvoLbl.isHidden = true
            
        } else {
            
            nextEvoLbl.isHidden = false
            evoLbl.text = "Next Evolution: \(pokemon.nextEvolutionName) LVL \(pokemon.nextEvolutionId)"
            nextEvoLbl.image = UIImage(named: pokemon.nextEvolutionId)
            
            
        }
        
        
        
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
