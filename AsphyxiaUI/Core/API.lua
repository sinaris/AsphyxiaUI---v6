---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local function CreateBorder( self, shadow )
	if( self:GetFrameStrata() == "BACKGROUND" ) then self:SetFrameStrata( "LOW" ) end

	local border = CreateFrame( "Frame", nil, self )
	border:SetPoint( "TOPLEFT", self, "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
	border:SetPoint( "BOTTOMRIGHT", self, "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
	border:SetTemplate( "Transparent" )
	
	if( shadow == true ) then
		border:CreateShadow( "Default" )
	end
	border:SetFrameLevel( self:GetFrameLevel() )
end

local function addapi( object )
	local mt = getmetatable( object ).__index

	if( not object.CreateBorder ) then mt.CreateBorder = CreateBorder end
end

local handled = { ["Frame"] = true }
local object = CreateFrame( "Frame" )
addapi( object )
addapi( object:CreateTexture() )
addapi( object:CreateFontString() )

object = EnumerateFrames()
while object do
	if( not handled[object:GetObjectType()] ) then
		addapi( object )
		handled[object:GetObjectType()] = true
	end

	object = EnumerateFrames( object )
end