/**
 * Generated by Gas3 v2.2.0 (Granite Data Services).
 *
 * WARNING: DO NOT CHANGE THIS FILE. IT MAY BE OVERWRITTEN EACH TIME YOU USE
 * THE GENERATOR. INSTEAD, EDIT THE INHERITED CLASS (PeopleService.as).
 */

package test.granite.cdi.service {

    import flash.utils.flash_proxy;
    import org.granite.tide.BaseContext;
    import org.granite.tide.Component;
    import org.granite.tide.ITideResponder;
    import test.granite.cdi.entity.Person;
    
    use namespace flash_proxy;

    public class PeopleServiceBase extends Component {

        public function find(arg0:Person, arg1:int, arg2:int, arg3:Array, arg4:Array, resultHandler:Object = null, faultHandler:Function = null):void {
            if (faultHandler != null)
                callProperty("find", arg0, arg1, arg2, arg3, arg4, resultHandler, faultHandler);
            else if (resultHandler is Function || resultHandler is ITideResponder)
                callProperty("find", arg0, arg1, arg2, arg3, arg4, resultHandler);
            else if (resultHandler == null)
                callProperty("find", arg0, arg1, arg2, arg3, arg4);
            else
                throw new Error("Illegal argument to remote call (last argument should be Function or ITideResponder): " + resultHandler);
        }
    }
}
