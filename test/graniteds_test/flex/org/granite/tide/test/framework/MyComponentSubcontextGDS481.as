/**
 * Generated by Gas3 v1.1.0 (Granite Data Services) on Sat Jul 26 17:58:20 CEST 2008.
 *
 * WARNING: DO NOT CHANGE THIS FILE. IT MAY BE OVERRIDDEN EACH TIME YOU USE
 * THE GENERATOR. CHANGE INSTEAD THE INHERITED CLASS (Contact.as).
 */

package org.granite.tide.test.framework {
	
	import org.granite.tide.Subcontext;
	

	[Name("subcontext.myComponentSubcontext")]
    public class MyComponentSubcontextGDS481 {
    	
    	[Out]
    	public var myComponentOutjected:MyComponentOutjectedGDS481 = new MyComponentOutjectedGDS481();
    	
    	public var triggered:Boolean = false;
    	
    	[Observer]
    	public function eventHandler(event:MyEvent):void {
    		triggered = true;
    	}
    }
}
