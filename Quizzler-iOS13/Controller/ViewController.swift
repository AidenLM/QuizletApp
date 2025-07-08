import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = (sender == trueButton) ? 1 : 0
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        sender.backgroundColor = userGotItRight ? UIColor.green : UIColor.red
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        if quizBrain.isQuizFinished() {
            textView.text = "END OF QUIZ\nYour Score is \(quizBrain.score)"
            trueButton.isHidden = true
            falseButton.isHidden = true
            progressView.progress = 1.0
        } else {
            textView.text = quizBrain.getQuestionText()
            progressView.progress = quizBrain.getProgress()
            trueButton.backgroundColor = .clear
            falseButton.backgroundColor = .clear
        }
    }
}
