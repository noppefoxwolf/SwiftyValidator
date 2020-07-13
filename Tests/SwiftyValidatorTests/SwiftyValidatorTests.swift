import XCTest
@testable import SwiftyValidator

final class SwiftyValidatorTests: XCTestCase {
    func testMultiSuccessValidate() {
        let validator = RequireValidator(groupedValidator: GroupedValidator(validators: [
            StringCountValidator(validCount: 4).erase(),
            StringCountRangeValidator(validRange: 0...5).erase()
        ]))
        let optionalText: String? = "text"
        let value = ValidatableValue(value: optionalText, validator: validator)
        switch value.validate() {
        case let .success(value):
            XCTAssertEqual(value, "text")
        case .failure:
            XCTAssertTrue(false)
        }
    }
    
    func testNilFailureValidate() {
        let validator = RequireValidator(groupedValidator: GroupedValidator(validators: [
            StringCountValidator(validCount: 4).erase(),
            StringCountRangeValidator(validRange: 0...5).erase()
        ]))
        let optionalText: String? = nil
        let value = ValidatableValue(value: optionalText, validator: validator)
        switch value.validate() {
        case let .success(value):
            XCTAssertTrue(false)
        case let .failure(error):
            switch error {
            case let error as RequireValidator<String>.Error:
                switch error {
                case .valueIsNil:
                    XCTAssertTrue(true)
                }
            case is GroupedValidator<String>.Error:
                XCTAssertTrue(false)
            default:
                XCTAssertTrue(false)
            }
        }
    }
    
    func testMultiFailureValidate() {
        let validator = RequireValidator(groupedValidator: GroupedValidator(validators: [
            StringCountValidator(validCount: 4).erase(),
            StringCountRangeValidator(validRange: 0...5).erase()
        ]))
        let optionalText: String? = "texttext" // 8 characters
        let value = ValidatableValue(value: optionalText, validator: validator)
        switch value.validate() {
        case let .success(value):
            XCTAssertTrue(false)
        case let .failure(error):
            switch error {
            case let error as RequireValidator<String>.Error:
                switch error {
                case .valueIsNil:
                    XCTAssertTrue(false)
                }
            case let error as GroupedValidator<String>.Error:
                switch error {
                case let .errors(errors):
                    XCTAssertEqual(errors.count, 2)
                }
            default:
                XCTAssertTrue(false)
            }
        }
    }
}
