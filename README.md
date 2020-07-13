# SwiftyValidator

## Usage

### Built-in validator.

```swift
let validator = GroupedValidator(validators: [
  StringCountValidator(validCount: 4).erase(),
  StringCountRangeValidator(validRange: 0...5).erase()
])
let value = ValidatableValue(value: "text", validator: validator)
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
