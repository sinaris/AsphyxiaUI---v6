---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

------------------------------
-- Actionbar Config
------------------------------
local AsphyxiaUIControlPanelActionbarBackground = CreateFrame( "Frame", "AsphyxiaUIControlPanelActionbarBackground", UIParent )
AsphyxiaUIControlPanelActionbarBackground:Size( 150, 80 )
AsphyxiaUIControlPanelActionbarBackground:Point( "CENTER", UIParent, "CENTER", 0, 25 )
AsphyxiaUIControlPanelActionbarBackground:SetTemplate( "Transparent" )
AsphyxiaUIControlPanelActionbarBackground:CreateShadow( "Default" )
AsphyxiaUIControlPanelActionbarBackground:SetFrameLevel( 15 )
AsphyxiaUIControlPanelActionbarBackground:Hide()

local AsphyxiaUIControlPanelActionbarBackgroundHeader = CreateFrame( "Frame", "AsphyxiaUIControlPanelActionbarBackgroundHeader", AsphyxiaUIControlPanelActionbarBackground )
AsphyxiaUIControlPanelActionbarBackgroundHeader:Size( AsphyxiaUIControlPanelActionbarBackground:GetWidth(), 20 )
AsphyxiaUIControlPanelActionbarBackgroundHeader:Point( "BOTTOM", AsphyxiaUIControlPanelActionbarBackground, "TOP", 0, 3 )
AsphyxiaUIControlPanelActionbarBackgroundHeader:SetTemplate( "Default" )
AsphyxiaUIControlPanelActionbarBackgroundHeader:CreateShadow( "Default" )

AsphyxiaUIControlPanelActionbarBackgroundHeader.Text = S.SetFontString( AsphyxiaUIControlPanelActionbarBackgroundHeader, S.CreateFontString() )
AsphyxiaUIControlPanelActionbarBackgroundHeader.Text:Point( "CENTER", AsphyxiaUIControlPanelActionbarBackgroundHeader, "CENTER", 0, 1 )
AsphyxiaUIControlPanelActionbarBackgroundHeader.Text:SetText( S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "Actionbar" )

------------------------------
-- Extra Config
------------------------------
local AsphyxiaUIControlPanelExtraBackground = CreateFrame( "Frame", "AsphyxiaUIControlPanelExtraBackground", UIParent )
AsphyxiaUIControlPanelExtraBackground:Size( 150, 132 )
AsphyxiaUIControlPanelExtraBackground:Point( "CENTER", UIParent, "CENTER", 0, 25 )
AsphyxiaUIControlPanelExtraBackground:SetTemplate( "Transparent" )
AsphyxiaUIControlPanelExtraBackground:CreateShadow( "Default" )
AsphyxiaUIControlPanelExtraBackground:SetFrameLevel( 15 )
AsphyxiaUIControlPanelExtraBackground:Hide()

local AsphyxiaUIControlPanelExtraBackgroundHeader = CreateFrame( "Frame", "AsphyxiaUIControlPanelExtraBackgroundHeader", AsphyxiaUIControlPanelExtraBackground )
AsphyxiaUIControlPanelExtraBackgroundHeader:Size( AsphyxiaUIControlPanelExtraBackground:GetWidth(), 20 )
AsphyxiaUIControlPanelExtraBackgroundHeader:Point( "BOTTOM", AsphyxiaUIControlPanelExtraBackground, "TOP", 0, 3 )
AsphyxiaUIControlPanelExtraBackgroundHeader:SetTemplate( "Default" )
AsphyxiaUIControlPanelExtraBackgroundHeader:CreateShadow( "Default" )

AsphyxiaUIControlPanelExtraBackgroundHeader.Text = S.SetFontString( AsphyxiaUIControlPanelExtraBackgroundHeader, S.CreateFontString() )
AsphyxiaUIControlPanelExtraBackgroundHeader.Text:Point( "CENTER", AsphyxiaUIControlPanelExtraBackgroundHeader, "CENTER", 0, 1 )
AsphyxiaUIControlPanelExtraBackgroundHeader.Text:SetText( S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "Control Panel" )

------------------------------
-- Actionbar Config Close Btn
------------------------------
local AsphyxiaUIControlPanelActionbarBackgroundCloseButton = CreateFrame( "Frame", "AsphyxiaUIControlPanelActionbarBackgroundCloseButton", AsphyxiaUIControlPanelActionbarBackground )
AsphyxiaUIControlPanelActionbarBackgroundCloseButton:Size( AsphyxiaUIControlPanelActionbarBackground:GetWidth() - 8, 15 )
AsphyxiaUIControlPanelActionbarBackgroundCloseButton:Point( "BOTTOM", AsphyxiaUIControlPanelActionbarBackground, "BOTTOM", 0, 4 )
AsphyxiaUIControlPanelActionbarBackgroundCloseButton:SetTemplate( "Default" )
AsphyxiaUIControlPanelActionbarBackgroundCloseButton:SetFrameLevel( AsphyxiaUIControlPanelActionbarBackground:GetFrameLevel() + 1 )
AsphyxiaUIControlPanelActionbarBackgroundCloseButton:HookScript( "OnEnter", S.SetModifiedBackdrop )
AsphyxiaUIControlPanelActionbarBackgroundCloseButton:HookScript( "OnLeave", S.SetOriginalBackdrop )

