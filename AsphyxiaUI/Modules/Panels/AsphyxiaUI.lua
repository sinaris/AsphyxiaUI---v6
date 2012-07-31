---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

print( "AsphyxiaUI Panels loaded!" )

------------------------------
-- Actionbars
------------------------------
G.ActionBars.Bar1:ClearAllPoints()
G.ActionBars.Bar1:Size( ( S.buttonsize * 12 ) + ( S.buttonspacing * 13 ) + 2, ( S.buttonsize * 2 ) + ( S.buttonspacing * 3 ) + 2 )
G.ActionBars.Bar1:Point( "BOTTOM", UIParent, "BOTTOM", 0, 48 )
G.ActionBars.Bar1:SetTemplate( "Transparent" )
G.ActionBars.Bar1:CreateShadow( "Default" )
G.ActionBars.Bar1:SetFrameStrata("BACKGROUND")
G.ActionBars.Bar1:SetFrameLevel( 1 )

G.ActionBars.Bar2:StripTextures()
G.ActionBars.Bar2:ClearAllPoints()
G.ActionBars.Bar2:SetAllPoints( G.ActionBars.Bar1 )

G.ActionBars.Bar3:StripTextures()
G.ActionBars.Bar3:ClearAllPoints()
G.ActionBars.Bar3:SetAllPoints( G.ActionBars.Bar1 )

G.ActionBars.Bar4:StripTextures()
G.ActionBars.Bar4:ClearAllPoints()
G.ActionBars.Bar4:SetAllPoints( G.ActionBars.Bar1 )

local AsphyxiaUISplitBarLeft = CreateFrame( "Frame", "AsphyxiaUISplitBarLeft", UIParent )
AsphyxiaUISplitBarLeft:Size( ( S.buttonsize * 3 ) + ( S.buttonspacing * 4 ) + 2, G.ActionBars.Bar1:GetHeight() )
AsphyxiaUISplitBarLeft:Point( "BOTTOMRIGHT", G.ActionBars.Bar1, "BOTTOMLEFT", -3, 0 )
AsphyxiaUISplitBarLeft:SetTemplate( "Transparent" )
AsphyxiaUISplitBarLeft:CreateShadow( "Default" )

local AsphyxiaUISplitBarRight = CreateFrame( "Frame", "AsphyxiaUISplitBarRight", UIParent )
AsphyxiaUISplitBarRight:Size( ( S.buttonsize * 3 ) + ( S.buttonspacing * 4 ) + 2, G.ActionBars.Bar1:GetHeight() )
AsphyxiaUISplitBarRight:Point( "BOTTOMLEFT", G.ActionBars.Bar1, "BOTTOMRIGHT", 3, 0 )
AsphyxiaUISplitBarRight:SetTemplate( "Transparent" )
AsphyxiaUISplitBarRight:CreateShadow( "Default" )

local AsphyxiaUIRightBar = CreateFrame( "Frame", "AsphyxiaUIRightBar", UIParent )
AsphyxiaUIRightBar:Size( ( S.buttonsize * 12 + S.buttonspacing * 13 ) + 2,  ( S.buttonsize * 12 + S.buttonspacing * 13 ) + 2 )
AsphyxiaUIRightBar:SetTemplate( "Transparent" )
AsphyxiaUIRightBar:Point( "BOTTOMRIGHT", G.Panels.RightChatBackground, "TOPRIGHT", 0, 3 )
AsphyxiaUIRightBar:CreateShadow( "Default" )
if( C["chat"]["background"] ~= true ) then
	AsphyxiaUIRightBar:ClearAllPoints()
	AsphyxiaUIRightBar:Point( "RIGHT", UIParent, "RIGHT", -8, 0 )
end
AsphyxiaUIRightBar:SetFrameStrata("BACKGROUND")
AsphyxiaUIRightBar:SetFrameLevel( 1 )

