struct Dollar: Money {
  init(_ amount: Int) {
    self.amount = amount
  }

  private(set) var amount: Int

  func times(_ multiplier: Int) -> some Money {
    return Dollar(amount * multiplier)
  }

  static func ==(lhs: Dollar, rhs: Dollar) -> Bool {
    return lhs.equals(rhs)
  }

  static func !=(lhs: Dollar, rhs: Dollar) -> Bool {
    return !lhs.equals(rhs)
  }
}
