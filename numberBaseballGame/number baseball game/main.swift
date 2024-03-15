//
//  main.swift
//  number baseball game
//
//  Created by 스파르타 on 3/12/24.
//  LV.1 ~ LV.6

import Foundation

class GameRecord {
    var attempts: Int
    

    init(attempts: Int) {
        self.attempts = attempts
       
    }
}

class BaseballGame {
    var answer: [Int] = []
    var gameRecords: [GameRecord] = []

    init() {
        answer = makeAnswer()
       
    }
    func makeAnswer() -> [Int] {
        var numbers: [Int] = []
        repeat {
            numbers.removeAll()
            var tempSet = Set<Int>()
            while tempSet.count < 3 {
                tempSet.insert(Int.random(in: 0...9))
            }
            numbers = Array(tempSet)
        } while numbers[0] == 0
        
        return numbers
    }
    
    func showGameRecords() {
        print("게임 기록:")
        if gameRecords.isEmpty {
            print("기록이 없습니다.")
        } else {
            for (index, record) in gameRecords.enumerated() {
                print("\(index + 1)번째 게임 : 시도 횟수 - \(record.attempts)")
            }
        }
        showStartMenu() // 모든 기록을 출력한 후에 메뉴로 돌아갑니다.
    }
    
    func showStartMenu() {
        print("게임에 오신 것을 환영합니다! 원하시는 번호를 입력해주세요.")
        print("1.게임 시작")
        print("2.게임 기록 보기")
        print("3.게임 룰 설명")
        print("4.게임 종료")
        
        if let input = readLine() {
            switch input {
            case "1":
                start()
            case "2":
                showGameRecords()
            case "3":
                print("0부터 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다.")
                showStartMenu()
            case "4":
                checkGameOver(isGameOver: true)
            default :
                print("잘못된 입력입니다.")
                showStartMenu()
                
            }
        }
    }

    
    func start() {
        var attempts = 0
        answer = makeAnswer()
        print("새 게임이 시작되었습니다. 정답을 맞춰보세요!")

        while true {
            print("숫자를 입력하세요. ex)123 : ", terminator: "")
            if let input = readLine(), let guess = parseGuess(input) {
                attempts += 1
                let result = compare(guess: guess)
                print("Result: \(result.strikes) Strikes, \(result.balls) Balls")
                if result.strikes == 3 {
                    print("정답입니다! 시도 횟수: \(attempts)")
                    gameRecords.append(GameRecord(attempts: attempts))
                    afterGame()
                    
                }
            } else {
                print("3자리 숫자를 입력해주세요.")
            }
        }
    }
    
    func afterGame() {
        print("게임을 계속 하시겠습니까? (y/n): ", terminator: "")
        if let decision = readLine(), decision.lowercased() == "y" {
            showStartMenu()
        } else {
            print("게임을 종료합니다.")
        }
    }
    
    
    func parseGuess(_ input: String) -> [Int]? {
        let numbers = input.split(separator: "").compactMap { Int($0) }
        guard numbers.count == 3 else { return nil }
        return numbers
    }
    
    func compare(guess: [Int]) -> (strikes: Int, balls: Int) {
        var strikes = 0
        var balls = 0
        for (index, guessedNumber) in guess.enumerated() {
            if guessedNumber == answer[index] {
                strikes += 1
            } else if answer.contains(guessedNumber) {
                balls += 1
            }
        }
        return (strikes, balls)
    }
    func checkGameOver(isGameOver: Bool) {
        if isGameOver {
            print("게임이 종료되었습니다.")
            exit(0)
        } else {
            showStartMenu()
        }
    }
            
    }



let game = BaseballGame()
game.showStartMenu()
