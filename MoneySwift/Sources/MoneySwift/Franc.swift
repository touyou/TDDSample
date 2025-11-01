struct Franc {
  init(_ amount: Int) {
    self.amount = amount
  }

  private let amount: Int

  func times(_ multiplier: Int) -> Franc {
    return Franc(amount * multiplier)
  }

  private func equals(_ other: Any) -> Bool {
    let otherFranc = other as! Franc
    return amount == otherFranc.amount
  }

  static func ==(lhs: Franc, rhs: Franc) -> Bool {
    return lhs.equals(rhs)
  }

  static func !=(lhs: Franc, rhs: Franc) -> Bool {
    return !lhs.equals(rhs)
  }
}