G.ActionBars.Pet:ClearAllPoints()
if( C["actionbar"]["vertical_rightbars"] == true ) then
	G.ActionBars.Pet:Size( ( S.petbuttonsize + S.buttonspacing * 2 ) + 2, ( S.petbuttonsize * NUM_PET_ACTION_SLOTS + S.buttonspacing * 11 ) + 2 )
else
	G.ActionBars.Pet:Size( ( S.petbuttonsize * NUM_PET_ACTION_SLOTS + S.buttonspacing * 11 ) + 2, ( S.petbuttonsize + S.buttonspacing * 2 ) + 2 )
end
G.ActionBars.Pet:Point( "BOTTOM", AsphyxiaUIRightBar, "TOP", 0, 3 )
G.ActionBars.Pet:SetTemplate( "Transparent" )
G.ActionBars.Pet:CreateShadow( "Default" )


------------------------------
-- Chat
------------------------------
G.Panels.LeftChatBackground:ClearAllPoints()
G.Panels.LeftChatBackground:Size( C["chat"]["width"], C["chat"]["height"] )
G.Panels.LeftChatBackground:Point( "BOTTOMLEFT", UIParent, "BOTTOMLEFT", 2, 2 )
G.Panels.LeftChatBackground:SetTemplate( "Transparent" )
G.Panels.LeftChatBackground:CreateShadow( "Default" )
G.Panels.LeftChatBackground:SetFrameLevel( 1 )
G.Panels.LeftChatBackground:SetFrameStrata( "BACKGROUND" )

