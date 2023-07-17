// DO NOT TOUCH!! THIS WAS MADE FOR CORRUPT'S MAYHEM!!
package backend.corruptMayhem;

class FreeplayData { // Was named "FreeplaySongs"
	public static var defaultList:Array<Dynamic> = [
		['Murderer', 'corrupt', 0xFF999999],
		['Peek a Kill', 'corrupt', 0xFF999999],
		['Unsolicited', 'corrupt', 0xFF777777]//,
		//['Test Void', 'test', 0x00000000]
	];

	// Put your value as a bool /j
	public static var list:Array<Dynamic> = [
		['Murderer', 'corrupt', 0xFF999999],
		['Peek a Kill', 'corrupt', 0xFF999999],
		['Unsolicited', 'corrupt', 0xFF777777]//,
		//['Test Void', 'test', 0x00000000]
	];

	public static function addObject(name:String, character:String, color:Int):Void {
		list.push([name, character, color]);
		saveObjects();
	}

	public static function removeObject(name:String, character:String, color:Int):Void {
		list.remove([name, character, color]);
		saveObjects();
	}

	public static function saveObjects():Void {
		FlxG.save.data.freeplaySongs = list;
		//trace('Saved to: ' + FlxG.save.data.freeplaySongs);
	}

	public static function setSavedObjects():Void {
		list = FlxG.save.data.freeplaySongs;
		//trace('Current save: $list');
	}

	public static function check(story:String):Array<Dynamic> {
		return switch(story) {
			case 'Invention': return [
				['Hello Bitch', 'corrupt', 0xFF888888],
				['Imminent', 'corrupt-frustrated', 0xFF888888],
				['Occlusal', 'corrupt-infected', 0xFF888888],
				['Freedom', 'corrupt-infected', 0xFF888888]
			];
			case 'Mistake': return [
				['Industrywide', 'corrupt', 0xFF666666],
				['Machine', 'corrupt', 0xFF666666],
				['Terminal', 'corrupt-frustrated', 0xFF555555],
				['Obstruction', 'corrupt-corrupted', 0xFF444444]
			];
			case 'End': return [
				['Excursion', 'ender', 0x00000000],
				['Extrication', 'ender', 0x00000000],
				['Restoration', 'corrupt-empty', 0x00000000]
			];
			default: return [];
		}
	}
}