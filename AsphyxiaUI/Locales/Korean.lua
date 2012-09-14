---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( S.client ~= "koKR" ) then return end

------------------------------
-- Global
------------------------------
L.Global_ADDON_TITLE = "AsphyxiaUI"
L.Global_ADDON_COPYRIGHT = "Copyright 2012 - Sinaris, EU - Das Syndikat"

L.Global_WELCOME_MESSAGE1 = "Whats up, |cff00AAFF" .. S.myname .. "!|r Thank you for using |cffFF6347AsphyxiaUI " .. GetAddOnMetadata( "AsphyxiaUI", "Version" ) .. "|r."
L.Global_WELCOME_MESSAGE2 = "For detailed Information |cff00FFFFvisit www.tukui.org or https://github.com/Sinaris/AsphyxiaUI"

------------------------------
-- Skin Messages
------------------------------
L.Message_BIGWIGS_RELOAD_INTERFACE = "Please reload your interface to apply Bigwigs skin."
L.Message_DBM_RELOAD_INTERFACE = "Please reload your interface to apply DBM skin."

------------------------------
-- Popups
------------------------------
L.Popups_SELECT_RAID_LAYOUT = "2 raid layouts are active, please select a layout."
L.Popups_ENABLE_CHAT_BACKGROUNDS = "AsphyxiaUI needs to have the chatbackground enabled."
L.Popups_DISABLE_TUKUI_NAMEPLATES = "Tukui nameplates are active. They will be disabled and the AsphyxiaUI nameplates will be enabled."
L.Popups_ENABLE_BIGWIGS_SKIN = "We need to set some BigWigs options to apply Tukui BigWigs skin.\nMost of your settings will remain untouched."
L.Popups_ENABLE_DBM_SKIN = "We need to set some DBM options to apply Tukui DBM skin.\nMost of your settings will remain untouched."
L.Popups_ADDONSKINS = "AsphyxiaUI has detected some other addon skins. AsphyxiaUI addon skins will be disabled!"
L.Popups_LOWRESOLUTION_OVERRIDE = "AsphyxiaUI is running on low resolution. Press accept to enable override lowresolution settings."

------------------------------
-- Tooltip
------------------------------
L.Tooltip_LOADING_TALENT = "Loading Talents..."
L.Tooltip_NO_TALENTS = "No Talents"
L.Tooltip_ITEMID = "Item ID:"
L.Tooltip_SPELLID = "Spell ID:"
L.Tooltip_INSPECTOPEN = "Inspect Frame is open."

------------------------------
-- GameTooltip
------------------------------
L.Gametooltip_SHOW_HIDE_CURRENCYBARS = "Show or hide currency datapanels."
L.Gametooltip_SHOW_HIDE_DATAPANELS = "Show or hide datatext panels below the actionbar."
L.Gametooltip_SHOW_HIDE_MINIMAP = "Show or hide the minimap."
L.Gametooltip_SWITCH_RAIDLAYOUT = "Switch raidlayout."
L.Gametooltip_SHOW_HIDE_REPUTATION = "Show or hide reputation panels below the minimap."

------------------------------
-- Modules
------------------------------
L.Actionbars_LOCK = "|cffe45050Locked|r"
L.Actionbars_UNLOCK = "|cff50e468Unlocked|r"
L.Actionbars_BARSLOCK = "Actionbars |cffe45050locked|r"
L.Actionbars_BARSUNLOCK = "Actionbars |cff50e468unlocked|r"

L.Grid_GRID_SHOW = "|cff00FF00Grid enabled|r"
L.Grid_GRID_HIDE = "|cffFF0000Grid disabled|r"

L.Mail_STOPPED = "Stopped, inventory is full."
L.Mail_UNIQUE = "Stopped. Found a duplicate unique item in bag or in bank."
L.Mail_COMPLETE = "All done."
L.Mail_NEED = "Need a mailbox."
L.Mail_MESSAGES = "messages"

L.Spellbinder_BINDERHEADER = "Mouse Bindings"

------------------------------
-- Changelog, seperate Addon
------------------------------
L.Changelog_TITLE = "|cff00AAFFAsphyxiaUI|r - Changelog"
L.Changelog_VERSION = "6.0.0"

