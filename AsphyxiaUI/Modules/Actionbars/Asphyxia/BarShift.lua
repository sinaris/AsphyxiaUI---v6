---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["panellayout"] ~= "asphyxia" ) then return end

if( C["actionbar"]["enable"] ~= true ) then return end

G.ActionBars.Shift:ClearAllPoints()
if( C["actionbar"]["vertical_shapeshift"] == true ) then
	G.ActionBars.Shift:Point( "TOPLEFT", G.Panels.LeftChatBackground, "TOPRIGHT", 2, 0 )
else
	G.ActionBars.Shift:Point( "BOTTOMLEFT", G.Panels.LeftChatBackground, "BOTTOMRIGHT", 2, -1 )
end
G.ActionBars.Shift:SetWidth( ( S.stancebuttonsize * 5 ) + ( S.stancebuttonsize * 4 ) )
G.ActionBars.Shift:SetHeight( 10 )

local ssborder = CreateFrame( "Frame", "ShapeShiftBorder", StanceButton1 )
ssborder:SetTemplate( "Transparent" )
ssborder:CreateShadow( "Default" )
ssborder:SetFrameLevel( 1 )
ssborder:SetFrameStrata( "BACKGROUND" )
if( C["actionbar"].vertical_shapeshift == true ) then
	ssborder:Point( "TOP", 0, S.buttonspacing )
else
	ssborder:Point( "LEFT", -S.buttonspacing, 0 )
end

if( C["actionbar"].hideshapeshift == true ) then TukuiShift:Hide() return end

local bar = CreateFrame( "Frame", "TukuiShapeShift", G.ActionBars.Shift, "SecureHandlerStateTemplate" )
bar:ClearAllPoints()
bar:SetAllPoints( G.ActionBars.Shift )

local States = {
	["DRUID"] = "show",
	["WARRIOR"] = "show",
	["PALADIN"] = "show",
	["DEATHKNIGHT"] = "show",
	["ROGUE"] = "show,",
	["PRIEST"] = "show,",
	["HUNTER"] = "show,",
	["WARLOCK"] = "show,",
}

bar:RegisterEvent( "PLAYER_LOGIN" )
bar:RegisterEvent( "PLAYER_ENTERING_WORLD" )
bar:RegisterEvent( "UPDATE_SHAPESHIFT_FORMS" )
bar:RegisterEvent( "UPDATE_SHAPESHIFT_USABLE" )
bar:RegisterEvent( "UPDATE_SHAPESHIFT_COOLDOWN" )
bar:RegisterEvent( "UPDATE_SHAPESHIFT_FORM" )
bar:RegisterEvent( "ACTIONBAR_PAGE_CHANGED" )
bar:SetScript( "OnEvent", function( self, event, ... )
	if( event == "PLAYER_LOGIN" ) then
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
		RegisterStateDriver( self, "visibility", States[S.myclass] or "hide" )
	elseif( event == "UPDATE_SHAPESHIFT_FORMS" ) then
		if( InCombatLockdown() ) then return end
		local button
		for i = 1, NUM_STANCE_SLOTS do
			button = _G["StanceButton" .. i]
			local _, name = GetShapeshiftFormInfo( i )
			if( name ) then
				button:Show()
			else
				button:Hide()
			end
		end

		S.ShiftBarUpdate()
		if( C["actionbar"]["vertical_shapeshift"] == true ) then
			ssborder:Size( ( ( StanceButton1:GetWidth() + S.buttonspacing ) ) + S.buttonspacing, StanceButton1:GetHeight() * GetNumShapeshiftForms() + ( GetNumShapeshiftForms() + 1 ) * S.buttonspacing )
		else
			ssborder:Size( ( ( StanceButton1:GetWidth() + S.buttonspacing ) * GetNumShapeshiftForms() ) + S.buttonspacing, StanceButton1:GetHeight() + 2 * S.buttonspacing )
		end
	elseif( event == "PLAYER_ENTERING_WORLD" ) then
		S.StyleShift()
		if( C["actionbar"]["vertical_shapeshift"] == true ) then
			ssborder:Size( ( ( StanceButton1:GetWidth() + S.buttonspacing ) ) + S.buttonspacing, StanceButton1:GetHeight() * GetNumShapeshiftForms() + ( GetNumShapeshiftForms() + 1 ) * S.buttonspacing )
		else
			ssborder:Size( ( ( StanceButton1:GetWidth() + S.buttonspacing ) * GetNumShapeshiftForms() )+ S.buttonspacing, StanceButton1:GetHeight()+ 2 * S.buttonspacing )
		end

		if( C["actionbar"]["mouseover_shapeshift"] == true ) then
			local function mouseover( alpha )
				for i = 1, NUM_STANCE_SLOTS do
					local sb = _G["StanceButton" .. i]
					sb:SetAlpha( alpha )
				end
			end

			for i = 1, NUM_STANCE_SLOTS do
				_G["StanceButton" .. i]:SetAlpha( 0 )
				_G["StanceButton" .. i]:HookScript( "OnEnter", function( self ) mouseover( 1 ) end )
				_G["StanceButton" .. i]:HookScript( "OnLeave", function( self ) mouseover( 0 ) end )
			end

			ssborder:EnableMouse( true )
			ssborder:HookScript( "OnEnter", function( self ) mouseover( 1 ) end )
			ssborder:HookScript( "OnLeave", function( self ) mouseover( 0 ) end )
		end
	else
		S.ShiftBarUpdate()
	end
end )