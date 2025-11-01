struct Sum: Expression{
  let augend: Money
  let addend: Money

  func reduce(to: String) -> Money {
    let amount = augend._amount + addend._amount
    return Money(amount: amount, currency: to)
  }
}
