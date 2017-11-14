//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Murari Varma on 14/11/17.
//  Copyright © 2017 murarivarma. All rights reserved.
//

import Foundation

func changeSign(operand: Double) -> Double {
    return -operand
}

struct CalculatorBrain {
    
    private var accumulator: Double?
    
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
    }
    
    private var operationsDict: Dictionary<String, Operation> =
        [
            "π" : Operation.constant(Double.pi),
            "e" : Operation.constant(M_E),
            "√" : Operation.unaryOperation(sqrt),
            "cos" : Operation.unaryOperation(cos),
            "±" : Operation.unaryOperation(changeSign)
    ]
    
    mutating func performOperation(_ symbol: String) {
        if let operation = operationsDict[symbol] {
            switch operation {
                case .constant(let value):
                    accumulator = value
                    break
                case .unaryOperation(let operationToPerform):
                    if accumulator != nil {
                     accumulator = operationToPerform(accumulator!)
                    }
                    break
            }
        }
    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    var result: Double? {
        get {
            return accumulator
        }
    }
}
