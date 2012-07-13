---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["unitframes"]["enable"] ~= true ) then return end

if( C["global"]["unitframelayout"] ~= "asphyxia2" ) then return end

------------------------------
-- Player
------------------------------
do
	------------------------------
	-- not needed
	------------------------------
	do
		G.UnitFrames.Player:SetBackdrop( nil )
		G.UnitFrames.Player:SetBackdropColor( 0, 0, 0 )
		G.UnitFrames.Player.shadow:Kill()
		G.UnitFrames.Player.panel:Kill()
	end

	------------------------------
	-- health
	------------------------------
	do
		G.UnitFrames.Player.Health:Size( 233, 13 )
		G.UnitFrames.Player.Health:SetStatusBarTexture( C["media"]["normal"] )
		G.UnitFrames.Player.Health:SetFrameLevel( 5 )
		G.UnitFrames.Player.Health:CreateBorder( true )
		G.UnitFrames.Player.Health.bg:SetTexture( 0.6, 0.6, 0.6 )

		if( C["unitframes"]["unicolor"] == true ) then
			G.UnitFrames.Player.Health.colorTapping = false
			G.UnitFrames.Player.Health.colorDisconnected = false
			G.UnitFrames.Player.Health.colorClass = false
			G.UnitFrames.Player.Health:SetStatusBarColor( 0.125, 0.125, 0.125, 1 )
			G.UnitFrames.Player.Health.bg:SetVertexColor( 0, 0, 0, 1 )
		else
			G.UnitFrames.Player.Health.colorDisconnected = true
			G.UnitFrames.Player.Health.colorTapping = true
			G.UnitFrames.Player.Health.colorClass = true
			G.UnitFrames.Player.Health.colorReaction = true
		end

		G.UnitFrames.Player.Health.value = S.SetFontString( G.UnitFrames.Player.Health, S.CreateFontString() )
		G.UnitFrames.Player.Health.value:Point( "RIGHT", G.UnitFrames.Player.Health, "RIGHT", -4, 1 )
	end

	------------------------------
	-- power
	------------------------------
	do
		G.UnitFrames.Player.Power:Size( 244, 2 )
		G.UnitFrames.Player.Power:SetStatusBarTexture( C["media"]["normal"] )
		G.UnitFrames.Player.Power:ClearAllPoints()
		G.UnitFrames.Player.Power:Point( "TOP", G.UnitFrames.Player.Health, "BOTTOM", 0, -11 )
		G.UnitFrames.Player.Power:SetFrameLevel( G.UnitFrames.Player.Health:GetFrameLevel() + 2 )
		G.UnitFrames.Player.Power:CreateBorder( true )

		G.UnitFrames.Player.Power.value = S.SetFontString( G.UnitFrames.Player.Health, S.CreateFontString() )
		G.UnitFrames.Player.Power.value:Point( "LEFT", G.UnitFrames.Player.Health, "LEFT", 4, 1 )
	end

	------------------------------
	-- portraits
	------------------------------
	do
		if( C["unitframes"]["charportrait"] == true ) then
			local portraitBorder = CreateFrame( "Frame", G.UnitFrames.Player:GetName() .. "_PortraitBorder", G.UnitFrames.Player )
			portraitBorder:CreatePanel( "Default", 237, 17, "TOP", G.UnitFrames.Player.Health, "BOTTOM", 0, -22 )
			portraitBorder:CreateShadow( "Default" )
			portraitBorder:SetFrameLevel( 2 )

			G.UnitFrames.Player.Portrait:ClearAllPoints()
			G.UnitFrames.Player.Portrait:ClearAllPoints()
			G.UnitFrames.Player.Portrait:Point( "TOPLEFT", portraitBorder, "TOPLEFT", 2, -2 )
			G.UnitFrames.Player.Portrait:Point( "BOTTOMRIGHT", portraitBorder, "BOTTOMRIGHT", -3, 3 )
			G.UnitFrames.Player.Portrait:SetAlpha( 0.8 )
			G.UnitFrames.Player.Portrait:SetFrameLevel( 8 )
			G.UnitFrames.Player.Portrait.SetAlpha = S.dummy
	
			G.UnitFrames.Player.Health:ClearAllPoints()
			G.UnitFrames.Player.Health:SetPoint( "TOPLEFT", 0, 0 )
			G.UnitFrames.Player.Health:SetPoint( "TOPRIGHT" )
			G.UnitFrames.Player.Portrait:SetFrameLevel( G.UnitFrames.Player.Health:GetFrameLevel() )
		end
	end

	------------------------------
	-- decoration
	------------------------------
	do
		local PowerLineLeft = CreateFrame( "Frame", "PowerLineLeft", G.UnitFrames.Player )
		PowerLineLeft:CreatePanel( "Default", 2, 38, "RIGHT", G.UnitFrames.Player.Power, "LEFT", -5, 0 )

		local PowerLineRight = CreateFrame( "Frame", "PowerLineRight", G.UnitFrames.Player )
		PowerLineRight:CreatePanel( "Default", 2, 38, "LEFT", G.UnitFrames.Player.Power, "RIGHT", 5, 0 )

		local HealthLine = CreateFrame( "Frame", "HealthLine", G.UnitFrames.Player )
		HealthLine:CreatePanel( "Default", 258, 2, "TOPLEFT", PowerLineLeft, "TOPLEFT", 0, 0 )

		local PortraitLine = CreateFrame( "Frame", "PortraitLine", G.UnitFrames.Player )
		PortraitLine:CreatePanel( "Default", 258, 2, "BOTTOMLEFT", PowerLineLeft, "BOTTOMLEFT", 0, 0 )
	end

	------------------------------
	-- classicons
	------------------------------
	do
		if( C["unitframes"]["classicons"] == true ) then
			local classicon = CreateFrame( "Frame", G.UnitFrames.Player:GetName() .. "_ClassIconBorder", G.UnitFrames.Player )
			classicon:CreatePanel( "Default", 38, 38, "RIGHT", PowerLineLeft, "LEFT", -3, 0 )

			local class = classicon:CreateTexture( G.UnitFrames.Player:GetName() .. "_ClassIcon", "ARTWORK" )
			class:Point( "TOPLEFT", 2, -2 )
			class:Point( "BOTTOMRIGHT", -2, 2 )
			G.UnitFrames.Player.ClassIcon = class

			G.UnitFrames.Player:EnableElement( "ClassIcon" )
		end
	end

	------------------------------
	-- combat icon
	------------------------------
	do
		G.UnitFrames.Player.Combat:Size( 19 )
		G.UnitFrames.Player.Combat:ClearAllPoints()
		G.UnitFrames.Player.Combat:SetPoint( "CENTER", 0, 0 )
		G.UnitFrames.Player.Combat:SetVertexColor( 0.69, 0.31, 0.31 )
	end

	------------------------------
	-- mana flash
	------------------------------
	do
		G.UnitFrames.Player.FlashInfo:ClearAllPoints()
		G.UnitFrames.Player.FlashInfo:SetAllPoints( G.UnitFrames.Player.Health )
		G.UnitFrames.Player.FlashInfo:SetFrameLevel( G.UnitFrames.Player.Health:GetFrameLevel() + 2 )

		G.UnitFrames.Player.FlashInfo.ManaLevel:ClearAllPoints()
		G.UnitFrames.Player.FlashInfo.ManaLevel:SetPoint( "CENTER", 0, 1 )
		G.UnitFrames.Player.FlashInfo.ManaLevel:SetFont( S.CreateFontString() )
		
	end

	------------------------------
	-- experience
	------------------------------
	do
		if( S.level ~= MAX_PLAYER_LEVEL ) then
			G.UnitFrames.Player.Experience:ClearAllPoints()
			G.UnitFrames.Player.Experience:SetStatusBarColor( 0, 0.4, 1, 0.8 )

			if( C["global"]["panellayout"] == "asphyxia" ) then
				G.UnitFrames.Player.Experience:SetStatusBarTexture( C["media"]["normal"] )
				G.UnitFrames.Player.Experience:Size( TukuiChatBackgroundLeft:GetWidth() - 4, 2 )
				G.UnitFrames.Player.Experience:Point( "BOTTOM", TukuiChatBackgroundLeft, "TOP", 0, 5 )
				G.UnitFrames.Player.Experience:SetFrameLevel( 12 )
				G.UnitFrames.Player.Experience:SetAlpha( 1 )
				G.UnitFrames.Player.Experience:CreateBorder( true )

				G.UnitFrames.Player.Experience:HookScript( "OnLeave", function( self ) self:SetAlpha( 1 ) end )

				G.UnitFrames.Player.Experience.Text = G.UnitFrames.Player.Experience:CreateFontString( nil, "OVERLAY" )
				G.UnitFrames.Player.Experience.Text:SetFont( S.CreateFontString() )
				G.UnitFrames.Player.Experience.Text:SetPoint( "CENTER", 0, 1 )
				G.UnitFrames.Player.Experience.Text:SetShadowOffset( S.mult, -S.mult )
				G.UnitFrames.Player.Experience.Text = G.UnitFrames.Player.Experience.Text
				G.UnitFrames.Player.Experience.PostUpdate = S.ExperienceText

				G.UnitFrames.Player.Resting:ClearAllPoints()
				G.UnitFrames.Player.Resting:SetPoint( "BOTTOMRIGHT", G.UnitFrames.Player, "TOPLEFT", 6, 7 )

			elseif( C["global"]["panellayout"] == "duffed" ) then
				G.UnitFrames.Player.Experience:SetStatusBarTexture( C["media"]["normal"] )
			elseif( C["global"]["panellayout"] == "jasje" ) then
				G.UnitFrames.Player.Experience:SetStatusBarTexture( C["media"]["glamour"] )
			elseif( C["global"]["panellayout"] == "sinaris" ) then
				G.UnitFrames.Player.Experience:SetStatusBarTexture( C["media"]["normal"] )
			end
		end
	end

	------------------------------
	-- reputation
	------------------------------
	do
		if( S.level == MAX_PLAYER_LEVEL ) then

		end
	end

	------------------------------
	-- combat feedback
	------------------------------
	do
		if( C["unitframes"]["combatfeedback"] == true ) then
			G.UnitFrames.Player.CombatFeedbackText:SetFont( S.CreateFontString() )
		end
	end

	------------------------------
	-- druidmana
	------------------------------
	do
		if( S.myclass == "DRUID" ) then
			G.UnitFrames.Player.DruidManaText:SetFont( S.CreateFontString() )
		end
	end

	------------------------------
	-- classbar
	------------------------------
	do
		if( C["unitframes"]["classbar"] == true ) then
			------------------------------
			-- druid
			------------------------------
			if( S.myclass == "DRUID" ) then
				G.UnitFrames.Player.DruidManaBackground:ClearAllPoints()
				G.UnitFrames.Player.DruidManaBackground:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 7 )
				G.UnitFrames.Player.DruidManaBackground:Size( 233, 2 )
				G.UnitFrames.Player.DruidManaBackground:CreateBorder( true )

				G.UnitFrames.Player.DruidMana:SetSize( G.UnitFrames.Player.DruidManaBackground:GetWidth(), G.UnitFrames.Player.DruidManaBackground:GetHeight() )

				G.UnitFrames.Player.EclipseBar:ClearAllPoints()
				G.UnitFrames.Player.EclipseBar:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 7 )
				G.UnitFrames.Player.EclipseBar:Size( 233, 2 )
				G.UnitFrames.Player.EclipseBar:CreateBorder( true )

				G.UnitFrames.Player.EclipseBar.LunarBar:SetSize( G.UnitFrames.Player.EclipseBar:GetWidth(), G.UnitFrames.Player.EclipseBar:GetHeight() )
				G.UnitFrames.Player.EclipseBar.SolarBar:SetSize( G.UnitFrames.Player.EclipseBar:GetWidth(), G.UnitFrames.Player.EclipseBar:GetHeight() )

				G.UnitFrames.Player.EclipseBar.Text:ClearAllPoints()
				G.UnitFrames.Player.EclipseBar.Text:SetPoint( "TOP", G.UnitFrames.Player.EclipseBar, 0, 25 )
				G.UnitFrames.Player.EclipseBar.Text:SetFont( S.CreateFontString() )
				G.UnitFrames.Player.EclipseBar.Text:SetShadowOffset( S.mult, -S.mult )
			end

			------------------------------
			-- warlock, paladin
			------------------------------
			if( S.myclass == "WARLOCK" ) then

			end

			------------------------------
			-- warlock, paladin
			------------------------------
			if( S.myclass == "PALADIN" ) then
				G.UnitFrames.Player.HolyPower:ClearAllPoints()
				G.UnitFrames.Player.HolyPower:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 7 )
				G.UnitFrames.Player.HolyPower:Size( 233, 2 )
				G.UnitFrames.Player.HolyPower:CreateBorder( true )

				for i = 1, 3 do
					G.UnitFrames.Player.HolyPower[i]:SetStatusBarColor( 228 / 255, 225 / 255, 16 / 255 )

					if( i == 1 ) then
						G.UnitFrames.Player.HolyPower[i]:SetPoint( "LEFT", G.UnitFrames.Player.HolyPower )
						G.UnitFrames.Player.HolyPower[i]:Size( S.Scale( 232 / 3 ), 2 )
					else
						G.UnitFrames.Player.HolyPower[i]:Point( "LEFT", G.UnitFrames.Player.HolyPower[i - 1], "RIGHT", 1, 0 )
						G.UnitFrames.Player.HolyPower[i]:Size( S.Scale( 232 / 3 ), 2 )
					end
				end
			end

			------------------------------
			-- deathknight
			------------------------------
			if( S.myclass == "DEATHKNIGHT" ) then
				G.UnitFrames.Player.Runes:ClearAllPoints()
				G.UnitFrames.Player.Runes:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 7 )
				G.UnitFrames.Player.Runes:Size( 233, 2 )
				G.UnitFrames.Player.Runes:CreateBorder( true )

				for i = 1, 6 do
					if( i == 1 ) then
						G.UnitFrames.Player.Runes[i]:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 7 )
						G.UnitFrames.Player.Runes[i]:Size( S.Scale( 38 ), 2 )
					elseif( i == 2 or i == 3 ) then
						G.UnitFrames.Player.Runes[i]:Size( S.Scale( 38 ), 2 )
					else
						G.UnitFrames.Player.Runes[i]:Point( "LEFT", G.UnitFrames.Player.Runes[i - 1], "RIGHT", 1, 0 )
						G.UnitFrames.Player.Runes[i]:Size( S.Scale( 37 ), 2 )
					end
				end
			end

			------------------------------
			-- shaman
			------------------------------
			if( S.myclass == "SHAMAN" ) then

			end
		end
	end

	------------------------------
	-- castbar
	------------------------------
	do
		if( C["unitframes"]["unitcastbar"] == true ) then
			G.UnitFrames.Player.Castbar:ClearAllPoints()
			G.UnitFrames.Player.Castbar:SetHeight( S.Scale( 20 ) )
			G.UnitFrames.Player.Castbar:Point( "BOTTOMRIGHT", G.ActionBars.Bar1, "TOPRIGHT", -2, 5 )
			G.UnitFrames.Player.Castbar:SetStatusBarTexture( C["media"]["normal"] )
			G.UnitFrames.Player.Castbar:CreateBorder( true )
			G.UnitFrames.Player.Castbar.bg:SetVertexColor( 0.05, 0.05, 0.05 )

			if( C["unitframes"]["cbicons"] == true ) then
				G.UnitFrames.Player.Castbar:Width( 347 )

				G.UnitFrames.Player.Castbar.button:ClearAllPoints()
				G.UnitFrames.Player.Castbar.button:SetPoint( "RIGHT", G.UnitFrames.Player.Castbar, "LEFT", -5, 0 )
				G.UnitFrames.Player.Castbar.button:Size( 24 )
			else
				G.UnitFrames.Player.Castbar:Width( 374 )
			end

			G.UnitFrames.Player.Castbar.PostCastStart = S.PostCastStart
			G.UnitFrames.Player.Castbar.PostChannelStart = S.PostCastStart

			G.UnitFrames.Player.Castbar.Time = S.SetFontString( G.UnitFrames.Player.Castbar, S.CreateFontString() )
			G.UnitFrames.Player.Castbar.Time:Point( "RIGHT", G.UnitFrames.Player.Castbar, "RIGHT", -4, 1 )
			G.UnitFrames.Player.Castbar.Time:SetTextColor( 0, 4, 0 )

			G.UnitFrames.Player.Castbar.Text = S.SetFontString( G.UnitFrames.Player.Castbar, S.CreateFontString() )
			G.UnitFrames.Player.Castbar.Text:Point( "LEFT", G.UnitFrames.Player.Castbar, "LEFT", 4, 1 )
			G.UnitFrames.Player.Castbar.Text:SetTextColor( 0.3, 0.2, 1 )

			if( C["unitframes"]["cblatency"] == true ) then
				G.UnitFrames.Player.Castbar.SafeZone:SetTexture( C["media"]["normal"] )
				G.UnitFrames.Player.Castbar.SafeZone:SetVertexColor( 0.8, 0.2, 0.2, 0.75 )
			end
		end
	end

	------------------------------
	-- fader
	------------------------------
	do
		if( C["unitframes"]["fader"] == true ) then
			G.UnitFrames.Player.FadeCasting = true
			G.UnitFrames.Player.FadeCombat = true
			G.UnitFrames.Player.FadeTarget = true
			G.UnitFrames.Player.FadeHealth = true
			G.UnitFrames.Player.FadePower = true
			G.UnitFrames.Player.FadeHover = true

			G.UnitFrames.Player.FadeSmooth = 0.5
			G.UnitFrames.Player.FadeMinAlpha = 0.3
			G.UnitFrames.Player.FadeMaxAlpha = 1

			G.UnitFrames.Player:EnableElement( "Fader" )
		end
	end

	------------------------------
	-- size
	------------------------------
	do
		G.UnitFrames.Player:Size( 233, 13 )
	end
