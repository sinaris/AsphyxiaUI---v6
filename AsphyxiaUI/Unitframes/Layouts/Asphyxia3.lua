---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["unitframes"]["enable"] ~= true ) then return end

if( C["global"]["unitframelayout"] ~= "asphyxia3" ) then return end

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
		G.UnitFrames.Player.Health:Size( 233, 26 )
		G.UnitFrames.Player.Health:SetFrameLevel( 5 )
		G.UnitFrames.Player.Health:CreateBackdrop( "Default" )
		G.UnitFrames.Player.Health.backdrop:CreateShadow( "Default" )
		G.UnitFrames.Player.Health.bg:SetVertexColor( 0.6, 0.6, 0.6 )

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

		G.UnitFrames.Player.Health.value = S.SetFontString( G.UnitFrames.Player.Health, unpack( S.FontTemplate.UFFontString.BuildFont ) )
		G.UnitFrames.Player.Health.value:Point( "RIGHT", G.UnitFrames.Player.Health, "RIGHT", -4, 1 )

		G.UnitFrames.Player.Health.PostUpdate = S.PostUpdateHealth
	end

	------------------------------
	-- power
	------------------------------
	do
		G.UnitFrames.Player.Power:Size( 180, 47 )
		G.UnitFrames.Player.Power:ClearAllPoints()
		G.UnitFrames.Player.Power:Point( "TOPRIGHT", G.UnitFrames.Player.Health, "TOPRIGHT", 15, 0 )
		G.UnitFrames.Player.Power:CreateBackdrop( "Default" )
		G.UnitFrames.Player.Power.backdrop:CreateShadow( "Default" )

		G.UnitFrames.Player.Power.value = S.SetFontString( G.UnitFrames.Player.Health, unpack( S.FontTemplate.UFFontString.BuildFont ) )
		G.UnitFrames.Player.Power.value:Point( "LEFT", G.UnitFrames.Player.Health, "LEFT", 4, 1 )
	end

	------------------------------
	-- portraits
	------------------------------
	do
		if( C["unitframes"]["charportrait"] == true ) then
			local PlayerPortrait = CreateFrame( "Frame", nil, G.UnitFrames.Player )
			PlayerPortrait:Size( 65, 18 )
			PlayerPortrait:SetPoint( "TOPLEFT", G.UnitFrames.Player.Health, "BOTTOMLEFT", -2, -5 )
			PlayerPortrait:SetTemplate( "Default" )
			PlayerPortrait:CreateShadow( "Default" )

			G.UnitFrames.Player.Portrait:SetAlpha( 1 )
			G.UnitFrames.Player.Portrait.SetAlpha = S.dummy
			G.UnitFrames.Player.Portrait:ClearAllPoints()
			G.UnitFrames.Player.Portrait:Point( "TOPLEFT", PlayerPortrait, "TOPLEFT", 2, -2 )
			G.UnitFrames.Player.Portrait:Point( "BOTTOMRIGHT", PlayerPortrait, "BOTTOMRIGHT", -3, 3 )

			G.UnitFrames.Player.Health:ClearAllPoints()
			G.UnitFrames.Player.Health:SetPoint( "TOPLEFT", 0, 0 )
			G.UnitFrames.Player.Health:SetPoint( "TOPRIGHT" )
		end
	end

	------------------------------
	-- classicons
	------------------------------
	do
		if( C["unitframes"]["classicons"] == true ) then
			local classicon = CreateFrame( "Frame", G.UnitFrames.Player:GetName() .. "_ClassIconBorder", G.UnitFrames.Player )
			classicon:Size( 30 )
			classicon:Point( "TOPRIGHT", G.UnitFrames.Player.Health, "TOPLEFT", -5, 2 )
			classicon:SetTemplate( "Default" )
			classicon:CreateShadow( "Default" )

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
		G.UnitFrames.Player.FlashInfo.ManaLevel:SetFont( unpack( S.FontTemplate.UFFontString.BuildFont ) )
		
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

			G.UnitFrames.Player.Experience:Size( G.Panels.LeftChatBackground:GetWidth() - 4, 2 )
			G.UnitFrames.Player.Experience:Point( "BOTTOM", G.Panels.LeftChatBackground, "TOP", 0, 5 )
			G.UnitFrames.Player.Experience:SetFrameLevel( 12 )
			G.UnitFrames.Player.Experience:SetAlpha( 1 )
			G.UnitFrames.Player.Experience:CreateBackdrop( "Default" )
			G.UnitFrames.Player.Experience.backdrop:CreateShadow( "Default" )

			G.UnitFrames.Player.Experience:HookScript( "OnLeave", function( self ) self:SetAlpha( 1 ) end )

			G.UnitFrames.Player.Experience.Text = G.UnitFrames.Player.Experience:CreateFontString( nil, "OVERLAY" )
			G.UnitFrames.Player.Experience.Text:SetFont( unpack( S.FontTemplate.UFFontString.BuildFont ) )
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

			G.UnitFrames.Player.Reputation:Size( G.Panels.LeftChatBackground:GetWidth() - 4, 2 )
			G.UnitFrames.Player.Reputation:Point( "BOTTOM", G.Panels.LeftChatBackground, "TOP", 0, 5 )
			G.UnitFrames.Player.Reputation:SetFrameLevel( 10 )
			G.UnitFrames.Player.Reputation:SetAlpha( 1 )
			G.UnitFrames.Player.Reputation:CreateBackdrop( "Default" )
			G.UnitFrames.Player.Reputation.backdrop:CreateShadow( "Default" )

			G.UnitFrames.Player.Reputation:HookScript( "OnLeave", function( self ) self:SetAlpha( 1 ) end )

			G.UnitFrames.Player.Reputation.Text = G.UnitFrames.Player.Reputation:CreateFontString( nil, "OVERLAY" )
			G.UnitFrames.Player.Reputation.Text:SetFont( unpack( S.FontTemplate.UFFontString.BuildFont ) )
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
			G.UnitFrames.Player.CombatFeedbackText:SetFont( unpack( S.FontTemplate.UFFontString.BuildFont ) )
		end
	end

	------------------------------
	-- druidmana
	------------------------------
	do
		if( S.myclass == "DRUID" ) then
			G.UnitFrames.Player.DruidManaText:SetFont( unpack( S.FontTemplate.UFFontString.BuildFont ) )
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
				G.UnitFrames.Player.DruidManaBackground:Size( 233, 2 )
				G.UnitFrames.Player.DruidManaBackground:CreateBackdrop( "Default" )
				G.UnitFrames.Player.DruidManaBackground.backdrop:CreateShadow( "Default" )

				G.UnitFrames.Player.DruidMana:SetSize( G.UnitFrames.Player.DruidManaBackground:GetWidth(), G.UnitFrames.Player.DruidManaBackground:GetHeight() )
			end

			if( C["unitframes"]["classbar"] == true ) then
				G.UnitFrames.Player.EclipseBar:ClearAllPoints()
				G.UnitFrames.Player.EclipseBar:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 7 )
				G.UnitFrames.Player.EclipseBar:Size( 233, 2 )
				G.UnitFrames.Player.EclipseBar:CreateBackdrop( "Default" )
				G.UnitFrames.Player.EclipseBar.backdrop:CreateShadow( "Default" )

				G.UnitFrames.Player.EclipseBar.LunarBar:SetSize( G.UnitFrames.Player.EclipseBar:GetWidth(), G.UnitFrames.Player.EclipseBar:GetHeight() )
				G.UnitFrames.Player.EclipseBar.SolarBar:SetSize( G.UnitFrames.Player.EclipseBar:GetWidth(), G.UnitFrames.Player.EclipseBar:GetHeight() )

				G.UnitFrames.Player.EclipseBar.Text:ClearAllPoints()
				G.UnitFrames.Player.EclipseBar.Text:SetPoint( "TOP", G.UnitFrames.Player.EclipseBar, 0, 25 )
				G.UnitFrames.Player.EclipseBar.Text:SetFont( unpack( S.FontTemplate.UFFontString.BuildFont ) )
				G.UnitFrames.Player.EclipseBar.Text:SetShadowOffset( S.mult, -S.mult )
			end

			if( C["unitframes"]["druidmushroombar"] == true ) then
				G.UnitFrames.Player.WildMushroom:ClearAllPoints()
				G.UnitFrames.Player.WildMushroom:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 16 )
				G.UnitFrames.Player.WildMushroom:Size( 233, 2 )
				G.UnitFrames.Player.WildMushroom:CreateBackdrop( "Default" )
				G.UnitFrames.Player.WildMushroom.backdrop:CreateShadow( "Default" )

				for i = 1, 3 do
					G.UnitFrames.Player.WildMushroom[i]:Size( S.Scale( 232 / 3 ), 2 )

					if( i == 1 ) then
						G.UnitFrames.Player.WildMushroom[i]:SetPoint( "LEFT", G.UnitFrames.Player.WildMushroom, "LEFT", 0, 0 )
					else
						G.UnitFrames.Player.WildMushroom[i]:Point( "LEFT", G.UnitFrames.Player.WildMushroom[i - 1], "RIGHT", 1, 0 )
					end
				end
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
				end
			end
		end

		------------------------------
		-- rogue
		------------------------------
		if( S.myclass == "ROGUE" ) then
			if( C["unitframes"]["classbar"] == true ) then
				G.UnitFrames.Player.ComboPointsBar:ClearAllPoints()
				G.UnitFrames.Player.ComboPointsBar:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 7 )
				G.UnitFrames.Player.ComboPointsBar:Size( 233, 2 )
				G.UnitFrames.Player.ComboPointsBar:CreateBackdrop( "Default" )
				G.UnitFrames.Player.ComboPointsBar.backdrop:CreateShadow( "Default" )

				for i = 1, 5 do
					if( i == 5 ) then
						G.UnitFrames.Player.ComboPointsBar[i]:Size( S.Scale( 232 / 5 ) - 1, 2 )
					else
						G.UnitFrames.Player.ComboPointsBar[i]:Size( S.Scale( 232 / 5 ), 2 )
					end

					if( i == 1 ) then
						G.UnitFrames.Player.ComboPointsBar[i]:SetPoint( "LEFT", G.UnitFrames.Player.ComboPointsBar, "LEFT", 0, 0 )
					else
						G.UnitFrames.Player.ComboPointsBar[i]:Point( "LEFT", G.UnitFrames.Player.ComboPointsBar[i - 1], "RIGHT", 1, 0 )
					end
				end
			end
		end

		------------------------------
		-- deathknight
		------------------------------
		if( S.myclass == "DEATHKNIGHT" ) then
			if( C["unitframes"]["classbar"] == true ) then
				G.UnitFrames.Player.Runes:ClearAllPoints()
				G.UnitFrames.Player.Runes:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 7 )
				G.UnitFrames.Player.Runes:Size( 233, 2 )
				G.UnitFrames.Player.Runes:CreateBackdrop( "Default" )
				G.UnitFrames.Player.Runes.backdrop:CreateShadow( "Default" )

				for i = 1, 6 do
					G.UnitFrames.Player.Runes[i]:Size( S.Scale( 232 / 6 ) - 1 , 2 )
					if( i == 1 ) then
						G.UnitFrames.Player.Runes[i]:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 7 )
					else
						G.UnitFrames.Player.Runes[i]:Point( "LEFT", G.UnitFrames.Player.Runes[i - 1], "RIGHT", 1, 0 )
					end
				end
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
	end

	------------------------------
	-- castbar
	------------------------------
	do
		if( C["unitframes"]["unitcastbar"] == true ) then
			local AsphyxiaUIUnitframesPlayerCastbarMover = CreateFrame( "Frame", "AsphyxiaUIUnitframesPlayerCastbarMover", UIParent )
			AsphyxiaUIUnitframesPlayerCastbarMover:Size( 378, 22 )
			AsphyxiaUIUnitframesPlayerCastbarMover:SetPoint( "BOTTOM", G.ActionBars.Bar1, "TOP", 0, 3 )
			AsphyxiaUIUnitframesPlayerCastbarMover:SetTemplate( "Default" )
			AsphyxiaUIUnitframesPlayerCastbarMover:SetBackdropBorderColor( 1, 0, 0 )
			AsphyxiaUIUnitframesPlayerCastbarMover:SetClampedToScreen( true )
			AsphyxiaUIUnitframesPlayerCastbarMover:SetMovable( true )
			AsphyxiaUIUnitframesPlayerCastbarMover:SetFrameStrata( "HIGH" )
			AsphyxiaUIUnitframesPlayerCastbarMover:Hide()
			AsphyxiaUIUnitframesPlayerCastbarMover:FontString( "Text", unpack( S.FontTemplate.UFFontString.BuildFont ) )
			AsphyxiaUIUnitframesPlayerCastbarMover.Text:SetPoint( "CENTER", AsphyxiaUIUnitframesPlayerCastbarMover, "CENTER", 0, 0 )
			AsphyxiaUIUnitframesPlayerCastbarMover.Text:SetText( "Move Player Castbar" )
			tinsert( S.AllowFrameMoving, AsphyxiaUIUnitframesPlayerCastbarMover )

			G.UnitFrames.Player.Castbar:ClearAllPoints()
			G.UnitFrames.Player.Castbar:SetHeight( S.Scale( 20 ) )
			G.UnitFrames.Player.Castbar:Point( "BOTTOMRIGHT", AsphyxiaUIUnitframesPlayerCastbarMover, "BOTTOMRIGHT", -2, 2 )
			G.UnitFrames.Player.Castbar:CreateBackdrop( "Default" )
			G.UnitFrames.Player.Castbar.backdrop:CreateShadow( "Default" )
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

			G.UnitFrames.Player.Castbar.Time = S.SetFontString( G.UnitFrames.Player.Castbar, unpack( S.FontTemplate.UFFontString.BuildFont ) )
			G.UnitFrames.Player.Castbar.Time:Point( "RIGHT", G.UnitFrames.Player.Castbar, "RIGHT", -4, 1 )
			G.UnitFrames.Player.Castbar.Time:SetTextColor( 0, 4, 0 )

			G.UnitFrames.Player.Castbar.Text = S.SetFontString( G.UnitFrames.Player.Castbar, unpack( S.FontTemplate.UFFontString.BuildFont ) )
			G.UnitFrames.Player.Castbar.Text:Point( "LEFT", G.UnitFrames.Player.Castbar, "LEFT", 4, 1 )
			G.UnitFrames.Player.Castbar.Text:SetTextColor( 0.3, 0.2, 1 )

			if( C["unitframes"]["cblatency"] == true ) then
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
		G.UnitFrames.Target.Health:Size( 233, 26 )
		G.UnitFrames.Target.Health:SetFrameLevel( 5 )
		G.UnitFrames.Target.Health:CreateBackdrop( "Default" )
		G.UnitFrames.Target.Health.backdrop:CreateShadow( "Default" )
		G.UnitFrames.Target.Health.bg:SetVertexColor( 0.6, 0.6, 0.6 )

		if( C["unitframes"]["unicolor"] == true ) then
			G.UnitFrames.Target.Health.colorTapping = false
			G.UnitFrames.Target.Health.colorDisconnected = false
			G.UnitFrames.Target.Health.colorClass = false
			G.UnitFrames.Target.Health:SetStatusBarColor( 0.125, 0.125, 0.125, 1 )
			G.UnitFrames.Target.Health.bg:SetVertexColor( 0, 0, 0, 1 )
		else
			G.UnitFrames.Target.Health.colorDisconnected = true
			G.UnitFrames.Target.Health.colorTapping = true
			G.UnitFrames.Target.Health.colorClass = true
			G.UnitFrames.Target.Health.colorReaction = true
		end

		G.UnitFrames.Target.Name:SetFont( unpack( S.FontTemplate.UFFontString.BuildFont ) )
		G.UnitFrames.Target.Name:SetShadowOffset( 1.25, -1.25 )

		G.UnitFrames.Target.Health.value = S.SetFontString( G.UnitFrames.Target.Health, unpack( S.FontTemplate.UFFontString.BuildFont ) )
		G.UnitFrames.Target.Health.value:Point( "RIGHT", G.UnitFrames.Target.Health, "RIGHT", -4, 1 )

		G.UnitFrames.Target.Health.PostUpdate = S.PostUpdateHealth
	end

	------------------------------
	-- power
	------------------------------
	do
		G.UnitFrames.Target.Power:Size( 180, 47 )
		G.UnitFrames.Target.Power:ClearAllPoints()
		G.UnitFrames.Target.Power:Point( "TOPLEFT", G.UnitFrames.Target.Health, "TOPLEFT", -15, 0 )
		G.UnitFrames.Target.Power:CreateBackdrop( "Default" )
		G.UnitFrames.Target.Power.backdrop:CreateShadow( "Default" )

		G.UnitFrames.Target.Power.value = S.SetFontString( G.UnitFrames.Target.Health, unpack( S.FontTemplate.UFFontString.BuildFont ) )
		G.UnitFrames.Target.Power.value:Point( "LEFT", G.UnitFrames.Player.Health, "LEFT", 4, 1 )

		if( C["unitframes"]["unicolor"] == true ) then
			G.UnitFrames.Target.Power.colorTapping = true
			G.UnitFrames.Target.Power.colorClass = true
			G.UnitFrames.Target.Power.bg.multiplier = 0.1
		else
			G.UnitFrames.Target.Power.colorPower = true
		end
	end

	------------------------------
	-- portraits
	------------------------------
	do
		if( C["unitframes"]["charportrait"] == true ) then
			local TargetPortrait = CreateFrame( "Frame", nil, G.UnitFrames.Target )
			TargetPortrait:Size( 65, 18 )
			TargetPortrait:SetPoint( "TOPRIGHT", G.UnitFrames.Target.Health, "BOTTOMRIGHT", 2, -5 )
			TargetPortrait:SetTemplate( "Default" )
			TargetPortrait:CreateShadow( "Default" )

			G.UnitFrames.Target.Portrait:SetAlpha( 1 )
			G.UnitFrames.Target.Portrait.SetAlpha = S.dummy
			G.UnitFrames.Target.Portrait:ClearAllPoints()
			G.UnitFrames.Target.Portrait:Point( "TOPLEFT", TargetPortrait, "TOPLEFT", 2, -2 )
			G.UnitFrames.Target.Portrait:Point( "BOTTOMRIGHT", TargetPortrait, "BOTTOMRIGHT", -3, 3 )

			G.UnitFrames.Target.Health:ClearAllPoints()
			G.UnitFrames.Target.Health:SetPoint( "TOPLEFT", 0, 0 )
			G.UnitFrames.Target.Health:SetPoint( "TOPRIGHT" )
		end
	end

	------------------------------
	-- classicons
	------------------------------
	do
		if( C["unitframes"]["classicons"] == true ) then
			local classicon = CreateFrame( "Frame", G.UnitFrames.Target:GetName() .. "_ClassIconBorder", G.UnitFrames.Target )
			classicon:Size( 30 )
			classicon:Point( "TOPLEFT", G.UnitFrames.Target.Health, "TOPRIGHT", 5, 2 )
			classicon:SetTemplate( "Default" )
			classicon:CreateShadow( "Default" )

			local class = classicon:CreateTexture( G.UnitFrames.Target:GetName() .. "_ClassIcon", "ARTWORK" )
			class:Point( "TOPLEFT", 2, -2 )
			class:Point( "BOTTOMRIGHT", -2, 2 )
			G.UnitFrames.Target.ClassIcon = class

			G.UnitFrames.Target:EnableElement( "ClassIcon" )
		end
	end

	------------------------------
	-- combat feedback
	------------------------------
	do
		if( C["unitframes"]["combatfeedback"] == true ) then
			G.UnitFrames.Target.CombatFeedbackText:SetFont( unpack( S.FontTemplate.UFFontString.BuildFont ) )
		end
	end

	------------------------------
	-- castbar
	------------------------------
	do
		if( C["unitframes"]["unitcastbar"] == true ) then
			G.UnitFrames.Target.Castbar:ClearAllPoints()
			G.UnitFrames.Target.Castbar:SetHeight( 20 )
			G.UnitFrames.Target.Castbar:Point( "TOPRIGHT", G.UnitFrames.Target, "BOTTOMRIGHT", 0, -28 )
			G.UnitFrames.Target.Castbar:CreateBackdrop( "Default" )
			G.UnitFrames.Target.Castbar.backdrop:CreateShadow( "Default" )
			G.UnitFrames.Target.Castbar.bg:SetVertexColor( 0.05, 0.05, 0.05 )

			if( C["unitframes"]["cbicons"] == true ) then
				G.UnitFrames.Target.Castbar:Width( 206 )

				G.UnitFrames.Target.Castbar.button:ClearAllPoints()
				G.UnitFrames.Target.Castbar.button:SetPoint( "RIGHT", G.UnitFrames.Target.Castbar, "LEFT", -5, 0 )
				G.UnitFrames.Target.Castbar.button:Size( 24 )
			else
				G.UnitFrames.Target.Castbar:Width( 233 )
			end

			G.UnitFrames.Target.Castbar.PostCastStart = S.PostCastStart
			G.UnitFrames.Target.Castbar.PostChannelStart = S.PostCastStart

			G.UnitFrames.Target.Castbar.Time = S.SetFontString( G.UnitFrames.Target.Castbar, unpack( S.FontTemplate.UFFontString.BuildFont ) )
			G.UnitFrames.Target.Castbar.Time:Point( "RIGHT", G.UnitFrames.Target.Castbar, "RIGHT", -4, 1 )
			G.UnitFrames.Target.Castbar.Time:SetTextColor( 0, 4, 0 )

			G.UnitFrames.Target.Castbar.Text = S.SetFontString( G.UnitFrames.Target.Castbar, unpack( S.FontTemplate.UFFontString.BuildFont ) )
			G.UnitFrames.Target.Castbar.Text:Point( "LEFT", G.UnitFrames.Target.Castbar, "LEFT", 4, 1 )
			G.UnitFrames.Target.Castbar.Text:SetTextColor( 0.3, 0.2, 1 )
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
-- Target of Target
------------------------------
do
	------------------------------
	-- not needed
	------------------------------
	do
		G.UnitFrames.TargetTarget:SetBackdrop( nil )
		G.UnitFrames.TargetTarget:SetBackdropColor( 0, 0, 0 )
		G.UnitFrames.TargetTarget.shadow:Kill()
		G.UnitFrames.TargetTarget.panel:Kill()
	end

	------------------------------
	-- health
	------------------------------
	do
		G.UnitFrames.TargetTarget.Health:Size( 130, 15 )
		G.UnitFrames.TargetTarget.Health:SetFrameLevel( 5 )
		G.UnitFrames.TargetTarget.Health:CreateBackdrop( "Default" )
		G.UnitFrames.TargetTarget.Health.backdrop:CreateShadow( "Default" )
		G.UnitFrames.TargetTarget.Health.bg:SetVertexColor( 0.6, 0.6, 0.6 )

		if( C["unitframes"]["unicolor"] == true ) then
			G.UnitFrames.TargetTarget.Health.colorTapping = false
			G.UnitFrames.TargetTarget.Health.colorDisconnected = false
			G.UnitFrames.TargetTarget.Health.colorClass = false
			G.UnitFrames.TargetTarget.Health:SetStatusBarColor( 0.125, 0.125, 0.125, 1 )
			G.UnitFrames.TargetTarget.Health.bg:SetVertexColor( 0, 0, 0, 1 )
		else
			G.UnitFrames.TargetTarget.Health.colorDisconnected = true
			G.UnitFrames.TargetTarget.Health.colorTapping = true
			G.UnitFrames.TargetTarget.Health.colorClass = true
			G.UnitFrames.TargetTarget.Health.colorReaction = true
		end

		G.UnitFrames.TargetTarget.Name:SetFont( unpack( S.FontTemplate.UFFontString.BuildFont ) )
		G.UnitFrames.TargetTarget.Name:SetShadowOffset( 1.25, -1.25 )
	end

	------------------------------
	-- power
	------------------------------
	do
		local TargetTargetPower = CreateFrame( "StatusBar", nil, G.UnitFrames.TargetTarget )
		TargetTargetPower:Size( 130, 2 )
		TargetTargetPower:Point( "TOP", G.UnitFrames.TargetTarget.Health, "BOTTOM", 0, -7 )
		TargetTargetPower:SetStatusBarTexture( C["media"]["normTex"] )
		TargetTargetPower:CreateBackdrop( "Default" )
		TargetTargetPower.backdrop:CreateShadow( "Default" )

		local TargetTargetPowerBackground = TargetTargetPower:CreateTexture( nil, "BORDER" )
		TargetTargetPowerBackground:SetAllPoints( TargetTargetPower )
		TargetTargetPowerBackground:SetTexture( C["media"]["normTex"] )
		TargetTargetPowerBackground.multiplier = 0.1

		TargetTargetPower.frequentUpdates = true
		TargetTargetPower.colorDisconnected = true

		if( C["unitframes"]["showsmooth"] == true ) then
			TargetTargetPower.Smooth = true
		end

		if( C["unitframes"]["unicolor"] == true ) then
			TargetTargetPower.colorTapping = true
			TargetTargetPower.colorClass = true
			TargetTargetPower.colorReaction = true
			TargetTargetPowerBackground.multiplier = 0.1
		else
			TargetTargetPower.colorPower = true
		end

		G.UnitFrames.TargetTarget.Power = TargetTargetPower
		G.UnitFrames.TargetTarget.Power.bg = TargetTargetPowerBackground

		G.UnitFrames.TargetTarget:EnableElement( "Power" )
	end

	------------------------------
	-- buffs, debuffs
	------------------------------
	do
		if( C["unitframes"]["totdebuffs"] == true ) then
			G.UnitFrames.TargetTarget.Debuffs:SetHeight( 25 )
			G.UnitFrames.TargetTarget.Debuffs:SetWidth( 130 )
			G.UnitFrames.TargetTarget.Debuffs.size = 25
			G.UnitFrames.TargetTarget.Debuffs.num = 3
			G.UnitFrames.TargetTarget.Debuffs.spacing = 3

			G.UnitFrames.TargetTarget.Debuffs:ClearAllPoints()
			G.UnitFrames.TargetTarget.Debuffs:Point( "RIGHT", G.UnitFrames.TargetTarget, "LEFT", -5, -3 )
			G.UnitFrames.TargetTarget.Debuffs.ClearAllPoints = S.dummy
			G.UnitFrames.TargetTarget.Debuffs.SetPoint = S.dummy

			G.UnitFrames.TargetTarget.Debuffs.initialAnchor = "RIGHT"
			G.UnitFrames.TargetTarget.Debuffs["growth-x"] = "LEFT"

			if( G.UnitFrames.TargetTarget.Debuffs ) then
				for _, frames in pairs( { G.UnitFrames.TargetTarget.Debuffs } ) do
					if( not frames ) then return end

					frames:Size( 130, 25 )
					frames.size = 25
					frames.num = 3

					hooksecurefunc( frames, "PostCreateIcon", S.SkinAura )
				end
			end
		end
	end

	------------------------------
	-- size
	------------------------------
	do
		G.UnitFrames.TargetTarget:Size( 130, 15 )
	end
