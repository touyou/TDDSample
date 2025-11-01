struct Franc: Money {
  init(amount: Int, currency: String) {
    self._amount = amount
    self._currency = currency
  }

  private(set) var _amount: Int
  private(set) var _currency: String

  func times(_ multiplier: Int) -> Money {
    return Franc(amount: _amount * multiplier, currency: _currency)
  }
}
