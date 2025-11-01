protocol Money {
  var _amount: Int { get }
  var _currency: String { get }
  func equals(_ other: Any) -> Bool
  func times(_ multiplier: Int) -> Self
  func currency() -> String
}

extension Money {
  func equals(_ other: Any) -> Bool {
    let money: any Money = other as! any Money
    return _amount == money._amount && type(of: self) == type(of: money)
  }

  func currency() -> String {
    return _currency
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
