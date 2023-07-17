package objects.cutscenes;

import flixel.FlxG;
import flixel.addons.text.FlxTypeText;
import flixel.text.FlxText;

class DialogBox extends flixel.group.FlxGroup.FlxSpriteGroup {
    var borderSpr:FlxSprite;
    var skinSpr:FlxSprite;

    public var nameText:FlxText;
    public var text:FlxTypeText;
    public var borderSize:Int = 6;
    public var borderColor:Int = 0xFF000000;
    public var skinColor:Int = 0xFFFFFFFF; // Don't know what I named that

    public function new(skin) {
        super();
        
        updateBorderColor(skin);
        updateSkinColor(skin);

        borderSpr = new FlxSprite(0, Std.int(skinSpr.y - borderSize)).makeGraphic(Std.int(skinSpr.width + (borderSize * 2)), Std.int(skinSpr.height + (borderSize * 2)), skinColor);
        borderSpr.screenCenter(X);

        skinSpr = new FlxSprite(0, FlxG.height - 450).makeGraphic(600, 350, skinColor);
        skipSpr.screenCenter(X);

        nameText = new FlxTypeText(skinSpr.x + 24, skinSpr.y + 24, Std.int(FlxG.width * 0.5), "Narrator", 24, true);
        text = new FlxTypeText(skinSpr.x + 24, skinSpr.y + 24, Std.int(FlxG.width * 0.5), "The devil kills people. You don't.", 24, true);
        
        add(borderSpr);
        add(skinSpr);
        add(nameText);
        add(text);
    }

    public function updateSkinColor(skin) {
        switch(skin) {
            case 'ender':
                skinColor = 0xFF000000;
                borderColor = 0xFFFF0000;
            default:
        }
    }

    public function typeNextLine(text) {
        text.resetText(text);
        text.start(0.0655, false, false, null);
    }

    public function update(elapsed:Float) { // Keep this here so the type text works
        super.update(elapsed);
    }
}