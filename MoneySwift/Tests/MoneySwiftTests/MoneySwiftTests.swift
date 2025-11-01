import Testing
@testable import MoneySwift

@Test("$5 * 2 = $10, Dollarの副作用どうする？")
func testMultiplication() async throws {
    let five: Money = MoneyFactory.dollar(5)
    #expect(five.times(2).equals(MoneyFactory.dollar(10)) == true, "$5 * 2 = 10")
    #expect(five.times(3).equals(MoneyFactory.dollar(15)) == true, "$5 * 3 = 15")
}

@Test("equals()")
func testEquality() async throws {
    #expect(MoneyFactory.dollar(5).equals(MoneyFactory.dollar(5)) == true, "equals() is true")
    #expect(MoneyFactory.dollar(5).equals(MoneyFactory.dollar(6)) == false, "equals() is false")
    #expect(MoneyFactory.franc(5).equals(MoneyFactory.franc(5)) == true, "equals() is true")
    #expect(MoneyFactory.franc(5).equals(MoneyFactory.franc(6)) == false, "equals() is false")
    #expect(MoneyFactory.franc(5).equals(MoneyFactory.dollar(5)) == false, "5CHF != $5")
}

@Test("Francの掛け算")
func testFrancMultiplication() async throws {
    let five: Money = MoneyFactory.franc(5)
    #expect(five.times(2).equals(MoneyFactory.franc(10)) == true, "5CHF * 2 = 10CHF")
    #expect(five.times(3).equals(MoneyFactory.franc(15)) == true, "5CHF * 3 = 15CHF")
}
