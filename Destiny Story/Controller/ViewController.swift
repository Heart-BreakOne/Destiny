//

import UIKit

class ViewController: UIViewController {
    
    //Declares outlets from the main storyboard
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!

    //Creates an instance of the Story struct
    var story = Story()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Array of the buttons the user can click
        let choiceButtons = [choiceOneButton, choiceTwoButton]
        //Programatically sets font size that fits the button
        for button in choiceButtons {
            button?.titleLabel?.adjustsFontSizeToFitWidth = true
            button?.titleLabel?.minimumScaleFactor = 0.1
        }
        // Do any additional setup after loading the view.
        updateUI()
    }

    //IBACtion method to handle the button press by the user
    @IBAction func choiceButtonPressed(_ sender: UIButton) {
        
        //Calls method nextStory to set the story index in story instance passing the title of the pressed button as a parameter
        story.nextStory(choice: sender.currentTitle!)
        
        //Updates UI so it shows the beginning of the story
        updateUI()
    }
    
    func updateUI() {
        //Calls method in the story instance to get the story title and sets the storyLabel with the result
        storyLabel.text = story.getStoryTitle()
        
        //Calls method in the story instance to get the story choices and sets the button text with the results
        choiceOneButton.setTitle(story.getChoiceOne(), for: .normal)
        choiceTwoButton.setTitle(story.getChoiceTwo(), for: .normal)
    }
    
}

