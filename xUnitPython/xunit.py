class TestResult:
    def __init__(self):
        self.runCount = 0
        self.errorCount = 0

    def testStarted(self):
        self.runCount = self.runCount + 1

    def testFailed(self):
        self.errorCount = self.errorCount + 1

    def summary(self):
        return "%d run, %d failed" % (self.runCount, self.errorCount)

class TestCase:
    def __init__(self, name, result=TestResult()):
        self.name = name
        self.result = result

    def setUp(self):
        pass

    def tearDown(self):
        pass

    def run(self):
        self.result.testStarted()
        try:
            self.setUp()
        except Exception as e:
            self.result.testFailed()
            print(f"setUp failed: {self.name} {e}")
        try:
            method = getattr(self, self.name)
            method()
        except Exception as e:
            self.result.testFailed()
            print(f"test method failed: {self.name} {e}")
        self.tearDown()

class TestSuite:
    def __init__(self):
        self.tests = []
        self.result = TestResult()

    def add(self, test):
        test.result = self.result
        self.tests.append(test)

    def summary(self):
        return self.result.summary()

    def run(self):
        for test in self.tests:
            test.run()


class WasRun(TestCase):
    def setUp(self):
        self.log = "setUp "

    def testMethod(self):
        self.log = self.log + "testMethod "

    def testBrokenMethod(self):
        raise Exception

    def tearDown(self):
        self.log = self.log + "tearDown "

class WasFailedSetUp(TestCase):
    def setUp(self):
        raise Exception

    def testMethod(self):
        pass

class TestCaseTest(TestCase):
    def testTemplateMethod(self):
        test = WasRun("testMethod")
        test.run()
        assert("setUp testMethod tearDown " == test.log)

    def testResult(self):
        test = WasRun("testMethod")
        test.run()
        assert("1 run, 0 failed" == test.result.summary())

    def testFailedResult(self):
        test = WasRun("testBrokenMethod")
        test.run()
        assert("1 run, 1 failed" == test.result.summary())

    def testFailedResultFormatting(self):
        result = TestResult()
        result.testStarted()
        result.testFailed()
        assert("1 run, 1 failed" == result.summary())

    def testSuite(self):
        suite = TestSuite()
        suite.add(WasRun("testMethod"))
        suite.add(WasRun("testBrokenMethod"))
        suite.run()
        assert("2 run, 1 failed" == suite.summary())

    def testSetUpError(self):
        test = WasFailedSetUp("testMethod")
        test.run()
        assert("1 run, 1 failed" == test.result.summary())

suite = TestSuite()
suite.add(TestCaseTest("testTemplateMethod"))
suite.add(TestCaseTest("testResult"))
suite.add(TestCaseTest("testFailedResult"))
suite.add(TestCaseTest("testFailedResultFormatting"))
suite.add(TestCaseTest("testSuite"))
suite.add(TestCaseTest("testSetUpError"))
suite.run()
print(suite.summary())
