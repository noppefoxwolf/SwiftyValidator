# SwiftyValidator

- ✅ Built-in validators
- ✅ Customizable
- ✅ Multiple validation
- ✅ Handle multiple error

## Usage

### Built-in validator.

```swift
let validator = GroupedValidator(validators: [
  StringCountValidator(validCount: 4).erase(),
  StringCountRangeValidator(validRange: 0...5).erase()
])
let validatableValue = ValidatableValue(value: "text", validator: validator)
validatableValue.validate // Result<String, Error>()
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
    
    
    func validate(value: Value) -> Result<Value, Swift.Error> {
        if value.size.width == size.width && value.size.height == size.height {
            return .success(value)
        } else {
            return .failure(Error.invalidSize)
        }
    }
}
```

### Handle Errors

```swift
switch validatableValue.validate {
  case let .success(value):
    break
  case let .failure(error):
    switch error {
    case let error as RequireValidator<String>.Error:
      switch error {
        case .valueIsNil:
        break
      }
    case is GroupedValidator<String>.Error:
      break
    default:
      break
    }
  }
}
```