end

------------------------------
-- Pet
------------------------------
do
	------------------------------
	-- not needed
	------------------------------
	do
		G.UnitFrames.Pet:SetBackdrop( nil )
		G.UnitFrames.Pet:SetBackdropColor( 0, 0, 0 )
		G.UnitFrames.Pet.shadow:Kill()
		G.UnitFrames.Pet.panel:Kill()
	end

	------------------------------
	-- health
	------------------------------
	do
		G.UnitFrames.Pet.Health:Size( 130, 15 )
		G.UnitFrames.Pet.Health:SetFrameLevel( 5 )
		G.UnitFrames.Pet.Health:CreateBackdrop( "Default" )
		G.UnitFrames.Pet.Health.backdrop:CreateShadow( "Default" )
		G.UnitFrames.Pet.Health.bg:SetVertexColor( 0.6, 0.6, 0.6 )

		if( C["unitframes"]["unicolor"] == true ) then
			G.UnitFrames.Pet.Health.colorTapping = false
			G.UnitFrames.Pet.Health.colorDisconnected = false
			G.UnitFrames.Pet.Health.colorClass = false
			G.UnitFrames.Pet.Health:SetStatusBarColor( 0.125, 0.125, 0.125, 1 )
			G.UnitFrames.Pet.Health.bg:SetVertexColor( 0, 0, 0, 1 )
		else
			G.UnitFrames.Pet.Health.colorDisconnected = true
			G.UnitFrames.Pet.Health.colorTapping = true
			G.UnitFrames.Pet.Health.colorClass = true
			G.UnitFrames.Pet.Health.colorReaction = true
		end

		G.UnitFrames.Pet.Name:SetFont( unpack( S.FontTemplate.UFFontString.BuildFont ) )
		G.UnitFrames.Pet.Name:SetShadowOffset( 1.25, -1.25 )
	end

	------------------------------
	-- power
	------------------------------
	do
		G.UnitFrames.Pet.Power:Size( 130, 2 )
		G.UnitFrames.Pet.Power:ClearAllPoints()
		G.UnitFrames.Pet.Power:SetPoint( "TOP", G.UnitFrames.Pet.Health, "BOTTOM", 0, -7 )
		G.UnitFrames.Pet.Power:CreateBackdrop( "Default" )
		G.UnitFrames.Pet.Power.backdrop:CreateShadow( "Default" )

	end

	------------------------------
	-- size
	------------------------------
	do
		G.UnitFrames.Pet:Size( 130, 15 )
	end
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
	------------------------------
	-- not needed
	------------------------------
	do
		G.UnitFrames.Focus:SetBackdrop( nil )
		G.UnitFrames.Focus:SetBackdropColor( 0, 0, 0 )
		G.UnitFrames.Focus.shadow:Kill()
	end

	------------------------------
	-- health
	------------------------------
	do
		G.UnitFrames.Focus.Health:Size( 200, 26 )
		G.UnitFrames.Focus.Health:SetFrameLevel( 5 )
		G.UnitFrames.Focus.Health:CreateBackdrop( "Default" )
		G.UnitFrames.Focus.Health.backdrop:CreateShadow( "Default" )
		G.UnitFrames.Focus.Health.bg:SetVertexColor( 0.6, 0.6, 0.6 )

		if( C["unitframes"]["unicolor"] == true ) then
			G.UnitFrames.Focus.Health.colorTapping = false
			G.UnitFrames.Focus.Health.colorDisconnected = false
			G.UnitFrames.Focus.Health.colorClass = false
			G.UnitFrames.Focus.Health:SetStatusBarColor( 0.125, 0.125, 0.125, 1 )
			G.UnitFrames.Focus.Health.bg:SetVertexColor( 0, 0, 0, 1 )
		else
			G.UnitFrames.Focus.Health.colorDisconnected = true
			G.UnitFrames.Focus.Health.colorTapping = true
			G.UnitFrames.Focus.Health.colorClass = true
			G.UnitFrames.Focus.Health.colorReaction = true
		end

		G.UnitFrames.Focus.Name:SetFont( unpack( S.FontTemplate.UFFontString.BuildFont ) )
		G.UnitFrames.Focus.Name:SetShadowOffset( 1.25, -1.25 )
		G.UnitFrames.Focus.Name:Point( "CENTER", G.UnitFrames.Focus.Health, "CENTER", 0, 1 )

		G.UnitFrames.Focus.Health.value = S.SetFontString( G.UnitFrames.Focus.Health, unpack( S.FontTemplate.UFFontString.BuildFont ) )
		G.UnitFrames.Focus.Health.value:Point( "RIGHT", G.UnitFrames.Focus.Health, "RIGHT", -4, 1 )
	end

	------------------------------
	-- power
	------------------------------
	do
		G.UnitFrames.Focus.Power:Size( 200, 2 )
		G.UnitFrames.Focus.Power:ClearAllPoints()
		G.UnitFrames.Focus.Power:Point( "TOPRIGHT", G.UnitFrames.Focus.Health, "BOTTOMRIGHT", 0, -7 )
		G.UnitFrames.Focus.Power:SetFrameLevel( G.UnitFrames.Focus.Health:GetFrameLevel() + 2 )
		G.UnitFrames.Focus.Power:CreateBackdrop( "Default" )
		G.UnitFrames.Focus.Power.backdrop:CreateShadow( "Default" )

		G.UnitFrames.Focus.Power.value = S.SetFontString( G.UnitFrames.Focus.Health, unpack( S.FontTemplate.UFFontString.BuildFont ) )
		G.UnitFrames.Focus.Power.value:Point( "LEFT", G.UnitFrames.Focus.Health, "LEFT", 4, 1 )
	end

	------------------------------
	-- castbar
	------------------------------
	do
		if( C["unitframes"]["unitcastbar"] == true ) then
			G.UnitFrames.Focus.Castbar:ClearAllPoints()
			G.UnitFrames.Focus.Castbar:SetHeight( 20 )
			G.UnitFrames.Focus.Castbar:Point( "TOPLEFT", G.UnitFrames.Focus, "BOTTOMLEFT", 0, -16 )
			G.UnitFrames.Focus.Castbar:CreateBackdrop( "Default" )
			G.UnitFrames.Focus.Castbar.backdrop:CreateShadow( "Default" )

			G.UnitFrames.Focus.Castbar.bg:Kill()

			G.UnitFrames.Focus.Castbar.bg = G.UnitFrames.Focus.Castbar:CreateTexture( nil, "BORDER" )
			G.UnitFrames.Focus.Castbar.bg:SetAllPoints( G.UnitFrames.Focus.Castbar )
			G.UnitFrames.Focus.Castbar.bg:SetVertexColor( 0.05, 0.05, 0.05 )

			G.UnitFrames.Focus.Castbar.Time = S.SetFontString( G.UnitFrames.Focus.Castbar, unpack( S.FontTemplate.UFFontString.BuildFont ) )
			G.UnitFrames.Focus.Castbar.Time:Point( "RIGHT", G.UnitFrames.Focus.Castbar, "RIGHT", -4, 1 )
			G.UnitFrames.Focus.Castbar.Time:SetTextColor( 0, 4, 0 )

			G.UnitFrames.Focus.Castbar.Text = S.SetFontString( G.UnitFrames.Focus.Castbar, unpack( S.FontTemplate.UFFontString.BuildFont ) )
			G.UnitFrames.Focus.Castbar.Text:Point( "LEFT", G.UnitFrames.Focus.Castbar, "LEFT", 4, 1 )
			G.UnitFrames.Focus.Castbar.Text:SetTextColor( 0.3, 0.2, 1 )

			G.UnitFrames.Focus.Castbar.PostCastStart = S.PostCastStart
			G.UnitFrames.Focus.Castbar.PostChannelStart = S.PostCastStart

			if( C["unitframes"]["cbicons"] == true ) then
				G.UnitFrames.Focus.Castbar:Width( 173 )

				G.UnitFrames.Focus.Castbar.button:ClearAllPoints()
				G.UnitFrames.Focus.Castbar.button:SetPoint( "LEFT", G.UnitFrames.Focus.Castbar, "RIGHT", 5, 0 )
				G.UnitFrames.Focus.Castbar.button:Size( 24 )
				G.UnitFrames.Focus.Castbar.button:CreateShadow( "Default" )
			else
				G.UnitFrames.Focus.Castbar:Width( 200 )

				G.UnitFrames.Focus.Castbar.button:Kill()
			end
		end
	end

	------------------------------
	-- buffs, debuffs
	------------------------------
	do
		G.UnitFrames.Focus.Debuffs:SetHeight( 30 )
		G.UnitFrames.Focus.Debuffs:SetWidth( 200 )
		G.UnitFrames.Focus.Debuffs.size = 30
		G.UnitFrames.Focus.Debuffs.num = 5
		G.UnitFrames.Focus.Debuffs.spacing = 3

		G.UnitFrames.Focus.Debuffs:ClearAllPoints()
		G.UnitFrames.Focus.Debuffs:Point( "LEFT", G.UnitFrames.Focus, "RIGHT", 5, 0 )
		G.UnitFrames.Focus.Debuffs.ClearAllPoints = S.dummy
		G.UnitFrames.Focus.Debuffs.SetPoint = S.dummy

		G.UnitFrames.Focus.Debuffs.initialAnchor = "LEFT"
		G.UnitFrames.Focus.Debuffs["growth-x"] = "RIGHT"

		if( G.UnitFrames.Focus.Debuffs ) then
			for _, frames in pairs( { G.UnitFrames.Focus.Debuffs } ) do
				if( not frames ) then return end

				frames:Size( 200, 30 )
				frames.size = 30
				frames.num = 5

				hooksecurefunc( frames, "PostCreateIcon", S.SkinAura )
			end
		end
	end

	------------------------------
	-- size
	------------------------------
	do
		G.UnitFrames.Focus:Size( 200, 26 )
	end
