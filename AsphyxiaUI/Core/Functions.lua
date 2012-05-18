---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

S.CreateFontString = function()
	if( C["global"]["unitframelayout"] == "asphyxia" ) then
		if( S.client == "ruRU" ) then
			return C["media"]["pixel_ru"], 10, "MONOCHROMEOUTLINE"
		else
			return C["media"]["asphyxia"], 10, "MONOCHROMEOUTLINE"
		end
	elseif( C["global"]["unitframelayout"] == "asphyxia2" ) then
		if( S.client == "ruRU" ) then
			return C["media"]["pixel_ru"], 10, "MONOCHROMEOUTLINE"
		else
			return C["media"]["asphyxia"], 10, "MONOCHROMEOUTLINE"
		end
	elseif( C["global"]["unitframelayout"] == "asphyxia3" ) then
		if( S.client == "ruRU" ) then
			return C["media"]["pixel_ru"], 10, "MONOCHROMEOUTLINE"
		else
			return C["media"]["asphyxia"], 10, "MONOCHROMEOUTLINE"
		end
	elseif( C["global"]["unitframelayout"] == "asphyxia4" ) then
		if( S.client == "ruRU" ) then
			return C["media"]["pixel_ru"], 10, "MONOCHROMEOUTLINE"
		else
			return C["media"]["asphyxia"], 10, "MONOCHROMEOUTLINE"
		end
	elseif( C["global"]["unitframelayout"] == "duffed" ) then
		if( S.client == "ruRU" ) then
			return C["media"]["pixel_ru"], 10, "MONOCHROMEOUTLINE"
		else
			return C["media"]["pixel_normal"], 10, "MONOCHROMEOUTLINE"
		end
	elseif( C["global"]["unitframelayout"] == "duffed2" ) then
		if( S.client == "ruRU" ) then
			return C["media"]["pixel_ru"], 10, "MONOCHROMEOUTLINE"
		else
			return C["media"]["pixel_normal"], 10, "MONOCHROMEOUTLINE"
		end
	elseif( C["global"]["unitframelayout"] == "jasje" ) then
		if( S.client == "ruRU" ) then
			return C["media"]["pixel_ru"], 10, "OUTLINEMONOCHROME"
		else
			return C["media"]["pixel_normal"], 12, "OUTLINEMONOCHROME"
		end
	elseif( C["global"]["unitframelayout"] == "merith" ) then
		if( S.client == "ruRU" ) then
			return C["media"]["pixel_ru"], 10, "MONOCHROMEOUTLINE"
		else
			return C["media"]["pixel_normal"], 10, "MONOCHROMEOUTLINE"
		end
	elseif( C["global"]["unitframelayout"] == "merith2" ) then
		if( S.client == "ruRU" ) then
			return C["media"]["pixel_ru"], 10, "MONOCHROMEOUTLINE"
		else
			return C["media"]["pixel_normal"], 10, "MONOCHROMEOUTLINE"
		end
	elseif( C["global"]["unitframelayout"] == "sinaris" ) then
		if( S.client == "ruRU" ) then
			return C["media"]["pixel_ru"], 10, "MONOCHROMEOUTLINE"
		else
			return C["media"]["pixel_normal"], 10, "MONOCHROMEOUTLINE"
		end
	else
		return C["media"]["asphyxia"], 10, "MONOCHROMEOUTLINE"
	end
end