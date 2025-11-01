class Franc: Money {
  override func times(_ multiplier: Int) -> Money {
    return Franc(amount: _amount * multiplier, currency: _currency)
  }
}
