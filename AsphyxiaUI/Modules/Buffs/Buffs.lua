---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

TukuiAurasPlayerBuffs:ClearAllPoints()
TukuiAurasPlayerDebuffs:ClearAllPoints()

if( C["global"]["panellayout"] == "asphyxia" ) then

	TukuiAurasPlayerBuffs:SetPoint( "TOPRIGHT", UIParent, -159, -2 )
	TukuiAurasPlayerBuffs:SetAttribute( "wrapAfter", 17 )
	TukuiAurasPlayerBuffs:SetAttribute( "xOffset", -33 )
	TukuiAurasPlayerBuffs:SetAttribute( "wrapYOffset", -67.5 )

	TukuiAurasPlayerDebuffs:SetPoint( "TOPRIGHT", UIParent, -159, -137 )
	TukuiAurasPlayerDebuffs:SetAttribute( "wrapAfter", 17 )
	TukuiAurasPlayerDebuffs:SetAttribute( "xOffset", -33 )

	local hooks = {
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
		end
	end

	for _, frame in pairs( hooks ) do
		frame:RegisterEvent( "PLAYER_ENTERING_WORLD" )
		frame:HookScript( "OnAttributeChanged", OnAttributeChanged )
		frame:HookScript( "OnEvent", OnAttributeChanged )
	end

elseif( C["global"]["panellayout"] == "duffed" ) then

	TukuiAurasPlayerBuffs:SetPoint( "TOPRIGHT", G.Maps.Minimap, "TOPLEFT", -8, 0 )
	TukuiAurasPlayerBuffs:SetAttribute( "wrapAfter", 14 )
	TukuiAurasPlayerBuffs:SetAttribute( "xOffset", -33 )
	TukuiAurasPlayerBuffs:SetAttribute( "wrapYOffset", -39 )

	TukuiAurasPlayerDebuffs:SetPoint( "TOPRIGHT", G.Maps.Minimap, "BOTTOMLEFT", -8, -15 )
	TukuiAurasPlayerDebuffs:SetAttribute( "wrapAfter", 14 )
	TukuiAurasPlayerDebuffs:SetAttribute( "xOffset", -33 )

	local hooks = {
		TukuiAurasPlayerBuffs,
		TukuiAurasPlayerDebuffs,
		TukuiAurasPlayerConsolidate,
	}

	local OnAttributeChanged = function( self )
		for i = 1, self:GetNumChildren() do
			local child = select( i, self:GetChildren() )

			if( child.Duration ) then
				child.Duration:SetFont( S.CreateFontString() )
				child.Duration:ClearAllPoints()
				child.Duration:SetPoint( "BOTTOM", 0, -10 )
			end

			if( child.Count ) then
				child.Count:SetFont( S.CreateFontString() )
				child.Count:ClearAllPoints()
				child.Count:SetPoint( "BOTTOMRIGHT", -1, 1 )
			end
		end
	end

	for _, frame in pairs( hooks ) do
		frame:RegisterEvent( "PLAYER_ENTERING_WORLD" )
		frame:HookScript( "OnAttributeChanged", OnAttributeChanged )
		frame:HookScript( "OnEvent", OnAttributeChanged )
	end

elseif( C["global"]["panellayout"] == "jasje" ) then
	TukuiAurasPlayerBuffs:SetPoint( "TOPRIGHT", G.Maps.Minimap, "TOPLEFT", -8, 0 )
	TukuiAurasPlayerBuffs:SetAttribute( "wrapAfter", 14 )
	TukuiAurasPlayerBuffs:SetAttribute( "xOffset", -33 )
	TukuiAurasPlayerBuffs:SetAttribute( "wrapYOffset", -39 )

	TukuiAurasPlayerDebuffs:SetPoint( "TOPRIGHT", G.Maps.Minimap, "BOTTOMLEFT", -8, -15 )
	TukuiAurasPlayerDebuffs:SetAttribute( "wrapAfter", 14 )
	TukuiAurasPlayerDebuffs:SetAttribute( "xOffset", -33 )

	local hooks = {
		TukuiAurasPlayerBuffs,
		TukuiAurasPlayerDebuffs,
		TukuiAurasPlayerConsolidate,
	}

	local OnAttributeChanged = function( self )
		for i = 1, self:GetNumChildren() do
			local child = select( i, self:GetChildren() )

			if( child.Duration ) then
				child.Duration:SetFont( S.CreateFontString() )
				child.Duration:ClearAllPoints()
				child.Duration:SetPoint( "BOTTOM", 0, -10 )
			end

			if( child.Count ) then
				child.Count:SetFont( S.CreateFontString() )
				child.Count:ClearAllPoints()
				child.Count:SetPoint( "BOTTOMRIGHT", -1, 1 )
			end
		end
	end

	for _, frame in pairs( hooks ) do
		frame:RegisterEvent( "PLAYER_ENTERING_WORLD" )
		frame:HookScript( "OnAttributeChanged", OnAttributeChanged )
		frame:HookScript( "OnEvent", OnAttributeChanged )
	end





elseif( C["global"]["panellayout"] == "sinaris" ) then

end