------------------------------
-- F.A.Q., seperate Addon
------------------------------
L.Faq_TITLE = "|cff00AAFFAsphyxiaUI|r - F.A.Q."
L.Faq_VERSION = "6.0.0"

L.Faq_BUTTONS_TEXT = {
	[1] = "Informations",
	[2] = "Unitframes",
	[3] = "Actionbars",
	[4] = "Panels, Nameplates",
	[5] = "Minimap, Chat",
	[6] = "Extra Addons, Skins",
	[7] = "Reported Issues",
	[8] = "Credits",
	[9] = "Wall of Glory",
}

L.Faq_CONTENT_TEXT_TITLE_0 = "|cff00AAFFAsphyxiaUI - F.A.Q.|r"
L.Faq_CONTENT_TEXT_TITLE_1 = "|cff00AAFFInformation|r"
L.Faq_CONTENT_TEXT_TITLE_2 = "|cff00AAFFUnitframes|r"
L.Faq_CONTENT_TEXT_TITLE_3 = "|cff00AAFFActionbars|r"
L.Faq_CONTENT_TEXT_TITLE_4 = "|cff00AAFFPanels, Nameplates|r"
L.Faq_CONTENT_TEXT_TITLE_5 = "|cff00AAFFMinimap, Chat|r"
L.Faq_CONTENT_TEXT_TITLE_6 = "|cff00AAFFExtra Addons, Skins|r"
L.Faq_CONTENT_TEXT_TITLE_7 = "|cff00AAFFReported Issues|r"
L.Faq_CONTENT_TEXT_TITLE_8 = "|cff00AAFFCredits|r"
L.Faq_CONTENT_TEXT_TITLE_9 = "|cff00AAFFWall of Glory|r"

L.Faq_CONTENT_TEXT_FIELD_0_1 = "AsphyxiaUI - F.A.Q."
L.Faq_CONTENT_TEXT_FIELD_0_2 = "Welcome to the F.A.Q. from AsphyxiaUI!\n\nThis F.A.Q. will help you to find the important settings and commands for AsphyxiaUI."
L.Faq_CONTENT_TEXT_FIELD_0_3 = "Please select a category."
L.Faq_CONTENT_TEXT_FIELD_0_4 = ""
L.Faq_CONTENT_TEXT_FIELD_0_5 = ""
L.Faq_CONTENT_TEXT_FIELD_0_6 = ""

L.Faq_CONTENT_TEXT_FIELD_1_1 = "AsphyxiaUI is a heavily modified version of Tukui. AsphyxiaUI is a complete UI replacement."
L.Faq_CONTENT_TEXT_FIELD_1_2 = "For detailed information visit:"
L.Faq_CONTENT_TEXT_FIELD_1_3 = "|cff00FFFFhttp://www.tukui.org/addons/index.php?act=view&id=74|r\nor\n|cff00FFFFhttps://github.com/Sinaris|r"
L.Faq_CONTENT_TEXT_FIELD_1_4 = ""
L.Faq_CONTENT_TEXT_FIELD_1_5 = "You can use the following slash-commands:"
L.Faq_CONTENT_TEXT_FIELD_1_6 = "|cffEAC117/testui|r -  Test mode for unitframes.\n|cffEAC117/ab|r - Actionbar configuration."

L.Faq_CONTENT_TEXT_FIELD_2_1 = "There are four different unitframe layouts. You can change them without editing the original LUA files."
L.Faq_CONTENT_TEXT_FIELD_2_2 = "Follow these steps to change the unitframe layout:"
L.Faq_CONTENT_TEXT_FIELD_2_3 = "Open the Tukui ConfigUI (type /tc into your chat)."
L.Faq_CONTENT_TEXT_FIELD_2_4 = "Goto: Asphyxia. Now you can see a inputbox named 'AsphyxiaUI Layout'."
L.Faq_CONTENT_TEXT_FIELD_2_5 = "You can choose between asphyxia, asphyxia2, asphyxia3, asphyxia4 and asphyxia5. More layouts will be added soon."
L.Faq_CONTENT_TEXT_FIELD_2_6 = "After changing the layout click onto 'Apply Settings' on the bottom of the Tukui ConfigUI. After the reload the unitframes are changed."

