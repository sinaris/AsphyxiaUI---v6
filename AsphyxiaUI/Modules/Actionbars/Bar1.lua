---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["actionbar"]["enable"] ~= true ) then return end

local bar = AsphyxiaUIActionbar1

local shd = 7
if( C["actionbar"]["ownshdbar"] == true ) then shd = 10 end

local Page = {
	["DRUID"] = "[bonusbar:1,nostealth] 7; [bonusbar:1,stealth] 8; [bonusbar:2] 8; [bonusbar:3] 9; [bonusbar:4] 10;",
	["WARRIOR"] = "[bonusbar:1] 7; [bonusbar:2] 8; [bonusbar:3] 9;",
	["PRIEST"] = "[bonusbar:1] 7;",
	["ROGUE"] = "[bonusbar:1] 7; [form:3] " .. shd .. ";",
	["MONK"] = "[bonusbar:1] 7;",
	["DEFAULT"] = "[vehicleui:12] 12; [bar:2] 2; [bar:3] 3; [bar:4] 4; [bar:5] 5; [bar:6] 6;",
}

local function GetBar()
	local condition = Page["DEFAULT"]
	local class = S.myclass
	local page = Page[class]
	if( page ) then
		condition = condition .. " " .. page
	end
	condition = condition .. " 1"
	return condition
end

bar:RegisterEvent( "PLAYER_LOGIN" )
bar:RegisterEvent( "PLAYER_ENTERING_WORLD" )
bar:RegisterEvent( "KNOWN_CURRENCY_TYPES_UPDATE" )
bar:RegisterEvent( "CURRENCY_DISPLAY_UPDATE" )
bar:RegisterEvent( "BAG_UPDATE" )
bar:RegisterEvent( "ACTIVE_TALENT_GROUP_CHANGED" )
bar:RegisterEvent( "UNIT_ENTERING_VEHICLE" )
bar:RegisterEvent( "UNIT_EXITING_VEHICLE" )

bar:SetScript( "OnEvent", function( self, event, unit, ... )
	if( event == "PLAYER_LOGIN" ) then
		local button
		for i = 1, NUM_ACTIONBAR_BUTTONS do
			button = _G["ActionButton" .. i]
			self:SetFrameRef( "ActionButton" .. i, button )
			G.ActionBars.Bar1["Button" .. i] = button
		end

		self:Execute([[
			buttons = table.new()
			for i = 1, 12 do
				table.insert( buttons, self:GetFrameRef( "ActionButton" .. i ) )
			end
		]] )

		self:SetAttribute( "_onstate-page", [[
			for i, button in ipairs( buttons ) do
				button:SetAttribute( "actionpage", tonumber( newstate ) )
			end
		]] )

		RegisterStateDriver( self, "page", GetBar() )
	elseif( event == "PLAYER_ENTERING_WORLD" ) then
		local button
		for i = 1, 12 do
			button = _G["ActionButton" .. i]
			button:SetSize( S.buttonsize, S.buttonsize )
			button:ClearAllPoints()
			button:SetParent( bar )
			button:SetFrameStrata( "BACKGROUND" )
			button:SetFrameLevel( 15 )
			if( i == 1 ) then
				if( C["actionbar"].mainswap == true ) then
					button:Point( "TOPLEFT", 5, -5 )
				else
					button:Point( "BOTTOMLEFT", 5, 5 )
				end
			else
				local previous = _G["ActionButton" .. i - 1]
				button:SetPoint( "LEFT", previous, "RIGHT", S.buttonspacing, 0 )
			end
		end
	elseif( event == "UNIT_ENTERING_VEHICLE" ) then
		if( unit == "player" and UnitHasVehicleUI( "player" ) ) then
			TukuiBar2Button:Hide()
			TukuiBar3Button:Hide()
			TukuiBar4Button:Hide()
			TukuiBar5ButtonTop:Hide()
			TukuiBar5ButtonBottom:Hide()
			for i = 2, 7 do
				local bar = _G["AsphyxiaUIActionbar" .. i]
				if( bar ) then
					bar:SetAlpha( 0 )
				end
			end
		end
	elseif( event == "UNIT_EXITING_VEHICLE" ) then
		if( unit == "player" and not UnitHasVehicleUI( "player" ) ) then
			TukuiBar2Button:Show()
			TukuiBar3Button:Show()
			TukuiBar4Button:Show()
			TukuiBar5ButtonTop:Show()
			TukuiBar5ButtonBottom:Show()
			for i = 2, 7 do
				local bar = _G["AsphyxiaUIActionbar" .. i]
				if( bar ) then
					S.Delay( 1, function()
						bar:SetAlpha( 1 )
					end )
				end
			end
		end
	else
		MainMenuBar_OnEvent( self, event, ... )
	end
end )