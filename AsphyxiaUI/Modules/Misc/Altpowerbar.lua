---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

G.Misc.AltPowerBar:ClearAllPoints()
G.Misc.AltPowerBar:SetAllPoints( AsphyxiaUILeftDataTextPanel )

G.Misc.AltPowerBar.Status:ClearAllPoints()
G.Misc.AltPowerBar.Status:Point( "TOPLEFT", AsphyxiaUILeftDataTextPanel, "TOPLEFT", 2, -2 )
G.Misc.AltPowerBar.Status:Point( "BOTTOMRIGHT", AsphyxiaUILeftDataTextPanel, "BOTTOMRIGHT", -2, 2 )

G.Misc.AltPowerBar.Text:SetFont( S.CreateFontString() )