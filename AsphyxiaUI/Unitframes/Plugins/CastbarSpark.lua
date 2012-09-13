---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["unitframes"]["unitcastbar"] ~= true ) then return end

local oUF = oUFTukui

if( not oUF ) then return end

local AddCastBarSpark = function( self )
	local Spark = self:CreateTexture( nil, "OVERLAY" )
	Spark:SetTexture( "Interface\\CastingBar\\UI-CastingBar-Spark" )
	Spark:SetVertexColor( 1, 1, 1 )
	Spark:SetBlendMode( "ADD" )
	Spark:Width( 15 )
	Spark:Height( 34 )
	Spark:Point( "LEFT", self:GetStatusBarTexture(), "RIGHT", -7, 0 )

	self.Spark = Spark
end

AddCastBarSpark( G.UnitFrames.Player.Castbar )
AddCastBarSpark( G.UnitFrames.Target.Castbar )