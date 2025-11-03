class Bank {
    func reduce(_ source: Expression, to: String) -> Money {
        return source.reduce(to: to)
    }
}
