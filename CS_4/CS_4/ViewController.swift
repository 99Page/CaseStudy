//
//  ViewController.swift
//  CS_4
//
//  Created by 노우영 on 2022/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    struct Location {
        var x: CGFloat = 0
        var y: CGFloat = 0
    }
    
    let baseDuration = 0.3
    var userAlive = true
    var timer = 0
    var locationY = 0
    var locationX = 0
    var bullets = [UIImageView]()
    var bulletsLocation = [Location]()
    var bulletsDirection = [Location]()
    var bulletsOrigin = [Location]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .gray
        
        setUpButtonArea()
        setUpPlayArea()
        setUpCharacter()
        setUpTimerLabe()
        setUpButtons()
        setUpBullets()
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { Timer in
            self.timerToString()
        }
        
        DispatchQueue.global(qos: .userInteractive).async {
            while self.timer <= 200 {
                for i in 0..<30{
                    DispatchQueue.main.async {
                        self.moveBullets(idx: i)
                    }
                }
                usleep(50000)
            }
        }
    }
    
    let buttonArea: UIView = {
        let buttonArea = UIView()
        buttonArea.translatesAutoresizingMaskIntoConstraints = false
        buttonArea.backgroundColor = .blue
        return buttonArea
    }()
    
    let playArea: UIView = {
        let playArea = UIView()
        playArea.translatesAutoresizingMaskIntoConstraints = false
        return playArea
    }()
    
    let character: UIImageView = {
        let character = UIImageView()
        character.translatesAutoresizingMaskIntoConstraints = false
        character.image = UIImage(systemName: "person")
        return character
    }()
    
    let timerLabel: UILabel = {
        let timerLabel = UILabel()
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        return timerLabel
    }()
    
    let upButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "arrow.up.square.fill")
        let upButton = UIButton(configuration: configuration, primaryAction: nil)
        upButton.translatesAutoresizingMaskIntoConstraints = false
        return upButton
    }()
    
    let downButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "arrow.down.square.fill")
        let downButton = UIButton(configuration: configuration, primaryAction: nil)
        downButton.translatesAutoresizingMaskIntoConstraints = false
        return downButton
    }()
    
    let leftButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "arrow.left.square.fill")
        let leftButton = UIButton(configuration: configuration, primaryAction: nil)
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        return leftButton
    }()
    
    let rightButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "arrow.right.square.fill")
        let rightButton = UIButton(configuration: configuration, primaryAction: nil)
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        return rightButton
    }()
    
    let tempDieButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "pencil")
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    func setUpButtonArea() {
        view.addSubview(buttonArea)
        NSLayoutConstraint.activate([
            buttonArea.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonArea.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonArea.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            buttonArea.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        ])
    }
    
    func setUpPlayArea() {
        view.addSubview(playArea)
        NSLayoutConstraint.activate([
            playArea.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            playArea.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            playArea.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            playArea.bottomAnchor.constraint(equalTo: buttonArea.topAnchor)
        ])
    }
    
    func setUpCharacter() {
        view.addSubview(character)
        NSLayoutConstraint.activate([
            character.centerXAnchor.constraint(equalTo: playArea.centerXAnchor),
            character.centerYAnchor.constraint(equalTo: playArea.centerYAnchor),
            character.widthAnchor.constraint(equalTo: playArea.widthAnchor, multiplier: 0.05),
            character.heightAnchor.constraint(equalTo: character.widthAnchor)
        ])
        
        locationX = Int(character.frame.origin.x)
        locationY = Int(character.frame.origin.y)
    }
    
    
    func setUpTimerLabe() {
        view.addSubview(timerLabel)
        NSLayoutConstraint.activate([
            timerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            timerLabel.trailingAnchor.constraint(equalTo: playArea.trailingAnchor)
        ])
    }
    
    func setUpButtons() {
        buttonArea.addSubview(upButton)
        buttonArea.addSubview(downButton)
        buttonArea.addSubview(leftButton)
        buttonArea.addSubview(rightButton)
        
        NSLayoutConstraint.activate([
            upButton.topAnchor.constraint(equalTo: buttonArea.topAnchor),
            upButton.centerXAnchor.constraint(equalTo: buttonArea.centerXAnchor),
            upButton.heightAnchor.constraint(equalTo: buttonArea.heightAnchor, multiplier: 0.6),
            upButton.widthAnchor.constraint(equalTo: upButton.heightAnchor),
            
            downButton.bottomAnchor.constraint(equalTo: buttonArea.bottomAnchor),
            downButton.centerXAnchor.constraint(equalTo: buttonArea.centerXAnchor),
            downButton.heightAnchor.constraint(equalTo: upButton.heightAnchor),
            downButton.widthAnchor.constraint(equalTo: upButton.widthAnchor),
            
            leftButton.trailingAnchor.constraint(equalTo: upButton.leadingAnchor),
            leftButton.centerYAnchor.constraint(equalTo: buttonArea.centerYAnchor),
            leftButton.heightAnchor.constraint(equalTo: upButton.heightAnchor),
            leftButton.widthAnchor.constraint(equalTo: upButton.widthAnchor),
            
            rightButton.leadingAnchor.constraint(equalTo: upButton.trailingAnchor),
            rightButton.centerYAnchor.constraint(equalTo: buttonArea.centerYAnchor),
            rightButton.heightAnchor.constraint(equalTo: upButton.heightAnchor),
            rightButton.widthAnchor.constraint(equalTo: downButton.widthAnchor)
        ])
        
        upButton.addTarget(self, action: #selector(characterUp), for: .allTouchEvents)
        downButton.addTarget(self, action: #selector(characterDown), for: .allTouchEvents)
        leftButton.addTarget(self, action: #selector(characterLeft), for: .allTouchEvents)
        rightButton.addTarget(self, action: #selector(characterRight), for: .allTouchEvents)
        
    }
    
    func makeBullets() -> UIImageView{
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "circle.fill")
        image.tintColor = .red
        return image
    }
    
    func setUpBullets() {
        let offset = 10
        
        for i in 0..<30 {
            bullets.append(makeBullets())
            playArea.addSubview(bullets[i])
            bulletsLocation.append(Location(x: 0, y: CGFloat(offset * i)))
            let dirX = CGFloat.random(in: 3...6)
            var dirY = CGFloat.random(in: 3...6)
            let rand = Int.random(in: 0...1)
            if rand == 0 {
                dirY *= -1
            }
            
            bulletsDirection.append(Location(x: dirX, y: dirY))
            bulletsOrigin.append(Location(x: 0, y: CGFloat(offset*i)))
            
            NSLayoutConstraint.activate([
                bullets[i].topAnchor.constraint(equalTo: playArea.topAnchor, constant: CGFloat(offset * i)),
                bullets[i].leadingAnchor.constraint(equalTo: playArea.leadingAnchor),
                bullets[i].heightAnchor.constraint(equalTo: playArea.heightAnchor, multiplier: 0.015),
                bullets[i].widthAnchor.constraint(equalTo: bullets[0].heightAnchor)
            ])
        }
    }
    
    func moveBullets(idx: Int) {
        changeDirection(idx: idx)
        bulletsLocation[idx].x += bulletsDirection[idx].x
        bulletsLocation[idx].y += bulletsDirection[idx].y
        bullets[idx].transform = CGAffineTransform(translationX: bulletsLocation[idx].x, y: bulletsLocation[idx].y)
    }
    
    func changeDirection(idx: Int) {
        let curX = bulletsOrigin[idx].x + bulletsLocation[idx].x
        let curY = bulletsOrigin[idx].y + bulletsLocation[idx].y
        
        if (curX < 0 || curX > UIScreen.main.bounds.width) {
            bulletsDirection[idx].x = bulletsDirection[idx].x * -1
        } else if (curY < 0 || curY > playArea.bounds.height) {
            bulletsDirection[idx].y = bulletsDirection[idx].y * -1
        }
    }
    
    func setUpDieButton() {
        playArea.addSubview(tempDieButton)
        NSLayoutConstraint.activate([
            tempDieButton.trailingAnchor.constraint(equalTo: playArea.trailingAnchor),
            tempDieButton.widthAnchor.constraint(equalTo: playArea.widthAnchor, multiplier: 0.1),
            tempDieButton.bottomAnchor.constraint(equalTo: playArea.bottomAnchor, constant: -10),
            tempDieButton.heightAnchor.constraint(equalTo: tempDieButton.widthAnchor)
        ])
        
        tempDieButton.addTarget(self, action: #selector(killCharacter), for: .allTouchEvents)
    }
    
    
    func timerToString() {
        timer += 1
        let primeMinute = timer % 10
        let minute = timer / 10
        timerLabel.text = String(format: "%02i.%i", minute, primeMinute)
    }
    
    @objc
    func killCharacter() {
        userAlive.toggle()
    }
    
    @objc
    func characterUp() {
        locationY -= 5
        
        UIView.animate(withDuration: baseDuration, delay: 0, options: []) {
            self.character.transform = CGAffineTransform(translationX: CGFloat(self.locationX), y: CGFloat(self.locationY))
        } completion: { _ in
            
        }
    }
    
    @objc
    func characterDown() {
        locationY += 5
        
        UIView.animate(withDuration: baseDuration, delay: 0, options: []) {
            self.character.transform = CGAffineTransform(translationX: CGFloat(self.locationX), y: CGFloat(self.locationY))
        } completion: { _ in
            
        }
    }
    
    @objc
    func characterLeft() {
        locationX -= 5
        
        UIView.animate(withDuration: baseDuration, delay: 0, options: []) {
            self.character.transform = CGAffineTransform(translationX: CGFloat(self.locationX), y: CGFloat(self.locationY))
        } completion: { _ in
            
        }
    }
    
    @objc
    func characterRight() {
        locationX += 5
        
        UIView.animate(withDuration: baseDuration, delay: 0, options: []) {
            self.character.transform = CGAffineTransform(translationX: CGFloat(self.locationX), y: CGFloat(self.locationY))
        } completion: { _ in
            
        }
    }
    
    func printLocation() {
        print("x : \(locationX), y : \(locationY)")
    }
}