end

------------------------------
-- Focus Target
------------------------------
do
	------------------------------
	-- not needed
	------------------------------
	do
		G.UnitFrames.FocusTarget:SetBackdrop( nil )
		G.UnitFrames.FocusTarget:SetBackdropColor( 0, 0, 0 )
		G.UnitFrames.FocusTarget.shadow:Kill()
	end

	------------------------------
	-- health
	------------------------------
	do
		G.UnitFrames.FocusTarget.Health:Size( 200, 26 )
		G.UnitFrames.FocusTarget.Health:SetFrameLevel( 5 )
		G.UnitFrames.FocusTarget.Health:CreateBackdrop( "Default" )
		G.UnitFrames.FocusTarget.Health.backdrop:CreateShadow( "Default" )
		G.UnitFrames.FocusTarget.Health.bg:SetVertexColor( 0.6, 0.6, 0.6 )

		if( C["unitframes"]["unicolor"] == true ) then
			G.UnitFrames.FocusTarget.Health.colorTapping = false
			G.UnitFrames.FocusTarget.Health.colorDisconnected = false
			G.UnitFrames.FocusTarget.Health.colorClass = false
			G.UnitFrames.FocusTarget.Health:SetStatusBarColor( 0.125, 0.125, 0.125, 1 )
			G.UnitFrames.FocusTarget.Health.bg:SetVertexColor( 0, 0, 0, 1 )
		else
			G.UnitFrames.FocusTarget.Health.colorDisconnected = true
			G.UnitFrames.FocusTarget.Health.colorTapping = true
			G.UnitFrames.FocusTarget.Health.colorClass = true
			G.UnitFrames.FocusTarget.Health.colorReaction = true
		end

		G.UnitFrames.FocusTarget.Name:SetFont( unpack( S.FontTemplate.UFFontString.BuildFont ) )
		G.UnitFrames.FocusTarget.Name:SetShadowOffset( 1.25, -1.25 )
		G.UnitFrames.FocusTarget.Name:Point( "CENTER", G.UnitFrames.FocusTarget.Health, "CENTER", 0, 1 )

		G.UnitFrames.FocusTarget.Health.value = S.SetFontString( G.UnitFrames.FocusTarget.Health, unpack( S.FontTemplate.UFFontString.BuildFont ) )
		G.UnitFrames.FocusTarget.Health.value:Point( "RIGHT", G.UnitFrames.FocusTarget.Health, "RIGHT", -4, 1 )
	end

	------------------------------
	-- power
	------------------------------
	do
		G.UnitFrames.FocusTarget.Power:Size( 200, 2 )
		G.UnitFrames.FocusTarget.Power:ClearAllPoints()
		G.UnitFrames.FocusTarget.Power:Point( "TOPRIGHT", G.UnitFrames.FocusTarget.Health, "BOTTOMRIGHT", 0, -7 )
		G.UnitFrames.FocusTarget.Power:SetFrameLevel( G.UnitFrames.FocusTarget.Health:GetFrameLevel() + 2 )
		G.UnitFrames.FocusTarget.Power:CreateBackdrop( "Default" )
		G.UnitFrames.FocusTarget.Power.backdrop:CreateShadow( "Default" )

		G.UnitFrames.FocusTarget.Power.value = S.SetFontString( G.UnitFrames.FocusTarget.Health, unpack( S.FontTemplate.UFFontString.BuildFont ) )
		G.UnitFrames.FocusTarget.Power.value:Point( "LEFT", G.UnitFrames.FocusTarget.Health, "LEFT", 4, 1 )
	end

	------------------------------
	-- castbar
	------------------------------
	do
		if( C["unitframes"]["unitcastbar"] == true ) then
			G.UnitFrames.FocusTarget.Castbar:ClearAllPoints()
			G.UnitFrames.FocusTarget.Castbar:SetHeight( 20 )
			G.UnitFrames.FocusTarget.Castbar:Point( "TOPLEFT", G.UnitFrames.FocusTarget, "BOTTOMLEFT", 0, -16 )
			G.UnitFrames.FocusTarget.Castbar:CreateBackdrop( "Default" )
			G.UnitFrames.FocusTarget.Castbar.backdrop:CreateShadow( "Default" )

			G.UnitFrames.FocusTarget.Castbar.bg:Kill()

			G.UnitFrames.FocusTarget.Castbar.bg = G.UnitFrames.FocusTarget.Castbar:CreateTexture( nil, "BORDER" )
			G.UnitFrames.FocusTarget.Castbar.bg:SetAllPoints( G.UnitFrames.FocusTarget.Castbar )
			G.UnitFrames.FocusTarget.Castbar.bg:SetTexture( C["media"]["normTex"] )
			G.UnitFrames.FocusTarget.Castbar.bg:SetVertexColor( 0.05, 0.05, 0.05 )

			G.UnitFrames.FocusTarget.Castbar.Time = S.SetFontString( G.UnitFrames.FocusTarget.Castbar, unpack( S.FontTemplate.UFFontString.BuildFont ) )
			G.UnitFrames.FocusTarget.Castbar.Time:Point( "RIGHT", G.UnitFrames.FocusTarget.Castbar, "RIGHT", -4, 1 )
			G.UnitFrames.FocusTarget.Castbar.Time:SetTextColor( 0, 4, 0 )

			G.UnitFrames.FocusTarget.Castbar.Text = S.SetFontString( G.UnitFrames.FocusTarget.Castbar, unpack( S.FontTemplate.UFFontString.BuildFont ) )
			G.UnitFrames.FocusTarget.Castbar.Text:Point( "LEFT", G.UnitFrames.FocusTarget.Castbar, "LEFT", 4, 1 )
			G.UnitFrames.FocusTarget.Castbar.Text:SetTextColor( 0.3, 0.2, 1 )

			G.UnitFrames.FocusTarget.Castbar.PostCastStart = S.PostCastStart
			G.UnitFrames.FocusTarget.Castbar.PostChannelStart = S.PostCastStart

			if( C["unitframes"]["cbicons"] == true ) then
				G.UnitFrames.FocusTarget.Castbar:Width( 173 )

				G.UnitFrames.FocusTarget.Castbar.button:ClearAllPoints()
				G.UnitFrames.FocusTarget.Castbar.button:SetPoint( "LEFT", G.UnitFrames.FocusTarget.Castbar, "RIGHT", 5, 0 )
				G.UnitFrames.FocusTarget.Castbar.button:Size( 24 )
				G.UnitFrames.FocusTarget.Castbar.button:CreateShadow( "Default" )
			else
				G.UnitFrames.FocusTarget.Castbar:Width( 200 )

				G.UnitFrames.FocusTarget.Castbar.button:Kill()
			end
		end
	end

	------------------------------
	-- buffs, debuffs
	------------------------------
	do
		G.UnitFrames.FocusTarget.Debuffs:SetHeight( 30 )
		G.UnitFrames.FocusTarget.Debuffs:SetWidth( 200 )
		G.UnitFrames.FocusTarget.Debuffs.size = 30
		G.UnitFrames.FocusTarget.Debuffs.num = 5
		G.UnitFrames.FocusTarget.Debuffs.spacing = 3

		G.UnitFrames.FocusTarget.Debuffs:ClearAllPoints()
		G.UnitFrames.FocusTarget.Debuffs:Point( "LEFT", G.UnitFrames.FocusTarget, "RIGHT", 5, 0 )
		G.UnitFrames.FocusTarget.Debuffs.ClearAllPoints = S.dummy
		G.UnitFrames.FocusTarget.Debuffs.SetPoint = S.dummy

		G.UnitFrames.FocusTarget.Debuffs.initialAnchor = "LEFT"
		G.UnitFrames.FocusTarget.Debuffs["growth-x"] = "RIGHT"

		if( G.UnitFrames.FocusTarget.Debuffs ) then
			for _, frames in pairs( { G.UnitFrames.FocusTarget.Debuffs } ) do
				if( not frames ) then return end

				frames:Size( 200, 30 )
				frames.size = 30
				frames.num = 5

				hooksecurefunc( frames, "PostCreateIcon", S.SkinAura )
			end
		end
	end

	------------------------------
	-- size
	------------------------------
	do
		G.UnitFrames.FocusTarget:Size( 200, 26 )
	end
