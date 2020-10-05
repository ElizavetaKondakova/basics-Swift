import Cocoa


enum ToyShopError: Error {
    case ToyIsOver
    case NotEnougMoney( coinsNeeded: Int)
}

struct CardProduct {
    var price: Int
    var count: Int
}

class ToyShop {
    var product = [
    "Единорог": CardProduct(price: 100, count: 3),
    "Дракон": CardProduct(price: 120, count: 10),
    "Машинка": CardProduct(price: 60, count: 12),
    "Тролль": CardProduct(price: 80, count: 5)
    ]
    
    var coinsDeposited = 0
    
    func sale(product: String)  {
        print("Ваш \(product)")
    }
    
    func shop(nameToy: String) throws {
        guard var item = product[nameToy] else {
            throw ToyShopError.ToyIsOver
        }
        guard item.count > 0 else {
            throw ToyShopError.ToyIsOver
        }
        guard item.price <= coinsDeposited  else {
            throw ToyShopError.NotEnougMoney(coinsNeeded: item.price - coinsDeposited)
        }
        coinsDeposited -= item.price
        item.count -= 1
        product[nameToy] = item
        sale(product: nameToy)
    }
}

var toyShop = ToyShop()
toyShop.coinsDeposited = 100
 
do {
    try toyShop.shop(nameToy: "Дракон")
} catch ToyShopError.NotEnougMoney(let coinsNeeded) {
    print("Недостаточно средств. Добавьте еще \(coinsNeeded) рублей.")
} catch ToyShopError.ToyIsOver {
    print("Товар закончился")
}
