struct Franc: Money {
  init(_ amount: Int) {
    self._amount = amount
    self._currency = "CHF"
  }

  private(set) var _amount: Int
  private(set) var _currency: String

  func times(_ multiplier: Int) -> Self {
    return Franc(_amount * multiplier)
  }

  static func ==(lhs: Franc, rhs: Franc) -> Bool {
    return lhs.equals(rhs)
  }

  static func !=(lhs: Franc, rhs: Franc) -> Bool {
    return !lhs.equals(rhs)
  }
}
