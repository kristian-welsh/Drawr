package unittests {
	import asunit.textui.TestRunner;
	
	[SWF(width="800",height="600",frameRate="60",backgroundColor="#FFFFFF")]
	public class MyTestRunner extends TestRunner {
		public function MyTestRunner() {
			start(AllTests, null, TestRunner.SHOW_TRACE);
		}
	}
}
