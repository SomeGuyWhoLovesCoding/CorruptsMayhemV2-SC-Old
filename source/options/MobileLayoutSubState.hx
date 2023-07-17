package options;

class MobileLayoutSubState extends MusicBeatSubstate
{
    public var mobileGrp:MobileGroup;
    public var layoutGrp:MobileGroup;

    var layoutPresets:Array<String> = ['classic', 'modern', 'close', 'hitbox'];
    var layoutTxt:Alphabet;

    var curSelected:Int = 0;

    override function create() {
        var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.color = 0xFFea71fd;
		bg.screenCenter();
		add(bg);

        layoutGrp = new MobileGroup(ClientPrefs.data.layoutPreset);
        layoutGrp.active = false;
        add(layoutGrp);

        layoutTxt = new Alphabet(0, FlxG.height - 120, CoolUtil.capitalize(ClientPrefs.data.layoutPreset), false);
        layoutTxt.screenCenter(X);
		add(layoutTxt);

        mobileGrp = new MobileGroup('left_right_accept');
        add(mobileGrp);

        mobileGrp.buttons.get('accept').x = -10000;
        FlxG.sound.play(Paths.sound('scrollMenu'));
        super.create();
    }

    override function update(elapsed) {
        if (controls.buttonJustPressed('left', mobileGrp)) {
            FlxG.sound.play(Paths.sound('scrollMenu'));
            curSelected--;
            if (curSelected < 0) curSelected = layoutPresets.length-1;
            reloadLayout();
        }
        if (controls.buttonJustPressed('right', mobileGrp)) {
            FlxG.sound.play(Paths.sound('scrollMenu'));
            curSelected++;
            if (curSelected > layoutPresets.length-1) curSelected = 0;
            reloadLayout();
        }
        if (controls.buttonJustPressed('escape', mobileGrp)) {
            FlxG.sound.play(Paths.sound('cancelMenu'));
            close();
        }
        super.update(elapsed);
    }
    
    function reloadLayout() {
        ClientPrefs.data.layoutPreset = layoutPresets[curSelected];
        layoutTxt.text = CoolUtil.capitalize(ClientPrefs.data.layoutPreset);
        remove(layoutGrp);
        layoutGrp = new MobileGroup(ClientPrefs.data.layoutPreset);
        layoutGrp.active = false;
        add(layoutGrp);
    }
}