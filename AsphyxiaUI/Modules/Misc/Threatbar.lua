---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local AsphyxiaUIThreatbarBackground = CreateFrame( "Frame", "AsphyxiaUIThreatbarBackground", UIParent )
AsphyxiaUIThreatbarBackground:Size( AsphyxiaUIActionbar1:GetWidth(), 20 )
AsphyxiaUIThreatbarBackground:Point( "TOP", AsphyxiaUIActionbar1, "BOTTOM", 0, -3 )
AsphyxiaUIThreatbarBackground:SetTemplate( "Default" )

G.Misc.ThreatBar:ClearAllPoints()
G.Misc.ThreatBar:Point( "TOPLEFT", AsphyxiaUIThreatbarBackground, 2, -2 )
G.Misc.ThreatBar:Point( "BOTTOMRIGHT", AsphyxiaUIThreatbarBackground, -2, 2 )

G.Misc.ThreatBar.text:SetFont( S.CreateFontString() )
G.Misc.ThreatBar.Title:SetFont( S.CreateFontString() )

AsphyxiaUIThreatbarBackground:SetAlpha( 0 )