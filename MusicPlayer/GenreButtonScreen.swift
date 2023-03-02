//
//  GenreButtonScreen.swift
//  MusicPlayer
//
//  Created by Jonathan Marcelo Peres on 01/03/23.
//

import UIKit
import MediaPlayer

class GenreButtonScreen: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func genreButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        
    }
    
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
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
}
