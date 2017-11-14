//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Murari Varma on 14/11/17.
//  Copyright © 2017 murarivarma. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    private var accumulator: Double?
    
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case equals
    }
    
    private var operationsDict: Dictionary<String, Operation> =
        [
            "π" : Operation.constant(Double.pi),
            "e" : Operation.constant(M_E),
            "√" : Operation.unaryOperation(sqrt),
            "cos" : Operation.unaryOperation(cos),
            "±" : Operation.unaryOperation({ -$0 }),
            "×" : Operation.binaryOperation({ $0 * $1 }),
            "÷" : Operation.binaryOperation({ $0 / $1 }),
            "+" : Operation.binaryOperation({ $0 + $1 }),
            "-" : Operation.binaryOperation({ $0 - $1 }),
            "=" : Operation.equals
        ]
    
    mutating func performOperation(_ symbol: String) {
        if let operation = operationsDict[symbol] {
            switch operation {
                case .constant(let value):
                    accumulator = value
                case .unaryOperation(let operationToPerform):
                    if accumulator != nil {
                     accumulator = operationToPerform(accumulator!)
                    }
            case .binaryOperation(let operationToPerform) :
                if accumulator != nil {
                    pendingBinaryOperation = PendingBinaryOperation(function: operationToPerform, firstOperand: accumulator!)
                    accumulator = nil
                }
            case .equals :
                performPendingBinaryOperation()
            }
        }
    }
    
    private mutating func performPendingBinaryOperation() {
        if pendingBinaryOperation != nil && accumulator != nil {
            accumulator = pendingBinaryOperation!.perform(with: accumulator!)
            pendingBinaryOperation = nil
        }
    }
    
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    private struct PendingBinaryOperation {
        let function: (Double, Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
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
