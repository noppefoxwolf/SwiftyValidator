import XCTest
@testable import SwiftyValidator

final class SwiftyValidatorTests: XCTestCase {
    func multiValidateTest() {
        let value = ValidatableValue(value: "text", validator: GroupedValidator(validators: [
            StringCountValidator(validCount: 4).erase(),
            StringCountRangeValidator(validRange: 0...5).erase()
        ]))
        XCTAssertTrue(value.isValid)
    }
}
