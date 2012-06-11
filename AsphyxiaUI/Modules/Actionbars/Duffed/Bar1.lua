---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["panellayout"] ~= "duffed" ) then return end

if( C["actionbar"]["enable"] ~= true ) then return end

local bar = TukuiBar1

if( C["actionbar"]["duffedswapbar1and3"] and C["actionbar"]["duffedablayout"] == 1 ) then
	TukuiDuffedABSwapHolderBar:Show()
	bar = TukuiDuffedABSwapHolderBar
end

local shd = 7
if( C["actionbar"]["ownshdbar"] == true ) then shd = 10 end

local Page = {
	["DRUID"] = "[bonusbar:1,nostealth] 7; [bonusbar:1,stealth] 8; [bonusbar:2] 8; [bonusbar:3] 9; [bonusbar:4] 10;",
	["WARRIOR"] = "[bonusbar:1] 7; [bonusbar:2] 8; [bonusbar:3] 9;",
	["PRIEST"] = "[bonusbar:1] 7;",
	["ROGUE"] = "[bonusbar:1] 7; [form:3] " .. shd .. ";",
	["DEFAULT"] = "[bonusbar:5] 11; [bar:2] 2; [bar:3] 3; [bar:4] 4; [bar:5] 5; [bar:6] 6;",
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
bar:SetScript( "OnEvent", function( self, event, ... )
	if( event == "PLAYER_LOGIN" ) then
		local button
		for i = 1, NUM_ACTIONBAR_BUTTONS do
			button = _G["ActionButton" .. i]
			self:SetFrameRef( "ActionButton" .. i, button )
		end

		self:Execute( [[
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
			if( C["actionbar"]["duffedablayout"] == 2 and C["actionbar"]["duffedswapbar1and3"] == true ) then
				if( i == 1 ) then
					button:SetPoint( "TOPLEFT", S.buttonspacing, -S.buttonspacing )
				else
					local previous = _G["ActionButton" .. i - 1]
					button:SetPoint( "LEFT", previous, "RIGHT", S.buttonspacing, 0 )
				end
			else
				if( i == 1 ) then
					button:SetPoint( "BOTTOMLEFT", S.buttonspacing, S.buttonspacing )
				else
					local previous = _G["ActionButton" .. i - 1]
					button:SetPoint( "LEFT", previous, "RIGHT", S.buttonspacing, 0 )
				end
			end
		end
	elseif( event == "ACTIVE_TALENT_GROUP_CHANGED" ) then
		LoadAddOn( "Blizzard_GlyphUI" )
	else
		MainMenuBar_OnEvent( self, event, ... )
	end
end )