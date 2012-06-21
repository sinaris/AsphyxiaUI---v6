---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["unitframes"]["enable"] ~= true ) then return end

G.Maps.Minimap:ClearAllPoints()

G.Maps.Minimap.Zone.Text:SetFont( S.CreateFontString() )
G.Maps.Minimap.Coord.Text:SetFont( S.CreateFontString() )

if( C["global"]["panellayout"] == "asphyxia" ) then
	G.Maps.Minimap:Size( 153 )
	G.Maps.Minimap:Size( 153 )
	G.Maps.Minimap:Point( "TOPRIGHT", UIParent, "TOPRIGHT", -34, -10 )
	G.Maps.Minimap:CreateShadow( "Default" )

	Minimap:Size( 153 )
elseif( C["global"]["panellayout"] == "duffed" ) then
	G.Maps.Minimap:Point( "TOPRIGHT", UIParent, "TOPRIGHT", -34, -5 )

	G.Maps.Minimap.Ticket:FontString( "Text", S.CreateFontString() )
elseif( C["global"]["panellayout"] == "jasje" ) then
	G.Maps.Minimap:Point( "TOPRIGHT", UIParent, "TOPRIGHT", -10, -15 )

	G.Maps.Minimap.Ticket:ClearAllPoints()
	G.Maps.Minimap.Ticket:Size( G.Maps.Minimap:GetWidth() - 4, 18 )
	G.Maps.Minimap.Ticket:FontString( "Text", S.CreateFontString() )
	G.Maps.Minimap.Ticket.Text:SetPoint( "CENTER", 0, 2 )
elseif( C["global"]["panellayout"] == "sinaris" ) then

end