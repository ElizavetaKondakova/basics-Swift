import Cocoa
protocol Families {
    var surname: String { get set}

}
class Family: Families {
    var surname: String
    
    init (surname: String) {
        self.surname = surname
    }
}

struct Stack<T: Families> {
    var items = [T]()
    
    init (){}
    
    init(_ elements: T ...) {
        self.items = elements
    }
    
    mutating func push(_ item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T {
        return items.removeLast()
    }
    
   func sortedArray(_ a: T) -> [T] {
    return items.sorted{ $0.surname < $1.surname }
    }
    
    subscript(i: Int) -> T?  {
        if i <= items.count - 1 {
            return items[i]
        } else {
            return nil
        }
    }
}

let family1 = Family(surname: "Ивановы")
let family2 = Family(surname: "Яковлевы")
let family3 = Family(surname: "Петровы")
let family4 = Family(surname: "Колобаевы")
var array = Stack<Family>()

array.push(family1)
array.push(family2)
array.push(family3)
array.push(family4)
array[2]
array.sortedArray(family1)


