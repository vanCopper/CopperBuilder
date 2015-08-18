package ui.core.interfaces {
	import ide.MainApp;

	

	public interface IPlugin {
		function init(app : MainApp) : void;
		function start() : void;
	}
}
