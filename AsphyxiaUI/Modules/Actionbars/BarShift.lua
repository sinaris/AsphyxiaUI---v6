---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["actionbar"]["enable"] ~= true ) then return end

G.ActionBars.Stance:ClearAllPoints()
G.ActionBars.Stance:SetClampedToScreen(false)

if( C["actionbar"]["vertical_shapeshift"] == true ) then
	G.ActionBars.Stance:Point( "TOPLEFT", TukuiChatBackgroundLeft, "TOPRIGHT", 2, 1 )
else
	G.ActionBars.Stance:Point( "BOTTOMLEFT", TukuiChatBackgroundLeft, "BOTTOMRIGHT", 2, -1 )
end

local AsphyxiaUIStanceBorder = CreateFrame( "Frame", "AsphyxiaUIStanceBorder", G.ActionBars.Stance, SecureHandlerStateTemplate )
AsphyxiaUIStanceBorder:SetTemplate("Transparent")
AsphyxiaUIStanceBorder:CreateShadow("Default")
AsphyxiaUIStanceBorder:SetFrameLevel(1)
AsphyxiaUIStanceBorder:SetFrameStrata("BACKGROUND")
if( C["actionbar"]["vertical_shapeshift"] == true ) then
	AsphyxiaUIStanceBorder:Point( "TOP", _G["StanceButton1"], "TOP", 0, 4 )
else
	AsphyxiaUIStanceBorder:Point( "LEFT", _G["StanceButton1"], "LEFT", -4, 0 )
end

local bar = G.ActionBars.Stance

bar:HookScript( "OnEvent", function( self, event, unit )
	if( event == "PLAYER_LOGIN" ) then
		StanceBarFrame.ignoreFramePositionManager = true
		StanceBarFrame:ClearAllPoints()
		StanceBarFrame:SetPoint( "BOTTOMLEFT", bar, "BOTTOMLEFT", -11, 0 )

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
				if( C["actionbar"].vertical_shapeshift == true ) then
					button:Point( "TOP", previous, "BOTTOM", 0, -S.buttonspacing )
				else
					button:Point( "LEFT", previous, "RIGHT", S.buttonspacing, 0 )
				end
			end
		end
	elseif( event == "UPDATE_SHAPESHIFT_FORMS" ) then
		if( C["actionbar"]["vertical_shapeshift"] == true ) then
			AsphyxiaUIStanceBorder:Size( ( ( StanceButton1:GetWidth() + S.buttonspacing ) ) + S.buttonspacing, StanceButton1:GetHeight() * GetNumShapeshiftForms() + ( GetNumShapeshiftForms() + 1 ) * S.buttonspacing )
		else
			AsphyxiaUIStanceBorder:Size( ( ( StanceButton1:GetWidth() + S.buttonspacing ) * GetNumShapeshiftForms() ) + S.buttonspacing, StanceButton1:GetHeight() + 2 * S.buttonspacing )
		end
	elseif( event == "PLAYER_ENTERING_WORLD" ) then
		if( C["actionbar"]["vertical_shapeshift"] == true ) then
			AsphyxiaUIStanceBorder:Size( ( ( StanceButton1:GetWidth() + S.buttonspacing ) ) + S.buttonspacing, StanceButton1:GetHeight() * GetNumShapeshiftForms() + ( GetNumShapeshiftForms() + 1 ) * S.buttonspacing )
		else
			AsphyxiaUIStanceBorder:Size( ( ( StanceButton1:GetWidth() + S.buttonspacing ) * GetNumShapeshiftForms() ) + S.buttonspacing, StanceButton1:GetHeight() + 2 * S.buttonspacing )
		end

		if( C["actionbar"]["mouseover_shapeshift"] == true ) then
			local function mouseover( alpha )
				for i = 1, NUM_STANCE_SLOTS do
					local sb = G.ActionBars.Stance["Button" .. i]
					sb:SetAlpha( alpha )
				end

				AsphyxiaUIStanceBorder:SetAlpha( alpha )
			end

			for i = 1, NUM_STANCE_SLOTS do
				_G["StanceButton" .. i]:SetAlpha( 0 )
				_G["StanceButton" .. i]:HookScript( "OnEnter", function( self ) mouseover( 1 ) end )
				_G["StanceButton" .. i]:HookScript( "OnLeave", function( self ) mouseover( 0 ) end )
			end
			AsphyxiaUIStanceBorder:EnableMouse( true )
			AsphyxiaUIStanceBorder:HookScript( "OnEnter", function( self ) mouseover( 1 ) end )
			AsphyxiaUIStanceBorder:HookScript( "OnLeave", function( self ) mouseover( 0 ) end )
		end
	end
end )