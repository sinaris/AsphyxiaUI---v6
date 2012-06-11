---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local T, C, L, G = unpack( Tukui )

if( C["global"]["panellayout"] ~= "duffed" ) then return end

if( C["actionbar"]["enable"] ~= true ) then return end

G.ActionBars.Bar2.ShowHideButton:Kill()
G.ActionBars.Bar3.ShowHideButton:Kill()
G.ActionBars.Bar4.ShowHideButton:Kill()
G.ActionBars.Bar5.ShowHideButtonTop:Kill()
G.ActionBars.Bar5.ShowHideButtonBottom:Kill()
G.ActionBars.ExitVehicleLeft:Kill()
G.ActionBars.ExitVehicleRight:Kill()


local cp = "|cff319f1b" -- +
local cm = "|cff9a1212" -- -
local function ShowOrHideBar(bar, button)
	local db = TukuiDataPerChar
	
	if bar:IsShown() then
		if bar == TukuiBar2 then
			if button == DuffedBar2Button then
				bar:Hide()
				TukuiDuffedABSwapHolderBar:Hide()
				db.hidebar2 = true
			end
		end
		if bar == TukuiBar3 then
			if button == DuffedBar3Button then
				if C["actionbar"].horizontal_petbar ~= true then TukuiLineToPetActionBarBackground:Show() end
				if db.rightbars == 1 then
					MultiBarRight:Show()
					db.rightbars = 2
					bar:SetWidth((T.buttonsize * 2) + (T.buttonspacing * 3))
				elseif db.rightbars == 2 then
					MultiBarRight:Hide()
					db.rightbars = 1
					bar:SetWidth((T.buttonsize * 1) + (T.buttonspacing * 2))
				end
			elseif button == DuffedBar3Button2 then
				if C["actionbar"].horizontal_petbar ~= true then TukuiLineToPetActionBarBackground:Hide() end
				db.rightbars = 0
				bar:Hide()
			end
		end
	else
		bar:Show()
		TukuiDuffedABSwapHolderBar:Show()
		if bar == TukuiBar2 then
			db.hidebar2 = false
		end
		if bar == TukuiBar3 then
			if button == DuffedBar3Button then
				bar:SetWidth((T.buttonsize * 1) + (T.buttonspacing * 2))
				MultiBarRight:Hide()
				db.rightbars = 1
				if C["actionbar"].horizontal_petbar ~= true then TukuiLineToPetActionBarBackground:Show() end
			end
		end
	end
end

local function MoveButtonBar(button, bar)
	local db = TukuiDataPerChar
	
	if button == DuffedBar2Button then
		--T.petBarPosition()
		--T.cbPosition()
		if bar:IsShown() then
			button.text:SetText(cm.."-|r")
		else
			button.text:SetText(cp.."+|r")
		end
	end

	if button == DuffedBar3Button then
		if bar:IsShown() then
			if db.rightbars == 2 and button == DuffedBar3Button then
				button.text:SetText(cm..">|r")
				DuffedBar3Button2:Hide()
				button:Height(130)
				button:ClearAllPoints()
				button:Point("RIGHT", UIParent, "RIGHT", 1, -14)
				if C["actionbar"].horizontal_petbar ~= true then TukuiPetBar:Point("RIGHT", UIParent, "RIGHT", -23 -((T.buttonsize * 2) + (T.buttonspacing * 3)), -14) end
			elseif db.rightbars == 1 then
				DuffedBar3Button2:Show()
				button:Height(130/2)
				button:ClearAllPoints()
				button:Point("BOTTOMRIGHT", UIParent, "RIGHT", 1, -14)
				button.text:SetText(cp.."<|r")
				if C["actionbar"].horizontal_petbar ~= true then TukuiPetBar:Point("RIGHT", UIParent, "RIGHT", -23 -((T.buttonsize * 1) + (T.buttonspacing * 2)), -14) end
			end
		end
	elseif button == DuffedBar3Button2 then
		if db.rightbars == 0 then
			button:Hide()
			DuffedBar3Button:Height(130)
			DuffedBar3Button:ClearAllPoints()
			DuffedBar3Button:Point("RIGHT", UIParent, "RIGHT", 1, -14)
			if C["actionbar"].horizontal_petbar ~= true then TukuiPetBar:Point("RIGHT", UIParent, "RIGHT", -14, -14) end
		end
	end
end

local function UpdateBar(self, bar) -- guess what! :P
	if InCombatLockdown() then print(ERR_NOT_IN_COMBAT) return end
	
	local button = self
	
	ShowOrHideBar(bar, button)
	MoveButtonBar(button, bar)
