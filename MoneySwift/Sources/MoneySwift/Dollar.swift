struct Dollar: Money {
  init(_ amount: Int) {
    self._amount = amount
    self._currency = "USD"
  }

  private(set) var _amount: Int
  private(set) var _currency: String

  func times(_ multiplier: Int) -> Self {
    return Dollar(_amount * multiplier)
  }

  static func ==(lhs: Dollar, rhs: Dollar) -> Bool {
    return lhs.equals(rhs)
  }

  static func !=(lhs: Dollar, rhs: Dollar) -> Bool {
    return !lhs.equals(rhs)
  }
}
