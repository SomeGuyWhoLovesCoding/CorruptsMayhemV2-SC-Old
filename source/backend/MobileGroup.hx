package backend;

import flixel.math.FlxPoint;
import flixel.ui.FlxButton;

class MobileGroup extends FlxSpriteGroup
{
    public var buttons:Map<String, FlxButton> = [];

    // Layout configuration
    public var leftPoint:FlxPoint = FlxPoint.get(-10000, -10000);
    public var downPoint:FlxPoint = FlxPoint.get(-10000, -10000);
    public var upPoint:FlxPoint = FlxPoint.get(-10000, -10000);
    public var rightPoint:FlxPoint = FlxPoint.get(-10000, -10000);
    public var acceptPoint:FlxPoint = FlxPoint.get(-10000, -10000);
    public var escapePoint:FlxPoint = FlxPoint.get(-10000, -10000);
    public var controlPoint:FlxPoint = FlxPoint.get(-10000, -10000);
    public var resetPoint:FlxPoint = FlxPoint.get(-10000, -10000);

    public function new(?layout:String) { // This is useful for reloading
        super();
        scrollFactor.set();

        if (layout == null) {
            trace('Preset is null! Set to "Classic"');
            layout = 'classic';
        }

        switch(layout.toLowerCase()) {
            case 'classic': // This is the default layout preset if no such layout preset is found
                leftPoint.set(20, FlxG.height - 280);
                downPoint.set(160, FlxG.height - 140);
                upPoint.set(160, FlxG.height - 420);
                rightPoint.set(300, FlxG.height - 280);
                resetPoint.set(FlxG.width - 140, 20);
                escapePoint.set(20, 20);

            case 'modern':
                leftPoint.set(20, FlxG.height - 280);
                downPoint.set(160, FlxG.height - 280);
                upPoint.set(FlxG.width - 280, FlxG.height - 280);
                rightPoint.set(FlxG.width - 140, FlxG.height - 280);
                resetPoint.set(FlxG.width - 140, 20);
                escapePoint.set(20, 20);

            case 'close':
                leftPoint.set(360, FlxG.height - 280);
                downPoint.set(500, FlxG.height - 280);
                upPoint.set(640, FlxG.height - 280);
                rightPoint.set(780, FlxG.height - 280);
                resetPoint.set(FlxG.width - 140, 20);
                escapePoint.set(20, 20);

            // Extra stuff
            case 'menu':
                downPoint.set(FlxG.width - 140, FlxG.height - 140);
                upPoint.set(FlxG.width - 140, FlxG.height - 280);
                acceptPoint.set(20, FlxG.height - 140);
                controlPoint.set(20, FlxG.height - 280);
                escapePoint.set(20, 20);

            case 'menu_pause':
                downPoint.set(FlxG.width - 140, FlxG.height - 140);
                upPoint.set(FlxG.width - 140, FlxG.height - 280);
                acceptPoint.set(20, FlxG.height - 280);
                escapePoint.set(20, FlxG.height - 140);

            case 'menu_playfield':
                downPoint.set(FlxG.width - 140, FlxG.height - 280);
                upPoint.set(FlxG.width - 280, FlxG.height - 280);
                leftPoint.set(FlxG.width - 280, FlxG.height - 140);
                rightPoint.set(FlxG.width - 140, FlxG.height - 140);
                acceptPoint.set(20, FlxG.height - 140);
                controlPoint.set(20, FlxG.height - 280);
                resetPoint.set(20, FlxG.height - 420);
                escapePoint.set(20, 20);

            case 'game_over':
                acceptPoint.set(FlxG.width - 140, FlxG.height - 140);
                escapePoint.set(FlxG.width - 280, FlxG.height - 140);

            case 'left_right_accept':
                leftPoint.set(20, FlxG.height - 140);
                rightPoint.set(160, FlxG.height - 140);
                escapePoint.set(FlxG.width - 140, 20);
                acceptPoint.set(FlxG.width - 140, FlxG.height - 140);

            case 'up_down_accept':
                upPoint.set(20, FlxG.height - 140);
                downPoint.set(160, FlxG.height - 140);
                escapePoint.set(FlxG.width - 140, 20);
                acceptPoint.set(FlxG.width - 140, FlxG.height - 140);
                escapePoint.set(20, 20);

            case 'up_down':
                upPoint.set(FlxG.width - 140, FlxG.height - 140);
                downPoint.set(FlxG.width - 280, FlxG.height - 140);
                escapePoint.set(20, 20);

            case 'menu_configs':
                leftPoint.set(20, FlxG.height - 280);
                downPoint.set(160, FlxG.height - 140);
                upPoint.set(160, FlxG.height - 420);
                rightPoint.set(300, FlxG.height - 280);
                acceptPoint.set(FlxG.width - 140, FlxG.height - 140);
                resetPoint.set(FlxG.width - 280, FlxG.height - 140);
                escapePoint.set(FlxG.width - 140, 20);

            case 'accept':
                acceptPoint.set(FlxG.width - 140, FlxG.height - 140);
            
            default:
                if (layout != null) trace('No such preset as "$layout" found! Set to "Classic"');
                leftPoint.set(20, FlxG.height - 280);
                downPoint.set(160, FlxG.height - 140);
                upPoint.set(160, FlxG.height - 420);
                rightPoint.set(300, FlxG.height - 280);
                resetPoint.set(FlxG.width - 140, 20);
        }

        //// PLEASE IGNORE!!
        // Make layout buttons
        var leftButton:FlxButton = new FlxButton(leftPoint.x, leftPoint.y, 'LEFT');
        leftButton.loadGraphic(Paths.image("mobile/buttons"), true, 120, 120);
        leftButton.updateHitbox();
        add(leftButton);

        var downButton:FlxButton = new FlxButton(downPoint.x, downPoint.y, 'DOWN');
        downButton.loadGraphic(Paths.image("mobile/buttons"), true, 120, 120);
        downButton.updateHitbox();
        add(downButton);

        var upButton:FlxButton = new FlxButton(upPoint.x, upPoint.y, 'UP');
        upButton.loadGraphic(Paths.image("mobile/buttons"), true, 120, 120);
        upButton.updateHitbox();
        add(upButton);

        var rightButton:FlxButton = new FlxButton(rightPoint.x, rightPoint.y, 'RIGHT');
        rightButton.loadGraphic(Paths.image("mobile/buttons"), true, 120, 120);
        rightButton.updateHitbox();
        add(rightButton);

        var acceptButton:FlxButton = new FlxButton(acceptPoint.x, acceptPoint.y, 'ACCEPT');
        acceptButton.loadGraphic(Paths.image("mobile/buttons"), true, 120, 120);
        acceptButton.updateHitbox();
        add(acceptButton);

        var escapeButton:FlxButton = new FlxButton(escapePoint.x, escapePoint.y, 'BACK');
        escapeButton.loadGraphic(Paths.image("mobile/buttons"), true, 120, 120);
        escapeButton.updateHitbox();
        add(escapeButton);

        var controlButton:FlxButton = new FlxButton(controlPoint.x, controlPoint.y, 'CONTROL');
        controlButton.loadGraphic(Paths.image("mobile/buttons"), true, 120, 120);
        controlButton.updateHitbox();
        add(controlButton);

        var resetButton:FlxButton = new FlxButton(resetPoint.x, resetPoint.y, 'RESET');
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

        for (button in buttons) {
            button.alpha = 0.7;
            button.label.color = 0xFFFFFFFF;
            #if !android
            // Deactivate them when not on mobile
            button.visible = false;
            button.active = false;
            #end
        }

    }
}