// DO NOT TOUCH!! THIS WAS MADE FOR CORRUPT'S MAYHEM!!
package backend.corruptMayhem;

class SaveData {
	// Default objects for Corrupt's Mayhem Save Data
	public static var defaultObjects:Map<String, Bool> = [
		'inEnderDialogue1' => false
	];

	// Put your value as a bool
	public static var objects:Map<String, Bool> = [
		'inEnderDialogue1' => false
	];

	public static function saveObjects():Void {
		FlxG.save.data.saves = objects;
		//trace(FlxG.save.data.saves);
	}

	public static function setSavedObjects():Void {
		objects = FlxG.save.data.saves;
		//trace(FlxG.save.data.saves);
	}

	public static function addObject(?obj = 'null', ?value = false):Void {
		if (!checkObjectExists(obj, false)) {
			objects.set(obj, value);
			trace('$obj added, set to $value');
		}
		saveObjects();
	}

	public static function setObject(?obj = 'null', ?value = false):Void {
		if (checkObjectExists(obj, true)) {
			objects.set(obj, value);
			trace('$obj set to $value');
		}
		else addObject(obj, value);
		saveObjects();
	}

	public static function getObject(?obj = 'null'):Bool {
		if (checkObjectExists(obj, true)) return objects.get(obj);
		else return false;
	}

	public static function checkObjectExists(?obj = 'null', ?primary = false):Bool {
		return (primary && objects.get(obj) != null) && objects.exists(obj);
	}
}