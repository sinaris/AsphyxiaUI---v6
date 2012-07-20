---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local bar = G.ActionBars.Stance

if( C["actionbar"].vertical_shapeshift == true ) then
	TukuiStance:ClearAllPoints()
	TukuiStance:Point( "TOPLEFT", AsphyxiaUILeftChatBackground, "TOPRIGHT", -2, 5 )
else
	TukuiStance:ClearAllPoints()
	TukuiStance:Point( "BOTTOMLEFT", AsphyxiaUILeftChatBackground, "BOTTOMRIGHT", -2, -5 )
end

if( C["actionbar"]["hideshapeshift"] == true ) then
	TukuiStance:Hide()
	return
end

local States = {
	["DRUID"] = "show",
	["WARRIOR"] = "show",
	["PALADIN"] = "show",
	["DEATHKNIGHT"] = "show",
	["ROGUE"] = "show,",
	["PRIEST"] = "show,",
	["HUNTER"] = "show,",
	["WARLOCK"] = "show,",
	["MONK"] = "show,",
}

bar:RegisterEvent("PLAYER_LOGIN")
bar:RegisterEvent("PLAYER_ENTERING_WORLD")
bar:RegisterEvent("UPDATE_SHAPESHIFT_FORMS")
bar:RegisterEvent("UPDATE_SHAPESHIFT_USABLE")
bar:RegisterEvent("UPDATE_SHAPESHIFT_COOLDOWN")
bar:RegisterEvent("UPDATE_SHAPESHIFT_FORM")
bar:RegisterEvent("ACTIONBAR_PAGE_CHANGED")
bar:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_LOGIN" then
		for i = 1, NUM_STANCE_SLOTS do
			if not self.buttons[i] then
				self.buttons[i] = CreateFrame("CheckButton", format(self:GetName().."Button%d", i), self, "StanceButtonTemplate")
				self.buttons[i]:SetID(i)
			end
			local button = self.buttons[i]
			button:ClearAllPoints()
			button:SetParent(self)
			button:SetFrameStrata("LOW")

			if( i == 1 ) then
				if( C["actionbar"].vertical_shapeshift == true ) then
					button:Point( "TOPLEFT", 5, -5 )
				else
					button:Point( "BOTTOMLEFT", 5, 5 )
				end
			else
				local previous = _G["TukuiStanceButton" .. i - 1]
				if( C["actionbar"].vertical_shapeshift == true ) then
					button:Point( "TOP", previous, "BOTTOM", 0, -S.buttonspacing )
				else
					button:Point( "LEFT", previous, "RIGHT", S.buttonspacing, 0 )
				end
			end

			local _, name = GetShapeshiftFormInfo(i)
			if name then
				button:Show()
			else
				button:Hide()
			end

			G.ActionBars.Stance["Button"..i] = button
		end
		RegisterStateDriver(self, "visibility", States[S.myclass] or "hide")
	elseif event == "UPDATE_SHAPESHIFT_FORMS" then
		if InCombatLockdown() then return end
		for i = 1, NUM_STANCE_SLOTS do
			local button = self.buttons[i]
			local _, name = GetShapeshiftFormInfo(i)
			if name then
				button:Show()
			else
				button:Hide()
			end
		end
	elseif event == "PLAYER_ENTERING_WORLD" then
		S.ShiftBarUpdate(self)
		S.StyleShift(self)
	else
		S.ShiftBarUpdate(self)
	end
end)