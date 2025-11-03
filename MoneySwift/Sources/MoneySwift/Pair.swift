struct Pair: Hashable {
  let from: String
  let to: String

  static func ==(lhs: Pair, rhs: Pair) -> Bool {
    return lhs.from == rhs.from && lhs.to == rhs.to
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(0)
  }
}
