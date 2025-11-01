struct Franc: Money {
  init(amount: Int, currency: String) {
    self._amount = amount
    self._currency = currency
  }

  private(set) var _amount: Int
  private(set) var _currency: String

  func times(_ multiplier: Int) -> Money {
    return MoneyFactory.franc(_amount * multiplier)
  }

  static func ==(lhs: Franc, rhs: Franc) -> Bool {
    return lhs.equals(rhs)
  }

  static func !=(lhs: Franc, rhs: Franc) -> Bool {
    return !lhs.equals(rhs)
  }
}
