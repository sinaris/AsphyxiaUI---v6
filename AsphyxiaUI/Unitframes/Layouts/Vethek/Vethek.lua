---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["globalstyle"] ~= "vethek" ) then return end

if( C["unitframes"]["enable"] ~= true ) then return end

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
	-- classbar background
	------------------------------
	do
		local VethekUnitframesClassbarBackground = CreateFrame( "Frame", "VethekUnitframesClassbarBackground", UIParent )
		VethekUnitframesClassbarBackground:Size( G.ActionBars.Bar1:GetWidth(), 72 )
		VethekUnitframesClassbarBackground:SetPoint( "BOTTOM", G.ActionBars.Bar1, "TOP", 0, 26 )
		VethekUnitframesClassbarBackground:SetTemplate( "Default" )
	end

	------------------------------
	-- health
	------------------------------
	do
		G.UnitFrames.Player.Health:Size( 233, 26 )
		G.UnitFrames.Player.Health:SetFrameLevel( 5 )
		G.UnitFrames.Player.Health:CreateBackdrop( "Default" )
		G.UnitFrames.Player.Health:SetStatusBarTexture( C["media"]["otravi"] )

		if( C["unitframes"]["unicolor"] == true ) then
			G.UnitFrames.Player.Health:SetStatusBarColor( 0.08, 0.08, 0.08, 1 )
			G.UnitFrames.Player.Health.bg:SetVertexColor( 1, 0, 0, 1 )
			G.UnitFrames.Player.Health.bg:SetTexture( 254, 0, 0, 0.5 )
		end

		G.UnitFrames.Player.Health.value = S.SetFontString( G.UnitFrames.Player.Health, unpack( S.FontTemplate.UnitframesHealth.BuildFont ) )
		G.UnitFrames.Player.Health.value:Point( "LEFT", G.UnitFrames.Player.Health, "LEFT", 2, 1 )
		G.UnitFrames.Player.Health.value:SetShadowOffset( 0, 0 )

		G.UnitFrames.Player.Health.PostUpdate = S.PostUpdateHealth
	end

	------------------------------
	-- power
	------------------------------
	do
		G.UnitFrames.Player.Power:Size( G.ActionBars.Bar1:GetWidth() - 16, 10 )
		G.UnitFrames.Player.Power:ClearAllPoints()
		G.UnitFrames.Player.Power:Point( "BOTTOM", VethekUnitframesClassbarBackground, "BOTTOM", 0, 8 )
		G.UnitFrames.Player.Power:SetFrameLevel( G.UnitFrames.Player.Health:GetFrameLevel() + 2 )
		G.UnitFrames.Player.Power:CreateBackdrop( "Default" )
		G.UnitFrames.Player.Power:SetStatusBarTexture( C["media"]["otravi"] )
		G.UnitFrames.Player.Power:SetFrameLevel( VethekUnitframesClassbarBackground:GetFrameLevel() + 2 )

		G.UnitFrames.Player.Power.colorClass = false
		G.UnitFrames.Player.Power.bg:SetVertexColor( 0, 0, 0, 1 )

		G.UnitFrames.Player.Power.value = S.SetFontString( G.UnitFrames.Player.Health, unpack( S.FontTemplate.UnitframesPower.BuildFont ) )
		G.UnitFrames.Player.Power.value:Point( "CENTER", G.UnitFrames.Player.Power, "CENTER", 0, 1 )
		G.UnitFrames.Player.Power.value:SetShadowOffset( 0, 0 )

		G.UnitFrames.Player.Power.PreUpdate = S.PreUpdatePower
		G.UnitFrames.Player.Power.PostUpdate = S.PostUpdatePower
	end

	------------------------------
	-- portraits
	------------------------------
	do
		if( C["unitframes"]["charportrait"] == true ) then
			G.UnitFrames.Player.Portrait:ClearAllPoints()
			G.UnitFrames.Player.Portrait:SetAllPoints( G.UnitFrames.Player.Health )
			G.UnitFrames.Player.Portrait:SetAlpha( 0.05 )
			G.UnitFrames.Player.Portrait.SetAlpha = S.dummy
			G.UnitFrames.Player.Portrait:SetFrameLevel( G.UnitFrames.Player.Health:GetFrameLevel() )
			G.UnitFrames.Player.Portrait.SetFrameLevel = S.dummy

			G.UnitFrames.Player.Health:ClearAllPoints()
			G.UnitFrames.Player.Health:SetPoint( "TOPLEFT", 0, 0 )
			G.UnitFrames.Player.Health:SetPoint( "TOPRIGHT" )
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
		G.UnitFrames.Player.FlashInfo.ManaLevel:SetFont( unpack( S.FontTemplate.UnitframesDefault.BuildFont ) )
		
	end

	------------------------------
	-- pvp combat icon
	------------------------------
	do
		local PVP = G.UnitFrames.Player.Health:CreateTexture( nil, "OVERLAY" )
		PVP:SetHeight( S.Scale( 32 ) )
		PVP:SetWidth( S.Scale( 32 ) )
		PVP:SetPoint( "CENTER", G.UnitFrames.Player.Health, "CENTER", 0, -7 )
		G.UnitFrames.Player.PvP = PVP

		G.UnitFrames.Player:EnableElement( "PvP" )
	end

	------------------------------
	-- experience
	------------------------------
	do
		if( S.level ~= MAX_PLAYER_LEVEL ) then
			G.UnitFrames.Player.Experience:ClearAllPoints()
			G.UnitFrames.Player.Experience:SetStatusBarColor( 0, 0.4, 1, 0.8 )
			G.UnitFrames.Player.Experience:SetStatusBarTexture( C["media"]["otravi"] )

			G.UnitFrames.Player.Experience:Size( G.Panels.LeftChatBackground:GetWidth() - 4, 2 )
			G.UnitFrames.Player.Experience:Point( "BOTTOM", G.Panels.LeftChatBackground, "TOP", 0, 5 )
			G.UnitFrames.Player.Experience:SetFrameLevel( 12 )
			G.UnitFrames.Player.Experience:SetAlpha( 1 )
			G.UnitFrames.Player.Experience:CreateBackdrop( "Default" )
			G.UnitFrames.Player.Experience.backdrop:CreateShadow( "Default" )

			G.UnitFrames.Player.Experience:HookScript( "OnLeave", function( self ) self:SetAlpha( 1 ) end )

			G.UnitFrames.Player.Experience.Text = G.UnitFrames.Player.Experience:CreateFontString( nil, "OVERLAY" )
			G.UnitFrames.Player.Experience.Text:SetFont( unpack( S.FontTemplate.UnitframesDefault.BuildFont ) )
			G.UnitFrames.Player.Experience.Text:SetPoint( "CENTER", 0, 1 )
			G.UnitFrames.Player.Experience.Text:SetShadowOffset( S.mult, -S.mult )
			G.UnitFrames.Player.Experience.Text = G.UnitFrames.Player.Experience.Text
			G.UnitFrames.Player.Experience.PostUpdate = S.ExperienceText

			G.UnitFrames.Player.Resting:ClearAllPoints()
			G.UnitFrames.Player.Resting:SetPoint( "BOTTOMRIGHT", G.UnitFrames.Player, "TOPLEFT", 6, 7 )
		end
	end

	------------------------------
	-- reputation
	------------------------------
	do
		if( S.level == MAX_PLAYER_LEVEL ) then
			G.UnitFrames.Player.Reputation:ClearAllPoints()
			G.UnitFrames.Player.Reputation:SetStatusBarTexture( C["media"]["otravi"] )

			G.UnitFrames.Player.Reputation:Size( G.Panels.LeftChatBackground:GetWidth() - 4, 2 )
			G.UnitFrames.Player.Reputation:Point( "BOTTOM", G.Panels.LeftChatBackground, "TOP", 0, 5 )
			G.UnitFrames.Player.Reputation:SetFrameLevel( 10 )
			G.UnitFrames.Player.Reputation:SetAlpha( 1 )
			G.UnitFrames.Player.Reputation:CreateBackdrop( "Default" )
			G.UnitFrames.Player.Reputation.backdrop:CreateShadow( "Default" )

			G.UnitFrames.Player.Reputation:HookScript( "OnLeave", function( self ) self:SetAlpha( 1 ) end )

			G.UnitFrames.Player.Reputation.Text = G.UnitFrames.Player.Reputation:CreateFontString( nil, "OVERLAY" )
			G.UnitFrames.Player.Reputation.Text:SetFont( unpack( S.FontTemplate.UnitframesDefault.BuildFont ) )
			G.UnitFrames.Player.Reputation.Text:SetPoint( "CENTER", 0, 1 )
			G.UnitFrames.Player.Reputation.Text:SetShadowOffset( S.mult, -S.mult )
			G.UnitFrames.Player.Reputation.Text = G.UnitFrames.Player.Reputation.Text
			G.UnitFrames.Player.Reputation.PostUpdate = S.UpdateReputationColor
		end
	end

	------------------------------
	-- combat feedback
	------------------------------
	do
		if( C["unitframes"]["combatfeedback"] == true ) then
			G.UnitFrames.Player.CombatFeedbackText:SetFont( unpack( S.FontTemplate.UnitframesDefault.BuildFont ) )
		end
	end

	------------------------------
	-- druidmana
	------------------------------
	do
		if( S.myclass == "DRUID" ) then
			G.UnitFrames.Player.DruidManaText:SetFont( unpack( S.FontTemplate.UnitframesDefault.BuildFont ) )
		end
	end

	------------------------------
	-- classbar
	------------------------------
	do
		------------------------------
		-- druid
		------------------------------
		if( S.myclass == "DRUID" ) then
			if( C["unitframes"]["druidmanabar"] == true ) then
				G.UnitFrames.Player.DruidManaBackground:ClearAllPoints()
				G.UnitFrames.Player.DruidManaBackground:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 7 )
				G.UnitFrames.Player.DruidManaBackground:Size( 233, 7 )
				G.UnitFrames.Player.DruidManaBackground:CreateBackdrop( "Default" )

				G.UnitFrames.Player.DruidMana:SetSize( G.UnitFrames.Player.DruidManaBackground:GetWidth(), G.UnitFrames.Player.DruidManaBackground:GetHeight() )
				G.UnitFrames.Player.DruidMana:SetStatusBarTexture( C["media"]["otravi"] )
			end

			if( C["unitframes"]["classbar"] == true ) then
				G.UnitFrames.Player.EclipseBar:ClearAllPoints()
				G.UnitFrames.Player.EclipseBar:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 7 )
				G.UnitFrames.Player.EclipseBar:Size( 233, 7 )
				G.UnitFrames.Player.EclipseBar:CreateBackdrop( "Default" )

				G.UnitFrames.Player.EclipseBar.LunarBar:SetSize( G.UnitFrames.Player.EclipseBar:GetWidth(), G.UnitFrames.Player.EclipseBar:GetHeight() )
				G.UnitFrames.Player.EclipseBar.SolarBar:SetSize( G.UnitFrames.Player.EclipseBar:GetWidth(), G.UnitFrames.Player.EclipseBar:GetHeight() )

				G.UnitFrames.Player.EclipseBar.LunarBar:SetStatusBarTexture( C["media"]["otravi"] )
				G.UnitFrames.Player.EclipseBar.SolarBar:SetStatusBarTexture( C["media"]["otravi"] )

				G.UnitFrames.Player.EclipseBar.Text:ClearAllPoints()
				G.UnitFrames.Player.EclipseBar.Text:SetPoint( "TOP", G.UnitFrames.Player.EclipseBar, 0, 25 )
				G.UnitFrames.Player.EclipseBar.Text:SetFont( unpack( S.FontTemplate.UnitframesDefault.BuildFont ) )
				G.UnitFrames.Player.EclipseBar.Text:SetShadowOffset( 0, 0 )
			end

			if( C["unitframes"]["druidmushroombar"] == true ) then
				G.UnitFrames.Player.WildMushroom:SetBackdrop( nil )

				for i = 1, 3 do
					G.UnitFrames.Player.WildMushroom[i]:Size( G.ActionBars.Bar1:GetWidth() - 16, 7 )
					G.UnitFrames.Player.WildMushroom[i]:CreateBackdrop( "Default" )
					G.UnitFrames.Player.WildMushroom[i]:SetStatusBarTexture( C["media"]["otravi"] )
					G.UnitFrames.Player.WildMushroom[i]:SetStatusBarColor( 1, 0, 0 )
					G.UnitFrames.Player.WildMushroom[i].bg:SetAlpha( 0 )

					G.UnitFrames.Player.WildMushroom[i]:ClearAllPoints()
					if( i == 1 ) then
						G.UnitFrames.Player.WildMushroom[i]:Point( "TOPLEFT", VethekUnitframesClassbarBackground, "TOPLEFT", 8, -8 )
					elseif( i == 2 ) then
						G.UnitFrames.Player.WildMushroom[i]:Point( "TOPLEFT", G.UnitFrames.Player.WildMushroom[1], "BOTTOMLEFT", 0, -8 )
					elseif( i == 3 ) then
						G.UnitFrames.Player.WildMushroom[i]:Point( "TOPLEFT", G.UnitFrames.Player.WildMushroom[2], "BOTTOMLEFT", 0, -8 )
					end

					G.UnitFrames.Player.WildMushroom[i]:FontString( "timer", unpack( S.FontTemplate.UnitframesPower.BuildFont ) )
					G.UnitFrames.Player.WildMushroom[i].timer:SetPoint( "CENTER", 0, 1 )
					G.UnitFrames.Player.WildMushroom[i].timer:SetShadowOffset( 0, 0 )
				end

				local total = 1
				local delay = 0.03

				local function UpdateWildMushroom( i )
					local up, name, start, duration, icon = GetTotemInfo( i )

					G.UnitFrames.Player.WildMushroom[i]:SetMinMaxValues( 0, duration )
					if( not up ) then
						G.UnitFrames.Player.WildMushroom[i]:SetValue( duration )
						G.UnitFrames.Player.WildMushroom[i].timer:SetText( "0" )
					else
						G.UnitFrames.Player.WildMushroom[i]:SetValue( GetTime() - start )
						G.UnitFrames.Player.WildMushroom[i].timer:SetText( S.FormatTime( duration - ( GetTime() - start ) ) )
					end
				end

				local OnUpdate = CreateFrame( "Frame" )
				OnUpdate:SetScript( "OnUpdate", function( self, elapsed )
					total = total + elapsed
					if( total > .01 ) then
						for i = 1, 3 do
							UpdateWildMushroom( i )
						end
					end
					total = 0
				end )
			end
		end

		------------------------------
		-- warlock
		------------------------------
		if( S.myclass == "WARLOCK" ) then
			if( C["unitframes"]["classbar"] == true ) then
				G.UnitFrames.Player.WarlockSpecBars:ClearAllPoints()
				G.UnitFrames.Player.WarlockSpecBars:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 7 )
				G.UnitFrames.Player.WarlockSpecBars:Size( 233, 2 )
				G.UnitFrames.Player.WarlockSpecBars:CreateBackdrop( "Default" )
				G.UnitFrames.Player.WarlockSpecBars.backdrop:CreateShadow( "Default" )

				for i = 1, 4 do
					G.UnitFrames.Player.WarlockSpecBars[i]:Size( S.Scale( 232 / 4 ), 2 )

					if( i == 1 ) then
						G.UnitFrames.Player.WarlockSpecBars[i]:SetPoint( "LEFT", G.UnitFrames.Player.WarlockSpecBars, "LEFT", 0, 0 )
					else
						G.UnitFrames.Player.WarlockSpecBars[i]:Point( "LEFT", G.UnitFrames.Player.WarlockSpecBars[i - 1], "RIGHT", 1, 0 )
					end
				end
			end
		end

		------------------------------
		-- paladin
		------------------------------
		if( S.myclass == "PALADIN" ) then
			if( C["unitframes"]["classbar"] == true ) then
				G.UnitFrames.Player.HolyPower:ClearAllPoints()
				G.UnitFrames.Player.HolyPower:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 7 )
				G.UnitFrames.Player.HolyPower:Size( 233, 2 )
				G.UnitFrames.Player.HolyPower:CreateBackdrop( "Default" )
				G.UnitFrames.Player.HolyPower.backdrop:CreateShadow( "Default" )

				for i = 1, 5 do
					G.UnitFrames.Player.HolyPower[i]:SetStatusBarColor( 228 / 255, 225 / 255, 16 / 255 )
					if( i == 5 ) then
						G.UnitFrames.Player.HolyPower[i]:Size( S.Scale( 232 / 5 ) - 1, 2 )
					else
						G.UnitFrames.Player.HolyPower[i]:Size( S.Scale( 232 / 5 ), 2 )
					end

					if( i == 1 ) then
						G.UnitFrames.Player.HolyPower[i]:SetPoint( "LEFT", G.UnitFrames.Player.HolyPower, "LEFT", 0, 0 )
					else
						G.UnitFrames.Player.HolyPower[i]:Point( "LEFT", G.UnitFrames.Player.HolyPower[i - 1], "RIGHT", 1, 0 )
					end
					G.UnitFrames.Player.HolyPower[i].width = G.UnitFrames.Player.HolyPower[i]:GetWidth()
				end
			end
		end

		------------------------------
		-- rogue
		------------------------------
		if( S.myclass == "ROGUE" ) then
			if( C["unitframes"]["classbar"] == true ) then
				G.UnitFrames.Player.ComboPointsBar:SetBackdrop( nil )

				for i = 1, 5 do
					G.UnitFrames.Player.ComboPointsBar[i]:CreateBackdrop( "Default" )
					G.UnitFrames.Player.ComboPointsBar[i]:SetStatusBarTexture( C["media"]["otravi"] )
					G.UnitFrames.Player.ComboPointsBar[i]:SetStatusBarColor( 1, 0, 0 )

					if( i == 5 ) then
						G.UnitFrames.Player.ComboPointsBar[i]:Size( G.ActionBars.Bar1:GetWidth() - 16, 7 )
					else
						G.UnitFrames.Player.ComboPointsBar[i]:Size( S.Scale( 109 ), 7 )
					end

					if( i == 1 ) then
						G.UnitFrames.Player.ComboPointsBar[i]:Point( "TOPLEFT", VethekUnitframesClassbarBackground, "TOPLEFT", 8, -8 )
					elseif( i == 2 ) then
						G.UnitFrames.Player.ComboPointsBar[i]:Point( "TOPLEFT", G.UnitFrames.Player.ComboPointsBar[1], "TOPRIGHT", 8, 0 )
					elseif( i == 3 ) then
						G.UnitFrames.Player.ComboPointsBar[i]:Point( "TOPLEFT", G.UnitFrames.Player.ComboPointsBar[1], "BOTTOMLEFT", 0, -8 )
					elseif( i == 4 ) then
						G.UnitFrames.Player.ComboPointsBar[i]:Point( "TOPLEFT", G.UnitFrames.Player.ComboPointsBar[3], "TOPRIGHT", 8, 0 )
					elseif( i == 5 ) then
						G.UnitFrames.Player.ComboPointsBar[i]:Point( "TOPLEFT", G.UnitFrames.Player.ComboPointsBar[3], "BOTTOMLEFT", 0, -8 )
					end
				end
			end
		end

		------------------------------
		-- deathknight
		------------------------------
		if( S.myclass == "DEATHKNIGHT" ) then
			if( C["unitframes"]["classbar"] == true ) then
				G.UnitFrames.Player.Runes:SetBackdrop( nil )

				local total = 1
				local delay = 0.03
				local GetRuneType, GetRuneCooldown, SetValue, GetTime = GetRuneType, GetRuneCooldown, SetValue, GetTime

				local colors = {
					{ 1, 0, 0 },
					{ 1, 0, 0 },
					{ 1, 0, 0 },
					{ 1, 0, 0 },
				}

				for i = 1, 6 do
					G.UnitFrames.Player.Runes[i]:Size( S.Scale( 109 ), 7 )
					G.UnitFrames.Player.Runes[i]:CreateBackdrop( "Default" )
					G.UnitFrames.Player.Runes[i]:SetStatusBarTexture( C["media"]["otravi"] )

					G.UnitFrames.Player.Runes[i]:ClearAllPoints()
					if( i == 1 ) then
						G.UnitFrames.Player.Runes[i]:Point( "TOPLEFT", VethekUnitframesClassbarBackground, "TOPLEFT", 8, -8 )
					elseif( i == 2 ) then
						G.UnitFrames.Player.Runes[i]:Point( "TOPLEFT", G.UnitFrames.Player.Runes[1], "TOPRIGHT", 8, 0 )
					elseif( i == 3 ) then
						G.UnitFrames.Player.Runes[i]:Point( "TOPLEFT", G.UnitFrames.Player.Runes[1], "BOTTOMLEFT", 0, -8 )
					elseif( i == 4 ) then
						G.UnitFrames.Player.Runes[i]:Point( "TOPLEFT", G.UnitFrames.Player.Runes[3], "TOPRIGHT", 8, 0 )
					elseif( i == 5 ) then
						G.UnitFrames.Player.Runes[i]:Point( "TOPLEFT", G.UnitFrames.Player.Runes[3], "BOTTOMLEFT", 0, -8 )
					elseif( i == 6 ) then
						G.UnitFrames.Player.Runes[i]:Point( "TOPLEFT", G.UnitFrames.Player.Runes[5], "TOPRIGHT", 8, 0 )
					end

					G.UnitFrames.Player.Runes[i]:FontString( "timer", unpack( S.FontTemplate.UnitframesPower.BuildFont ) )
					G.UnitFrames.Player.Runes[i].timer:SetPoint( "CENTER", 0, 1 )
					G.UnitFrames.Player.Runes[i].timer:SetShadowOffset( 0, 0 )
				end

				local function UpdateRune( i )
					local start, duration, finished = GetRuneCooldown( i )
					local runetype = GetRuneType( i )

					G.UnitFrames.Player.Runes[i]:SetStatusBarColor( unpack( colors[runetype] ) )
					G.UnitFrames.Player.Runes[i]:SetMinMaxValues( 0, duration )
					if( finished ) then
						G.UnitFrames.Player.Runes[i]:SetValue( duration )
						G.UnitFrames.Player.Runes[i].timer:SetText( "" )
					else
						G.UnitFrames.Player.Runes[i]:SetValue( GetTime() - start )
						G.UnitFrames.Player.Runes[i].timer:SetFormattedText( "%01d", duration - ( GetTime() - start ) )
					end
				end

				local OnUpdate = CreateFrame( "Frame" )
				OnUpdate:SetScript( "OnUpdate", function( self, elapsed )
					total = total + elapsed
					if( total > .01 ) then
						for i = 1, 6 do
							UpdateRune( i )
						end
					end
					total = 0
				end )

				G.UnitFrames.Player.Statue:ClearAllPoints()
				G.UnitFrames.Player.Statue:Size( 233, 7 )
				G.UnitFrames.Player.Statue:Point( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 7 )
				G.UnitFrames.Player.Statue:CreateBackdrop( "Default" )
				G.UnitFrames.Player.Statue.bg:SetVertexColor( 0, 0, 0, 1 )
				G.UnitFrames.Player.Statue:SetStatusBarColor( 1, 0, 0 )
				G.UnitFrames.Player.Statue:SetStatusBarTexture( C["media"]["otravi"] )
			end
		end

		------------------------------
		-- monk
		------------------------------
		if( S.myclass == "MONK" ) then
			if( C["unitframes"]["classbar"] == true ) then
				G.UnitFrames.Player.HarmonyBar:ClearAllPoints()
				G.UnitFrames.Player.HarmonyBar:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 7 )
				G.UnitFrames.Player.HarmonyBar:Size( 233, 2 )
				G.UnitFrames.Player.HarmonyBar:CreateBackdrop( "Default" )
				G.UnitFrames.Player.HarmonyBar.backdrop:CreateShadow( "Default" )

				local maxChi = UnitPowerMax( "player", SPELL_POWER_LIGHT_FORCE )

				for i = 1, maxChi do
					if( maxChi == 4 ) then
						if( i == 4 or i == 3 ) then
							G.UnitFrames.Player.HarmonyBar[i]:Size( ( 233 / 4 ) - 1, 2 )
						else
							G.UnitFrames.Player.HarmonyBar[i]:Size( 233 / 4, 2 )
						end

						if( i == 1 ) then
							G.UnitFrames.Player.HarmonyBar[i]:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 7 )
						else
							G.UnitFrames.Player.HarmonyBar[i]:Point( "LEFT", G.UnitFrames.Player.HarmonyBar[i - 1], "RIGHT", 1, 0 )
						end
					elseif( maxChi == 5 ) then
						if( i == 5 ) then
							G.UnitFrames.Player.HarmonyBar[i]:Size( S.Scale( 232 / 5 ) - 1, 2 )
						else
							G.UnitFrames.Player.HarmonyBar[i]:Size( S.Scale( 232 / 5 ), 2 )
						end

						if( i == 1 ) then
							G.UnitFrames.Player.HarmonyBar[i]:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 7 )
						else
							G.UnitFrames.Player.HarmonyBar[i]:Point( "LEFT", G.UnitFrames.Player.HarmonyBar[i - 1], "RIGHT", 1, 0 )
						end
					end
				end

				G.UnitFrames.Player.Statue:ClearAllPoints()
				G.UnitFrames.Player.Statue:Size( 233, 7 )
				G.UnitFrames.Player.Statue:Point( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 7 )
				G.UnitFrames.Player.Statue:CreateBackdrop( "Default" )
				G.UnitFrames.Player.Statue.bg:SetVertexColor( 0, 0, 0, 1 )
				G.UnitFrames.Player.Statue:SetStatusBarColor( 1, 0, 0 )
				G.UnitFrames.Player.Statue:SetStatusBarTexture( C["media"]["otravi"] )
			end
		end

		------------------------------
		-- shaman
		------------------------------
		if( S.myclass == "SHAMAN" ) then
			if( C["unitframes"]["classbar"] == true ) then
				for i = 1, 4 do
					G.UnitFrames.Player.TotemBar[i]:ClearAllPoints()
					G.UnitFrames.Player.TotemBar[i]:Size( S.Scale( 232 / 4 ) - 5, 2 )

					if( i == 1 ) then
						G.UnitFrames.Player.TotemBar[i]:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 7 )
					else
						G.UnitFrames.Player.TotemBar[i]:Point( "LEFT", G.UnitFrames.Player.TotemBar[i - 1], "RIGHT", 7, 0 )
					end

					G.UnitFrames.Player.TotemBar[i]:CreateBackdrop( "Default" )
					G.UnitFrames.Player.TotemBar[i].backdrop:CreateShadow( "Default" )
				end
			end
		end

		------------------------------
		-- priest
		------------------------------
		if( S.myclass == "PRIEST" ) then
			if( C["unitframes"]["classbar"] == true ) then
				G.UnitFrames.Player.ShadowOrbsBar:ClearAllPoints()
				G.UnitFrames.Player.ShadowOrbsBar:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 7 )
				G.UnitFrames.Player.ShadowOrbsBar:Size( 233, 2 )
				G.UnitFrames.Player.ShadowOrbsBar:CreateBackdrop( "Default" )
				G.UnitFrames.Player.ShadowOrbsBar.backdrop:CreateShadow( "Default" )

				for i = 1, 3 do
					G.UnitFrames.Player.ShadowOrbsBar[i]:Size( S.Scale( 232 / 3 ), 2 )

					if( i == 1 ) then
						G.UnitFrames.Player.ShadowOrbsBar[i]:SetPoint( "LEFT", G.UnitFrames.Player.ShadowOrbsBar, "LEFT", 0, 0 )
					else
						G.UnitFrames.Player.ShadowOrbsBar[i]:Point( "LEFT", G.UnitFrames.Player.ShadowOrbsBar[i - 1], "RIGHT", 1, 0 )
					end
				end

				G.UnitFrames.Player.Statue:ClearAllPoints()
				G.UnitFrames.Player.Statue:Size( 233, 7 )
				G.UnitFrames.Player.Statue:Point( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 7 )
				G.UnitFrames.Player.Statue:CreateBackdrop( "Default" )
				G.UnitFrames.Player.Statue.bg:SetVertexColor( 0, 0, 0, 1 )
				G.UnitFrames.Player.Statue:SetStatusBarColor( 1, 0, 0 )
				G.UnitFrames.Player.Statue:SetStatusBarTexture( C["media"]["otravi"] )
			end
		end

		------------------------------
		-- mage
		------------------------------
		if( S.myclass == "MAGE" ) then
			if ( C["unitframes"]["mageclassbar"] == true ) then
				G.UnitFrames.Player.ArcaneChargeBar:ClearAllPoints()
				G.UnitFrames.Player.ArcaneChargeBar:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 7 )
				G.UnitFrames.Player.ArcaneChargeBar:Size( 233, 2 )
				G.UnitFrames.Player.ArcaneChargeBar:CreateBackdrop( "Default" )
				G.UnitFrames.Player.ArcaneChargeBar.backdrop:CreateShadow( "Default" )

				for i = 1, 6 do
					G.UnitFrames.Player.ArcaneChargeBar[i]:Size( S.Scale( 232 / 6 ) - 1 , 2 )
					if( i == 1 ) then
						G.UnitFrames.Player.ArcaneChargeBar[i]:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 7 )
					else
						G.UnitFrames.Player.ArcaneChargeBar[i]:Point( "LEFT", G.UnitFrames.Player.ArcaneChargeBar[i - 1], "RIGHT", 1, 0 )
					end
				end
			end
		end

		------------------------------
		-- warrior
		------------------------------
		if( S.myclass == "WARRIOR" ) then
			if( C["unitframes"]["classbar"] == true ) then
				G.UnitFrames.Player.Statue:ClearAllPoints()
				G.UnitFrames.Player.Statue:Size( 233, 7 )
				G.UnitFrames.Player.Statue:Point( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 7 )
				G.UnitFrames.Player.Statue:CreateBackdrop( "Default" )
				G.UnitFrames.Player.Statue.bg:SetVertexColor( 0, 0, 0, 1 )
				G.UnitFrames.Player.Statue:SetStatusBarColor( 1, 0, 0 )
				G.UnitFrames.Player.Statue:SetStatusBarTexture( C["media"]["otravi"] )
			end
		end
	end

	------------------------------
	-- castbar
	------------------------------
	do
		if( C["unitframes"]["unitcastbar"] == true ) then
			G.UnitFrames.Player.Castbar:ClearAllPoints()
			G.UnitFrames.Player.Castbar:Point( "TOPRIGHT", G.UnitFrames.Player, "BOTTOMRIGHT", 0, -5 )
			G.UnitFrames.Player.Castbar:CreateBackdrop( "Default" )
			G.UnitFrames.Player.Castbar:SetStatusBarTexture( C["media"]["otravi"] )
			G.UnitFrames.Player.Castbar.bg:SetVertexColor( 254, 0, 0, 1 )

			G.UnitFrames.Player.Castbar.PostCastStart = S.CheckCast
			G.UnitFrames.Player.Castbar.PostChannelStart = S.CheckChannel

			G.UnitFrames.Player.Castbar.Time = S.SetFontString( G.UnitFrames.Player.Castbar, unpack( S.FontTemplate.UnitframesDefault.BuildFont ) )
			G.UnitFrames.Player.Castbar.Time:Point( "RIGHT", G.UnitFrames.Player.Castbar, "RIGHT", -2, 1 )
			G.UnitFrames.Player.Castbar.Time:SetTextColor( 1, 1, 1 )
			G.UnitFrames.Player.Castbar.Time:SetShadowOffset( 0, 0 )

			G.UnitFrames.Player.Castbar.Text = S.SetFontString( G.UnitFrames.Player.Castbar, unpack( S.FontTemplate.UnitframesDefault.BuildFont ) )
			G.UnitFrames.Player.Castbar.Text:Point( "LEFT", G.UnitFrames.Player.Castbar, "LEFT", 2, 1 )
			G.UnitFrames.Player.Castbar.Text:SetTextColor( 1, 1, 1 )
			G.UnitFrames.Player.Castbar.Text:SetShadowOffset( 0, 0 )

			if( C["unitframes"]["cbicons"] == true ) then
				G.UnitFrames.Player.Castbar:Size( G.UnitFrames.Player:GetWidth() - 34, 12 )

				G.UnitFrames.Player.Castbar.button:ClearAllPoints()
				G.UnitFrames.Player.Castbar.button:SetPoint( "RIGHT", G.UnitFrames.Player.Castbar, "LEFT", -3, 0 )
				G.UnitFrames.Player.Castbar.button:Size( 16 )
				G.UnitFrames.Player.Castbar.button.shadow:Kill()
			else
				G.UnitFrames.Player.Castbar:Size( G.UnitFrames.Player:GetWidth() - 17, 12 )
			end

			if( C["unitframes"]["cblatency"] == true ) then
				G.UnitFrames.Player.Castbar.SafeZone:SetVertexColor( 1, 1, 1, 1 )
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
		G.UnitFrames.Player:Size( 233, 26 )
	end
