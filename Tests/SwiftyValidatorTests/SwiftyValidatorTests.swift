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
        case .success:
            XCTAssertTrue(false)
        case let .failure(error):
            XCTAssertEqual(error.errors.count, 1)
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
        case .success:
            XCTAssertTrue(false)
        case let .failure(error):
            XCTAssertEqual(error.errors.count, 2)
        }
    }
}
