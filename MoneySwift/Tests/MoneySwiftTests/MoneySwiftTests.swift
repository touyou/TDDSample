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
    #expect(Money.franc(5).equals(Money.dollar(5)) == false, "5CHF != $5")
}

@Test("通貨の概念")
func testCurrency() async throws {
    #expect(Money.dollar(1).currency() == "USD", "Dollarの通貨はUSD")
    #expect(Money.franc(1).currency() == "CHF", "Francの通貨はCHF")
}

@Test("$5 + $5 = $10")
func testSimpleAddition() async throws {
    let five = Money.dollar(5)
    let sum: Expression = five.plus(five)
    let bank = Bank()
    let reduced = bank.reduce(sum, to: "USD")
    #expect(reduced.equals(Money.dollar(10)) == true, "$5 + $5 = $10")
}

@Test("Sumクラス")
func testPlusReturnsSum() async throws {
    let five = Money.dollar(5)
    let result = five.plus(five)
    let sum = result as! Sum
    #expect(five.equals(sum.augend) == true, "augend is correct")
    #expect(five.equals(sum.addend) == true, "addend is correct")
}

@Test("reduce Sum")
func testReduceSum() async throws {
    let sum = Sum(augend: .dollar(3), addend: .dollar(4))
    let bank = Bank()
    let result = bank.reduce(sum, to: "USD")
    #expect(result.equals(Money.dollar(7)) == true, "3 + 4 = 7")
}

@Test("reduce Money")
func testReduceMoney() async throws {
    let bank = Bank()
    let result = bank.reduce(Money.dollar(1), to: "USD")
    #expect(result.equals(Money.dollar(1)) == true, "reduce Money")
}