end

-- +/-
local DuffedBar2Button = CreateFrame("Button", "DuffedBar2Button", UIParent)
DuffedBar2Button:SetTemplate("Default")
DuffedBar2Button:CreateShadow("Default")
DuffedBar2Button:RegisterForClicks("AnyUp")
DuffedBar2Button.text = T.SetFontString(DuffedBar2Button, C["media"].font, C["datatext"].fontsize)
DuffedBar2Button:SetScript("OnClick", function(self, btn)
	if btn == "RightButton" then
		if TukuiInfoLeftBattleGround and UnitInBattleground("player") then
			ToggleFrame(TukuiInfoLeftBattleGround)
		end
	else
		UpdateBar(self, TukuiBar2)
	end
end)
if C["actionbar"].duffedablayout == 2 then
	DuffedBar2Button:Size(TukuiInfoLeft:GetHeight())
	DuffedBar2Button:Point("LEFT", TukuiInfoLeft, "RIGHT", 2, 0)
	DuffedBar2Button.text:Point("CENTER", 1, 0)
else
	DuffedBar2Button:Point("TOPLEFT", TukuiInfoLeft, "TOPRIGHT", 2, 0)
	DuffedBar2Button:Point("BOTTOMRIGHT", TukuiInfoRight, "BOTTOMLEFT", -2, 0)
	DuffedBar2Button.text:Point("CENTER", 0, 0)
end
if C["actionbar"].button2 == true then
	DuffedBar2Button:SetAlpha(0)
else
	DuffedBar2Button:SetAlpha(1)
end
DuffedBar2Button:SetScript("OnEnter", function(self) self:SetBackdropBorderColor(unpack(C["media"].datatextcolor1)) end)
DuffedBar2Button:SetScript("OnLeave", function(self) self:SetBackdropBorderColor(unpack(C["media"].bordercolor)) end)
DuffedBar2Button.text:SetText(cm.."-|r")

-- >/< 1
local DuffedBar3Button = CreateFrame("Button", "DuffedBar3Button", UIParent)
DuffedBar3Button:Width(12)
DuffedBar3Button:Height(130)
DuffedBar3Button:Point("RIGHT", UIParent, "RIGHT", 1, -14)
DuffedBar3Button:SetTemplate("Default")
DuffedBar3Button:RegisterForClicks("AnyUp")
DuffedBar3Button:SetAlpha(0)
DuffedBar3Button:SetScript("OnClick", function(self) UpdateBar(self, TukuiBar3) end)
if C["actionbar"].rightbarsmouseover == true then
	DuffedBar3Button:SetScript("OnEnter", function(self) TukuiRightBarsMouseover(1) end)
	DuffedBar3Button:SetScript("OnLeave", function(self) TukuiRightBarsMouseover(0) end)
else
	DuffedBar3Button:SetScript("OnEnter", function(self) self:SetAlpha(1) DuffedBar3Button2:SetAlpha(1) end)
	DuffedBar3Button:SetScript("OnLeave", function(self) self:SetAlpha(0) DuffedBar3Button2:SetAlpha(0) end)
end
DuffedBar3Button.text = T.SetFontString(DuffedBar3Button, C["media"].font, 14)
DuffedBar3Button.text:Point("CENTER", 0, 0)
DuffedBar3Button.text:SetText(cm..">|r")

-- >/< 2
local DuffedBar3Button2 = CreateFrame("Button", "DuffedBar3Button2", UIParent)
DuffedBar3Button2:Width(TukuiBar3Button:GetWidth())
DuffedBar3Button2:Height((DuffedBar3Button:GetHeight()/2)+1)
DuffedBar3Button2:Point("TOP", DuffedBar3Button, "BOTTOM", 3, 1)
DuffedBar3Button2:SetTemplate("Default")
DuffedBar3Button2:RegisterForClicks("AnyUp")
DuffedBar3Button2:SetAlpha(0)
DuffedBar3Button2:Hide()
DuffedBar3Button2:SetScript("OnClick", function(self) UpdateBar(self, TukuiBar3) end)
if C["actionbar"].rightbarsmouseover == true then
	DuffedBar3Button2:SetScript("OnEnter", function(self) TukuiRightBarsMouseover(1) end)
	DuffedBar3Button2:SetScript("OnLeave", function(self) TukuiRightBarsMouseover(0) end)
