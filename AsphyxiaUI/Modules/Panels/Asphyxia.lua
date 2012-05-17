---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["panellayout"] ~= "asphyxia" ) then return end

print( "panel: asphyxia" )

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