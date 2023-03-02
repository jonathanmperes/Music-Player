//
//  GenreButtonScreen.swift
//  MusicPlayer
//
//  Created by Jonathan Marcelo Peres on 01/03/23.
//

import UIKit
import MediaPlayer

class GenreButtonScreen: UIViewController {
    
    @IBOutlet var musicPlayerButtons: [UIButton]!
        
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer

    override func viewDidLoad() {
        super.viewDidLoad()
        formatButtons()
    }

    @IBAction func genreButtonTapped(_ sender: UIButton) {
        
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                self.playGenre(genre: sender.currentTitle!)
            }
        }
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    func playGenre(genre: String) {
        
        musicPlayer.stop()

        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)

        query.addFilterPredicate(predicate)

        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
    
    func formatButtons() {
        for button in musicPlayerButtons {
            button.layer.cornerRadius = button.frame.size.height / 2
        }
    }
}
