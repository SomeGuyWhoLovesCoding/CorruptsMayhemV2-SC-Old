package cutscenes;

import states.LoadingState;
import backend.MusicBeatState;
import backend.Song;
import backend.Difficulty;
import flixel.addons.text.FlxTypeText;
import openfl.utils.Assets;

class EnderDialogue extends MusicBeatState {
    var text:FlxTypeText;
    var textList:Array<String> = ['Hi.'];

    var currentLine:Int = -1;

    var welcomeTxt:String = 'HI.\nWelcome to my void.';
    var typeNameBeforeEnteringTxt = 'Please type in your name before entering.';
    var songName:String = 'tutorial';
    var dialogPart:Int = 0;
    public function new(part:Int, song:String) {
        super();

        Paths.sound('dialog');
        dialogPart = part;

        // SAVE DATA CRAP
        if(!SaveData.getObject('welcomedFirstTimeInEnderDialogue')) SaveData.setObject('welcomedFirstTimeInEnderDialogue', true);
        else welcomeTxt = 'Welcome back.';

        switch(part) {
            case 0:
                textList = [
                    welcomeTxt,
                    typeNameBeforeEnteringTxt,
                    'Thank you!'
                ];
        }

        text = new FlxTypeText(0, 0, 0, "", 24, false);
        text.color = 0xFFFF0000;
		text.font = Assets.getFont(Paths.font("consola.ttf")).fontName;
		add(text);

        nextLine();

        songName = song;
    }

    override function update(elapsed:Float) {
        text.sounds = [FlxG.sound.load(Paths.sound('dialog'))]; // Keep it like that
        if (controls.ACCEPT) nextLine();
        text.screenCenter();
        super.update(elapsed);
    }

    function nextLine() {
        currentLine++;
        if (currentLine < textList.length) {
            text.resetText(textList[currentLine]);
            text.start(0.0655, false, false, null);
        } else {
            if (!PlayState.isStoryMode) PlayState.SONG = Song.loadFromJson('$songName-hard', songName);
            LoadingState.loadAndSwitchState(new PlayState());
        }
    }
}