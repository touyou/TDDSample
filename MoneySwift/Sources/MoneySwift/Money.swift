protocol Money {
  var amount: Int { get }
  func equals(_ other: Any) -> Bool
  func times(_ multiplier: Int) -> Self
}

extension Money {
  func equals(_ other: Any) -> Bool {
    let money: any Money = other as! any Money
    return amount == money.amount && type(of: self) == type(of: money)
  }
}

class MoneyFactory {
  static func dollar(_ amount: Int) -> some Money {
    return Dollar(amount)
  }
}
