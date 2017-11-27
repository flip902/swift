//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Phillip Carlino on 2017-10-21.
//

import UIKit

class AthleteFormViewController: UIViewController {
    
    struct PropertyKeys {
        static let unwind = "UnwindToAthleteTable"
    }
    
    var athlete: Athlete?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var leagueTextField: UITextField!
    @IBOutlet weak var teamTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateView() {
        guard let athlete = athlete else { return }
        nameTextField.text = athlete.name
        ageTextField.text = athlete.age
        leagueTextField.text = athlete.league
        teamTextField.text = athlete.team
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text,
        let age = ageTextField.text,
        let league = leagueTextField.text,
        let team = teamTextField.text else { return }
        
        athlete = Athlete(name: name, age: age, league: league, team: team)
        performSegue(withIdentifier: PropertyKeys.unwind, sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
