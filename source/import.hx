
//Discord API
#if sys
import backend.Discord;
#end

//Psych
#if MODS_ALLOWED import backend.Mods; #end

#if LUA_ALLOWED
import llua.*;
import llua.Lua;
import llua.State;
#end

import backend.Paths;
import backend.Controls;
import backend.MobileGroup;
import backend.CoolUtil;
import backend.MusicBeatState;
import backend.MusicBeatSubstate;
import backend.CustomFadeTransition;
import backend.ClientPrefs;
import backend.Conductor;
import backend.BaseStage;
import backend.Difficulty;
import backend.corruptMayhem.SaveData;
import backend.corruptMayhem.StoryData;
import backend.corruptMayhem.FreeplayData;

import objects.Alphabet;
import objects.BGSprite;

import states.PlayState;
import states.LoadingState;

//Flixel
#if (flixel >= "5.3.0")
import flixel.sound.FlxSound;
#else
import flixel.system.FlxSound;
#end
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.display.FlxBackdrop;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.group.FlxSpriteGroup;
import flixel.group.FlxGroup.FlxTypedGroup;

using StringTools;