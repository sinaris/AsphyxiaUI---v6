---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["panellayout"] ~= "duffed" ) then return end

print( "panel: duffed" )

------------------------------
-- not needed
------------------------------
local panelsToKill = { G.ActionBars.Bar5, G.ActionBars.Bar6, G.ActionBars.Bar7, G.Panels.LeftDataTextToActionBarLine, G.Panels.RightDataTextToActionBarLine }

for _, panels in pairs( panelsToKill ) do
	panels:Kill()
end

------------------------------
-- actionbars
------------------------------
G.ActionBars.Bar1:ClearAllPoints()
if( C["actionbar"]["duffedablayout"] == 1 ) then
	G.ActionBars.Bar1:SetPoint( "BOTTOM", UIParent, "BOTTOM", 0, 26 )
	G.ActionBars.Bar1:Size( ( S.buttonsize * 24 ) + ( S.buttonspacing * 25 ), ( S.buttonsize * 1 ) + ( S.buttonspacing * 2 ) )
else
	G.ActionBars.Bar1:SetPoint( "BOTTOM", UIParent, "BOTTOM", 0, 67 )
	G.ActionBars.Bar1:Size( ( S.buttonsize * 12 ) + ( S.buttonspacing * 13 ), ( S.buttonsize * 2 ) + ( S.buttonspacing * 3 ) )
end
G.ActionBars.Bar1:SetFrameStrata( "BACKGROUND" )
G.ActionBars.Bar1:SetFrameLevel( 1 )
G.ActionBars.Bar1:CreateShadow( "Default" )

G.ActionBars.Bar2:ClearAllPoints()
if( C["actionbar"]["duffedablayout"] == 1 ) then
	G.ActionBars.Bar2:SetPoint( "BOTTOM", G.ActionBars.Bar1, "TOP", 0, 4 )
	G.ActionBars.Bar2:Size( ( S.buttonsize * 12 ) + ( S.buttonspacing * 13 ), ( S.buttonsize * 1 ) + ( S.buttonspacing * 2 ) )
else
	G.ActionBars.Bar2:SetPoint( "BOTTOMRIGHT", G.ActionBars.Bar1, "BOTTOMLEFT", -6, 0 )
	G.ActionBars.Bar2:Size( ( S.buttonsize * 3 ) + ( S.buttonspacing * 4 ), ( S.buttonsize * 2 ) + ( S.buttonspacing * 3 ) )
end
G.ActionBars.Bar2:SetFrameStrata( "BACKGROUND" )
G.ActionBars.Bar2:SetFrameLevel( 2 )
G.ActionBars.Bar2:CreateShadow( "Default" )

G.ActionBars.Bar3:ClearAllPoints()
G.ActionBars.Bar3:SetPoint( "RIGHT", UIParent, "RIGHT", -14, -14 )
G.ActionBars.Bar3:Size( ( S.buttonsize * 2 ) + ( S.buttonspacing * 3 ), ( S.buttonsize * 12 ) + ( S.buttonspacing * 13 ) )
G.ActionBars.Bar3:SetFrameStrata( "BACKGROUND" )
G.ActionBars.Bar3:SetFrameLevel( 2 )
G.ActionBars.Bar3:CreateShadow( "Default" )

if( C["actionbar"]["duffedablayout"] == 1 ) then
	G.ActionBars.Bar4:Kill()
elseif( C["actionbar"]["duffedablayout"] == 2 ) then
	G.ActionBars.Bar4:ClearAllPoints()
	G.ActionBars.Bar4:SetPoint( "BOTTOMLEFT", G.ActionBars.Bar1, "BOTTOMRIGHT", 6, 0 )
	G.ActionBars.Bar4:Size( ( S.buttonsize * 3 ) + ( S.buttonspacing * 4 ), ( S.buttonsize * 2 ) + ( S.buttonspacing * 3 ) )
	G.ActionBars.Bar4:SetFrameStrata( "BACKGROUND" )
	G.ActionBars.Bar4:SetFrameLevel( 2 )
	G.ActionBars.Bar4:CreateShadow( "Default" )
end

G.ActionBars.Pet:ClearAllPoints()
if( C["actionbar"]["horizontal_petbar"] == true ) then
	G.ActionBars.Pet:Size( ( S.petbuttonsize * 10 ) + ( S.petbuttonspacing * 11 ), S.petbuttonsize + ( S.petbuttonspacing * 2 ) )
	G.ActionBars.Pet:SetPoint( "BOTTOM", G.ActionBars.Bar2, "TOP", 0, 4 )

	G.ActionBars.Pet.BackgroundLink:Hide()
else
	G.ActionBars.Pet:Size( S.petbuttonsize + ( S.petbuttonspacing * 2 ), ( S.petbuttonsize * 10 ) + ( S.petbuttonspacing * 11 ) )
	G.ActionBars.Pet:SetPoint( "RIGHT", G.ActionBars.Bar3, "LEFT", -6, 0 )
end
G.ActionBars.Pet:CreateShadow( "Default" )

local TukuiDuffedABSwapHolderBar = CreateFrame("Frame", "TukuiDuffedABSwapHolderBar", UIParent, "SecureHandlerStateTemplate")
TukuiDuffedABSwapHolderBar:CreatePanel("Default", 1, 1, "CENTER", UIParent, "CENTER", 0, 0)
TukuiDuffedABSwapHolderBar:ClearAllPoints()
TukuiDuffedABSwapHolderBar:SetAllPoints( G.ActionBars.Bar2 )
TukuiDuffedABSwapHolderBar:SetFrameStrata("BACKGROUND")
TukuiDuffedABSwapHolderBar:SetFrameLevel(1)
TukuiDuffedABSwapHolderBar:Hide()

