import Testing
@testable import MoneySwift

@Test("$5 * 2 = $10, Dollarの副作用どうする？")
func testMultiplication() async throws {
    let five = MoneyFactory.dollar(5)
    #expect(five.times(2) as! Dollar == Dollar(10), "$5 * 2 = 10")
    #expect(five.times(3) as! Dollar == Dollar(15), "$5 * 3 = 15")
}

@Test("equals()")
func testEquality() async throws {
    #expect(Dollar(5) == Dollar(5), "equals() is true")
    #expect(Dollar(5) != Dollar(6), "equals() is false")
    #expect(Franc(5) == Franc(5), "equals() is true")
    #expect(Franc(5) != Franc(6), "equals() is false")
    #expect(Franc(5).equals(Dollar(5)) == false, "5CHF != $5")
}

@Test("Francの掛け算")
func testFrancMultiplication() async throws {
    let five = Franc(5)
    #expect(five.times(2) as! Franc == Franc(10), "5CHF * 2 = 10CHF")
    #expect(five.times(3) as! Franc == Franc(15), "5CHF * 3 = 15CHF")
}
