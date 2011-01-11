
/**
 * 	Generated by mxmlc 2.0
 *
 *	Package:	
 *	Class: 		Login
 *	Source: 	C:\workspace\graniteds\examples\graniteds_tide_ejb3\build\swf\Login.mxml
 *	Template: 	flex2/compiler/mxml/gen/ClassDef.vm
 *	Time: 		2010.12.30 09:06:21 EST
 */

package 
{

import flash.accessibility.*;
import flash.debugger.*;
import flash.display.*;
import flash.errors.*;
import flash.events.*;
import flash.events.MouseEvent;
import flash.external.*;
import flash.filters.*;
import flash.geom.*;
import flash.media.*;
import flash.net.*;
import flash.printing.*;
import flash.profiler.*;
import flash.system.*;
import flash.text.*;
import flash.ui.*;
import flash.utils.*;
import flash.xml.*;
import mx.binding.*;
import mx.binding.IBindingClient;
import mx.containers.Form;
import mx.containers.FormItem;
import mx.containers.Panel;
import mx.controls.Button;
import mx.controls.Text;
import mx.controls.TextInput;
import mx.core.ClassFactory;
import mx.core.DeferredInstanceFromClass;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IDeferredInstance;
import mx.core.IFactory;
import mx.core.IPropertyChangeNotifier;
import mx.core.UIComponentDescriptor;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.styles.*;



		[Name]
	

//	begin class def

public class Login
	extends mx.containers.Panel
	implements mx.binding.IBindingClient
{

	//	instance variables
/**
 * @private
 **/
	public var _Login_Text2 : mx.controls.Text;

	[Bindable]
/**
 * @private
 **/
	public var password : mx.controls.TextInput;

	[Bindable]
/**
 * @private
 **/
	public var username : mx.controls.TextInput;


	//	type-import dummies


	//	Container document descriptor
private var _documentDescriptor_ : mx.core.UIComponentDescriptor = 
new mx.core.UIComponentDescriptor({
  type: mx.containers.Panel
  ,
  propertiesFactory: function():Object { return {
    childDescriptors: [
      new mx.core.UIComponentDescriptor({
        type: mx.controls.Text
        ,
        stylesFactory: function():void {
          this.textAlign = "center";
        }
        ,
        propertiesFactory: function():Object { return {
          htmlText: "<i>(Type in user/user or admin/admin)</i>"
        }}
      })
    ,
      new mx.core.UIComponentDescriptor({
        type: mx.containers.Form
        ,
        propertiesFactory: function():Object { return {
          childDescriptors: [
            new mx.core.UIComponentDescriptor({
              type: mx.containers.FormItem
              ,
              propertiesFactory: function():Object { return {
                label: "Username",
                childDescriptors: [
                  new mx.core.UIComponentDescriptor({
                    type: mx.controls.TextInput
                    ,
                    id: "username"
                  })
                ]
              }}
            })
          ,
            new mx.core.UIComponentDescriptor({
              type: mx.containers.FormItem
              ,
              propertiesFactory: function():Object { return {
                label: "Password",
                childDescriptors: [
                  new mx.core.UIComponentDescriptor({
                    type: mx.controls.TextInput
                    ,
                    id: "password"
                    ,
                    events: {
                      enter: "__password_enter"
                    }
                    ,
                    propertiesFactory: function():Object { return {
                      displayAsPassword: true
                    }}
                  })
                ]
              }}
            })
          ]
        }}
      })
    ,
      new mx.core.UIComponentDescriptor({
        type: mx.controls.Text
        ,
        id: "_Login_Text2"
        ,
        stylesFactory: function():void {
          this.textAlign = "center";
        }
      })
    ,
      new mx.core.UIComponentDescriptor({
        type: mx.controls.Button
        ,
        events: {
          click: "___Login_Button1_click"
        }
        ,
        propertiesFactory: function():Object { return {
          label: "Login"
        }}
      })
    ]
  }}
})

	//	constructor (Flex display object)
    /**
     * @private
     **/
	public function Login()
	{
		super();

		mx_internal::_document = this;

		//	our style settings
		//	initialize component styles
		if (!this.styleDeclaration)
		{
			this.styleDeclaration = new CSSStyleDeclaration();
		}

		this.styleDeclaration.defaultFactory = function():void
		{
			this.horizontalAlign = "center";
			this.verticalGap = 0;
			this.paddingTop = 8;
			this.paddingBottom = 8;
		};



		//	properties
		this.title = "Login";
		this.titleIcon = _embed_mxml_network_png_1654425576;

		//	events

	}

	//	initialize()
    /**
     * @private
     **/
	override public function initialize():void
	{
 		mx_internal::setDocumentDescriptor(_documentDescriptor_);

		var bindings:Array = _Login_bindingsSetup();
		var watchers:Array = [];

		var target:Login = this;

		if (_watcherSetupUtil == null)
		{
			var watcherSetupUtilClass:Object = getDefinitionByName("_LoginWatcherSetupUtil");
			watcherSetupUtilClass["init"](null);
		}

		_watcherSetupUtil.setup(this,
					function(propertyName:String):* { return target[propertyName]; },
					bindings,
					watchers);

		for (var i:uint = 0; i < bindings.length; i++)
		{
			Binding(bindings[i]).execute();
		}

		mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
		mx_internal::_watchers = mx_internal::_watchers.concat(watchers);


		super.initialize();
	}

	//	scripts
	//	<Script>, line 37 - 60

        import org.granite.tide.ejb.Identity;
        import org.granite.tide.events.TideResultEvent;
        import org.granite.tide.events.TideFaultEvent;
        
        [Bindable] [In]
        public var identity:Identity;
        
        [Bindable]
        public var message:String = null;
        
        
        private function tryLogin(username:String, password:String):void {
            identity.login(username, password, loginResult, loginFault);        
        }

        private function loginResult(event:TideResultEvent):void {
            message = null;
        }
        
        private function loginFault(event:TideFaultEvent):void {
        	message = event.fault.faultString;
        }
    

	//	end scripts


    //	supporting function definitions for properties, events, styles, effects
/**
 * @private
 **/
public function __password_enter(event:mx.events.FlexEvent):void
{
	tryLogin(username.text, password.text);
}

/**
 * @private
 **/
public function ___Login_Button1_click(event:flash.events.MouseEvent):void
{
	tryLogin(username.text, password.text);
}


	//	binding mgmt
    private function _Login_bindingsSetup():Array
    {
        var result:Array = [];
        var binding:Binding;

        binding = new mx.binding.Binding(this,
            function():String
            {
                var result:* = (message);
                var stringResult:String = (result == undefined ? null : String(result));
                return stringResult;
            },
            function(_sourceFunctionReturnValue:String):void
            {
				
                _Login_Text2.text = _sourceFunctionReturnValue;
            },
            "_Login_Text2.text");
        result[0] = binding;

        return result;
    }

    private function _Login_bindingExprs():void
    {
        var destination:*;
		[Binding(id='0')]
		destination = (message);
    }

    /**
     * @private
     **/
    public static function set watcherSetupUtil(watcherSetupUtil:IWatcherSetupUtil):void
    {
        (Login)._watcherSetupUtil = watcherSetupUtil;
    }

    private static var _watcherSetupUtil:IWatcherSetupUtil;



	//	embed carrier vars
[Embed(source='network.png')]
 private var _embed_mxml_network_png_1654425576:Class;

	//	end embed carrier vars

	//	binding management vars
    /**
     * @private
     **/
    mx_internal var _bindings : Array = [];
    /**
     * @private
     **/
    mx_internal var _watchers : Array = [];
    /**
     * @private
     **/
    mx_internal var _bindingsByDestination : Object = {};
    /**
     * @private
     **/
    mx_internal var _bindingsBeginWithWord : Object = {};

//	end class def
}

//	end package def
}
