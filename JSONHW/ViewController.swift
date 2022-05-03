//
//  ViewController.swift
//  JSONHW
//
//  Created by Redghy on 5/2/22.
//

    import UIKit

    class ViewController: UIViewController {

        lazy var manualDecodeButton: UIButton = {
            let button = UIButton(frame: .zero)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Manually Decode", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .systemOrange
            button.addTarget(self, action: #selector(self.manualDecodeButtonPressed), for: .touchUpInside)
            return button
        }()
        
        lazy var navToWebView: UIButton = {
            let button = UIButton(frame: .zero)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Navigate To WebView", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .systemBlue
            return button
        }()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.view.addSubview(self.manualDecodeButton)
            self.manualDecodeButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.manualDecodeButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            
            self.view.addSubview(self.navToWebView)
            self.navToWebView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            self.navToWebView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            self.navToWebView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            self.navToWebView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        }
        
        @objc
        func manualDecodeButtonPressed() {
            guard let pokemon = NetworkManager.shared.getPokemonManually() else { return }
            presentAlert(pokemon: pokemon)
        }

        func presentAlert(pokemon: Pokemon) {
            //var title  = pokemon.gameIndeces.map({ $0.generation.name })
            var title = pokemon.dragons.map({ $0.pokemonD.name })
            var countTitle = title.count
            var names = ""
            for i in 0...countTitle-1{
                names = names + title[i] + "\n"
                print(names)
            }
            

    let alert = UIAlertController(title: "Displaying 'Dragon'", message: "\n\(names)", preferredStyle: .alert)
            let action = UIAlertAction(title: "Kool", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        
    }



