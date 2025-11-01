class Dollar: Money {
  override func times(_ multiplier: Int) -> Money {
    return Dollar(amount: _amount * multiplier, currency: _currency)
  }
}
