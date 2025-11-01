protocol Money {
  var amount: Int { get }
}

extension Money {
  func equals(_ other: Any) -> Bool {
    let money: Money = other as! Money
    return amount == money.amount
  }
}
