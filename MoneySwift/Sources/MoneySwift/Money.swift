protocol Money {
  var amount: Int { get }
  func equals(_ other: Any) -> Bool
}

extension Money {
  func equals(_ other: Any) -> Bool {
    let money: Money = other as! Money
    return amount == money.amount && type(of: self) == type(of: money)
  }
}

class MoneyFactory {
  static func dollar(_ amount: Int) -> Dollar {
    return Dollar(amount)
  }
}
