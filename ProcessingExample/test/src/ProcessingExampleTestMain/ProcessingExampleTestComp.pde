// -*- Java -*-
// <rtc-template block="description">
/*!
 * @file ProcessingExampleTestComp.java
 * @brief Standalone component
 * @date $Date$
 *
 * @author 作成者・連絡先
 *
 * ライセンス、使用条件
 *
 * $Id$
 */
// </rtc-template>

import jp.go.aist.rtm.RTC.Manager;
import jp.go.aist.rtm.RTC.ModuleInitProc;
import jp.go.aist.rtm.RTC.RTObject_impl;
import jp.go.aist.rtm.RTC.util.Properties;

/*!
 * @class ProcessingExampleTestComp
 * @brief Standalone component Class
 *
 */
public class ProcessingExampleTestComp implements ModuleInitProc {

    public void myModuleInit(Manager mgr) {
      Properties prop = new Properties(processionexapmpletest_conf);
      mgr.registerFactory(prop, new ProcessingExampleTest(), new ProcessingExampleTest());

      // Create a component
      RTObject_impl comp = mgr.createComponent("ProcessingExampleTest");
      if( comp==null ) {
    	  System.err.println("Component create failed.");
    	  System.exit(0);
      }
      
      // Example
      // The following procedure is examples how handle RT-Components.
      // These should not be in this function.

//      // Get the component's object reference
//      Manager manager = Manager.instance();
//      RTObject rtobj = null;
//      try {
//          rtobj = RTObjectHelper.narrow(manager.getPOA().servant_to_reference(comp));
//      } catch (ServantNotActive e) {
//          e.printStackTrace();
//      } catch (WrongPolicy e) {
//          e.printStackTrace();
//      }
//
//      // Get the port list of the component
//      PortListHolder portlist = new PortListHolder();
//      portlist.value = rtobj.get_ports();
//
//      // getting port profiles
//      System.out.println( "Number of Ports: " );
//      System.out.println( portlist.value.length );
//      for( int intIdx=0;intIdx<portlist.value.length;++intIdx ) {
//          Port port = portlist.value[intIdx];
//          System.out.println( "Port" + intIdx + " (name): ");
//          System.out.println( port.get_port_profile().name );
//        
//          PortInterfaceProfileListHolder iflist = new PortInterfaceProfileListHolder();
//          iflist.value = port.get_port_profile().interfaces;
//          System.out.println( "---interfaces---" );
//          for( int intIdx2=0;intIdx2<iflist.value.length;++intIdx2 ) {
//              System.out.println( "I/F name: " );
//              System.out.println( iflist.value[intIdx2].instance_name  );
//              System.out.println( "I/F type: " );
//              System.out.println( iflist.value[intIdx2].type_name );
//              if( iflist.value[intIdx2].polarity==PortInterfacePolarity.PROVIDED ) {
//                  System.out.println( "Polarity: PROVIDED" );
//              } else {
//                  System.out.println( "Polarity: REQUIRED" );
//              }
//          }
//          System.out.println( "---properties---" );
//          NVUtil.dump( new NVListHolder(port.get_port_profile().properties) );
//          System.out.println( "----------------" );
//      }
    }

}
