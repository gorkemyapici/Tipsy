import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctBbutton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var numberOfPeople = 2
    var percent = 0.0
    var percent2 = 0
    var result = "0.0"
    var tip = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSelected()
    }
    
    @IBAction func tipeChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        if "0%" == sender.currentTitle! {
            updateSelected()
            zeroPctButton.isSelected = true
            percent = 0.0
            percent2 = 0
        }
        else if "10%" == sender.currentTitle! {
            updateSelected()
            tenPctButton.isSelected = true
            percent = 0.1
            percent2 = 10
        }
        else if "20%" == sender.currentTitle! {
            updateSelected()
            twentyPctBbutton.isSelected = true
            percent = 0.2
            percent2 = 20
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        billTextField.endEditing(true)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
        
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if billTextField.text != "" {
            let bill = Double(billTextField.text!)!
            tip = bill * percent
            result = String(format: "%.2f", ((bill + tip) / Double(numberOfPeople)))
            print(result)
            
            self.performSegue(withIdentifier: "goToResult", sender: self)
            
            billTextField.text = ""
            updateSelected()
        }
        
        else {
            billTextField.text = "Type number."
        }
    }
    
    func updateSelected() {
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctBbutton.isSelected = false
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = result
            destinationVC.percent2 = percent2
            destinationVC.numberOfPeople = numberOfPeople
        }
        
    }
    
}

