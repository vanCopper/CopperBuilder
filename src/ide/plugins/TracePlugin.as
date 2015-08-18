package ide.plugins
{
	import flash.text.TextFieldType;
	
	import ide.MainApp;
	import ide.events.LogEvent;
	
	import ui.core.container.Panel;
	import ui.core.controls.InputText;
	import ui.core.interfaces.IPlugin;
	
	/**
	 *
	 * @author vanCopper
	 */
	public class TracePlugin implements IPlugin
	{
		private var _mainApp:MainApp;
		private var _panel:Panel;
		private var _output:InputText;
		
		public function TracePlugin()
		{
			_output = new InputText("", true);
		}
		
		public function init(app:MainApp):void
		{
			_mainApp = app;
			
			_output.minHeight = 20;
			_output.textField.type = TextFieldType.DYNAMIC;
			
			_panel = new Panel("CONSOLE", 200, 100, false);
			_panel.minHeight = -1;
			_panel.margins = 5;
			_panel.addControl(_output);
			
			_mainApp.logTab.addPanel(_panel);
			
			onTrace("Running...", LogEvent.TRACE_NORMAL);
		}
		
		public function start():void
		{
			_mainApp.logTab.open();
		}
		
		public function onTrace(str:String, type:uint = 1000):void
		{
			var date:Date = new Date();
			var msg:String = "" + date.hours + ":"  + date.minutes + ":" + date.seconds + ":";
			if(type == LogEvent.TRACE_NORMAL)
			{
				msg += "<font color='#207020'>" + str + "</font> \n";
			}else if(type == LogEvent.TRACE_ERROR)
			{
				msg += "<font color='#F15156'>" + str + "</font> \n";
			}else
			{
				msg += "<font color='#907020'>" + str + "</font> \n";	
			}
			
			_output.textField.htmlText += msg;
			_output.textField.scrollV = _output.textField.maxScrollV;
		}
	}
}