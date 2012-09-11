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
local ButtonSpacing = 2.5

G.ActionBars.Bar1:ClearAllPoints()
G.ActionBars.Bar1:SetPoint( "BOTTOM", UIParent, "BOTTOM", 0, 35 )
G.ActionBars.Bar1:Size( ( ButtonSize * 6 ) + ( ButtonSpacing * 7 ), ( ButtonSize * 2 ) + ( ButtonSpacing * 3 ) )

G.ActionBars.Bar4:ClearAllPoints()
G.ActionBars.Bar4:SetPoint( "BOTTOM", UIParent, "BOTTOM", 0, 35 )
G.ActionBars.Bar4:Size( ( ButtonSize * 6 ) + ( ButtonSpacing * 7 ), ( ButtonSize * 2 ) + ( ButtonSpacing * 3 ) )

G.ActionBars.Bar5:Size( ( S.buttonsize * 2 ) + ( S.buttonspacing * 3 ), ( S.buttonsize * 12 ) + ( S.buttonspacing * 13 ) )

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

G.Panels.RightChatBackground:ClearAllPoints()
G.Panels.RightChatBackground:Size( C["chat"]["width"], C["chat"]["height"] )
G.Panels.RightChatBackground:Point( "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -5, 5 )
G.Panels.RightChatBackground:SetTemplate( "Transparent" )
G.Panels.RightChatBackground:CreateShadow( "Default" )
G.Panels.RightChatBackground:SetFrameLevel( 1 )
G.Panels.RightChatBackground:SetFrameStrata( "BACKGROUND" )

G.Panels.LeftChatTabsBackground:ClearAllPoints()
G.Panels.LeftChatTabsBackground:Size( G.Panels.LeftChatBackground:GetWidth() - 10, 23 )
G.Panels.LeftChatTabsBackground:Point( "TOP", G.Panels.LeftChatBackground, "TOP", 0, -5 )
G.Panels.LeftChatTabsBackground:SetTemplate( "Transparent" )
G.Panels.LeftChatTabsBackground:SetFrameLevel( 2 )
G.Panels.LeftChatTabsBackground:SetFrameStrata( "BACKGROUND" )

G.Panels.RightChatTabsBackground:ClearAllPoints()
G.Panels.RightChatTabsBackground:Size( G.Panels.RightChatBackground:GetWidth() - 10, 23 )
G.Panels.RightChatTabsBackground:Point( "TOP", G.Panels.RightChatBackground, "TOP", 0, -5 )
G.Panels.RightChatTabsBackground:SetTemplate( "Transparent" )
G.Panels.RightChatTabsBackground:SetFrameLevel( 2 )
G.Panels.RightChatTabsBackground:SetFrameStrata( "BACKGROUND" )