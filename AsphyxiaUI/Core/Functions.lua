---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

S.buttonsize = S.Scale( C["actionbar"].buttonsize )
S.buttonspacing = S.Scale( C["actionbar"].buttonspacing )
S.petbuttonsize = S.Scale( C["actionbar"].petbuttonsize )
S.petbuttonspacing = S.Scale( C["actionbar"].buttonspacing )
S.stancebuttonsize = S.Scale( C["actionbar"].stancebuttonsize )

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

function S.SetModifiedBackdrop( self )
	local color = RAID_CLASS_COLORS[S.myclass]
	self:SetBackdropColor(color.r * 0.15, color.g * 0.15, color.b * 0.15 )
	self:SetBackdropBorderColor( color.r, color.g, color.b )
end

function S.SetOriginalBackdrop( self )
	local color = RAID_CLASS_COLORS[S.myclass]
	if( C["general"]["classcolortheme"] == true ) then
		self:SetBackdropBorderColor( color.r, color.g, color.b )
	else
		self:SetTemplate( "Default" )
	end
end

function S.update_alpha( self )
	if( self.parent:GetAlpha() == 0 ) then
		self.parent:Hide()
		self:Hide()
	end
end

function S.fadeOut( self )
	UIFrameFadeOut( self, .4, 1, 0 )
	self.frame:Show()
end

function S.fadeIn( p )
	p.frame = CreateFrame( "Frame", nil, p )
	p.frame:Hide()
	p.frame.parent = p
	p.frame:SetScript( "OnUpdate", S.update_alpha )
	p:SetScript( "OnShow", function()
		p.frame:Hide()
		UIFrameFadeIn( p, .4, 0, 1 )
	end )
	p.fadeOut = S.fadeOut
end