L.Faq_CONTENT_TEXT_FIELD_3_1 = "There is a seperate config ui for the actionbars."
L.Faq_CONTENT_TEXT_FIELD_3_2 = "Click onto 'Control Panel' at the bottom of the actionbars."
L.Faq_CONTENT_TEXT_FIELD_3_3 = "Now click onto 'Actionbar Config'."
L.Faq_CONTENT_TEXT_FIELD_3_4 = ""
L.Faq_CONTENT_TEXT_FIELD_3_5 = "Now you can change the actionbars to whatever you want."
L.Faq_CONTENT_TEXT_FIELD_3_6 = ""

L.Faq_CONTENT_TEXT_FIELD_4_1 = "There is a seperate 'Control Panel' at the bottom of the screen."
L.Faq_CONTENT_TEXT_FIELD_4_2 = "Left button: after clicking this button the UI will be reloaded and the default AsphyxiaUI settings will be loaded."
L.Faq_CONTENT_TEXT_FIELD_4_3 = "Middle button: open the AsphyxiaUI Control Panel."
L.Faq_CONTENT_TEXT_FIELD_4_4 = "Right button: reload the UI."
L.Faq_CONTENT_TEXT_FIELD_4_5 = "The AsphyxiaUI nameplates have several tweaks. You can enable or disable the debuff and cc tracking into the Tukui ConfigUI.\nFollow this steps to change the settings:"
L.Faq_CONTENT_TEXT_FIELD_4_6 = "Open the Tukui ConfigUI (type /tc into your chat)\nGoto: Nameplates\nNow you can enable or disable the debuff and/or cc tracking onto the nameplates."

L.Faq_CONTENT_TEXT_FIELD_5_1 = "You can show or hide the minimap by clicking the left button at the minimap. There are also the buttons for the help frame and the Tukui version frame."
L.Faq_CONTENT_TEXT_FIELD_5_2 = "The minimap buttons are skinned too. So if you are using DBM, Skada or other addons with a seperate minimap button, this button will be skinned as well."
L.Faq_CONTENT_TEXT_FIELD_5_3 = "You can change the height and/or width of the chatframes."
L.Faq_CONTENT_TEXT_FIELD_5_4 = "Follow this steps to change the chat frames:"
L.Faq_CONTENT_TEXT_FIELD_5_5 = "Open the Tukui ConfigUI (type /tc into your chat) and goto: Chat"
L.Faq_CONTENT_TEXT_FIELD_5_6 = "There are two inputfields names chatheight and chatwidth. You can change the default values to whatever you want.\n\nAfter you are done click 'Apply Settings' on the bottom of the Tukui ConfigUI. After the reload the chatframes are changed."

L.Faq_CONTENT_TEXT_FIELD_6_1 = "There are some extra addons included into AsphyxiaUI. You will find some credits and other informations about this under the 'Credits' section."
L.Faq_CONTENT_TEXT_FIELD_6_2 = "AsphyxiaUI has some nice and cool looking skins for the following AddOns:\nBalancePowerTracker, BigWigs, DeadlyBossMods, DeuxVox, Omen, Recount, Skada and TinyDPS."
L.Faq_CONTENT_TEXT_FIELD_6_3 = "You can change these settings by follow these steps:"
L.Faq_CONTENT_TEXT_FIELD_6_4 = "Open the Tukui ConfigUI (type /tc into your chat) and goto: Addon Skins.\n\nNow you can enable or disable the needed skins. You can also activate the embed right for Skada or Recount."
L.Faq_CONTENT_TEXT_FIELD_6_5 = "The default Blizzard-Frames are also skinned to match the rest of the AsphyxiaUI. If you don't like them you can disable it by follow these steps:"
L.Faq_CONTENT_TEXT_FIELD_6_6 = "Open the Tukui ConfigUI (type /tc into your chat) and goto: General\n\nNow you can enable or disable the skinning for the Blizzard-Frames."