AsphyxiaUIControlPanelActionbarBackgroundCloseButton.Text = S.SetFontString( AsphyxiaUIControlPanelActionbarBackgroundCloseButton, S.CreateFontString() )
AsphyxiaUIControlPanelActionbarBackgroundCloseButton.Text:Point( "CENTER", AsphyxiaUIControlPanelActionbarBackgroundCloseButton, "CENTER", 0, 1 )
AsphyxiaUIControlPanelActionbarBackgroundCloseButton.Text:SetText( S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. CLOSE )
AsphyxiaUIControlPanelActionbarBackgroundCloseButton:CreateOverlay( AsphyxiaUIControlPanelActionbarBackgroundCloseButton )
AsphyxiaUIControlPanelActionbarBackgroundCloseButton:SetScript( "OnMouseDown", function()
	AsphyxiaUIControlPanelActionbarBackground:Hide()
	AsphyxiaUIControlPanelExtraBackground:Show()
end )

------------------------------
-- Control Panel Buttons
------------------------------
local AsphyxiaUIControlPanelButtons = {
	[1] = { "/ab" },
	[2] = { "/am" },
	[3] = { "/tc" },
	[4] = { "/mtukui" },
}

------------------------------
-- Control Panel Buttons Text
------------------------------
local AsphyxiaUIControlPanelButtonsTexts = {
	[1] = { S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "Actionbars" },
	[2] = { S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "AddOns" },
	[3] = { S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "Tukui" },
	[4] = { S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "MoveUI" },
}

local AsphyxiaUIControlPanelButtonsButtons = CreateFrame( "Button", "AsphyxiaUIControlPanelButtonsButtons", AsphyxiaUIControlPanelExtraBackground )
for i = 1, getn( AsphyxiaUIControlPanelButtons ) do
	AsphyxiaUIControlPanelButtonsButtons[i] = CreateFrame( "Button", "AsphyxiaUIControlPanelButtonsButtons" .. i, AsphyxiaUIControlPanelExtraBackground, "SecureActionButtonTemplate" )
	AsphyxiaUIControlPanelButtonsButtons[i]:Size( AsphyxiaUIControlPanelExtraBackground:GetWidth() - 8, 24 )
	AsphyxiaUIControlPanelButtonsButtons[i]:Point( "TOP", AsphyxiaUIControlPanelExtraBackground, "TOP", 0, -4 )
	AsphyxiaUIControlPanelButtonsButtons[i]:SetTemplate( "Default" )
	AsphyxiaUIControlPanelButtonsButtons[i]:SetFrameLevel( AsphyxiaUIControlPanelExtraBackground:GetFrameLevel() + 2 )

	AsphyxiaUIControlPanelButtonsButtons[i].Text = S.SetFontString( AsphyxiaUIControlPanelButtonsButtons[i], S.CreateFontString() )
	AsphyxiaUIControlPanelButtonsButtons[i].Text:Point( "CENTER", AsphyxiaUIControlPanelButtonsButtons[i], "CENTER", 0, 1 )
	AsphyxiaUIControlPanelButtonsButtons[i].Text:SetText( unpack( AsphyxiaUIControlPanelButtonsTexts[i] ) )

	if( i == 1 ) then
		AsphyxiaUIControlPanelButtonsButtons[i]:ClearAllPoints()
		AsphyxiaUIControlPanelButtonsButtons[i]:Point( "TOP", AsphyxiaUIControlPanelExtraBackground, "TOP", 0, -5 )
	else
		AsphyxiaUIControlPanelButtonsButtons[i]:ClearAllPoints()
		AsphyxiaUIControlPanelButtonsButtons[i]:Point( "TOP", AsphyxiaUIControlPanelButtonsButtons[i - 1], "BOTTOM", 0, -3 )
	end
	AsphyxiaUIControlPanelButtonsButtons[i]:SetAttribute( "type", "macro" )
	AsphyxiaUIControlPanelButtonsButtons[i]:SetAttribute( "macrotext", unpack( AsphyxiaUIControlPanelButtons[i] ) )
	--AsphyxiaUIControlPanelButtonsButtons[i]:SetFrameStrata( "BACKGROUND" )
	AsphyxiaUIControlPanelButtonsButtons[i]:CreateOverlay( AsphyxiaUIControlPanelButtonsButtons[i] )
	AsphyxiaUIControlPanelButtonsButtons[i]:HookScript( "OnEnter", S.SetModifiedBackdrop )
	AsphyxiaUIControlPanelButtonsButtons[i]:HookScript( "OnLeave", S.SetOriginalBackdrop )
