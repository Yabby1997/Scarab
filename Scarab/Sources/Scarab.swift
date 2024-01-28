//
//  Scarab.swift
//  Scarab
//
//  Created by Seunghun on 1/28/24.
//  Copyright © 2024 seunghun. All rights reserved.
//

import Foundation

public class Scarab {
    public enum Errors: Error {
        case invalidInputs
    }
    
    public init() {}
    
    public func requiredExperimentFor(successRate: Double, targetRate: Double) throws -> Int {
        guard .leastNonzeroMagnitude..<1 ~= successRate,
              .leastNonzeroMagnitude..<1 ~= targetRate,
              1 - successRate > .leastNonzeroMagnitude,
              1 - targetRate > .leastNonzeroMagnitude else {
            throw Errors.invalidInputs
        }
        
        guard successRate < targetRate else { return 1 }
        
        let result = log(1 - targetRate) / log(1 - successRate)
        
        guard result.isFinite else {
            throw Errors.invalidInputs
        }
        
        return Int(ceil(result))
    }
    
    public func expectedProbailityFor(successRate: Double, experiments: Int) throws -> Double {
        guard .leastNonzeroMagnitude..<1 ~= successRate,
              experiments > .zero else {
            throw Errors.invalidInputs
        }
        
        let result = 1 - pow(1 - successRate, Double(experiments))
        
        guard result.isFinite else {
            throw Errors.invalidInputs
        }
        
        return result
    }
}
