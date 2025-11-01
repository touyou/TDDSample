protocol Money {
  var amount: Int { get }
  func equals(_ other: Any) -> Bool
  func times(_ multiplier: Int) -> Self
  func currency() -> String
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

  static func franc(_ amount: Int) -> some Money {
    return Franc(amount)
  }
}
