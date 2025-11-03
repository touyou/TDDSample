protocol Expression {
  func plus(_ addend: Expression) -> Expression
  func reduce(with bank: Bank, to currency: String) -> Money
}
