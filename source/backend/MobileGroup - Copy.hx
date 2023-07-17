package backend;

import flixel.math.FlxPoint;
import flixel.ui.FlxButton;


class MobileGroup extends FlxSpriteGroup
{
    public var buttons:Map<String, FlxButton> = [];

    // Layout configuration
    public var leftPoint:FlxPoint = FlxPoint.get(-6000, -6000);
    public var downPoint:FlxPoint = FlxPoint.get(-6000, -6000);
    public var upPoint:FlxPoint = FlxPoint.get(-6000, -6000);
    public var rightPoint:FlxPoint = FlxPoint.get(-6000, -6000);
    public var acceptPoint:FlxPoint = FlxPoint.get(-6000, -6000);
    public var escapePoint:FlxPoint = FlxPoint.get(-6000, -6000);
    public var controlPoint:FlxPoint = FlxPoint.get(-6000, -6000);
    public var resetPoint:FlxPoint = FlxPoint.get(-6000, -6000);

    public function new(?layout:String) { // This is useful for reloading
        super();
        scrollFactor.set();

        if (layout == null) {
            trace('Preset is null! Set to "Classic"');
            layout = 'classic';
        }

        escapePoint.set(20, 20);
        switch(layout.toLowerCase()) {
            case 'classic': // This is the default layout preset if no such layout preset is found
                leftPoint.set(20, FlxG.height - 280);
                downPoint.set(160, FlxG.height - 140);
                upPoint.set(160, FlxG.height - 420);
                rightPoint.set(300, FlxG.height - 280);
                resetPoint.set(FlxG.width - 140, 20);
            case 'modern':
                leftPoint.set(20, FlxG.height - 140);
                downPoint.set(160, FlxG.height - 140);
                upPoint.set(FlxG.width - 280, FlxG.height - 140);
                rightPoint.set(FlxG.width - 140, FlxG.height - 140);
                resetPoint.set(FlxG.width - 140, 20);
            case 'close':
                leftPoint.set(300, FlxG.height - 300);
                downPoint.set(440, FlxG.height - 300);
                upPoint.set(580, FlxG.height - 300);
                rightPoint.set(720, FlxG.height - 300);
                resetPoint.set(FlxG.width - 140, 20);
            case 'hitbox':
            case 'menu':
                downPoint.set(FlxG.width - 140, FlxG.height - 140);
                upPoint.set(FlxG.width - 140, FlxG.height - 280);
                acceptPoint.set(20, FlxG.height - 140);
                controlPoint.set(20, FlxG.height - 280);
            case 'menu_pause':
                downPoint.set(FlxG.width - 140, FlxG.height - 140);
                upPoint.set(FlxG.width - 140, FlxG.height - 280);
                escapePoint.set(20, FlxG.height - 140);
                acceptPoint.set(20, FlxG.height - 280);
            default:
                if (layout != null) trace('No such preset as "$layout" is found! Set to "Classic"');
                leftPoint.set(20, FlxG.height - 280);
                downPoint.set(160, FlxG.height - 140);
                upPoint.set(160, FlxG.height - 420);
                rightPoint.set(300, FlxG.height - 280);
                resetPoint.set(FlxG.width - 140, 20);
        }

        //// PLEASE IGNORE!!
        // Make layout buttons
        var leftButton:FlxButton = new FlxButton(leftPoint.x, leftPoint.y, '');
        leftButton.loadGraphic(Paths.image("mobile/buttons"), true, 120, 120);
        add(leftButton);

        var downButton:FlxButton = new FlxButton(downPoint.x, downPoint.y, '');
        downButton.loadGraphic(Paths.image("mobile/buttons"), true, 120, 120);
        add(downButton);

        var upButton:FlxButton = new FlxButton(upPoint.x, upPoint.y, '');
        upButton.loadGraphic(Paths.image("mobile/buttons"), true, 120, 120);
        add(upButton);

        var rightButton:FlxButton = new FlxButton(rightPoint.x, rightPoint.y, '');
        rightButton.loadGraphic(Paths.image("mobile/buttons"), true, 120, 120);
        add(rightButton);

        var acceptButton:FlxButton = new FlxButton(acceptPoint.x, acceptPoint.y, '');
        acceptButton.loadGraphic(Paths.image("mobile/buttons"), true, 120, 120);
        add(acceptButton);

        var escapeButton:FlxButton = new FlxButton(escapePoint.x, escapePoint.y, '');
        escapeButton.loadGraphic(Paths.image("mobile/buttons"), true, 120, 120);
        add(escapeButton);

        var controlButton:FlxButton = new FlxButton(controlPoint.x, controlPoint.y, '');
        controlButton.loadGraphic(Paths.image("mobile/buttons"), true, 120, 120);
        add(controlButton);

        var resetButton:FlxButton = new FlxButton(resetPoint.x, resetPoint.y, '');
        resetButton.loadGraphic(Paths.image("mobile/buttons"), true, 120, 120);
        resetButton.updateHitbox();
        add(resetButton);
        ////

        buttons = [
            'left' => leftButton,
            'down' => downButton,
            'up' => upButton,
            'right' => rightButton,
            'accept' => acceptButton,
            'escape' => escapeButton,
            'control' => controlButton,
            'reset' => resetButton
        ];

        // I found an issue where in a substate the buttons aren't active so I fixed it
        for (buttonMap in buttons) {
            //buttonMap.updateHitbox(); // Do NOT remove it.
            buttonMap.alpha = 0.7;
        }
    }
}