else
	DuffedBar3Button2:SetScript("OnEnter", function(self) self:SetAlpha(1) DuffedBar3Button:SetAlpha(1) end)
	DuffedBar3Button2:SetScript("OnLeave", function(self) self:SetAlpha(0) DuffedBar3Button:SetAlpha(0) end)
end
DuffedBar3Button2.text = T.SetFontString(DuffedBar3Button2, C["media"].font, 14)
DuffedBar3Button2.text:Point("CENTER", 0, 0)
DuffedBar3Button2.text:SetText(cm..">|r")

-- exit vehicle button on right side of bottom action bar
local exitvehicle = CreateFrame("Button", "DuffedExitVehicleButton", UIParent, "SecureHandlerClickTemplate")
if C["actionbar"].duffedablayout == 1 then
	exitvehicle:CreatePanel("Default", T.buttonsize, T.buttonsize, "LEFT", TukuiBar1, "RIGHT", 5, 0)
else
	exitvehicle:CreatePanel("Default", TukuiBar1:GetWidth(), 12, "TOP", TukuiBar1, "BOTTOM", 0, -3)
end
exitvehicle:RegisterForClicks("AnyUp")
exitvehicle:SetScript("OnClick", function() VehicleExit() end)
exitvehicle:CreateShadow("Default")
if C["actionbar"].layout == 1 then
	exitvehicle.text = T.SetFontString(exitvehicle, C["media"].font, 19)
	exitvehicle.text:Point("CENTER", 1, 1)
	exitvehicle.text:SetText(cm.."v|r")
else
	exitvehicle.text = T.SetFontString(exitvehicle, C["media"].font, 12)
	exitvehicle.text:Point("CENTER", 0, -1)
	exitvehicle.text:SetText(cm.."Leave Vehicle|r")
end
RegisterStateDriver(exitvehicle, "visibility", "[target=vehicle,exists] show;hide")

if C["actionbar"].duffedablayout == 1 then
	local exitvehicle2 = CreateFrame("Button", "DuffedExitVehicleButton2", UIParent, "SecureHandlerClickTemplate")
	exitvehicle2:CreatePanel("Default", T.buttonsize, T.buttonsize, "RIGHT", TukuiBar1, "LEFT", -5, 0)
	exitvehicle2:RegisterForClicks("AnyUp")
	exitvehicle2:SetScript("OnClick", function() VehicleExit() end)
	exitvehicle2:CreateShadow("Default")
	exitvehicle2.text = T.SetFontString(exitvehicle2, C["media"].font, 19)
	exitvehicle2.text:Point("CENTER", 1, 1)
	exitvehicle2.text:SetText(cm.."v|r")
	RegisterStateDriver(exitvehicle2, "visibility", "[target=vehicle,exists] show;hide")
end

local init = CreateFrame("Frame")
init:RegisterEvent("VARIABLES_LOADED")
init:SetScript("OnEvent", function(self, event)
	if not TukuiDataPerChar then TukuiDataPerChar = {} end
	local db = TukuiDataPerChar
	if db.hidebar2 == nil and T.lowversion then db.hidebar2 = true end

	--T.cbPosition()
	--T.petBarPosition()

	-- Third Bar at the bottom
	if db.hidebar2 then
		UpdateBar(DuffedBar2Button, TukuiBar2)
	end

	-- Rightbars on startup
	if db.rightbars == nil then db.rightbars = 2 end
	if db.rightbars == 1 then
		MoveButtonBar(DuffedBar3Button, TukuiBar3)
		TukuiBar3:SetWidth((T.buttonsize * 1) + (T.buttonspacing * 2))
		if C["actionbar"].horizontal_petbar ~= true then TukuiPetBar:Point("RIGHT", UIParent, "RIGHT", -23 -((T.buttonsize * 1) + (T.buttonspacing * 2)), -14) TukuiLineToPetActionBarBackground:Show() end
	elseif db.rightbars == 0 then
		DuffedBar3Button.text:SetText(cp.."<|r")
		TukuiBar3:Hide()
		if C["actionbar"].horizontal_petbar ~= true then TukuiPetBar:Point("RIGHT", UIParent, "RIGHT", -14, -14) TukuiLineToPetActionBarBackground:Hide() end
	elseif db.rightbars == 2 then
		if C["actionbar"].horizontal_petbar ~= true then TukuiPetBar:Point("RIGHT", UIParent, "RIGHT", -23 -((T.buttonsize * 2) + (T.buttonspacing * 3)), -14) TukuiLineToPetActionBarBackground:Show() end
	end
end)