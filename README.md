<h1>Layout</h1>

**Layout** is a DSL for Auto Layout 

<p align="left">
    <img src="https://img.shields.io/badge/Swift-5.1-orange.svg" />
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
    <a href="https://twitter.com/vt_codes">
        <img src="https://img.shields.io/badge/contact-@vt_codes-blue.svg?style=flat" alt="Twitter: @vt_codes" />
    </a>
</p>

The DSL allows you to replace this:

```swift
label.translatesAutoresizingMaskIntoConstraints = false

NSLayoutConstraint.activate([
    label.topAnchor.constraint(
        equalTo: button.bottomAnchor,
        constant: 10
    ),
    label.leadingAnchor.constraint(
        equalTo: button.leadingAnchor
    ),
    label.widthAnchor.constraint(
        lessThanOrEqualTo: view.widthAnchor,
        constant: -35
    ),
    label.heightAnchor.constraint(
        equalToConstant: button.leadingAnchor
    )
])
```

with this:

```swift
label.layout {
    $0.top == button.bottomAnchor + 10
    $0.leading == button.leadingAnchor
    $0.width <= view.widthAnchor - 35
    $0.height == 40
}
```

## Installation

To install **Layout**, use the [Swift Package Manager](https://github.com/apple/swift-package-manager) by declaring **Layout** as a dependency in your `Package.swift` file:

```swift
.package(url: "https://github.com/Vutlhari/Layout", from: "0.2.0")
```

*For more information, see [the Swift Package Manager documentation](https://github.com/apple/swift-package-manager/tree/master/Documentation).*


## Usage

Call the `layout` function on your `UIView` instance with a closure in which you declare the constraints between the different attributes of your views:

### Quick Start

```swift
import Layout

class ViewController: UIViewController {
    lazy var box = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(box)
        self.box.backgroundColor = .red
        self.layout {
            $0.centerX == self.view.centerXAnchor
            $0.centerY == self.view.centerYAnchor
            $0.height == 80
            $0.width == 80
        }
    }
}
```

### Multiple configuration steps

**Layout** includes a convenience API that extends `UIView` by executing a closure after adding a given view as a subview, like this:

```swift
self.view.add(box, then: {
    $0.layout {
        $0.centerX == self.view.centerXAnchor
        $0.centerY == self.view.centerYAnchor
        $0.height == 80
        $0.width == 80
    }
})
```

_Please Note:_

Every view on the left hand side of an equality (`==`) or inequality (`>=`, `<=`) operator, Layout will automatically set its `translatesAutoresizingMaskIntoConstraints` property to `false`.

If the view is not controlled by you – for example _if it belongs to a Apple-provided
`UIViewController` class_ – you should take appropriate care when declaring its
constraints.


## Supported attributes

**Layout** supports the following iOS attributes:

- `top`
- `bottom`
- `leading`
- `right`
- `trailing`
- `left`
- `centerX`
- `centerY`
- `width`
- `height`

## License

Layout is released under the MIT license. See LICENSE for details.