---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

S.CreateFontString = function()
	if( S.client == "ruRU" ) then
		return C["media"]["pixel_ru"], 10, "MONOCHROMEOUTLINE"
	else
		return C["media"]["asphyxia"], 10, "MONOCHROMEOUTLINE"
	end
end

function S.SetModifiedBackdrop( self )
	local color = RAID_CLASS_COLORS[S.myclass]
	self:SetBackdropColor( color.r * 0.15, color.g * 0.15, color.b * 0.15 )
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

S.DataBarPoint = function( p, obj )
	obj:SetPoint( "TOPRIGHT", S.databars[p], "TOPRIGHT", -2, -2 )
	obj:SetPoint( "BOTTOMLEFT", S.databars[p], "BOTTOMLEFT", 2, 2 )
end

S.DataBarTooltipAnchor = function( barNum )
	local xoff = -S.databars[barNum]:GetWidth()
	local yoff = S.Scale(-5)
	
	if( C["databars"]["settings"]["vertical"] == true ) then
		xoff = S.Scale( 5 )
		yoff = S.databars[barNum]:GetHeight()
	end

	return xoff, yoff
end