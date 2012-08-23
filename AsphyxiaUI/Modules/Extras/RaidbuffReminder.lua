local T, C, L, G = unpack(Tukui)

--Locals
--Setup Caster Buffs
local function SetCasterOnlyBuffs()
	Spell1Buff = {
		77747, -- Burning Wrath
		109773, -- Dark Intent
		1459, -- Arcane Brilliance
	}
	Spell2Buff = { --Total Stats
		24907, -- Moonkin Aura
		51470, -- Elemental Oath
		49868, -- Mind Quickening
	}
	Spell3Buff = { --Total Stats
		117667, --Legacy of The Emperor
		1126, 	-- Mark of The Wild
		20217, 	-- Blessing Of Kings
	}
	Spell4Buff = { --Total Stamina
		469, -- Commanding Shout
		6307, -- Imp. Blood Pact
		21562, -- Power Word: Fortitude
	}
	Spell5Buff = { --Total Mana
		116956, --Grace of Air
		19740, -- Blessing of Might
	}
	Spell6Buff = { --Crit
		1459, -- Arcane Brilliance
		24932, -- Leader of The Pact
		116781, -- Legacy of the White Tiger
	}
end

--Setup everyone else's buffs
local function SetBuffs()
	Spell1Buff = { -- Attack Speed
		30809, -- Unleashed Rage
		113742, -- Swiftblade's Cunning
		55610, -- Improved Icy Talons
	}
	Spell2Buff = { -- 5% crit
		1459, -- Arcane Brilliance
		24932, -- Leader of The Pact
		116781, -- Legacy of the White Tiger
	}
	Spell3Buff = { --Total Stats
		1126, -- "Mark of the wild"
		20217, --"Greater Blessing of Kings",
		117667, --Legacy of The Emperor
	}
	Spell4Buff = { --Total Stamina
		469, -- Commanding Shout
		6307, -- Imp. Blood Pact
		21562, -- Power Word: Fortitude
	}
	Spell5Buff = { --Mastery
		116956, --Grace of Air
		19740, -- Blessing of Might
	}
	Spell6Buff = { --Total AP
		19506, -- Trueshot Aura
		6673, -- Battle Shout
		57330, -- Horn of Winter
	}
end


--Main Script
local function OnAuraChange(self, event, arg1, unit)
	if (event == "UNIT_AURA" and arg1 ~= "player") then 
		return
	end
	
	--If We're a caster we may want to see differant buffs
	if T.Role == "Caster" or T.Role == "Healer" then 
		SetCasterOnlyBuffs()
	else
		SetBuffs()
	end
	
	
	for i, Spell1Buff in pairs(Spell1Buff) do
		local spellname = select(1, GetSpellInfo(Spell1Buff))
		if UnitAura("player", spellname) then
			Spell1Frame:SetAlpha(1)
			Spell1Frame.t:SetTexture(select(3, GetSpellInfo(Spell1Buff)))
			Spell1Frame.id = Spell1Buff
			break
		else
			Spell1Frame:SetAlpha(0.2)
			Spell1Frame.t:SetTexture(select(3, GetSpellInfo(Spell1Buff)))
		end
		Spell1Frame.id = Spell1Buff
	end	
	
	for i, Spell2Buff in pairs(Spell2Buff) do
		local spellname = select(1, GetSpellInfo(Spell2Buff))
		if UnitAura("player", spellname) then
			Spell2Frame:SetAlpha(1)
			Spell2Frame.t:SetTexture(select(3, GetSpellInfo(Spell2Buff)))
			Spell2Frame.id = Spell2Buff
			break
		else
			Spell2Frame:SetAlpha(0.2)
			Spell2Frame.t:SetTexture(select(3, GetSpellInfo(Spell2Buff)))
		end
		Spell2Frame.id = Spell2Buff
	end	
	
	for i, Spell3Buff in pairs(Spell3Buff) do
		local spellname = select(1, GetSpellInfo(Spell3Buff))
		if UnitAura("player", spellname) then
			Spell3Frame:SetAlpha(1)
			Spell3Frame.t:SetTexture(select(3, GetSpellInfo(Spell3Buff)))
			Spell3Frame.id = Spell3Buff
			break
		else
			Spell3Frame:SetAlpha(0.2)
			Spell3Frame.t:SetTexture(select(3, GetSpellInfo(Spell3Buff)))
		end
		Spell3Frame.id = Spell3Buff
	end
	
	for i, Spell4Buff in pairs(Spell4Buff) do
		local spellname = select(1, GetSpellInfo(Spell4Buff))
		if UnitAura("player", spellname) then
			Spell4Frame:SetAlpha(1)
			Spell4Frame.t:SetTexture(select(3, GetSpellInfo(Spell4Buff)))
			Spell4Frame.id = Spell4Buff
			break
		else
			Spell4Frame:SetAlpha(0.2)
			Spell4Frame.t:SetTexture(select(3, GetSpellInfo(Spell4Buff)))
			Spell4Frame.id = Spell4Buff
		end
	end
	
	for i, Spell5Buff in pairs(Spell5Buff) do
		local spellname = select(1, GetSpellInfo(Spell5Buff))
		if UnitAura("player", spellname) then
			Spell5Frame:SetAlpha(1)
			Spell5Frame.t:SetTexture(select(3, GetSpellInfo(Spell5Buff)))
			Spell5Frame.id = Spell5Buff
			break
		else
			Spell5Frame:SetAlpha(0.2)
			Spell5Frame.t:SetTexture(select(3, GetSpellInfo(Spell5Buff)))
		end
		Spell5Frame.id = Spell5Buff
	end	
	
	for i, Spell6Buff in pairs(Spell6Buff) do
		local spellname = select(1, GetSpellInfo(Spell6Buff))
		if UnitAura("player", spellname) then
			Spell6Frame:SetAlpha(1)
			Spell6Frame.t:SetTexture(select(3, GetSpellInfo(Spell6Buff)))
			Spell6Frame.id = Spell6Buff
			break
		else
			Spell6Frame:SetAlpha(0.2)
			Spell6Frame.t:SetTexture(select(3, GetSpellInfo(Spell6Buff)))
		end
		Spell6Frame.id = Spell6Buff
	end	