L.Faq_CONTENT_TEXT_FIELD_7_1 = "I worked hard, very hard. So, i know that there are some issues into the AsphyxiaUI."
L.Faq_CONTENT_TEXT_FIELD_7_2 = "If you found something that looks ugly or if you think that can be a bug, error or whatever, let me know."
L.Faq_CONTENT_TEXT_FIELD_7_3 = ""
L.Faq_CONTENT_TEXT_FIELD_7_4 = "You can post your erros here (please read the guidline to report bugs and erros):"
L.Faq_CONTENT_TEXT_FIELD_7_5 = ""
L.Faq_CONTENT_TEXT_FIELD_7_6 = "|cff00FFFFhttp://www.tukui.org/addons/index.php?act=view&id=74|r\nor\n|cff00FFFFhttps://github.com/Sinaris|r"

L.Faq_CONTENT_TEXT_FIELD_8_1 = "First: Asphyxia, the creator of this UI. Thank you for this awesome job. I hope the 'new' AsphyxiaUI is that what you want."
L.Faq_CONTENT_TEXT_FIELD_8_2 = "Some other credits goto: Caith, Caellian, Shestak, Haste, Tekkub, Alza, Roth, P3lim, Tulla, Hungtar, hankthetank, Ishtara, Haleth and others..."
L.Faq_CONTENT_TEXT_FIELD_8_3 = ""
L.Faq_CONTENT_TEXT_FIELD_8_4 = "Special thanks to: Asi, my forum bitch! xD Also i have to thank Nisha and BuG. Both people are very helpfull and helped me a lot to finish my work."
L.Faq_CONTENT_TEXT_FIELD_8_5 = ""
L.Faq_CONTENT_TEXT_FIELD_8_6 = "If i missed someone, let me know it and i will add them onto the list."

L.Faq_CONTENT_TEXT_FIELD_9_1 = ""
L.Faq_CONTENT_TEXT_FIELD_9_2 = ""
L.Faq_CONTENT_TEXT_FIELD_9_3 = ""
L.Faq_CONTENT_TEXT_FIELD_9_4 = ""
L.Faq_CONTENT_TEXT_FIELD_9_5 = ""
L.Faq_CONTENT_TEXT_FIELD_9_6 = ""

