// DO NOT TOUCH!! THIS WAS MADE FOR CORRUPT'S MAYHEM!!
package backend.corruptMayhem;

class StoryData {
	public static var defaultList:Array<Dynamic> = ['Machinery'];
	public static var list:Array<Dynamic> = ['Machinery'];

	public static function addObject(name:String):Void {
		list.push(name);
		saveObjects();
	}

	public static function removeObject(name:String):Void {
		list.remove(name);
		saveObjects();
	}

	public static function saveObjects():Void {
		FlxG.save.data.storyModeChapters = list;
		//trace('Saved to: ' + FlxG.save.data.storyModeChapters);
	}

	public static function setSavedObjects():Void {
		list = FlxG.save.data.storyModeChapters;
		//trace('Current save: $list');
	}

	public static function check(story:String):Null<String> {
		return switch(story) {
			case 'Machinery': return 'Invention';
			case 'Invention': return 'Mistake';
			case 'Mistake': return 'End';
			default: return null;
		}
	}
}