end

local RBRWidth = ((TukuiMinimap:GetWidth() - 6) / 6) + 4

local raidbuff_reminder = CreateFrame('Frame', 'RaidBuffReminder', Minimap)
raidbuff_reminder:SetTemplate('Default')
raidbuff_reminder:Width(RBRWidth)
raidbuff_reminder:Point('TOPLEFT', TukuiMinimap, 'TOPRIGHT', 4, 0)
raidbuff_reminder:Point('BOTTOMLEFT', TukuiMinimap, 'BOTTOMRIGHT', 4, 0)
raidbuff_reminder:CreateShadow( "Default" )

raidbuff_reminder:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
raidbuff_reminder:RegisterEvent("UNIT_INVENTORY_CHANGED")
raidbuff_reminder:RegisterEvent("UNIT_AURA")
raidbuff_reminder:RegisterEvent("PLAYER_REGEN_ENABLED")
raidbuff_reminder:RegisterEvent("PLAYER_REGEN_DISABLED")
raidbuff_reminder:RegisterEvent("PLAYER_ENTERING_WORLD")
raidbuff_reminder:RegisterEvent("UPDATE_BONUS_ACTIONBAR")
raidbuff_reminder:RegisterEvent("CHARACTER_POINTS_CHANGED")
raidbuff_reminder:RegisterEvent("ZONE_CHANGED_NEW_AREA")
raidbuff_reminder:SetScript("OnEvent", OnAuraChange)
raidbuff_reminder:SetScript("OnMouseUp", microMenuGenerator)



--Function to create buttons
local function CreateButton(name, relativeTo, firstbutton, lastbutton)
	local button = CreateFrame("Button", name, RaidBuffReminder)
	button:SetTemplate('Default')
	button:Size(RBRWidth - 4)
	if firstbutton == true then
		button:Point("TOP", relativeTo, "TOP", 0, -2)
	else
		button:Point("TOP", relativeTo, "BOTTOM", 0, -1)
	end
	
	if lastbutton == true then
		button:Point("BOTTOM", RaidBuffReminder, "BOTTOM", 0, 2)
	end
	
	button.t = button:CreateTexture(name..".t", "OVERLAY")
	button.t:SetTexCoord(.08, .92, .08, .92)
	button.t:Point("TOPLEFT", 2, -2)
	button.t:Point("BOTTOMRIGHT", -2, 2)
	button:SetScript("OnMouseUp", microMenuGenerator)
	
	return button
end

--Create Buttons
do
CreateButton("Spell1Frame", RaidBuffReminder, true)
CreateButton("Spell2Frame", Spell1Frame, false)
CreateButton("Spell3Frame", Spell2Frame, false)
CreateButton("Spell4Frame", Spell3Frame, false)
CreateButton("Spell5Frame", Spell4Frame, false)
CreateButton("Spell6Frame", Spell5Frame, false, true)
end