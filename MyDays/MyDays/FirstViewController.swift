//
//  ViewController.swift
//  12
//
//  Created by Дмитрий  on 16.05.2023.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var PartnerNameTF: UITextField!
    @IBOutlet weak var NameTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func resultBetton() {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? ResultViewController else { return }
        destinationVC.firstName = NameTF.text
        destinationVC.secondName = PartnerNameTF.text
    }
    

    @IBAction func resultButtenTaped() {
        
        performSegue(withIdentifier: "goToResult", sender: nil)
        
    }
}
extension FirstViewController {
    private func showAlert(title: String, messega: String){
        let alert = UIAlertController(title: title, message: messega, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
extension FirstViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == NameTF{
            PartnerNameTF.becomeFirstResponder()
        } else {
            resultBetton()
        }
        return true
    }
}
