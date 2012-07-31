---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

G.Maps.Minimap:ClearAllPoints()

G.Maps.Minimap.Zone.Text:SetFont( S.CreateFontString() )
G.Maps.Minimap.Coord.Text:SetFont( S.CreateFontString() )

G.Maps.Minimap:Size( 153 )
G.Maps.Minimap:Size( 153 )
G.Maps.Minimap:Point( "TOPRIGHT", UIParent, "TOPRIGHT", -2, -2 )
G.Maps.Minimap:CreateShadow( "Default" )

Minimap:Size( 153 )