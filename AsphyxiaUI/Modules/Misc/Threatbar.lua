---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( not TukuiInfoRight or not oUFTukui ) then return end

G.Misc.ThreatBar:ClearAllPoints()
G.Misc.ThreatBar:Point( "TOPLEFT", AsphyxiaUIInfoCenter, 2, -2 )
G.Misc.ThreatBar:Point( "BOTTOMRIGHT", AsphyxiaUIInfoCenter, -2, 2 )
G.Misc.ThreatBar:SetBackdropColor( 0, 0, 0, 1 )

G.Misc.ThreatBar.text:SetFont( S.CreateFontString() )
G.Misc.ThreatBar.Title:SetFont( S.CreateFontString() )