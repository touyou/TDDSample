protocol Expression {
  func reduce(with bank: Bank, to currency: String) -> Money
}
