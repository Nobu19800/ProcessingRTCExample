import jp.go.aist.rtm.RTC.Manager;
import OpenRTM.ExtTrigExecutionContextService;
import jp.go.aist.rtm.RTC.port.CorbaConsumer;
import RTC.ExecutionContext;

Manager manager;
ExtTrigExecutionContextService ec0Ref;

public void setup() {
  // Initialize manager
  String[] args = {"processing", "-o", "exec_cxt.periodic.type:jp.go.aist.rtm.RTC.executionContext.OpenHRPExecutionContext"};
  manager = Manager.init(args);
  // Set module initialization proceduer
  // This procedure will be invoked in activateManager() function.
  ProcessingExampleTestComp init = new ProcessingExampleTestComp();
  manager.setModuleInitProc(init);
  // Activate manager and register to naming service
  manager.activateManager();
  
  // run the manager in non-blocking mode
  // runManager(true) is the default.
  manager.runManager(true);
  
  CorbaConsumer<ExtTrigExecutionContextService> ec0c = new CorbaConsumer<ExtTrigExecutionContextService>(ExtTrigExecutionContextService.class);
  ExecutionContext ec0 =  manager.getComponent("ProcessingExampleTest0").getExecutionContext(0);
  ec0c.setObject(ec0);
  ec0Ref = ec0c._ptr();

}


public void draw() {
  ec0Ref.tick();
}
