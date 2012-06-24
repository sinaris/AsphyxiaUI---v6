---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local oUF = oUFTukui

if( not oUF ) then return end

local AddCastBarSpark = function( self )
	local Spark = self:CreateTexture( nil, "OVERLAY" )
	Spark:SetTexture( "Interface\\CastingBar\\UI-CastingBar-Spark" )
	Spark:SetVertexColor( 1, 1, 1 )
	Spark:SetBlendMode( "ADD" )
	Spark:Width( 15 )
	Spark:Height( 34 )
	Spark:Point( "LEFT", self:GetStatusBarTexture(), "RIGHT", -6, 0 )

	self.Spark = Spark
end

for unit, object in pairs( oUFTukui.units ) do
	if( unit == "player" or unit == "target" ) then
		if( object.Castbar ) then
			AddCastBarSpark( object.Castbar )
		end
	end
end