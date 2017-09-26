//
//  CodableBugTests.swift
//  CodableBugTests
//
//  Created by Kevin McQuown on 9/25/17.
//  Copyright © 2017 Spokin. All rights reserved.
//

import XCTest
@testable import CodableBug

let jsonData = """
                {
                    "legCount" : 4,
                    "bestFriend" : "Owner"
                }
                """

class CodableBugTests: XCTestCase {
    
    func testLegCount() {
        
        let data = jsonData.data(using: .utf8)!
        let decoder = JSONDecoder()
        do {
            let payload = try decoder.decode(Dog.self, from: data)
            let dog = payload as Dog
            XCTAssertEqual(dog.legCount, 4)
        }
         catch DecodingError.keyNotFound(let key, let context) {
            print("Missing Key \(key)")
            print("Debug description \(context)")
        } catch DecodingError.typeMismatch(let type, let context) {
            print("Has wrong type: \(type)")
            print("Debug description \(context)")
        } catch DecodingError.valueNotFound(let type, let context) {
            print("Has missing value: \(type)")
            print("Debug description \(context)")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func testDogBestFriend() {
        
        let data = jsonData.data(using: .utf8)!
        let decoder = JSONDecoder()
        do {
            let payload = try decoder.decode(Dog.self, from: data)
            let dog = payload as Dog
            XCTAssertEqual(dog.bestFriend, "Owner")
        }
        catch DecodingError.keyNotFound(let key, let context) {
            print("Missing Key \(key)")
            print("Debug description \(context)")
        } catch DecodingError.typeMismatch(let type, let context) {
            print("Has wrong type: \(type)")
            print("Debug description \(context)")
        } catch DecodingError.valueNotFound(let type, let context) {
            print("Has missing value: \(type)")
            print("Debug description \(context)")
        } catch {
            print(error.localizedDescription)
        }
    }
}
