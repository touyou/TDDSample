class Franc: Money {
  override func times(_ multiplier: Int) -> Money {
    return Money(amount: _amount * multiplier, currency: _currency)
  }
}
