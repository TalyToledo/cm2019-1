//: Playground - noun: a place where people can play

import UIKit

class Button {
    let title: String
    var delegate: ButtonDelegate?
    
    init (title: String) {
        self.title = title
    }
    
    func tapped(){
        //Código cuando esto pase
        self.delegate?.userTappedButton(self)
    }
}

protocol ButtonDelegate {
    func userTappedButton (_ button: Button)
}

class Song {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}

class MusicController: ButtonDelegate {
    func userTappedButton(_ button: Button) {
        if button.title == "Play" {
            playSong(song: playlist.first!)
        } else if button.title == "Pause" {
            pauseSong()
        }
    }
    
    func playSong( song: Song) {
        print("Now playing: \(song.title)")
    }
    func pauseSong() {
        print("Paused current song...")
    }
}

let playlist: [Song] = [Song(title: "Let it be"), Song(title: "Tu si sabes quererme"), Song(title: "Getting jiggy with it")]

let musicController = MusicController()
let startMusicButton = Button(title: "Play")
startMusicButton.delegate = musicController
let pauseMusicButton = Button(title: "Pause")
pauseMusicButton.delegate = musicController

startMusicButton.tapped()
pauseMusicButton.tapped()

