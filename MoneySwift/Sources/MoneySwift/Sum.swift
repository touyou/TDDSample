struct Sum: Expression{
  let augend: Expression
  let addend: Expression

  func plus(_ addend: Expression) -> Expression {
    return Sum(augend: self, addend: addend)
  }

  func reduce(with bank: Bank, to currency: String) -> Money {
    let amount = augend.reduce(with: bank, to: currency)._amount + addend.reduce(with: bank, to: currency)._amount
    return Money(amount: amount, currency: currency)
  }
}
