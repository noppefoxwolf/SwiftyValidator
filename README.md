# SwiftyValidator

- ✅ Built-in validators
- ✅ Customizable
- ✅ Multiple validation
- ✅ Handle multiple error
- ✅ PropertyWrapper

## Usage

### Built-in validator.

```swift
let validator = GroupedValidator(validators: [
  StringCountValidator(validCount: 4).erase(),
  StringCountRangeValidator(validRange: 0...5).erase()
])
let validatableValue = ValidatableValue(value: "text", validator: validator)
validatableValue.validate() // Result<String, ValidationError>()
validatableValue.isValid // Bool
validatableValue.value = "new Value"
```

### Custom validator

```swift
struct ImageSizeValidator: Validatable {
    typealias Value = UIImage
    enum Error: Swift.Error {
        case invalidSize
    }
    let size: CGSize
    public init(size: CGSize) {
        self.size = size
    }
    
    
    func validate(value: Value) -> Result<Value, ValidationError> {
        if value.size.width == size.width && value.size.height == size.height {
            return .success(value)
        } else {
            return .failure(.init([Error.invalidSize]))
        }
    }
}
```

### Handle Errors

```swift
switch validatableValue.validate() {
  case let .success(value):
    break
  case let .failure(error):
    error.errors
  }
}
```

### PropertyWrapper

```swift
@Validation(StringCountValidator(validCount: 20)) var text: String = ""

$text.validate() // Result<String, ValidationError>()
$text.isValid // Bool
text.value = "new Value"
```
