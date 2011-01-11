package org.granite.tide.test
{
    import flexunit.framework.TestCase;
    
    import mx.rpc.Fault;
    
    import org.granite.tide.InvalidContextError;
    import org.granite.tide.events.TideResultEvent;
    import org.granite.tide.seam.Context;
    
    
    public class TestSeamDestroyConversation extends TestCase
    {
        public function TestSeamDestroyConversation() {
            super("testSeamDestroyConversation");
        }
        
        private var _ctx:Context;
        
        
        private var _name:String;
        
        public override function setUp():void {
            super.setUp();
            
            MockSeam.reset();
            _ctx = MockSeam.getInstance().getSeamContext();
            MockSeam.getInstance().token = new MockConversationAsyncToken();
        }
        
        
        public function testSeamDestroyConversation():void {
            _ctx.userHome.selectUser(addAsync(selectResult, 1000));
        }
        
        private function selectResult(event:TideResultEvent):void {
            event.context.user = event.context.user;
            event.context.userHome.updateUser(addAsync(updateResult, 1000));
        }
        
        private function updateResult(event:TideResultEvent):void {
            assertEquals("test", event.context.user.name);
            
            var finished:Boolean = false; 
            try { 
                event.context.userHome.updateUser();
            }
            catch (e:InvalidContextError) {
                finished = true;
            }
            
            assertTrue(finished);
        }
    }
}


import flash.utils.Timer;
import flash.events.TimerEvent;
import mx.rpc.AsyncToken;
import mx.rpc.IResponder;
import mx.messaging.messages.IMessage;
import mx.messaging.messages.ErrorMessage;
import mx.rpc.Fault;
import mx.rpc.events.FaultEvent;
import mx.collections.ArrayCollection;
import mx.rpc.events.AbstractEvent;
import mx.rpc.events.ResultEvent;
import org.granite.tide.invocation.InvocationCall;
import org.granite.tide.invocation.InvocationResult;
import org.granite.tide.invocation.ContextUpdate;
import mx.messaging.messages.AcknowledgeMessage;
import org.granite.tide.test.MockSeamAsyncToken;
import org.granite.tide.test.User;
import org.granite.tide.Tide;
import org.granite.tide.seam.Seam;
import org.granite.tide.test.MockSeam;


class MockConversationAsyncToken extends MockSeamAsyncToken {
    
    function MockConversationAsyncToken() {
        super(null);
    }
    
    protected override function buildResponse(call:InvocationCall, componentName:String, op:String, params:Array):AbstractEvent {
        var user:User = new User();
        var re:ResultEvent;
        if (componentName == "userHome" && op == "selectUser") {
            user.username = "toto";
            re = buildResult(null, [[ "user", user, true ]]);
            re.result.scope = 2;
            re.message.headers[Tide.IS_LONG_RUNNING_CONVERSATION_TAG] = true;
            re.message.headers[Tide.CONVERSATION_TAG] = "23";
            return re;
        }
        else if (componentName == "userHome" && op == "updateUser") {
            var u:User = call.updates.getItemAt(0).value;
            user.username = u.username;
            user.name = "test";
            re = buildResult(null, [[ "user", user, true ]]);
            re.message.headers[Tide.WAS_LONG_RUNNING_CONVERSATION_ENDED_TAG] = true;
            re.result.scope = 2;
            return re;
        }
        
        return buildFault("Server.Error");
    }
}