end

------------------------------
-- Boss
------------------------------
do
	for i = 1, MAX_BOSS_FRAMES do
		------------------------------
		-- not needed
		------------------------------
		do
			G.UnitFrames["Boss" .. i]:SetBackdrop( nil )
			G.UnitFrames["Boss" .. i]:SetBackdropColor( 0, 0, 0 )
			G.UnitFrames["Boss" .. i].shadow:Kill()
		end

		------------------------------
		-- health
		------------------------------
		do
			G.UnitFrames["Boss" .. i].Health:Size( 200, 26 )
			G.UnitFrames["Boss" .. i].Health:SetFrameLevel( 5 )
			G.UnitFrames["Boss" .. i].Health:CreateBackdrop( "Default" )
			G.UnitFrames["Boss" .. i].Health.backdrop:CreateShadow( "Default" )
			G.UnitFrames["Boss" .. i].Health.bg:SetVertexColor( 0.6, 0.6, 0.6 )

			if( C["unitframes"]["unicolor"] == true ) then
				G.UnitFrames["Boss" .. i].Health.colorTapping = false
				G.UnitFrames["Boss" .. i].Health.colorDisconnected = false
				G.UnitFrames["Boss" .. i].Health.colorClass = false
				G.UnitFrames["Boss" .. i].Health:SetStatusBarColor( 0.125, 0.125, 0.125, 1 )
				G.UnitFrames["Boss" .. i].Health.bg:SetVertexColor( 0, 0, 0, 1 )
			else
				G.UnitFrames["Boss" .. i].Health.colorDisconnected = true
				G.UnitFrames["Boss" .. i].Health.colorTapping = true
				G.UnitFrames["Boss" .. i].Health.colorClass = true
				G.UnitFrames["Boss" .. i].Health.colorReaction = true
			end

			G.UnitFrames["Boss" .. i].Name:SetFont( unpack( S.FontTemplate.UFFontString.BuildFont ) )
			G.UnitFrames["Boss" .. i].Name:SetShadowOffset( 1.25, -1.25 )
			G.UnitFrames["Boss" .. i].Name:Point( "CENTER", G.UnitFrames["Boss" .. i].Health, "CENTER", 0, 1 )

			G.UnitFrames["Boss" .. i].Health.value = S.SetFontString( G.UnitFrames["Boss" .. i].Health, unpack( S.FontTemplate.UFFontString.BuildFont ) )
			G.UnitFrames["Boss" .. i].Health.value:Point( "RIGHT", G.UnitFrames["Boss" .. i].Health, "RIGHT", -4, 1 )
		end

		------------------------------
		-- power
		------------------------------
		do
			G.UnitFrames["Boss" .. i].Power:Size( 200, 2 )
			G.UnitFrames["Boss" .. i].Power:ClearAllPoints()
			G.UnitFrames["Boss" .. i].Power:Point( "TOPRIGHT", G.UnitFrames["Boss" .. i].Health, "BOTTOMRIGHT", 0, -7 )
			G.UnitFrames["Boss" .. i].Power:SetFrameLevel( G.UnitFrames["Boss" .. i].Health:GetFrameLevel() + 2 )
			G.UnitFrames["Boss" .. i].Power:CreateBackdrop( "Default" )
			G.UnitFrames["Boss" .. i].Power.backdrop:CreateShadow( "Default" )

			G.UnitFrames["Boss" .. i].Power.value = S.SetFontString( G.UnitFrames["Boss" .. i].Health, unpack( S.FontTemplate.UFFontString.BuildFont ) )
			G.UnitFrames["Boss" .. i].Power.value:Point( "LEFT", G.UnitFrames["Boss" .. i].Health, "LEFT", 4, 1 )
		end

		------------------------------
		-- castbar
		------------------------------
		do
			if( C["unitframes"]["unitcastbar"] == true ) then
				G.UnitFrames["Boss" .. i].Castbar:ClearAllPoints()
				G.UnitFrames["Boss" .. i].Castbar:SetHeight( 20 )
				G.UnitFrames["Boss" .. i].Castbar:Point( "TOPRIGHT", G.UnitFrames["Boss" .. i], "BOTTOMRIGHT", 0, -16 )
				G.UnitFrames["Boss" .. i].Castbar:CreateBackdrop( "Default" )
				G.UnitFrames["Boss" .. i].Castbar.backdrop:CreateShadow( "Default" )

				G.UnitFrames["Boss" .. i].Castbar.bg:Kill()

				G.UnitFrames["Boss" .. i].Castbar.bg = G.UnitFrames["Boss" .. i].Castbar:CreateTexture( nil, "BORDER" )
				G.UnitFrames["Boss" .. i].Castbar.bg:SetAllPoints( G.UnitFrames["Boss" .. i].Castbar )
				G.UnitFrames["Boss" .. i].Castbar.bg:SetTexture( C["media"]["normTex"] )
				G.UnitFrames["Boss" .. i].Castbar.bg:SetVertexColor( 0.05, 0.05, 0.05 )

				G.UnitFrames["Boss" .. i].Castbar.Time = S.SetFontString( G.UnitFrames["Boss" .. i].Castbar, unpack( S.FontTemplate.UFFontString.BuildFont ) )
				G.UnitFrames["Boss" .. i].Castbar.Time:Point( "RIGHT", G.UnitFrames["Boss" .. i].Castbar, "RIGHT", -4, 1 )
				G.UnitFrames["Boss" .. i].Castbar.Time:SetTextColor( 0, 4, 0 )

				G.UnitFrames["Boss" .. i].Castbar.Text = S.SetFontString( G.UnitFrames["Boss" .. i].Castbar, unpack( S.FontTemplate.UFFontString.BuildFont ) )
				G.UnitFrames["Boss" .. i].Castbar.Text:Point( "LEFT", G.UnitFrames["Boss" .. i].Castbar, "LEFT", 4, 1 )
				G.UnitFrames["Boss" .. i].Castbar.Text:SetTextColor( 0.3, 0.2, 1 )

				G.UnitFrames["Boss" .. i].Castbar.PostCastStart = S.PostCastStart
				G.UnitFrames["Boss" .. i].Castbar.PostChannelStart = S.PostCastStart

				if( C["unitframes"]["cbicons"] == true ) then
					G.UnitFrames["Boss" .. i].Castbar:Width( 173 )

					G.UnitFrames["Boss" .. i].Castbar.button:ClearAllPoints()
					G.UnitFrames["Boss" .. i].Castbar.button:SetPoint( "RIGHT", G.UnitFrames["Boss" .. i].Castbar, "LEFT", -5, 0 )
					G.UnitFrames["Boss" .. i].Castbar.button:Size( 24 )
					G.UnitFrames["Boss" .. i].Castbar.button:CreateShadow( "Default" )
				else
					G.UnitFrames["Boss" .. i].Castbar:Width( 200 )

					G.UnitFrames["Boss" .. i].Castbar.button:Kill()
				end
			end
		end

		------------------------------
		-- buffs, debuffs
		------------------------------
		do
			G.UnitFrames["Boss" .. i].Debuffs:SetHeight( 30 )
			G.UnitFrames["Boss" .. i].Debuffs:SetWidth( 200 )
			G.UnitFrames["Boss" .. i].Debuffs.size = 30
			G.UnitFrames["Boss" .. i].Debuffs.num = 5
			G.UnitFrames["Boss" .. i].Debuffs.spacing = 3

			G.UnitFrames["Boss" .. i].Debuffs:ClearAllPoints()
			G.UnitFrames["Boss" .. i].Debuffs:Point( "LEFT", G.UnitFrames["Boss" .. i], "RIGHT", 5, 0 )
			G.UnitFrames["Boss" .. i].Debuffs.ClearAllPoints = S.dummy
			G.UnitFrames["Boss" .. i].Debuffs.SetPoint = S.dummy

			G.UnitFrames["Boss" .. i].Buffs:SetHeight( 30 )
			G.UnitFrames["Boss" .. i].Buffs:SetWidth( 200 )
			G.UnitFrames["Boss" .. i].Buffs.size = 30
			G.UnitFrames["Boss" .. i].Buffs.num = 5
			G.UnitFrames["Boss" .. i].Buffs.spacing = 3

			G.UnitFrames["Boss" .. i].Buffs:ClearAllPoints()
			G.UnitFrames["Boss" .. i].Buffs:Point( "RIGHT", G.UnitFrames["Boss" .. i], "LEFT", -5, 0 )
			G.UnitFrames["Boss" .. i].Buffs.ClearAllPoints = S.dummy
			G.UnitFrames["Boss" .. i].Buffs.SetPoint = S.dummy

			G.UnitFrames["Boss" .. i].Debuffs.initialAnchor = "LEFT"
			G.UnitFrames["Boss" .. i].Debuffs["growth-x"] = "RIGHT"

			G.UnitFrames["Boss" .. i].Buffs.initialAnchor = "RIGHT"
			G.UnitFrames["Boss" .. i].Buffs["growth-x"] = "LEFT"

			if( G.UnitFrames["Boss" .. i].Debuffs or G.UnitFrames["Boss" .. i].Buffs ) then
				for _, frames in pairs( { G.UnitFrames["Boss" .. i].Debuffs, G.UnitFrames["Boss" .. i].Buffs } ) do
					if( not frames ) then return end

					frames:Size( 200, 30 )
					frames.size = 30
					frames.num = 5

					hooksecurefunc( frames, "PostCreateIcon", S.SkinAura )
				end
			end
		end

		------------------------------
		-- altpowerbar
		------------------------------
		do
			G.UnitFrames["Boss" .. i].AltPowerBar:SetStatusBarTexture( C["media"]["normal"] )
		end

		------------------------------
		-- size
		------------------------------
		do
			G.UnitFrames["Boss" .. i]:Size( 200, 26 )
		end
	end
