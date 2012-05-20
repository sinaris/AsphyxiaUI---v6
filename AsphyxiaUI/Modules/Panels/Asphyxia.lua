---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["panellayout"] ~= "asphyxia" ) then return end

print( "panel: asphyxia" )

------------------------------
-- not needed
------------------------------
local panelsToKill = { G.ActionBars.Bar5, G.ActionBars.Bar6, G.ActionBars.Bar7, G.ActionBars.Pet.BackgroundLink, G.Panels.BottomLeftVerticalLine, G.Panels.BottomRightVerticalLine, G.Panels.BottomLeftCube, G.Panels.BottomRightCube, G.Panels.BottomLeftLine, G.Panels.BottomRightLine, G.Panels.LeftDataTextToActionBarLine, G.Panels.RightDataTextToActionBarLine }

for _, panels in pairs( panelsToKill ) do
	panels:Kill()
end

------------------------------
-- actionbars
------------------------------
G.ActionBars.Bar1:ClearAllPoints()
G.ActionBars.Bar1:SetPoint( "BOTTOM", UIParent, "BOTTOM", 0, 48 )
G.ActionBars.Bar1:Size( ( S.buttonsize * 12 ) + ( S.buttonspacing * 13 ) + 2, ( S.buttonsize * 2 ) + ( S.buttonspacing * 3 ) + 2 )
G.ActionBars.Bar1:CreateShadow( "Default" )
G.ActionBars.Bar1:SetTemplate( "Transparent" )

G.ActionBars.Bar2:ClearAllPoints()
G.ActionBars.Bar2:SetAllPoints( G.ActionBars.Bar1 )

G.ActionBars.Bar3:ClearAllPoints()
G.ActionBars.Bar3:SetAllPoints( G.ActionBars.Bar1 )

G.ActionBars.Bar4:ClearAllPoints()
G.ActionBars.Bar4:SetAllPoints( G.ActionBars.Bar1 )

local TukuiSplitBarLeft = CreateFrame( "Frame", "TukuiSplitBarLeft", UIParent )
TukuiSplitBarLeft:CreatePanel( "Transparent", ( S.buttonsize * 3 ) + ( S.buttonspacing * 4 ) + 2, G.ActionBars.Bar1:GetHeight(), "BOTTOMRIGHT", G.ActionBars.Bar1, "BOTTOMLEFT", -3, 0 )
TukuiSplitBarLeft:CreateShadow( "Default" )

local TukuiSplitBarRight = CreateFrame( "Frame", "TukuiSplitBarRight", UIParent )
TukuiSplitBarRight:CreatePanel( "Transparent", ( S.buttonsize * 3 ) + ( S.buttonspacing * 4 ) + 2, G.ActionBars.Bar1:GetHeight(), "BOTTOMLEFT", G.ActionBars.Bar1, "BOTTOMRIGHT", 3, 0 )
TukuiSplitBarRight:CreateShadow( "Default" )

local TukuiRightBar = CreateFrame( "Frame", "TukuiRightBar", UIParent )
TukuiRightBar:CreatePanel( "Transparent", ( S.buttonsize * 12 + S.buttonspacing * 13 ) + 2,  ( S.buttonsize * 12 + S.buttonspacing * 13 ) + 2, "BOTTOMRIGHT", TukuiChatBackgroundRight, "TOPRIGHT", 0, 3 )
TukuiRightBar:CreateShadow( "Default" )
if( C["chat"]["background"] ~= true ) then
	TukuiRightBar:ClearAllPoints()
	TukuiRightBar:Point( "RIGHT", UIParent, "RIGHT", -8, 0 )
end

G.ActionBars.Pet:ClearAllPoints()
if( C["actionbar"]["vertical_rightbars"] == true ) then
	G.ActionBars.Pet:Width( ( S.petbuttonsize + S.buttonspacing * 2 ) + 2 )
	G.ActionBars.Pet:Height( ( S.petbuttonsize * NUM_PET_ACTION_SLOTS + S.buttonspacing * 11 ) + 2 )