G.Panels.RightChatBackground:ClearAllPoints()
G.Panels.RightChatBackground:Size( C["chat"]["width"], C["chat"]["height"] )
G.Panels.RightChatBackground:Point( "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -2, 2 )
G.Panels.RightChatBackground:SetTemplate( "Transparent" )
G.Panels.RightChatBackground:CreateShadow( "Default" )
G.Panels.RightChatBackground:SetFrameLevel( 1 )
G.Panels.RightChatBackground:SetFrameStrata( "BACKGROUND" )

G.Panels.LeftChatTabsBackground:ClearAllPoints()
G.Panels.LeftChatTabsBackground:Size( G.Panels.LeftChatBackground:GetWidth() - 10, 23 )
G.Panels.LeftChatTabsBackground:Point( "TOP", G.Panels.LeftChatBackground, "TOP", 0, -5 )
G.Panels.LeftChatTabsBackground:SetTemplate( "Transparent" )
G.Panels.LeftChatTabsBackground:CreateOverlay( AsphyxiaUILeftChatTab )
G.Panels.LeftChatTabsBackground:SetFrameLevel( 2 )
G.Panels.LeftChatTabsBackground:SetFrameStrata( "BACKGROUND" )

G.Panels.RightChatTabsBackground:ClearAllPoints()
G.Panels.RightChatTabsBackground:Size( G.Panels.RightChatBackground:GetWidth() - 10, 23 )
G.Panels.RightChatTabsBackground:Point( "TOP", G.Panels.RightChatBackground, "TOP", 0, -5 )
G.Panels.RightChatTabsBackground:SetTemplate( "Transparent" )
G.Panels.RightChatTabsBackground:CreateOverlay( AsphyxiaUILeftChatTab )
G.Panels.RightChatTabsBackground:SetFrameLevel( 2 )
G.Panels.RightChatTabsBackground:SetFrameStrata( "BACKGROUND" )


------------------------------
-- Datatext Panels
------------------------------
G.Panels.DataTextLeft:ClearAllPoints()
G.Panels.DataTextLeft:Size( G.Panels.LeftChatBackground:GetWidth() - 10, 23 )
G.Panels.DataTextLeft:Point( "BOTTOM", G.Panels.LeftChatBackground, "BOTTOM", 0, 5 )
G.Panels.DataTextLeft:SetTemplate( "Transparent" )
G.Panels.DataTextLeft:CreateOverlay( G.Panels.DataTextLeft )

G.Panels.DataTextRight:ClearAllPoints()
G.Panels.DataTextRight:Size( G.Panels.RightChatBackground:GetWidth() - 10, 23 )
G.Panels.DataTextRight:Point( "BOTTOM", G.Panels.RightChatBackground, "BOTTOM", 0, 5 )
G.Panels.DataTextRight:SetTemplate( "Transparent" )
G.Panels.DataTextRight:CreateOverlay( G.Panels.DataTextRight )

local AsphyxiaUIInfoCenter = CreateFrame( "Frame", "AsphyxiaUIInfoCenter", G.ActionBars.Bar1 )
AsphyxiaUIInfoCenter:Size( G.ActionBars.Bar1:GetWidth(), 20 )
AsphyxiaUIInfoCenter:Point( "TOP", G.ActionBars.Bar1, "BOTTOM", 0, -3 )
AsphyxiaUIInfoCenter:SetTemplate( "Default" )
AsphyxiaUIInfoCenter:CreateShadow( "Default" )
AsphyxiaUIInfoCenter:SetFrameLevel( 2 )
AsphyxiaUIInfoCenter:SetFrameStrata( "BACKGROUND" )
AsphyxiaUIInfoCenter:CreateOverlay( AsphyxiaUIInfoCenter )

local AsphyxiaUIInfoCenterLeft = CreateFrame( "Frame", "AsphyxiaUIInfoCenterLeft", AsphyxiaUISplitBarLeft )
AsphyxiaUIInfoCenterLeft:Size( AsphyxiaUISplitBarLeft:GetWidth(), 20 )
AsphyxiaUIInfoCenterLeft:Point( "TOP", AsphyxiaUISplitBarLeft, "BOTTOM", 0, -3 )
AsphyxiaUIInfoCenterLeft:SetTemplate( "Default" )
AsphyxiaUIInfoCenterLeft:CreateShadow( "Default" )
AsphyxiaUIInfoCenterLeft:SetFrameLevel( 2 )
AsphyxiaUIInfoCenterLeft:SetFrameStrata( "BACKGROUND" )
AsphyxiaUIInfoCenterLeft:CreateOverlay( AsphyxiaUIInfoCenterLeft )

local AsphyxiaUIInfoCenterRight = CreateFrame( "Frame", "AsphyxiaUIInfoCenterRight", AsphyxiaUISplitBarRight )
AsphyxiaUIInfoCenterRight:Size( AsphyxiaUISplitBarRight:GetWidth(), 20 )
AsphyxiaUIInfoCenterRight:Point( "TOP", AsphyxiaUISplitBarRight, "BOTTOM", 0, -3 )
AsphyxiaUIInfoCenterRight:SetTemplate( "Default" )
AsphyxiaUIInfoCenterRight:CreateShadow( "Default" )
AsphyxiaUIInfoCenterRight:SetFrameLevel( 2 )
AsphyxiaUIInfoCenterRight:SetFrameStrata( "BACKGROUND" )
AsphyxiaUIInfoCenterRight:CreateOverlay( AsphyxiaUIInfoCenterRight )


------------------------------
-- Minimap
------------------------------
if( TukuiMinimap ) then
	local AsphyxiaUITimeWatch = CreateFrame( "Frame", "AsphyxiaUITimeWatch", Minimap )
	AsphyxiaUITimeWatch:Size( 55, 17 )
	AsphyxiaUITimeWatch:Point( "TOP", Minimap, "BOTTOM", 0, 8 )
	AsphyxiaUITimeWatch:SetTemplate( "Default" )
	AsphyxiaUITimeWatch:CreateShadow( "Default" )
	--AsphyxiaUITimeWatch:SetFrameLevel( 3 )
	--AsphyxiaUITimeWatch:SetFrameStrata( "MEDIUM" )
	AsphyxiaUITimeWatch:CreateOverlay( AsphyxiaUITimeWatch )
end