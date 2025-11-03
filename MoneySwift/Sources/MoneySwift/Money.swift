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

  func reduce(with bank: Bank, to currency: String) -> Money {
    let rate = bank.rate(from: _currency, to: currency)
    return Money(amount: _amount / rate, currency: currency)
  }

  func currency() -> String {
    return _currency
  }

  func times(_ multiplier: Int) -> Expression {
    return Money(amount: _amount * multiplier, currency: _currency)
  }

  func plus(_ addend: Expression) -> Expression {
    return Sum(augend: self, addend: addend)
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
