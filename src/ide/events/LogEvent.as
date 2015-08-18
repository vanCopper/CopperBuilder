package ide.events
{
	import flash.events.Event;
	
	/**
	 *
	 * @author vanCopper
	 */
	public class LogEvent extends Event
	{
		public static const TRACE_NORMAL:uint = 0;
		public static const TRACE_ERROR:uint = 1;
		public function LogEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}