end

------------------------------
-- Target
------------------------------
do
	------------------------------
	-- not needed
	------------------------------
	do
		G.UnitFrames.Target:SetBackdrop( nil )
		G.UnitFrames.Target:SetBackdropColor( 0, 0, 0 )
		G.UnitFrames.Target.shadow:Kill()
		G.UnitFrames.Target.panel:Kill()
	end

	------------------------------
	-- health
	------------------------------
	do
		G.UnitFrames.Target.Health:Size( 233, 19 )
		G.UnitFrames.Target.Health:SetFrameLevel( 5 )
		G.UnitFrames.Target.Health:CreateBackdrop( "Default" )
		G.UnitFrames.Target.Health:SetStatusBarTexture( C["media"]["otravi"] )

		if( C["unitframes"]["unicolor"] == true ) then
			G.UnitFrames.Target.Health:SetStatusBarColor( 0.08, 0.08, 0.08, 1 )
			G.UnitFrames.Target.Health.bg:SetVertexColor( 1, 0, 0, 1 )
			G.UnitFrames.Target.Health.bg:SetTexture( 254, 0, 0, 0.5 )
		end

		G.UnitFrames.Target.Name:SetFont( unpack( S.FontTemplate.UnitframesName.BuildFont ) )
		G.UnitFrames.Target.Name:SetShadowOffset( 0, 0 )

		G.UnitFrames.Target.Health.value = S.SetFontString( G.UnitFrames.Target.Health, unpack( S.FontTemplate.UnitframesHealth.BuildFont ) )
		G.UnitFrames.Target.Health.value:Point( "RIGHT", G.UnitFrames.Target.Health, "RIGHT", -4, 1 )
		G.UnitFrames.Target.Health.value:SetShadowOffset( 0, 0 )

		G.UnitFrames.Target.Health.PostUpdate = S.PostUpdateHealth

		G.UnitFrames.Target:Tag( G.UnitFrames.Target.Name, "[Tukui:nameshort] [Tukui:diffcolor][level] [shortclassification]" )
		G.UnitFrames.Target.Name:SetTextColor( 254, 0, 0, 1 )
	end

	------------------------------
	-- power
	------------------------------
	do
		G.UnitFrames.Target.Power:Size( 233, 2 )
		G.UnitFrames.Target.Power:ClearAllPoints()
		G.UnitFrames.Target.Power:Point( "TOPRIGHT", G.UnitFrames.Target.Health, "BOTTOMRIGHT", 0, -5 )
		G.UnitFrames.Target.Power:SetFrameLevel( G.UnitFrames.Target.Health:GetFrameLevel() + 2 )
		G.UnitFrames.Target.Power:CreateBackdrop( "Default" )
		G.UnitFrames.Target.Power:SetStatusBarTexture( C["media"]["otravi"] )

		G.UnitFrames.Target.Power.colorClass = false
		G.UnitFrames.Target.Power.bg:SetVertexColor( 0, 0, 0, 1 )

		G.UnitFrames.Target.Power.PreUpdate = S.PreUpdatePower
		G.UnitFrames.Target.Power.PostUpdate = S.PostUpdatePower

		G.UnitFrames.Target.Power.value = S.SetFontString( G.UnitFrames.Target.Health, unpack( S.FontTemplate.UnitframesPower.BuildFont ) )
		G.UnitFrames.Target.Power.value:Point( "LEFT", G.UnitFrames.Target.Health, "LEFT", 2, 1 )
		G.UnitFrames.Target.Power.value:SetShadowOffset( 0, 0 )
	end

	------------------------------
	-- portraits
	------------------------------
	do
		if( C["unitframes"]["charportrait"] == true ) then
			G.UnitFrames.Target.Portrait:ClearAllPoints()
			G.UnitFrames.Target.Portrait:SetAllPoints( G.UnitFrames.Target.Health )
			G.UnitFrames.Target.Portrait:SetAlpha( 0.2 )
			G.UnitFrames.Target.Portrait.SetAlpha = S.dummy
			G.UnitFrames.Target.Portrait:SetFrameLevel( G.UnitFrames.Target.Health:GetFrameLevel() )
			G.UnitFrames.Target.Portrait.SetFrameLevel = S.dummy

			G.UnitFrames.Target.Health:ClearAllPoints()
			G.UnitFrames.Target.Health:SetPoint( "TOPLEFT", 0, 0 )
			G.UnitFrames.Target.Health:SetPoint( "TOPRIGHT" )
		end
	end

	------------------------------
	-- combat feedback
	------------------------------
	do
		if( C["unitframes"]["combatfeedback"] == true ) then
			G.UnitFrames.Target.CombatFeedbackText:SetFont( unpack( S.FontTemplate.UnitframesDefault.BuildFont ) )
		end
	end

	------------------------------
	-- castbar
	------------------------------
	do
		if( C["unitframes"]["unitcastbar"] == true ) then
			G.UnitFrames.Target.Castbar:ClearAllPoints()
			G.UnitFrames.Target.Castbar:Point( "TOPLEFT", G.UnitFrames.Target, "BOTTOMLEFT", 0, -5 )
			G.UnitFrames.Target.Castbar:CreateBackdrop( "Default" )
			G.UnitFrames.Target.Castbar:SetStatusBarTexture( C["media"]["otravi"] )
			G.UnitFrames.Target.Castbar.bg:SetVertexColor( 254, 0, 0, 1 )

			G.UnitFrames.Target.Castbar.PostCastStart = S.CheckCast
			G.UnitFrames.Target.Castbar.PostChannelStart = S.CheckChannel

			if( C["unitframes"]["cbicons"] == true ) then
				G.UnitFrames.Target.Castbar:Size( G.UnitFrames.Target:GetWidth() - 34, 12 )

				G.UnitFrames.Target.Castbar.button:ClearAllPoints()
				G.UnitFrames.Target.Castbar.button:SetPoint( "LEFT", G.UnitFrames.Target.Castbar, "RIGHT", 3, 0 )
				G.UnitFrames.Target.Castbar.button:Size( 16 )
				G.UnitFrames.Target.Castbar.button.shadow:Kill()
			else
				G.UnitFrames.Target.Castbar:Size( G.UnitFrames.Target:GetWidth() - 17, 12 )
			end

			G.UnitFrames.Target.Castbar.Time = S.SetFontString( G.UnitFrames.Target.Castbar, unpack( S.FontTemplate.UnitframesDefault.BuildFont ) )
			G.UnitFrames.Target.Castbar.Time:Point( "RIGHT", G.UnitFrames.Target.Castbar, "RIGHT", -2, 1 )
			G.UnitFrames.Target.Castbar.Time:SetTextColor( 1, 1, 1 )
			G.UnitFrames.Target.Castbar.Time:SetShadowOffset( 0, 0 )

			G.UnitFrames.Target.Castbar.Text = S.SetFontString( G.UnitFrames.Target.Castbar, unpack( S.FontTemplate.UnitframesDefault.BuildFont ) )
			G.UnitFrames.Target.Castbar.Text:Point( "LEFT", G.UnitFrames.Target.Castbar, "LEFT", 2, 1 )
			G.UnitFrames.Target.Castbar.Text:SetTextColor( 1, 1, 1 )
			G.UnitFrames.Target.Castbar.Text:SetShadowOffset( 0, 0 )
		end
	end

	------------------------------
	-- buffs, debuffs
	------------------------------
	do
		if( C["unitframes"]["targetauras"] == true ) then
			G.UnitFrames.Target.Debuffs:SetHeight( 27 )
			G.UnitFrames.Target.Debuffs:SetWidth( 230 )
			G.UnitFrames.Target.Debuffs.size = 27
			G.UnitFrames.Target.Debuffs.num = 8
			G.UnitFrames.Target.Debuffs.spacing = 3

			G.UnitFrames.Target.Buffs:SetHeight( 27 )
			G.UnitFrames.Target.Buffs:SetWidth( 230 )
			G.UnitFrames.Target.Buffs.size = 27
			G.UnitFrames.Target.Buffs.num = 8
			G.UnitFrames.Target.Buffs.spacing = 3

			G.UnitFrames.Target.Buffs:ClearAllPoints()
			G.UnitFrames.Target.Buffs:Point( "BOTTOMLEFT", G.UnitFrames.Target, "TOPLEFT", -2, 5 )
			G.UnitFrames.Target.Buffs.ClearAllPoints = S.dummy
			G.UnitFrames.Target.Buffs.SetPoint = S.dummy

			G.UnitFrames.Target.Debuffs:ClearAllPoints()
			G.UnitFrames.Target.Debuffs:Point( "BOTTOMRIGHT", G.UnitFrames.Target.Buffs, "TOPRIGHT", 7, 3 )
			G.UnitFrames.Target.Debuffs.ClearAllPoints = S.dummy
			G.UnitFrames.Target.Debuffs.SetPoint = S.dummy

			if( G.UnitFrames.Target.Buffs or G.UnitFrames.Target.Debuffs ) then
				for _, frames in pairs( { G.UnitFrames.Target.Buffs, G.UnitFrames.Target.Debuffs } ) do
					if( not frames ) then return end

					frames:Size( 230, 27 )
					frames.size = 27
					frames.num = 8

					hooksecurefunc( frames, "PostCreateIcon", S.SkinAura )
				end
			end

			G.UnitFrames.Target.Buffs.PostCreateIcon = S.PostCreateAura
			G.UnitFrames.Target.Buffs.PostUpdateIcon = S.PostUpdateAura
			G.UnitFrames.Target.Debuffs.PostCreateIcon = S.PostCreateAura
			G.UnitFrames.Target.Debuffs.PostUpdateIcon = S.PostUpdateAura
		end
	end

	------------------------------
	-- fader
	------------------------------
	do
		if( C["unitframes"]["fader"] == true ) then
			G.UnitFrames.Target.FadeCasting = true
			G.UnitFrames.Target.FadeCombat = true
			G.UnitFrames.Target.FadeTarget = true
			G.UnitFrames.Target.FadeHealth = true
			G.UnitFrames.Target.FadePower = true
			G.UnitFrames.Target.FadeHover = true

			G.UnitFrames.Target.FadeSmooth = 0.5
			G.UnitFrames.Target.FadeMinAlpha = 0.3
			G.UnitFrames.Target.FadeMaxAlpha = 1

			G.UnitFrames.Target:EnableElement( "Fader" )
		end
	end

	------------------------------
	-- size
	------------------------------
	do
		G.UnitFrames.Target:Size( 233, 26 )
	end
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

	G.UnitFrames.Player:SetPoint( "TOPRIGHT", VethekUnitframesClassbarBackground, "TOPLEFT", -5, -2 )
	G.UnitFrames.Target:SetPoint( "TOPLEFT", VethekUnitframesClassbarBackground, "TOPRIGHT", 5, -2 )
	G.UnitFrames.TargetTarget:SetPoint( "TOPRIGHT", G.UnitFrames.Target, "BOTTOMRIGHT", 0, -49 )
	G.UnitFrames.Pet:SetPoint( "TOPLEFT", G.UnitFrames.Player, "BOTTOMLEFT", 0, -49 )
	G.UnitFrames.Focus:SetPoint( "TOP", UIParent, "BOTTOM", -450, 600 )
	G.UnitFrames.FocusTarget:SetPoint( "TOP", G.UnitFrames.Focus, "BOTTOM", 0 , -43 )

	if( C["unitframes"]["showboss"] == true ) then
		for i = 1, MAX_BOSS_FRAMES do
			G.UnitFrames["Boss" .. i]:ClearAllPoints()
			if( i == 1 ) then
				G.UnitFrames["Boss" .. i]:SetPoint( "TOP", UIParent, "BOTTOM", 450, 600 )
			else
				G.UnitFrames["Boss" .. i]:SetPoint( "TOP", G.UnitFrames["Boss" .. i - 1], "BOTTOM", 0, -43 )
			end
		end
	end

	if( C["unitframes"]["arena"] == true ) then
		for i = 1, 5 do
			G.UnitFrames["Arena" .. i]:ClearAllPoints()
			if( i == 1 ) then
				G.UnitFrames["Arena" .. i]:SetPoint( "TOP", UIParent, "BOTTOM", 450, 600 )
			else
				G.UnitFrames["Arena" .. i]:SetPoint( "TOP", G.UnitFrames["Arena" .. i - 1], "BOTTOM", 0, -43 )
			end
		end
	end
end )