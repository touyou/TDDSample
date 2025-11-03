class Bank {
    var rates: [Pair: Int] = [:]

    func reduce(_ source: Expression, to: String) -> Money {
        return source.reduce(with: self, to: to)
    }

    func addRate(from: String, to: String, rate: Int) {
        rates[Pair(from: from, to: to)] = rate
    }

    func rate(from: String, to: String) -> Int {
        if from == to {
            return 1
        }
        return rates[Pair(from: from, to: to)] ?? 0
    }
}
