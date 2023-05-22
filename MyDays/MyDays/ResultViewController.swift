//
//  ResultViewController.swift
//  12
//
//  Created by Дмитрий  on 18.05.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var resultLable: UILabel!
    @IBOutlet weak var namesLable: UILabel!
    var firstName: String!
    var secondName: String!
    private var resultVaule = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultVaule = findResult()
        namesLable.text = "\(firstName ?? "") and \(secondName ?? "")"
        resultLable.text = resultVaule.formatted(.percent)
        progressView.progress = Float(resultVaule) / 100
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 4)
    }
    @IBAction func backButtenTaped() {
        performSegue(withIdentifier: "unwindSeque", sender: nil)
    }
    private func findValue(for name: String) -> Int {
        var count = 0
        for character in name.lowercased () {
            
            switch character {
            case "a", "i", "j", "q", "y":
                count += 1
            case "b", "k", "r":
                count += 2
            case "c", "g", "l", "s":
                count += 3
            case "d", "m", "t":
                count += 4
            case "e", "h", "n", "x":
                count += 5
            case "u", "v", "w":
                count += 6
            case "o", "z":
                count += 7
            case "f", "p":
                count += 8
            default:
                count += 0
                
            }
        }
        return count
    }
    private func findResult() -> Int{
        var result = 0
        
        let firstValue = findValue(for: firstName)
        let secondValue = findValue(for: secondName)
        let adsDifference = abs(firstValue - secondValue)
        switch adsDifference {
        case 0, 1, 2:
            result = 100
        case 3, 4:
            result = 65
        case 5:
            result = 50
        case 6:
            result = 40
        default:
            result = 30
        }
        return result
    }
}