------------------------------
-- datatext panels
------------------------------
G.Panels.DataTextLeft:ClearAllPoints()
G.Panels.DataTextLeft:CreateShadow( "Default" )
if( C["actionbar"]["duffedablayout"] == 2 ) then
	G.Panels.DataTextLeft:Size( S.InfoLeftRightWidth - 9, 19 )
	G.Panels.DataTextLeft:SetPoint( "BOTTOMLEFT", UIParent, "BOTTOMLEFT", 5, 3 )
else
	G.Panels.DataTextLeft:Size( S.Scale( S.InfoLeftRightWidth ), 19 )
	G.Panels.DataTextLeft:SetPoint( "BOTTOMRIGHT", UIParent, "BOTTOM", -12, 3 )
end

G.Panels.DataTextRight:ClearAllPoints()
G.Panels.DataTextRight:CreateShadow( "Default" )
if( C["actionbar"]["duffedablayout"] == 2 ) then
	G.Panels.DataTextRight:Size( S.InfoLeftRightWidth + 12, 19 )
	G.Panels.DataTextRight:SetPoint( "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -5, 3 )
else
	G.Panels.DataTextRight:Size( S.Scale( S.InfoLeftRightWidth ), 19 )
	G.Panels.DataTextRight:SetPoint( "BOTTOMLEFT", UIParent, "BOTTOM", 12, 3 )
end

if( C["actionbar"]["buttonsize"] > 26 and C["actionbar"]["duffedablayout"] == 1 ) then
	G.Panels.BottomLeftLine:SetAlpha( 1 )
	G.Panels.BottomLeftLine:ClearAllPoints()
	G.Panels.BottomLeftLine:Size( 10, 2 )
	G.Panels.BottomLeftLine:SetPoint( "RIGHT", G.Panels.DataTextLeft, "LEFT", 0, 0 )

	G.Panels.BottomRightLine:SetAlpha( 1 )
	G.Panels.BottomRightLine:ClearAllPoints()
	G.Panels.BottomRightLine:Size( 10, 2 )
	G.Panels.BottomRightLine:SetPoint( "LEFT", G.Panels.DataTextRight, "RIGHT", 0, 0 )

	G.Panels.BottomLeftVerticalLine:SetAlpha( 1 )
	G.Panels.BottomLeftVerticalLine:ClearAllPoints()
	G.Panels.BottomLeftVerticalLine:Size( 2, 13 )
	G.Panels.BottomLeftVerticalLine:SetPoint( "BOTTOM", G.Panels.BottomLeftLine, "LEFT", 0, -1 )

	G.Panels.BottomRightVerticalLine:SetAlpha( 1 )
	G.Panels.BottomRightVerticalLine:ClearAllPoints()
	G.Panels.BottomRightVerticalLine:Size( 2, 13 )
	G.Panels.BottomRightVerticalLine:SetPoint( "BOTTOM", G.Panels.BottomRightLine, "RIGHT", 0, -1 )
end

------------------------------
-- chat
------------------------------
G.Panels.LeftChatBackground:ClearAllPoints()
G.Panels.LeftChatBackground:Size( C["chat"]["width"], C["chat"]["height"] )
if( C["actionbar"]["duffedablayout"] == 2 ) then
	G.Panels.LeftChatBackground:SetPoint( "BOTTOMLEFT", UIParent, "BOTTOMLEFT", 5, 24 )
else
	G.Panels.LeftChatBackground:SetPoint( "BOTTOMLEFT", UIParent, "BOTTOMLEFT", 5, 3 )
end
G.Panels.LeftChatBackground:CreateShadow( "Default" )
G.Panels.LeftChatBackground:SetTemplate( "Transparent" )

G.Panels.RightChatBackground:ClearAllPoints()
G.Panels.RightChatBackground:Size( C["chat"]["width"], C["chat"]["height"] )
if( C["actionbar"]["duffedablayout"] == 2 ) then
	G.Panels.RightChatBackground:SetPoint( "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -5, 24 )
else
	G.Panels.RightChatBackground:SetPoint( "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -5, 3 )
end
G.Panels.RightChatBackground:CreateShadow( "Default" )
G.Panels.RightChatBackground:SetTemplate( "Transparent" )

G.Panels.LeftChatTabsBackground:ClearAllPoints()
G.Panels.LeftChatTabsBackground:Size( G.Panels.LeftChatBackground:GetWidth() - 8, 20 )
G.Panels.LeftChatTabsBackground:SetPoint( "TOP", G.Panels.LeftChatBackground, "TOP", 0, -4 )

G.Panels.RightChatTabsBackground:ClearAllPoints()
G.Panels.RightChatTabsBackground:Size( G.Panels.RightChatBackground:GetWidth() - 8, 20 )
G.Panels.RightChatTabsBackground:SetPoint( "TOP", G.Panels.RightChatBackground, "TOP", 0, -4 )

------------------------------
-- minimap
------------------------------
if( TukuiMinimap ) then
	G.Panels.DataTextMinimapLeft:CreateShadow( "Default" )
	G.Panels.DataTextMinimapRight:CreateShadow( "Default" )
end