end

------------------------------
-- Target
------------------------------
do

end

------------------------------
-- Target of Target
------------------------------
do

end

------------------------------
-- Pet
------------------------------
do

end

------------------------------
-- Pet Target
------------------------------
do

end

------------------------------
-- Focus
------------------------------
do

end

------------------------------
-- Focus Target
------------------------------
do

end

------------------------------
-- Boss
------------------------------
do

end

------------------------------
-- Arena
------------------------------
do

end

------------------------------
-- Main Tank, Main Assist
------------------------------
do

end

------------------------------
-- Position
------------------------------
local FramePositions = CreateFrame( "Frame" )
FramePositions:RegisterEvent( "PLAYER_ENTERING_WORLD" )
FramePositions:SetScript( "OnEvent", function( self, event, addon )
	G.UnitFrames.Player:ClearAllPoints()
	G.UnitFrames.Target:ClearAllPoints()
	G.UnitFrames.TargetTarget:ClearAllPoints()
	G.UnitFrames.Pet:ClearAllPoints()
	G.UnitFrames.Focus:ClearAllPoints()
	G.UnitFrames.FocusTarget:ClearAllPoints()

	if( IsAddOnLoaded( "AsphyxiaUI_Raid" ) ) then
		G.UnitFrames.Player:SetPoint( "TOP", UIParent, "BOTTOM", -170 , 260 )
		G.UnitFrames.Target:SetPoint( "TOP", UIParent, "BOTTOM", 170 , 260 )
	elseif( IsAddOnLoaded( "AsphyxiaUI_Raid_Healing" ) ) then
		G.UnitFrames.Player:SetPoint( "TOP", UIParent, "BOTTOM", -309 , 350 )
		G.UnitFrames.Target:SetPoint( "TOP", UIParent, "BOTTOM", 309 , 350 )
	else
		G.UnitFrames.Player:SetPoint( "TOP", UIParent, "BOTTOM", -309 , 350 )
		G.UnitFrames.Target:SetPoint( "TOP", UIParent, "BOTTOM", 309 , 350 )
	end

	G.UnitFrames.TargetTarget:SetPoint( "TOPRIGHT", G.UnitFrames.Target, "BOTTOMRIGHT", 0, -49 )
	G.UnitFrames.Pet:SetPoint( "TOPLEFT", G.UnitFrames.Player, "BOTTOMLEFT", 0, -49 )
	G.UnitFrames.Focus:SetPoint( "TOP", UIParent, "BOTTOM", -450, 600 )
	G.UnitFrames.FocusTarget:SetPoint( "TOP", G.UnitFrames.Focus, "BOTTOM", 0 , -43 )

	for i = 1, MAX_BOSS_FRAMES do
		G.UnitFrames["Boss" .. i]:ClearAllPoints()
		if( i == 1 ) then
			G.UnitFrames["Boss" .. i]:SetPoint( "TOP", UIParent, "BOTTOM", 450, 600 )
		else
			G.UnitFrames["Boss" .. i]:SetPoint( "TOP", G.UnitFrames["Boss" .. i - 1], "BOTTOM", 0, -43 )
		end
	end

	for i = 1, 5 do
		G.UnitFrames["Arena" .. i]:ClearAllPoints()
		if( i == 1 ) then
			G.UnitFrames["Arena" .. i]:SetPoint( "TOP", UIParent, "BOTTOM", 450, 600 )
		else
			G.UnitFrames["Arena" .. i]:SetPoint( "TOP", G.UnitFrames["Arena" .. i - 1], "BOTTOM", 0, -43 )
		end
	end
end )