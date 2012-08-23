---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

TukuiAurasPlayerBuffs:ClearAllPoints()
TukuiAurasPlayerDebuffs:ClearAllPoints()

TukuiAurasPlayerBuffs:SetPoint( "TOPRIGHT", UIParent, -204, -2 )
TukuiAurasPlayerBuffs:SetAttribute( "wrapAfter", 17 )
TukuiAurasPlayerBuffs:SetAttribute( "xOffset", -33 )
TukuiAurasPlayerBuffs:SetAttribute( "wrapYOffset", -67.5 )

TukuiAurasPlayerDebuffs:SetPoint( "TOPRIGHT", UIParent, -204, -137 )
TukuiAurasPlayerDebuffs:SetAttribute( "wrapAfter", 17 )
TukuiAurasPlayerDebuffs:SetAttribute( "xOffset", -33 )

local HookFrames = {
	TukuiAurasPlayerBuffs,
	TukuiAurasPlayerDebuffs,
	TukuiAurasPlayerConsolidate,
}

local OnAttributeChanged = function( self )
	for i = 1, self:GetNumChildren() do
		local child = select( i, self:GetChildren() )

		if( child ) then
			child:CreateShadow( "Default" )
		end

		if( child.Duration ) then
			child.Duration:SetFont( S.CreateFontString() )
			child.Duration:ClearAllPoints()
			child.Duration:SetPoint( "BOTTOM", 0, -1 )
		end

		if( child.Count ) then
			child.Count:SetFont( S.CreateFontString() )
			child.Count:ClearAllPoints()
			child.Count:SetPoint( "TOP", 0, -4 )
		end

		if( child.Holder ) then
			child.Holder:ClearAllPoints()
			child.Holder:SetPoint( "TOP", child, "BOTTOM", 0, -3 )
			child.Holder:CreateShadow( "Default" )
		end
	end
end

for _, frame in pairs( HookFrames ) do
	frame:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	frame:HookScript( "OnAttributeChanged", OnAttributeChanged )
	frame:HookScript( "OnEvent", OnAttributeChanged )
end