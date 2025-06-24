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
    // тут будет массив с выбранными ответами пользователя
    // мне нужно посмотреть какое животное встречается чаще остальных и выдать в соответствии с этим животным результат - определить наиболее встречающийся тип животного
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        calculateMostCommonAnswer()
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func calculateMostCommonAnswer() {
        let animalCounts = Dictionary(grouping: answers, by: { $0.animal })
            .mapValues { $0.count }
        
        if let mostCommonAnswer = animalCounts.max(by: { $0.value < $1.value }) {
            animalLabel.text = "Вы - \(mostCommonAnswer.key.rawValue)"
            definitionLabel.text = mostCommonAnswer.key.definition
        }
    }
}
