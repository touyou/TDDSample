class Bank {
    func reduce(_ source: Expression, to: String) -> Money {
        let sum = source as! Sum
        let amount = sum.augend._amount + sum.addend._amount
        return Money(amount: amount, currency: to)
    }
}
