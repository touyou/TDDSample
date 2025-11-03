struct Sum: Expression{
  let augend: Money
  let addend: Money

  func reduce(with bank: Bank, to currency: String) -> Money {
    let amount = augend.reduce(with: bank, to: currency)._amount + addend.reduce(with: bank, to: currency)._amount
    return Money(amount: amount, currency: currency)
  }
}
