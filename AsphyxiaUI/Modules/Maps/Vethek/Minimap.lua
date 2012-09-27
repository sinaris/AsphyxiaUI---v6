---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["globalstyle"] ~= "vethek" ) then return end

G.Maps.Minimap:ClearAllPoints()

G.Maps.Minimap:ClearAllPoints()
G.Maps.Minimap:Point( "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -5, 26 )

G.Maps.Minimap:Size( 154 )

Minimap:Size( 150 )