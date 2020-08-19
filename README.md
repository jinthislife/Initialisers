How to add a custom initialiser in UIViewController

As an iOS developer, you might want to use custom initialiser from time to time to control dependency injection. When adding a custom initialiser to UIViewController, you need to consider 3 different cases and I will cover all of them.

1. Initialising UIViewController programmatically
2. Initialising UIViewController using XIB
3. Initialising UIViewController from storyboard 

First of all, what is a custom initialiser?

Custom initialisation can fall into these 2 different cases. From my experience, 경우는 드물었다 that I need to override the initialiser of superview. I think I only have created new initialiser rather than overriding.


1. Creating a new designated(?) initialiser
```Swift
Class CustomViewController: UIViewController {     let name: String
    
    init(name: String) {
        self.name = name
    }
}
```

2. Overriding a initialiser of super
```Swift
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        <#code#>
    }
```

For all three cases when you provide custom initialisers, Xcode will complain you should provide require init?(coder: NSCoder) which is used to create UIViewController from storyboard. The decoder, NSCoder is related to the Interface Builder. Xcode translate everything you set and do in Interface builder to code under the hood.
￼<p align = "left">
<img src = "Images/requiredInitErr.png" width="230">
</p>
You need to implement required initialiser regardless of you are using storyboard or not, because the initialiser marked as required by super view.

If you are not using storyboards or your view controller has properties to be initialised, you implement below.
This won’t be crashing because this will be never called by storyboard.
```Swift
required init?(coder aDecoder: NSCoder) {
    fatalError("We aren't using storyboards")
}
```


Or you can just reference the fatal error with the super.
```Swift
required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
}
```


1.  In case you write custom initialiser for programatically created UIViewController.
```Swift
init(name: String) {
    self.name = name
}
```
After initializing custom class you should call designated initialiser of super to initilize its own properties.
￼<p align = "left">
<img src = "Images/superInitErr.png" width="230">
</p>

You should call the designated initialiser for UIViewController, initWithNibName:bundle:
￼<p align = "left">
<img src = "Images/initNameStringErr.png" width="230">
</p>

Results
```Swift
￼class CodeBasedViewController: UIViewController {

private let data: String

init(data: String, viewModel: String? = nil) {
    self.data = data
    super.init(nibName: nil, bundle:nil)
}

required init?(coder: NSCoder) {
    fatalError("Never will happen")
}
```

2. When you write custom initialiser for xib based UIViewController
Adding custom initialiser to XIB based UIViewController is pretty similar

```Swift
class XIBBasedViewController: UIViewController {

@IBOutlet weak var titleLabel: UILabel!
private let titleData: String

init(data: String) {
    self.titleData = data
    super.init(nibName: nil, bundle: nil)
}

required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}
```


3. You can’t use custom initialiser with storyboard in iOS 12 and earlier.
In iOS 13 and later, however, Apple provides a way to use custom initializer for a Storyboard based UIViewController with some limitations. i.e(That is) you can’t use this on relationship segue like navigation controller root view
https://sarunw.com/posts/better-dependency-injection-for-storyboards-in-ios13/


How to add a convenience initialiser in UIViewController

Convenience Initialisers are in addition to designated initialisers rather than a replacement.

Convenience initialisers should end up with calling designated initialisers. Make sure your properties have default values or are optionals to call self.init().
￼
```Swift
private var initialData: String = ""

convenience init(initialData: String) {
    // To call self.init(), every properties should have default values or be optionals
    self.init()
    self.initialData = initialData
    print("convenience init")
}
```
