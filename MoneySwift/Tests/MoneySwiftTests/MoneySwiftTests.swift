import Testing
@testable import MoneySwift

@Test("$5 * 2 = $10, Dollarの副作用どうする？")
func testMultiplication() async throws {
    let five = Dollar(5)
    #expect(five.times(2) == Dollar(10), "$5 * 2 = 10")
    #expect(five.times(3) == Dollar(15), "$5 * 3 = 15")
}

@Test("equals()")
func testEquality() async throws {
    #expect(Dollar(5) == Dollar(5), "equals() is true")
    #expect(Dollar(5) != Dollar(6), "equals() is false")
}

@Test("Francの掛け算")
func testFrancMultiplication() async throws {
    let five = Franc(5)
    #expect(five.times(2) == Franc(10), "5CHF * 2 = 10CHF")
    #expect(five.times(3) == Franc(15), "5CHF * 3 = 15CHF")
}
