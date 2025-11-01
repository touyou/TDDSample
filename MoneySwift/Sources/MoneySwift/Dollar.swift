struct Dollar: Money {
  init(_ amount: Int) {
    self.amount = amount
  }

  private(set) var amount: Int

  func times(_ multiplier: Int) -> Self {
    return Dollar(amount * multiplier)
  }

  func currency() -> String {
    return "USD"
  }

  static func ==(lhs: Dollar, rhs: Dollar) -> Bool {
    return lhs.equals(rhs)
  }

  static func !=(lhs: Dollar, rhs: Dollar) -> Bool {
    return !lhs.equals(rhs)
  }
}