else
	G.ActionBars.Pet:Width( ( S.petbuttonsize * NUM_PET_ACTION_SLOTS + S.buttonspacing * 11 ) + 2 )
	G.ActionBars.Pet:Height( ( S.petbuttonsize + S.buttonspacing * 2 ) + 2 )
end
G.ActionBars.Pet:SetPoint( "BOTTOM", TukuiRightBar, "TOP", 0, 3 )
G.ActionBars.Pet:CreateShadow( "Default" )
G.ActionBars.Pet:SetTemplate( "Transparent" )

------------------------------
-- chat
------------------------------
G.Panels.LeftChatBackground:ClearAllPoints()
G.Panels.LeftChatBackground:Size( C["chat"]["width"], C["chat"]["height"] )
G.Panels.LeftChatBackground:SetPoint( "BOTTOMLEFT", UIParent, "BOTTOMLEFT", 2, 2 )
G.Panels.LeftChatBackground:CreateShadow( "Default" )
G.Panels.LeftChatBackground:SetTemplate( "Transparent" )

G.Panels.RightChatBackground:ClearAllPoints()
G.Panels.RightChatBackground:Size( C["chat"]["width"], C["chat"]["height"] )
G.Panels.RightChatBackground:SetPoint( "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -2, 2 )
G.Panels.RightChatBackground:CreateShadow( "Default" )
G.Panels.RightChatBackground:SetTemplate( "Transparent" )

G.Panels.LeftChatTabsBackground:ClearAllPoints()
G.Panels.LeftChatTabsBackground:Size( G.Panels.LeftChatBackground:GetWidth() - 10, 23 )
G.Panels.LeftChatTabsBackground:SetPoint( "TOP", G.Panels.LeftChatBackground, "TOP", 0, -5 )
G.Panels.LeftChatTabsBackground:CreateOverlay( G.Panels.LeftChatTabsBackground )

G.Panels.RightChatTabsBackground:ClearAllPoints()
G.Panels.RightChatTabsBackground:Size( G.Panels.RightChatBackground:GetWidth() - 10, 23 )
G.Panels.RightChatTabsBackground:SetPoint( "TOP", G.Panels.RightChatBackground, "TOP", 0, -5 )
G.Panels.RightChatTabsBackground:CreateOverlay( G.Panels.RightChatTabsBackground )

if( C["chat"]["background"] ~= true ) then
	G.Panels.LeftChatBackground:SetAlpha( 0 )
	G.Panels.RightChatBackground:SetAlpha( 0 )
	G.Panels.LeftChatTabsBackground:SetAlpha( 0 )
	G.Panels.RightChatTabsBackground:SetAlpha( 0 )
end

------------------------------
-- datatext panels
------------------------------
G.Panels.DataTextLeft:ClearAllPoints()
G.Panels.DataTextLeft:Size( G.Panels.LeftChatBackground:GetWidth() - 10, 23 )
G.Panels.DataTextLeft:SetPoint( "BOTTOM", G.Panels.LeftChatBackground, "BOTTOM", 0, 5 )
G.Panels.DataTextLeft:CreateOverlay( G.Panels.DataTextLeft )

G.Panels.DataTextRight:ClearAllPoints()
G.Panels.DataTextRight:Size( G.Panels.RightChatBackground:GetWidth() - 10, 23 )
G.Panels.DataTextRight:SetPoint( "BOTTOM", G.Panels.RightChatBackground, "BOTTOM", 0, 5 )
G.Panels.DataTextRight:CreateOverlay( G.Panels.DataTextRight )

if( C["datatext"]["battleground"] == true ) then
	G.Panels.BattlegroundDataText:SetFrameStrata( "HIGH" )
	G.Panels.BattlegroundDataText:SetFrameLevel( 0 )
	G.Panels.BattlegroundDataText:CreateOverlay( G.Panels.BattlegroundDataText )
end