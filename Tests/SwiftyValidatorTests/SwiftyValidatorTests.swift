import XCTest
@testable import SwiftyValidator

final class SwiftyValidatorTests: XCTestCase {
    func multiValidateTest() {
        let validator = RequireValidator(groupedValidator: GroupedValidator(validators: [
            StringCountValidator(validCount: 4).erase(),
            StringCountRangeValidator(validRange: 0...5).erase()
        ]))
        let optionalText: String? = "text"
        let value = ValidatableValue(value: optionalText, validator: validator)
        XCTAssertTrue(value.isValid)
    }
}
