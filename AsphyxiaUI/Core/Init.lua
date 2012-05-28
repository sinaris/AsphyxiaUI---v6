---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

S.version = GetAddOnMetadata( "AsphyxiaUI", "Version" )

if( C["global"]["panellayout"] == "asphyxia" ) then
	S.InfoLeftRightWidth = 370
elseif( C["global"]["panellayout"] == "duffed" ) then
	S.InfoLeftRightWidth = 370
elseif( C["global"]["panellayout"] == "jasje" ) then
	S.InfoLeftRightWidth = 370
elseif( C["global"]["panellayout"] == "sinaris" ) then
	S.InfoLeftRightWidth = 370
end