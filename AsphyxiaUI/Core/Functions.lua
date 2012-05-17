---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

S.CreateFontString = function( pixel )
	if( pixel == true ) then
		return
	else
		return C["media"]["asphyxia"], 10, "MONOCHROMEOUTLINE"
	end
end