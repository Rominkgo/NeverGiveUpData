
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let name = getNameFromUserDefaults() ?? "You"
        
        let introSpeech = ("Welcome back, \(name)")
        
        introText.text = introSpeech
    }
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var introText: UILabel!
    @IBOutlet weak var ageText: UILabel!
    
    
    

    @IBOutlet weak var saveContinueButton: UIButton!
    @IBAction func saveContinue(_ sender: Any) {
        guard let text = nameField.text, !text.isEmpty else {
            print("Error!")
            return
        }
        saveNameInUserDefaults(text: text)
        print("Success!")
    }
    
    let userDefaultsNameKey = "realName"
    
    
    
    
    private func saveNameInUserDefaults(text: String) {
        UserDefaults.standard.set(text, forKey: userDefaultsNameKey)
    }
    
    private func getNameFromUserDefaults() -> String? {
        let name = UserDefaults.standard.string(forKey: userDefaultsNameKey)
        return name
    }
}

