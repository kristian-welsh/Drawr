package unittests{
    import asunit.textui.TestRunner;
    
    public class MyTestRunner extends TestRunner {

        public function MyTestRunner() {
            start(AllTests, null, TestRunner.SHOW_TRACE);
        }
    }
}
