package ide
{
	import flash.desktop.NativeApplication;
	import flash.display.NativeMenu;
	import flash.display.NativeMenuItem;
	import flash.display.NativeWindow;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import ide.plugins.HierarchyPlugin;
	import ide.plugins.PropertiesPlugin;
	import ide.plugins.ScenePlugin;
	import ide.plugins.TracePlugin;
	
	import ui.core.container.Box;
	import ui.core.controls.TabControl;
	import ui.core.interfaces.IPlugin;
	
	/**
	 * 主界面
	 * @author vanCopper
	 */
	public class MainApp extends Sprite
	{
		private var _uiLayer:Sprite;		// UI层
		private var _popLayer:Sprite;		// POP层
		private var _tipLayer:Sprite;		// Tip层
		
		private var _ide:Box;				//主界面容器
		private var _left:Box;				//左侧容器
		private var _center:Box;			//中间容器
		private var _right:Box;				//右侧容器
		private var _menu:NativeMenu; 		// menu
		
		private var _sceneTab:TabControl;	//场景面板
		private var _logTab:TabControl;		//Log面板
		private var _leftTab:TabControl;	//左侧面板
		private var _rightTab:TabControl;	//右侧面板
		
		public function MainApp()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
		}
		
		private function onAddToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			stage.addEventListener(Event.RESIZE, onResize);
			App.stage = stage;
			initUI();
			
			initPlugin(new TracePlugin());		// 输出
			initPlugin(new ScenePlugin());		// 场景
			initPlugin(new HierarchyPlugin());	// 层级
			initPlugin(new PropertiesPlugin()); // 属性
		}
		
		private function initUI():void
		{
			_menu = new NativeMenu();
			
			_uiLayer = new Sprite();
			addChild(_uiLayer);
			
			_popLayer = new Sprite();
			addChild(_popLayer);
			
			_tipLayer = new Sprite();
			_tipLayer.mouseChildren = _tipLayer.mouseEnabled = false;
			addChild(_tipLayer);
			
			_ide = new Box();
			_ide.orientation = Box.HORIZONTAL;
			_ide.allowResize = true;
			_ide.flexible = 1;
			_ide.space = 0;
			_ide.height = 400;
			_uiLayer.addChild(_ide.view);
			
			// 左侧容器
			_left = new Box();
			_left.minWidth = 10;
			_left.orientation = Box.HORIZONTAL;
			_left.allowResize = true;
			_left.showBorders = true;
			_ide.addControl(_left);
			
			// 中间容器
			_center = new Box();
			_center.minWidth = 900;
			_center.orientation = Box.VERTICAL;
			_center.allowResize = true;
			_center.showBorders = true;
			_ide.addControl(_center);
			
			//右侧容器
			_right = new Box();
			_right.minWidth = 10;
			_right.orientation = Box.HORIZONTAL;
			_right.allowResize = true;
			_right.showBorders = true;
			_ide.addControl(_right);
			
			
			//场景面板
			_sceneTab = new TabControl();
			_sceneTab.minHeight = 600;
			_center.addControl(_sceneTab);
			
			//Log面板
			_logTab = new TabControl();
			_logTab.minHeight = 10;
			_center.addControl(_logTab);
			
			//左侧面板
			_leftTab = new TabControl();
			_leftTab.minWidth = 10;
			_left.addControl(_leftTab);
			
			//右侧面板
			_rightTab = new TabControl();
			_rightTab.minWidth = 10;
			_right.addControl(_rightTab);
			
			addMenu("Help/About");
			onResize(null);
		}
		
		private function onResize(e:Event):void
		{
			//TODO:
			if(_ide)
			{
				_ide.width = this.stage.stageWidth;
				_ide.height = this.stage.stageHeight;
				_ide.update();
				_ide.draw();
			}
		}
		
		private function initPlugin(plugin:IPlugin):void
		{
			plugin.init(this);
			plugin.start();
		}
		
		/**
		 * 添加menu 
		 * @param label			labels
		 * @param callback		callback
		 * @return 
		 * 
		 */		
		public function addMenu(label : String = null, callback : Function = null) : NativeMenuItem
		{
			var labels : Array = label.split("/");
			if (labels.length == 0) 
			{
				throw new Error("Invalud menu path.");
			}
			var menu : NativeMenu = this._menu;
			while (labels.length) 
			{
				var txt  : String = labels.shift();
				var item : NativeMenuItem = null;
				for each (var mi : NativeMenuItem in menu.items) 
				{
					if (mi.name == txt || mi.label == txt)
					{
						item = mi;
					}
				}
				if (!item) 
				{
					item = menu.addItem(new NativeMenuItem(txt));
				}
				if (labels.length) 
				{
					if (!item.submenu)
					{
						item.submenu = new NativeMenu();
					}
				} else {
					item.name = label;
					if (callback != null) 
					{
						item.addEventListener(Event.SELECT, callback);
					}
				}
				menu = item.submenu;
			}
			if (NativeApplication.supportsMenu)
			{
				NativeApplication.nativeApplication.menu = this._menu;
			} else if (NativeWindow.supportsMenu)
			{
				stage.nativeWindow.menu = this._menu;
			}
			return item;
		}

		public function get logTab():TabControl
		{
			return _logTab;
		}
		
		public function get sceneTab():TabControl
		{
			return _sceneTab;
		}
		
		public function get leftTab():TabControl
		{
			return _leftTab;
		}
		
		public function get rightTab():TabControl
		{
			return _rightTab;
		}

	}
}