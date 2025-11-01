struct Dollar: Money {
  init(_ amount: Int) {
    self.amount = amount
  }

  internal let amount: Int

  func times(_ multiplier: Int) -> Dollar {
    return Dollar(amount * multiplier)
  }

  static func ==(lhs: Dollar, rhs: Dollar) -> Bool {
    return lhs.equals(rhs)
  }

  static func !=(lhs: Dollar, rhs: Dollar) -> Bool {
    return !lhs.equals(rhs)
  }
}
