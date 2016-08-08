//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://www.jessesquires.com/JSQCoreDataKit
//
//
//  GitHub
//  https://github.com/jessesquires/JSQCoreDataKit
//
//
//  License
//  Copyright © 2015 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

import XCTest

import ExampleModel
import JSQCoreDataKit


final class ExampleAppTests: XCTestCase {

    let inMemoryModel = CoreDataModel(name: modelName, bundle: modelBundle, storeType: .inMemory)

    var inMemoryStack: CoreDataStack!

    override func setUp() {
        super.setUp()
        
        let factory = CoreDataStackFactory(model: inMemoryModel)

        var result: StackResult!

        factory.createStack(onQueue: nil) { (r) in
            result = r
        }

        inMemoryStack = result.stack()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_should_pass() {
        let context = inMemoryStack.mainContext

        // ExampleModel.Employee should be created
        // Instead, ExampleModel.Person is created
        // This worked prior to Version 8.0 beta 4 (8S188o)
        let employee = Employee(context: context,
                                name: "Name",
                                birthDate: Date(),
                                salary: 1_000)

        print(employee)
        saveContext(context)
    }
}
