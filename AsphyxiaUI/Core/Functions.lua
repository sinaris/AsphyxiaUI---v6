---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

S.buttonsize = S.Scale( C["actionbar"].buttonsize )
S.buttonspacing = S.Scale( C["actionbar"].buttonspacing )
S.petbuttonsize = S.Scale( C["actionbar"].petbuttonsize )
S.petbuttonspacing = S.Scale( C["actionbar"].buttonspacing )
S.stancebuttonsize = S.Scale( C["actionbar"].stancebuttonsize )

S.panelcolor = S.RGBToHex( unpack( C["media"]["datatextcolor1"] ) )

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
			return C["media"]["pixel_normal"], 12, "MONOCHROMEOUTLINE"
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
	elseif( C["global"]["unitframelayout"] == "smelly" ) then
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
	UIFrameFadeOut( self, 0.4, 1, 0 )
	self.frame:Show()
end

function S.fadeIn( p )
	p.frame = CreateFrame( "Frame", nil, p )
	p.frame:Hide()
	p.frame.parent = p
	p.frame:SetScript( "OnUpdate", S.update_alpha )
	p:SetScript( "OnShow", function()
		p.frame:Hide()
		UIFrameFadeIn( p, 0.4, 0, 1 )
	end )
	p.fadeOut = S.fadeOut
end

S.CastbarResize = function()
	if( C["global"]["panellayout"] ~= "duffed" ) then return end

	if( C["unitframes"]["enable"] ~= true or C["unitframes"]["unitcastbar"] ~= true ) then return end

	local x = 4
	if( C["castbar"]["cbicons"] == true ) then
		x = 32
	end

	if( C["actionbar"]["duffedablayout"] == 1 ) then
		if( C["actionbar"]["horizontal_petbar"] == true ) then
			if( TukuiPetBar:IsShown() ) then
				TukuiPlayerCastBar:Width( TukuiPetBar:GetWidth() - x )
			else
				TukuiPlayerCastBar:Width( ( TukuiBar2:GetWidth() + 1 ) - x )
			end
		else
			TukuiPlayerCastBar:Width( ( TukuiBar2:GetWidth() + 1 ) - x )
		end
	else
		if( C["actionbar"]["horizontal_petbar"] == true ) then
			if( TukuiPetBar:IsShown() ) then
				TukuiPlayerCastBar:Width( TukuiPetBar:GetWidth() - x )
			else
				TukuiPlayerCastBar:Width( ( TukuiBar1:GetWidth() + 1 ) - x )
			end
		else
			TukuiPlayerCastBar:Width( ( TukuiBar1:GetWidth() + 1 ) - x )
		end
	end
end

S.CastbarPosition = function()
	if( C["global"]["panellayout"] ~= "duffed" ) then return end

	if( C["unitframes"]["enable"] ~= true or C["unitframes"]["unitcastbar"] ~= true ) then return end

	S.CastbarResize()

	local x = 0
	local y = 5
	if( C["castbar"]["cbicons"] == true ) then
		x = 14
	end

	if( TukuiDataPerChar.hidebar2 == true ) then
		TukuiPlayerCastBar:ClearAllPoints()
		if( C["actionbar"]["horizontal_petbar"] == true ) then
			if( TukuiPetBar:IsShown() ) then
				TukuiPlayerCastBar:Point( "BOTTOMRIGHT", TukuiPetBar, "TOPRIGHT", -2, y )
			else
				TukuiPlayerCastBar:Point( "BOTTOM", TukuiBar1, "TOP", x, y )
			end
		else
			TukuiPlayerCastBar:Point( "BOTTOM", TukuiBar1, "TOP", x, y )
		end
	else
		TukuiPlayerCastBar:ClearAllPoints()
		if( C["actionbar"]["duffedablayout"] == 1 ) then
			if( C["actionbar"]["horizontal_petbar"] == true ) then
				if( TukuiPetBar:IsShown() ) then
					TukuiPlayerCastBar:Point( "BOTTOMRIGHT", TukuiPetBar, "TOPRIGHT", -2, y )
				else
					TukuiPlayerCastBar:Point( "BOTTOMRIGHT", TukuiBar2, "TOPRIGHT", -2, y )
				end
			else
				TukuiPlayerCastBar:Point( "BOTTOMRIGHT", TukuiBar2, "TOPRIGHT", -2, y )
			end
		else
			if( C["actionbar"]["horizontal_petbar"] == true ) then
				if( TukuiPetBar:IsShown() ) then
					TukuiPlayerCastBar:Point( "BOTTOMRIGHT", TukuiPetBar, "TOPRIGHT", -2, y )
				else
					TukuiPlayerCastBar:Point( "BOTTOMRIGHT", TukuiBar1, "TOPRIGHT", -2, y )
				end
			else
				TukuiPlayerCastBar:Point( "BOTTOMRIGHT", TukuiBar1, "TOPRIGHT", -2, y )
			end
		end
	end
end

S.PetbarPosition = function()
	if( C["global"]["panellayout"] ~= "duffed" ) then return end

	if( C["actionbar"]["horizontal_petbar"] ~= true or InCombatLockdown() ) then return end

	TukuiPetBar:ClearAllPoints()
	if( TukuiDataPerChar.hidebar2 == true ) then
		TukuiPetBar:Point( "BOTTOM", TukuiBar1, "TOP", 0, 4 )
	else
		TukuiPetBar:Point( "BOTTOM", TukuiBar2, "TOP", 0, 4 )
	end
end