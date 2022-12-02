
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        introScreenNameSetup()
        introScreenAgeSetup()
    }
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var introText: UILabel!
    @IBOutlet weak var ageText: UILabel!
    
    @IBOutlet weak var entryResponder: UILabel!
    @IBOutlet weak var saveContinueButton: UIButton!
    @IBAction func saveContinue(_ sender: Any) {
        guard let text = nameField.text, !text.isEmpty else {
            print("Error!")
            return
        }
        guard let textAge = ageField.text, !textAge.isEmpty else {
            print("Error Here too!")
            return
        }
        saveNameInUserDefaults(text: text)
        saveAgeInUserDefaults(text: Int(textAge) ?? 0)
        print("Success!")
        entryResponder.text = "Thank you"
    }
    
    let userDefaultsNameKey = "realName"
    let userDefaultsAgeKey = "realAge"
    
    private func saveNameInUserDefaults(text: String) {
        UserDefaults.standard.set(text, forKey: userDefaultsNameKey)
    }
    
    private func getNameFromUserDefaults() -> String? {
        let name = UserDefaults.standard.string(forKey: userDefaultsNameKey)
        return name
    }
    
    private func saveAgeInUserDefaults(text: Int) {
        UserDefaults.standard.set(text, forKey: userDefaultsAgeKey)
    }
    
    private func getAgeFromUserDetails() -> Int? {
        let age = UserDefaults.standard.integer(forKey: userDefaultsAgeKey)
        return age
    }
    
    func introScreenNameSetup() {
        introText.text = "Welcome, please sign up"
        ageText.text = "Everybody is welcome. Even you"
        
        let name = getNameFromUserDefaults() ?? "You"
        let introSpeech = ("Welcome back, \(name)")
        introText.text = introSpeech
    }
    
    func introScreenAgeSetup(){
        let age = getAgeFromUserDetails() ?? 0
        var smackTalk: String?

        if age < 26 {
            smackTalk = ("Wow! \(age) ? What a baby")
        } else {
            smackTalk = ("Wow you are so old")
        }
        
        ageText.text = smackTalk
    }
}

