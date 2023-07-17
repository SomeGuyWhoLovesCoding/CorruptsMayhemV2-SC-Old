package cutscenes;

import states.LoadingState;
import backend.MusicBeatSubstate;
import backend.Song;
import backend.Difficulty;
import flixel.addons.text.FlxTypeText;
import openfl.utils.Assets;
import flixel.FlxSprite;
import flixel.text.FlxText;

// Fade stuff
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.util.FlxTimer;

import flixel.util.FlxColor;

class CorruptDialogue extends MusicBeatSubstate {
    var dialogueBG:FlxSprite;
    var dialogueBox:FlxSprite;
    var nameText:FlxText;
    var text:FlxTypeText;
    var textList:Array<Array<String>> = [['Hi.', 'Corrupt']];

    var currentLine:Int = -1;

    var songName:String = 'tutorial';
    var dialogPart:Int = 0;

    public function new(song:String) {
        super();

        textList = [
            ["Hey! Who's there?", "???", "neutral"],
            ["Boyfriend, you have to be careful.", "GF", "worried"],
            ["An evil person could be in the building.", "GF", "worried"],
            ["Girlfriend, You don't have to worry about it. I'm just gonna do a solo before something happens.", "BF", "brave"],
            ["Okay then.", "GF", "glad-angry"]
        ];//Dialogues.checkExisting(song);

        songName = song;
    }

    override function create() {
        dialogueBG = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
        dialogueBG.alpha = 0;
        add(dialogueBG);

        dialogueBox = new FlxSprite().loadGraphic(Paths.image('dialogueStuff/Box'));
        dialogueBox.screenCenter(X);
        dialogueBox.y = FlxG.height - (dialogueBox.height + 60);
        dialogueBox.alpha = 0;
        add(dialogueBox);

        nameText = new FlxText(dialogueBox.x + 22, dialogueBox.y + 22, Std.int(dialogueBox.width - 44), "...", 36);
        nameText.font = Assets.getFont(Paths.font("consola.ttf")).fontName;
        nameText.color = 0xFF171717;
        nameText.bold = true;
        nameText.alpha = 0;
        add(nameText);

        text = new FlxTypeText(nameText.x, nameText.y + nameText.height, Std.int(dialogueBox.width - 44), "", 24, false);
        text.color = 0xFF171717;
		text.font = Assets.getFont(Paths.font("consola.ttf")).fontName;
        text.alpha = 0;
		add(text);

        startDialogue();
    }

    var dialogueStarted:Bool = false;
    function startDialogue() {
        FlxTween.tween(dialogueBG, {alpha: 0.15}, 2.4, {ease: FlxEase.sineInOut});
        FlxTween.tween(dialogueBox, {alpha: 1}, 2.4, {ease: FlxEase.sineInOut});
        FlxTween.tween(nameText, {alpha: 1}, 2.4, {ease: FlxEase.sineInOut});
        FlxTween.tween(text, {alpha: 1}, 2.4, {ease: FlxEase.sineInOut});
        new FlxTimer().start(2.4, function(_) {
            if (!dialogueStarted) nextLine();
            dialogueStarted = true;
        });
    }

    function nextLine() {
        currentLine++;
        if (!dialogueEnded) FlxG.sound.play(Paths.sound('clickText', 'shared')); // Leave it like that
        if (currentLine < textList.length) {
            text.resetText(textList[currentLine][0]);
            text.start(0.055, false, false, null);
            nameText.text = textList[currentLine][1];
        } else {
            if (!dialogueEnded) endDialogue();
        }
    }

    var dialogueEnded:Bool = false;
    function endDialogue() {
        if (!dialogueEnded) {
            FlxTween.tween(dialogueBG, {alpha: 0}, 1, {ease: FlxEase.sineInOut});
            FlxTween.tween(dialogueBox, {alpha: 0}, 1, {ease: FlxEase.sineInOut});
            FlxTween.tween(nameText, {alpha: 0}, 1, {ease: FlxEase.sineInOut});
            FlxTween.tween(text, {alpha: 0}, 1, {ease: FlxEase.sineInOut});
            new FlxTimer().start(1, function(_) {
                if (!PlayState.isStoryMode) PlayState.SONG = Song.loadFromJson('$songName-hard', songName);
                else PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0] + Difficulty.getFilePath(), PlayState.storyPlaylist[0]);
                LoadingState.loadAndSwitchState(new PlayState());
            });
            dialogueEnded = true;
        }
    }

    override function update(elapsed:Float) {
        text.sounds = [FlxG.sound.load(Paths.sound('dialog'))]; // Keep it like that
        if (controls.ACCEPT) {
            //// Stop fade tweens and set the alphas to 1
            if (!dialogueStarted && !dialogueEnded) {
                FlxTween.cancelTweensOf(dialogueBG, []);
                FlxTween.cancelTweensOf(dialogueBox, []);
                FlxTween.cancelTweensOf(nameText, []);
                FlxTween.cancelTweensOf(text, []);
                dialogueStarted = true;
                dialogueBG.alpha = 0.15;
                dialogueBox.alpha = 1;
                nameText.alpha = 1;
                text.alpha = 1;
            }
            ////
            nextLine();
        }
        super.update(elapsed);
    }
}

class Dialogues {
    public static function checkExisting(song:String) {
        return switch(song) {
            case 'Murderer':
                return [
                    ["Hey! Who's there?", "???", "neutral"],
                    ["Boyfriend, you have to be careful.", "GF", "worried"],
                    ["An evil person could be in the building.", "GF", "worried"],
                    ["Girlfriend, You don't have to worry about it. I'm just gonna do a solo before something happens.", "BF", "brave"],
                    ["Okay then.", "GF", "glad-angry"]
                ];
            default:
                return [['Hi.', 'Corrupt']];
        }
    }
}