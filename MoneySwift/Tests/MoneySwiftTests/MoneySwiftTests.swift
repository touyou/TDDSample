import Testing
@testable import MoneySwift

@Test("$5 * 2 = $10, Dollarの副作用どうする？")
func testMultiplication() async throws {
    let five: Money = Money.dollar(5)
    #expect(five.times(2).equals(Money.dollar(10)) == true, "$5 * 2 = 10")
    #expect(five.times(3).equals(Money.dollar(15)) == true, "$5 * 3 = 15")
}

@Test("equals()")
func testEquality() async throws {
    #expect(Money.dollar(5).equals(Money.dollar(5)) == true, "equals() is true")
    #expect(Money.dollar(5).equals(Money.dollar(6)) == false, "equals() is false")
    #expect(Money.franc(5).equals(Money.franc(5)) == true, "equals() is true")
    #expect(Money.franc(5).equals(Money.franc(6)) == false, "equals() is false")
    #expect(Money.franc(5).equals(Money.dollar(5)) == false, "5CHF != $5")
}

@Test("Francの掛け算")
func testFrancMultiplication() async throws {
    let five: Money = Money.franc(5)
    #expect(five.times(2).equals(Money.franc(10)) == true, "5CHF * 2 = 10CHF")
    #expect(five.times(3).equals(Money.franc(15)) == true, "5CHF * 3 = 15CHF")
}

@Test("通貨の概念")
func testCurrency() async throws {
    #expect(Money.dollar(1).currency() == "USD", "Dollarの通貨はUSD")
    #expect(Money.franc(1).currency() == "CHF", "Francの通貨はCHF")
}