end

local AsphyxiaUIControlPanelExtraBackgroundCloseButton = CreateFrame( "Frame", "AsphyxiaUIControlPanelExtraBackgroundCloseButton", AsphyxiaUIControlPanelExtraBackground )
AsphyxiaUIControlPanelExtraBackgroundCloseButton:Size( AsphyxiaUIControlPanelExtraBackground:GetWidth() - 8, 15 )
AsphyxiaUIControlPanelExtraBackgroundCloseButton:Point( "TOP", AsphyxiaUIControlPanelButtonsButtons[4], "BOTTOM", 0, -3 )
AsphyxiaUIControlPanelExtraBackgroundCloseButton:SetTemplate( "Default" )
AsphyxiaUIControlPanelExtraBackgroundCloseButton:SetFrameLevel( AsphyxiaUIControlPanelExtraBackground:GetFrameLevel() + 1 )
AsphyxiaUIControlPanelExtraBackgroundCloseButton:HookScript( "OnEnter", S.SetModifiedBackdrop )
AsphyxiaUIControlPanelExtraBackgroundCloseButton:HookScript( "OnLeave", S.SetOriginalBackdrop )

AsphyxiaUIControlPanelExtraBackgroundCloseButton.Text = S.SetFontString( AsphyxiaUIControlPanelExtraBackgroundCloseButton, S.CreateFontString() )
AsphyxiaUIControlPanelExtraBackgroundCloseButton.Text:Point( "CENTER", AsphyxiaUIControlPanelExtraBackgroundCloseButton, "CENTER", 0, 1 )
AsphyxiaUIControlPanelExtraBackgroundCloseButton.Text:SetText( S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. CLOSE )
AsphyxiaUIControlPanelExtraBackgroundCloseButton:CreateOverlay( AsphyxiaUIControlPanelExtraBackgroundCloseButton )
AsphyxiaUIControlPanelExtraBackgroundCloseButton:SetScript( "OnMouseDown", function()
	AsphyxiaUIControlPanelExtraBackground:Hide()
end )

------------------------------
-- Control Panel Button
------------------------------
local AsphyxiaUIControlPanelButton = CreateFrame( "Frame", "AsphyxiaUIControlPanelButton", UIParent )
AsphyxiaUIControlPanelButton:Size( 100, 20 )
AsphyxiaUIControlPanelButton:Point( "BOTTOM", UIParent, "BOTTOM", 0, 2 )
AsphyxiaUIControlPanelButton:SetTemplate( "Default" )
AsphyxiaUIControlPanelButton:SetFrameLevel( 2 )
AsphyxiaUIControlPanelButton:SetFrameStrata( "LOW" )
AsphyxiaUIControlPanelButton:CreateShadow( "Default" )
AsphyxiaUIControlPanelButton:CreateOverlay( AsphyxiaUIControlPanelButton )

AsphyxiaUIControlPanelButton.Text = S.SetFontString( AsphyxiaUIControlPanelButton, S.CreateFontString() )
AsphyxiaUIControlPanelButton.Text:Point( "CENTER", AsphyxiaUIControlPanelButton, "CENTER", 0, 1 )
AsphyxiaUIControlPanelButton.Text:SetText( S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. "Control Panel" )

AsphyxiaUIControlPanelButton:HookScript( "OnEnter", S.SetModifiedBackdrop )
AsphyxiaUIControlPanelButton:HookScript( "OnLeave", S.SetOriginalBackdrop )

AsphyxiaUIControlPanelButton:SetScript( "OnMouseDown", function( self )
	if( InCombatLockdown() ) then print( ERR_NOT_IN_COMBAT ) return end
	if not AsphyxiaUIControlPanelExtraBackground:IsShown() then
		AsphyxiaUIControlPanelExtraBackground:Show()
		AsphyxiaUIControlPanelActionbarBackground:Hide()
	else
		AsphyxiaUIControlPanelExtraBackground:Hide()
	end
end )

------------------------------
-- slash command to open up actionbar config
------------------------------
function SlashCmdList.ActionbarControlPanel()
	if( AsphyxiaUIControlPanelExtraBackground:IsShown() ) then
		AsphyxiaUIControlPanelActionbarBackground:Show()
		AsphyxiaUIControlPanelExtraBackground:Hide()
	else
		AsphyxiaUIControlPanelActionbarBackground:Show()
	end
end
SLASH_ActionbarControlPanel1 = "/ab"







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
				local bar = _G["AsphyxiaUIBar" .. i]
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
				local bar = _G["AsphyxiaUIBar" .. i]
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
