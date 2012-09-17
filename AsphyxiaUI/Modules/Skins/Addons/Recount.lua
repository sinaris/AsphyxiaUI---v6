---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["addonskins"]["enable"] ~= true ) then return end

if( not IsAddOnLoaded( "Recount" ) or C["addonskins"]["recount"] ~= true ) then return end