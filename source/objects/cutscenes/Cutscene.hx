package objects.cutscenes;

import flixel.FlxG;
import object.cutscenes.DialogBox;
import flixel.addons.text.FlxTypeText;

class Cutscene extends FlxSubState {
    public var dialogBox:DialogBox;

    public function new(skin:String) {
        super();
        dBoxSkin = skin;
        drawDialogueBoxSkin();
		cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];
    }

    public function create() {
        dialogBox = new DialogBox(dBoxSkin, dialogText);
        super.create();
    }

    public function update(elapsed:Float) {
        super.update(elapsed);
    }

    // DIALOG STUFF

    public function goToNextLine() {
        dialogBox.typeNextLine(dialogText[currentLine][0]);
        dialogBox.nameText.dialogText[currentLine][0]);
    }

    // DIALOG VARIABLES
    var curLine:Int = -1;
    public var dialogText:Array<Array<String>> = [
        ["HELP ME! HELP ME!", "Master Corrupt"],
        ["Hold on, I'm grabbing my scissors real quick.", "Corrupt"],
        ["Okay.", "Master Corrupt"],
        ["Don't forget to bring me some pizza too.", "Master Corrupt"],
        ["I really need some pizza in me.", "Master Corrupt"]
    ];
}