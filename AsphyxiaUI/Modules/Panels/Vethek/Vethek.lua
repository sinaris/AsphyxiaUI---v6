---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["globalstyle"] ~= "vethek" ) then return end

------------------------------
-- Actionbars - Panels
------------------------------
local ButtonSize = 38
local ButtonSpacing = 2

G.ActionBars.Bar1:ClearAllPoints()
G.ActionBars.Bar1:SetPoint( "BOTTOM", UIParent, "BOTTOM", 0, 35 )
G.ActionBars.Bar1:Size( ( ButtonSize * 6 ) + ( ButtonSpacing * 7 ), ( ButtonSize * 2 ) + ( ButtonSpacing * 3 ) )

G.ActionBars.Bar2:ClearAllPoints()
G.ActionBars.Bar2:SetPoint( "BOTTOMRIGHT", G.ActionBars.Bar1, "BOTTOMLEFT", -3, 0 )
G.ActionBars.Bar2:Size( ( S.buttonsize * 6 ) + ( ButtonSpacing * 7 ), ( S.buttonsize * 2 ) + ( ButtonSpacing * 3 ) )

G.ActionBars.Bar3:ClearAllPoints()
G.ActionBars.Bar3:SetPoint( "BOTTOMLEFT", G.ActionBars.Bar1, "BOTTOMRIGHT", 3, 0 )
G.ActionBars.Bar3:Size( ( S.buttonsize * 6 ) + ( ButtonSpacing * 7 ), ( S.buttonsize * 2 ) + ( ButtonSpacing * 3 ) )

G.ActionBars.Bar4:ClearAllPoints()
G.ActionBars.Bar4:SetPoint( "BOTTOM", UIParent, "BOTTOM", 0, 35 )
G.ActionBars.Bar4:Size( ( ButtonSize * 6 ) + ( ButtonSpacing * 7 ), ( ButtonSize * 2 ) + ( ButtonSpacing * 3 ) )

G.ActionBars.Bar5:Size( ( S.buttonsize * 2 ) + ( ButtonSpacing * 3 ), ( S.buttonsize * 12 ) + ( ButtonSpacing * 13 ) )

------------------------------
-- Chat
------------------------------
G.Panels.LeftChatBackground:ClearAllPoints()
G.Panels.LeftChatBackground:Size( C["chat"]["width"], C["chat"]["height"] )
G.Panels.LeftChatBackground:Point( "BOTTOMLEFT", UIParent, "BOTTOMLEFT", 5, 5 )
G.Panels.LeftChatBackground:SetTemplate( "Transparent" )
G.Panels.LeftChatBackground:CreateShadow( "Default" )
G.Panels.LeftChatBackground:SetFrameLevel( 1 )
G.Panels.LeftChatBackground:SetFrameStrata( "BACKGROUND" )

G.Panels.LeftChatTabsBackground:ClearAllPoints()
G.Panels.LeftChatTabsBackground:Size( G.Panels.LeftChatBackground:GetWidth() - 10, 23 )
G.Panels.LeftChatTabsBackground:Point( "TOP", G.Panels.LeftChatBackground, "TOP", 0, -5 )
G.Panels.LeftChatTabsBackground:SetTemplate( "Transparent" )
G.Panels.LeftChatTabsBackground:CreateOverlay( G.Panels.LeftChatTabsBackground )
G.Panels.LeftChatTabsBackground:SetFrameLevel( 2 )
G.Panels.LeftChatTabsBackground:SetFrameStrata( "BACKGROUND" )

------------------------------
-- Datatext Panels
------------------------------
G.Panels.DataTextLeft:ClearAllPoints()
G.Panels.DataTextLeft:Size( G.Panels.LeftChatBackground:GetWidth() - 10, 23 )
G.Panels.DataTextLeft:Point( "BOTTOM", G.Panels.LeftChatBackground, "BOTTOM", 0, 5 )
G.Panels.DataTextLeft:SetTemplate( "Transparent" )
G.Panels.DataTextLeft:CreateOverlay( G.Panels.DataTextLeft )

------------------------------
-- Minimap
------------------------------
if( TukuiMinimap ) then
	G.Panels.DataTextMinimapLeft:Size( ( ( TukuiMinimap:GetWidth() + 8 ) / 2 ), 19 )
	G.Panels.DataTextMinimapLeft:CreateOverlay( G.Panels.DataTextMinimapLeft )

	G.Panels.DataTextMinimapRight:Size( ( ( TukuiMinimap:GetWidth() + 8 ) / 2 ), 19 )
	G.Panels.DataTextMinimapRight:CreateOverlay( G.Panels.DataTextMinimapRight )
end