class Money: Expression, CustomStringConvertible {
  private(set) var _amount: Int
  private(set) var _currency: String

  init(amount: Int, currency: String) {
    self._amount = amount
    self._currency = currency
  }

  func equals(_ other: Any) -> Bool {
    let money: Money = other as! Money
    return _amount == money._amount && _currency == money.currency()
  }

  func currency() -> String {
    return _currency
  }

  func times(_ multiplier: Int) -> Money {
    return Money(amount: _amount * multiplier, currency: _currency)
  }

  func plus(_ addend: Money) -> Expression {
    return Money(amount: _amount + addend._amount, currency: _currency)
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
