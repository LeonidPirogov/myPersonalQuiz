//
//  ResultViewController.swift
//  myPersonalQuiz
//
//  Created by Leonid on 22.06.2025.
//

import UIKit

final class ResultViewController: UIViewController {

    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var answers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

// MARK: - Private Methods
extension ResultViewController {
    private func updateResult() {
        var frequencyOfAnimals: [Animal: Int] = [:]
        let animals = answers.map {$0.animal}
        
        for animal in animals {
            frequencyOfAnimals[animal, default: 0] += 1
        }
        
        let sortedFrequentAnimals = frequencyOfAnimals.sorted{ $0.value > $1.value }
        guard let mostFrequentAnimal = sortedFrequentAnimals.first?.key else { return }
        
        updateUI(with: mostFrequentAnimal)
    }
    
    private func updateUI(with animal: Animal) {
        animalLabel.text = "Вы - \(animal.rawValue)"
        definitionLabel.text = animal.definition
    }
}
