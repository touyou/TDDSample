class Money: CustomStringConvertible {
  private(set) var _amount: Int
  private(set) var _currency: String

  init(amount: Int, currency: String) {
    self._amount = amount
    self._currency = currency
  }

  func equals(_ other: Any) -> Bool {
    let money: Money = other as! Money
    return _amount == money._amount && type(of: self) == type(of: money)
  }

  func currency() -> String {
    return _currency
  }

  func times(_ multiplier: Int) -> Money {
    fatalError("This method should be overridden")
  }

  var description: String {
    return "\(_amount) \(_currency)"
  }

  static func dollar(_ amount: Int) -> Money {
    return Money(amount: amount, currency: "USD")
  }

  static func franc(_ amount: Int) -> Money {
    return Money(amount: amount, currency: "CHF")
  }
}