if( TukuiConfigUILocalization ) then
	TukuiConfigUILocalization.global = "AsphyxiaUI"
	TukuiConfigUILocalization.globalunitframelayout = "Unitframe layout (asphyxia, asphyxia2, asphyxia3 or asphyxia4)"

	TukuiConfigUILocalization.databars = "Databars"
	TukuiConfigUILocalization.databarsenable = "Enable databars"
	TukuiConfigUILocalization.databarswidth = "Databars width"
	TukuiConfigUILocalization.databarsheight = "Databars height"
	TukuiConfigUILocalization.databarsvertical = "Enable vertical databars"
	TukuiConfigUILocalization.databarsspacing = "Databars spacing"
	TukuiConfigUILocalization.databarspadding = "Databars padding"
	TukuiConfigUILocalization.databarsframerate = "FPS position (Default: 1)"
	TukuiConfigUILocalization.databarsmemory = "Memory position (Default: 3)"
	TukuiConfigUILocalization.databarsreps = "Reputations: |cFFFF0000*Please edit the Config-File for this option or the UI will be broken!*|r"
	TukuiConfigUILocalization.databarsreputation = "Enable Reputation-Bars under the minimap."
	TukuiConfigUILocalization.databarsdurability = "Durability position (Default: 4)"
	TukuiConfigUILocalization.databarscurrency = "Enable Currency-Bars under the Databars"
	TukuiConfigUILocalization.databarslatency = "Latency position (Default: 2)"

	TukuiConfigUILocalization.combattext = "Combat Text"
	TukuiConfigUILocalization.combattextenable = "Enable Combat Text"
	TukuiConfigUILocalization.combattextblizzheadnumbers = "Use blizzard damage/healing output (above mob/player head)"
	TukuiConfigUILocalization.combattextdamagestyle = "Change default damage/healing font above mobs/player heads (needs to restart WoW)"
	TukuiConfigUILocalization.combattextdamage = "Show outgoing damage in it's own frame"
	TukuiConfigUILocalization.combattexthealing = "Show outgoing healing in it's own frame"
	TukuiConfigUILocalization.combattexthots = "Show periodic healing effects in healing frame"
	TukuiConfigUILocalization.combattextoverhealing = "Show outgoing overhealing"
	TukuiConfigUILocalization.combattextpetdamage = "Show your pet damage"
	TukuiConfigUILocalization.combattextdotdamage = "Show damage from your dots"
	TukuiConfigUILocalization.combattextdamagecolor = "Display damage numbers depending on school of magic"
	TukuiConfigUILocalization.combattextcritprefix = "Symbol that will be added before crit"
	TukuiConfigUILocalization.combattextcritpostfix = "Symbol that will be added after crit"
	TukuiConfigUILocalization.combattexticons = "Show outgoing damage icons"
	TukuiConfigUILocalization.combattexticonsize = "Icon size of spells in outgoing damage frame, also has effect on dmg font size"
	TukuiConfigUILocalization.combattexttreshold = "Minimum damage to show in damage frame"
	TukuiConfigUILocalization.combattexthealtreshold = "Minimum healing to show in incoming/outgoing healing messages"
	TukuiConfigUILocalization.combattextscrollable = "Allows you to scroll frame lines with mousewheel"
	TukuiConfigUILocalization.combattextmaxlines = "Max lines to keep in scrollable mode (more lines = more memory)"
	TukuiConfigUILocalization.combattexttimevisible = "Time(seconds) a single message will be visible"
	TukuiConfigUILocalization.combattextstopvespam = "Automaticly turns off healing spam for priests in shadowform"
	TukuiConfigUILocalization.combattextdkrunes = "Show deathknight rune recharge"
	TukuiConfigUILocalization.combattextkillingblow = "Tells you about your killingblows"
	TukuiConfigUILocalization.combattextmergeaoespam = "Merges multiple aoe damage spam into single message"
	TukuiConfigUILocalization.combattextmergeaoespamtime = "Time in seconds aoe spell will be merged into single message"
	TukuiConfigUILocalization.combattextdispel = "Tells you about your dispels"
	TukuiConfigUILocalization.combattextinterrupt = "Tells you about your interrupts"
	TukuiConfigUILocalization.combattextdirection = "Scrolling Direction('top'(goes down) or 'bottom'(goes up))"

	TukuiConfigUILocalization.chatwidth = "Height of the chat"
	TukuiConfigUILocalization.chatheight= "Width of the chat"
	TukuiConfigUILocalization.chatjustifyRight= "Justify Right right chat frame"

	TukuiConfigUILocalization.castbar = "Castbar"
	TukuiConfigUILocalization.castbarticks = "Show Ticks"
	TukuiConfigUILocalization.castbarclasscolor = "Castbar in classcolor"
	TukuiConfigUILocalization.castbarnointerruptcolor = "Color if spell cant interrupt"
	TukuiConfigUILocalization.castbarcastbarcolor = "Choose color of the castbar"

	TukuiConfigUILocalization.tooltiptalents = "Show the Talentspecialization |cFFFF0000*New*|r"
	TukuiConfigUILocalization.tooltipitemlevel = "Show the average itemlevel |cFFFF0000*New*|r"
	TukuiConfigUILocalization.tooltipsymbiosis = "Show the abilty you get from Symbiosis |cFFFF0000*New*|r"
	TukuiConfigUILocalization.tooltipicon = "Show the icon in Ablilty-tooltips |cFFFF0000*New*|r"
	TukuiConfigUILocalization.tooltipreforge = "Show what is refoged in gear tooltip |cFFFF0000*New*|r"
	TukuiConfigUILocalization.tooltipspellitemids = "Show Spell-ID or Item-ID in tooltip |cFFFF0000*New*|r"
	TukuiConfigUILocalization.tooltipreforge = "Show what is refoged in gear tooltip |cFFFF0000*New*|r"
	TukuiConfigUILocalization.tooltiprole = "Show units role in tooltip |cFFFF0000*New*|r"

	TukuiConfigUILocalization.intmodules = "AsphyxiaUI Modules"
	TukuiConfigUILocalization.intmodulesalertcombat = "Alert Combat"
	TukuiConfigUILocalization.intmodulesafkcamera = "AFK Screensaver |cFFFF0000*New and AWESOME*|r"
	TukuiConfigUILocalization.intmodulesbnetpanel = "Battle.NET Panel |cFFFF0000*Not done yet!*|r"
	TukuiConfigUILocalization.intmodulesachscreen = "Automatic achievement screenshots |cFFFF0000*New*|r"
	TukuiConfigUILocalization.intmoduleslocationpanel = "Location panel"
	TukuiConfigUILocalization.intmodulesachscreen = "Automatic achievement screenshots |cFFFF0000*New*|r"
	TukuiConfigUILocalization.intmodulesminimapbuttons = "Skin minimap buttons |cFFFF0000*New*|r"
	TukuiConfigUILocalization.intmoduleshattrick = "Show or hide helmet and/or cloak"
	TukuiConfigUILocalization.intmodulesmicromenu = "Default micromenu below the location panel |cFFFF0000*New*|r"
	TukuiConfigUILocalization.intmodulesmail = "Easy Mail"
	TukuiConfigUILocalization.intmodulesaddonmanager = "InGame Addon-Manager"
	TukuiConfigUILocalization.intmodulesnickalert = "Nick-Alert: |cFFFF0000*Please edit the Config-File for this option or the UI will be broken!*|r"
	TukuiConfigUILocalization.intmodulesitemlevelongearandslots = "Show Item-Level on Character-Slots |cFFFF0000*New*|r"
	TukuiConfigUILocalization.intmodulesclickcast = "Enable click-to-cast |cFFFF0000*New*|r"
	TukuiConfigUILocalization.intmodulesinterrupts = "Announce successful interrupts"
	TukuiConfigUILocalization.intmodulesspells = "Announce spells"
	TukuiConfigUILocalization.intmodulesautorole = "Set units role when joining raid, arena or battlegrounds |cFFFF0000*New*|r"

	TukuiConfigUILocalization.raidcooldowns = "Raidcooldowns"
	TukuiConfigUILocalization.raidcooldownsenable = "Enable raidcooldowns"
	TukuiConfigUILocalization.raidcooldownsshowinparty = "Party"
	TukuiConfigUILocalization.raidcooldownsshowinraid = "Raid"
	TukuiConfigUILocalization.raidcooldownsshowinarena = "Arena"

	TukuiConfigUILocalization.actionbarvertical_shapeshift = "Enable vertical stance bar"
	TukuiConfigUILocalization.actionbarmainswap = "Swap actionbar 1 and 2"
	TukuiConfigUILocalization.actionbarvertical_rightbars = "Enable vertical right bars"

	TukuiConfigUILocalization.unitframesclassicons = "Enable classicons on player and target frame"
	TukuiConfigUILocalization.unitframesgradient = "Gradient health color: |cFFFF0000*Please edit the Config-File for this option or the UI will be broken!*|r"
	TukuiConfigUILocalization.unitframesfader = "Enable unitframe fader"
	TukuiConfigUILocalization.unitframesgradienthealth = "Enable gradient health on unitframes"

	TukuiConfigUILocalization.nameplateenable = "Enable Nameplates: |cFFFF0000*Disable Tukui nameplates to have AsphyxiaUI nameplates enabled!*|r"
	TukuiConfigUILocalization.nameplateasphyxia = "Enable AsphyxiaUI nameplates"
	TukuiConfigUILocalization.nameplatedebuffs = "Enable debuffs on the nameplates"
	TukuiConfigUILocalization.nameplateshowcastbarname = "Show castbar name"
	TukuiConfigUILocalization.nameplatewidth = "Nameplates width"
	TukuiConfigUILocalization.nameplateheight = "Nameplates height"
	TukuiConfigUILocalization.nameplateaurassize = "Debuffs size"
	TukuiConfigUILocalization.nameplatenameabbrev = "Display abbreviated names"
end