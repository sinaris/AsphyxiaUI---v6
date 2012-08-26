---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["actionbar"].enable ~= true ) then return end

local bar = G.ActionBars.Stance

TukuiStance:ClearAllPoints()
if( C["actionbar"].vertical_shapeshift == true ) then
	TukuiStance:Point( "TOPLEFT", TukuiChatBackgroundLeft, "TOPRIGHT", 2, 0 )
else
	TukuiStance:Point( "BOTTOMLEFT", TukuiChatBackgroundLeft, "BOTTOMRIGHT", 2, -1 )
end

local AsphyxiaUIStanceBarBorder = CreateFrame( "Frame", "AsphyxiaUIStanceBarBorder", StanceButton1 )
AsphyxiaUIStanceBarBorder:SetTemplate( "Transparent" )
AsphyxiaUIStanceBarBorder:SetFrameLevel( 1 )
AsphyxiaUIStanceBarBorder:SetFrameStrata( "BACKGROUND" )

TukuiStance:HookScript( "OnEvent", function( self, event, ... )
	if( C["actionbar"]["vertical_shapeshift"] == true ) then
		AsphyxiaUIStanceBarBorder:Point( "TOP", 0, S.buttonspacing )
		AsphyxiaUIStanceBarBorder:Size( StanceButton1:GetHeight() + 2 * S.buttonspacing, ( ( StanceButton1:GetWidth() + S.buttonspacing ) * GetNumShapeshiftForms() ) + S.buttonspacing )
	else
		AsphyxiaUIStanceBarBorder:Point( "LEFT", -S.buttonspacing, 0 )
		AsphyxiaUIStanceBarBorder:Size( ( ( StanceButton1:GetWidth() + S.buttonspacing ) * GetNumShapeshiftForms() ) + S.buttonspacing, StanceButton1:GetHeight() + 2 * S.buttonspacing )
	end
end )

bar:HookScript( "OnEvent", function( self, event, unit )
	if( InCombatLockdown() ) then return end
	local button
	for i = 1, NUM_STANCE_SLOTS do
		button = _G["StanceButton" .. i]
		button:ClearAllPoints()
		button:SetParent( self )
		button:SetFrameStrata( "LOW" )
		if( i == 1 ) then
			if( C["actionbar"]["vertical_shapeshift"] == true ) then
				button:Point( "TOPLEFT", 5, -5 )
			else
				button:Point( "BOTTOMLEFT", 5, 5 )
			end
		else
			local previous = _G["StanceButton" .. i - 1]
			if( C["actionbar"]["vertical_shapeshift"] == true ) then
				button:Point( "TOP", previous, "BOTTOM", 0, -S.buttonspacing )
			else
				button:Point( "LEFT", previous, "RIGHT", S.buttonspacing, 0 )
			end
		end
		local _, name = GetShapeshiftFormInfo( i )
		if( name ) then
			button:Show()
		end
	end
end )