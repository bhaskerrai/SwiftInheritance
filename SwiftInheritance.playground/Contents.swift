import UIKit

//Classes can also add property observers to inherited properties in order to be notified when the value of a property changes. Property observers can be added to any property, regardless of whether it was originally defined as a stored or computed property.

//Swift classes don’t inherit from a universal base class. Classes you define without specifying a superclass automatically become base classes for you to build upon.


class Vehicle {
    var current_speed: Int
    init(s: Int){
        current_speed = s;
    }
}



class Bicycle: Vehicle {
    init() {
        super.init(s: 80)
    }
}


let c = Vehicle(s: 40)
print(c.current_speed)

let b = Bicycle()
print(b.current_speed)



//you access the superclass version of a method, property, or subscript by using the super prefix:

//An overridden method named someMethod() can call the superclass version of someMethod() by calling super.someMethod() within the overriding method implementation.

//An overridden property called someProperty can access the superclass version of someProperty as super.someProperty within the overriding getter or setter implementation.

//An overridden subscript for someIndex can access the superclass version of the same subscript as super[someIndex] from within the overriding subscript implementation.




class Book{
    
    var genre = "fiction"
    
    func b_genre() -> String {
        return "The genre of the book is: \(genre)"
    }
}

let half = Book()
half.genre
print(half.b_genre())


class LordOfRings: Book{
     
    override func b_genre() -> String {
        return "The genre of the Lord of Rings is: " + super.genre + " and fantasy."     //accessing parent class property using super keyword.
        
//        super.b_genre()
    }
}

let f = LordOfRings()
print(f.b_genre())



//Overriding Property Observers
//You can use property overriding to add property observers to an inherited property. This enables you to be notified when the value of an inherited property changes, regardless of how that property was originally implemented.


//Note
//You can’t add property observers to inherited constant stored properties or inherited read-only computed properties. The value of these properties can’t be set, and so it isn’t appropriate to provide a willSet or didSet implementation as part of an override.

//Note also that you can’t provide both an overriding setter and an overriding property observer for the same property. If you want to observe changes to a property’s value, and you are already providing a custom setter for that property, you can simply observe any value changes from within the custom setter.


class A{
    
    var amount = 55.0
//        print("Ok this is the main function of the superclass!")

}

class B: A{
    
    override var amount: Double{
        didSet{
            print("Parent class property modified in the subclass")
            
        }
    }
}

var x = B()
//x.amount
x.amount = 66
print(x.amount)



//Preventing Overrides
//You can prevent a method, property, or subscript from being overridden by marking it as final. Do this by writing the final modifier before the method, property, or subscript’s introducer keyword (such as final var, final func, final class func, and final subscript).


//You can mark an entire class as final by writing the final modifier before the class keyword in its class definition (final class). Any attempt to subclass a final class is reported as a compile-time error.