end

------------------------------
-- Arena
------------------------------
do
	if( C["unitframes"]["arena"] == true ) then
		for i = 1, 5 do
			------------------------------
			-- not needed
			------------------------------
			do
				G.UnitFrames["Arena" .. i]:SetBackdrop( nil )
				G.UnitFrames["Arena" .. i]:SetBackdropColor( 0, 0, 0 )
				G.UnitFrames["Arena" .. i].shadow:Kill()
			end
			------------------------------
			-- health
			------------------------------
			do
				G.UnitFrames["Arena" .. i].Health:Size( 200, 26 )
				G.UnitFrames["Arena" .. i].Health:SetFrameLevel( 5 )
				G.UnitFrames["Arena" .. i].Health:CreateBackdrop( "Default" )
				G.UnitFrames["Arena" .. i].Health.backdrop:CreateShadow( "Default" )
				G.UnitFrames["Arena" .. i].Health.bg:SetVertexColor( 0.6, 0.6, 0.6 )

				if( C["unitframes"]["unicolor"] == true ) then
					G.UnitFrames["Arena" .. i].Health.colorTapping = false
					G.UnitFrames["Arena" .. i].Health.colorDisconnected = false
					G.UnitFrames["Arena" .. i].Health.colorClass = false
					G.UnitFrames["Arena" .. i].Health:SetStatusBarColor( 0.125, 0.125, 0.125, 1 )
					G.UnitFrames["Arena" .. i].Health.bg:SetVertexColor( 0, 0, 0, 1 )
				else
					G.UnitFrames["Arena" .. i].Health.colorDisconnected = true
					G.UnitFrames["Arena" .. i].Health.colorTapping = true
					G.UnitFrames["Arena" .. i].Health.colorClass = true
					G.UnitFrames["Arena" .. i].Health.colorReaction = true
				end

				G.UnitFrames["Arena" .. i].Name:SetFont( unpack( S.FontTemplate.UFFontString.BuildFont ) )
				G.UnitFrames["Arena" .. i].Name:SetShadowOffset( 1.25, -1.25 )
				G.UnitFrames["Arena" .. i].Name:Point( "CENTER", G.UnitFrames["Arena" .. i].Health, "CENTER", 0, 1 )

				G.UnitFrames["Arena" .. i].Health.value = S.SetFontString( G.UnitFrames["Arena" .. i].Health, unpack( S.FontTemplate.UFFontString.BuildFont ) )
				G.UnitFrames["Arena" .. i].Health.value:Point( "RIGHT", G.UnitFrames["Arena" .. i].Health, "RIGHT", -4, 1 )
			end

			------------------------------
			-- power
			------------------------------
			do
				G.UnitFrames["Arena" .. i].Power:Size( 200, 2 )
				G.UnitFrames["Arena" .. i].Power:ClearAllPoints()
				G.UnitFrames["Arena" .. i].Power:Point( "TOPRIGHT", G.UnitFrames["Arena" .. i].Health, "BOTTOMRIGHT", 0, -7 )
				G.UnitFrames["Arena" .. i].Power:SetFrameLevel( G.UnitFrames["Arena" .. i].Health:GetFrameLevel() + 2 )
				G.UnitFrames["Arena" .. i].Power:CreateBackdrop( "Default" )
				G.UnitFrames["Arena" .. i].Power.backdrop:CreateShadow( "Default" )

				G.UnitFrames["Arena" .. i].Power.value = S.SetFontString( G.UnitFrames["Arena" .. i].Health, unpack( S.FontTemplate.UFFontString.BuildFont ) )
				G.UnitFrames["Arena" .. i].Power.value:Point( "LEFT", G.UnitFrames["Arena" .. i].Health, "LEFT", 4, 1 )
			end

			------------------------------
			-- castbar
			------------------------------
			do
				if( C["unitframes"]["unitcastbar"] == true ) then
					G.UnitFrames["Arena" .. i].Castbar:ClearAllPoints()
					G.UnitFrames["Arena" .. i].Castbar:SetHeight( 20 )
					G.UnitFrames["Arena" .. i].Castbar:Point( "TOPRIGHT", G.UnitFrames["Arena" .. i], "BOTTOMRIGHT", 0, -16 )
					G.UnitFrames["Arena" .. i].Castbar:CreateBackdrop( "Default" )
					G.UnitFrames["Arena" .. i].Castbar.backdrop:CreateShadow( "Default" )

					G.UnitFrames["Arena" .. i].Castbar.bg:Kill()

					G.UnitFrames["Arena" .. i].Castbar.bg = G.UnitFrames["Arena" .. i].Castbar:CreateTexture( nil, "BORDER" )
					G.UnitFrames["Arena" .. i].Castbar.bg:SetAllPoints( G.UnitFrames["Arena" .. i].Castbar )
					G.UnitFrames["Arena" .. i].Castbar.bg:SetTexture( C["media"]["normTex"] )
					G.UnitFrames["Arena" .. i].Castbar.bg:SetVertexColor( 0.05, 0.05, 0.05 )

					G.UnitFrames["Arena" .. i].Castbar.Time = S.SetFontString( G.UnitFrames["Arena" .. i].Castbar, unpack( S.FontTemplate.UFFontString.BuildFont ) )
					G.UnitFrames["Arena" .. i].Castbar.Time:Point( "RIGHT", G.UnitFrames["Arena" .. i].Castbar, "RIGHT", -4, 1 )
					G.UnitFrames["Arena" .. i].Castbar.Time:SetTextColor( 0, 4, 0 )

					G.UnitFrames["Arena" .. i].Castbar.Text = S.SetFontString( G.UnitFrames["Arena" .. i].Castbar, unpack( S.FontTemplate.UFFontString.BuildFont ) )
					G.UnitFrames["Arena" .. i].Castbar.Text:Point( "LEFT", G.UnitFrames["Arena" .. i].Castbar, "LEFT", 4, 1 )
					G.UnitFrames["Arena" .. i].Castbar.Text:SetTextColor( 0.3, 0.2, 1 )

					G.UnitFrames["Arena" .. i].Castbar.PostCastStart = S.PostCastStart
					G.UnitFrames["Arena" .. i].Castbar.PostChannelStart = S.PostCastStart

					if( C["unitframes"]["cbicons"] == true ) then
						G.UnitFrames["Arena" .. i].Castbar:Width( 173 )

						G.UnitFrames["Arena" .. i].Castbar.button:ClearAllPoints()
						G.UnitFrames["Arena" .. i].Castbar.button:SetPoint( "RIGHT", G.UnitFrames["Arena" .. i].Castbar, "LEFT", -5, 0 )
						G.UnitFrames["Arena" .. i].Castbar.button:Size( 24 )
						G.UnitFrames["Arena" .. i].Castbar.button:CreateShadow( "Default" )
					else
						G.UnitFrames["Arena" .. i].Castbar:Width( 200 )

						G.UnitFrames["Arena" .. i].Castbar.button:Kill()
					end
				end
			end

			------------------------------
			-- buffs, debuffs
			------------------------------
			do
				G.UnitFrames["Arena" .. i].Debuffs:SetHeight( 30 )
				G.UnitFrames["Arena" .. i].Debuffs:SetWidth( 200 )
				G.UnitFrames["Arena" .. i].Debuffs.size = 30
				G.UnitFrames["Arena" .. i].Debuffs.num = 5
				G.UnitFrames["Arena" .. i].Debuffs.spacing = 3

				G.UnitFrames["Arena" .. i].Debuffs:ClearAllPoints()
				G.UnitFrames["Arena" .. i].Debuffs:Point( "LEFT", G.UnitFrames["Arena" .. i], "RIGHT", 5, 0 )
				G.UnitFrames["Arena" .. i].Debuffs.ClearAllPoints = S.dummy
				G.UnitFrames["Arena" .. i].Debuffs.SetPoint = S.dummy

				G.UnitFrames["Arena" .. i].Debuffs.initialAnchor = "LEFT"
				G.UnitFrames["Arena" .. i].Debuffs["growth-x"] = "RIGHT"

				if( G.UnitFrames["Arena" .. i].Debuffs ) then
					for _, frames in pairs( { G.UnitFrames["Arena" .. i].Debuffs } ) do
						if( not frames ) then return end

						frames:Size( 200, 30 )
						frames.size = 30
						frames.num = 5

						hooksecurefunc( frames, "PostCreateIcon", S.SkinAura )
					end
				end
			end

			------------------------------
			-- pvp scpec icon
			------------------------------
			do
				G.UnitFrames["Arena" .. i].PVPSpecIcon:Size( 26 )
				G.UnitFrames["Arena" .. i].PVPSpecIcon:CreateShadow( "Default" )
			end

			------------------------------
			-- trinket
			------------------------------
			do
				G.UnitFrames["Arena" .. i].Trinket:Size( 26 )
				G.UnitFrames["Arena" .. i].Trinket:CreateShadow( "Default" )
			end

			------------------------------
			-- size
			------------------------------
			do
				G.UnitFrames["Arena" .. i]:Size( 200, 26 )
			end
		end
	end
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
		G.UnitFrames.Player:SetPoint( "TOP", UIParent, "BOTTOM", -170 , 272 )
		G.UnitFrames.Target:SetPoint( "TOP", UIParent, "BOTTOM", 170 , 272 )
	elseif( IsAddOnLoaded( "AsphyxiaUI_Raid_Healing" ) ) then
		G.UnitFrames.Player:SetPoint( "TOP", UIParent, "BOTTOM", -309 , 362 )
		G.UnitFrames.Target:SetPoint( "TOP", UIParent, "BOTTOM", 309 , 362 )
	else
		G.UnitFrames.Player:SetPoint( "TOP", UIParent, "BOTTOM", -309 , 362 )
		G.UnitFrames.Target:SetPoint( "TOP", UIParent, "BOTTOM", 309 , 362 )
	end

	G.UnitFrames.TargetTarget:SetPoint( "TOPRIGHT", G.UnitFrames.Target, "BOTTOMRIGHT", 0, -61 )
	G.UnitFrames.Pet:SetPoint( "TOPLEFT", G.UnitFrames.Player, "BOTTOMLEFT", 0, -61 )
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