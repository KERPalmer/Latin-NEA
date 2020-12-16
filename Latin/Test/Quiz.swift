//
//  quiz.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import Foundation
class Quiz{
    public var questions:[Question]=[]
    private var questionNum:Int = 0
    init(){
    }
    func generateNextQuestion(){
        questionNum += 1
    }
}
