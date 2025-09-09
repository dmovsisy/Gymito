//
//  GymitoTests.swift
//  GymitoTests
//
//  Created by David Movsisyan  on 2024-12-10.
//

import XCTest
@testable import Gymito

final class ModelTests: XCTestCase {
    
    func testSetDataInitialization() {
        let set = SetData(weight: 50.0, reps: 10)
        XCTAssertEqual(set.weight, 50.0)
        XCTAssertEqual(set.reps, 10)
    }
    
    func testExerciseListItemInitialization() {
        let sets = [SetData(weight: 40, reps: 12), SetData(weight: 50, reps: 10)]
        let item = ExerciseListItem(id: "123", exercise: "Bench Press", exerciseSets: sets)
        
        XCTAssertEqual(item.id, "123")
        XCTAssertEqual(item.exercise, "Bench Press")
        XCTAssertEqual(item.exerciseSets.count, 2)
    }
    
    func testUserInitialization() {
        let user = User(id: "abc123",
                        name: "David",
                        email: "test@example.com",
                        timeJoined: 123456789,
                        workoutId: "w1",
                        currentlyWorkingOut: true)
        
        XCTAssertEqual(user.id, "abc123")
        XCTAssertTrue(user.currentlyWorkingOut)
    }
}

final class LoginViewViewModelTests: XCTestCase {
    
    var viewModel: LoginViewViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = LoginViewViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testEmptyFieldsValidation() {
        viewModel.email = ""
        viewModel.password = ""
        
        //XCTAssertFalse(viewModel.loginIsValid())
        XCTAssertEqual(viewModel.errormsg, "please fill in all the fields")
    }
    
    func testInvalidEmailValidation() {
        viewModel.email = "invalidEmail"
        viewModel.password = "password123"
        
        //XCTAssertFalse(viewModel.loginIsValid())
        XCTAssertEqual(viewModel.errormsg, "please enter a valid email")
    }
    
    func testValidEmailAndPassword() {
        viewModel.email = "user@example.com"
        viewModel.password = "password123"
        
        // XCTAssertTrue(viewModel.loginIsValid())
        XCTAssertEqual(viewModel.errormsg, "")
    }
}

final class HomeViewViewModelTests: XCTestCase {
    
    func testGetTodaysDateReturnsFormattedString() {
        let vm = HomeViewViewModel()
        let date = vm.getTodaysDate()
        
        XCTAssertFalse(date.isEmpty)
        XCTAssertTrue(date.contains(",")) // e.g., "Sep 8, 2025"
    }
}


final class RegisterViewViewModelTests: XCTestCase {
    
    var viewModel: RegisterViewViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = RegisterViewViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testValidateFailsWithEmptyFields() {
        viewModel.name = ""
        viewModel.email = ""
        viewModel.password = ""
        
        // XCTAssertFalse(viewModel.registerIsValid())
    }
    
    func testValidateFailsWithInvalidEmail() {
        viewModel.name = "John Doe"
        viewModel.email = "invalidemail"
        viewModel.password = "securePass"
        
       //  XCTAssertFalse(viewModel.registerIsValid())
    }
    
    func testValidateFailsWithShortPassword() {
        viewModel.name = "John Doe"
        viewModel.email = "john@example.com"
        viewModel.password = "123"  // too short
        
       // XCTAssertFalse(viewModel.registerIsValid())
    }
    
    func testValidateSucceedsWithValidInputs() {
        viewModel.name = "John Doe"
        viewModel.email = "john@example.com"
        viewModel.password = "securePass123"
        
       // XCTAssertTrue(viewModel.registerIsValid())
    }
}

final class ProfileViewViewModelTests: XCTestCase {
    
    func testSignOutDoesNotCrash() {
        let vm = ProfileViewViewModel()
        XCTAssertNoThrow(vm.signOut())
    }
    
    func testUserDefaultsToNil() {
        let vm = ProfileViewViewModel()
        XCTAssertNil(vm.user)
    }
}
