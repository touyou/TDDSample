struct Sum: Expression{
  let augend: Money
  let addend: Money

  func reduce(with bank: Bank, to currency: String) -> Money {
    let amount = augend._amount + addend._amount
    return Money(amount: amount, currency: currency)
  }
}
