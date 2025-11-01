class Bank {
    func reduce(_ source: Expression, to: String) -> Money {
        let sum = source as! Sum
        return sum.reduce(to: to)
    }
}
