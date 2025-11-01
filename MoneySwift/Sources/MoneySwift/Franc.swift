struct Franc: Money {
  init(_ amount: Int) {
    self.amount = amount
  }

  private(set) var amount: Int

  func times(_ multiplier: Int) -> Self {
    return Franc(amount * multiplier)
  }

  static func ==(lhs: Franc, rhs: Franc) -> Bool {
    return lhs.equals(rhs)
  }

  static func !=(lhs: Franc, rhs: Franc) -> Bool {
    return !lhs.equals(rhs)
  }
}
