---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["unitframes"]["enable"] ~= true ) then return end

if( C["global"]["unitframelayout"] == "asphyxia" ) then
	print("uf layout: asphyxia")

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
		G.UnitFrames.Target.Health:Size( 230, 26 )
		G.UnitFrames.Target.Health:SetStatusBarTexture( C["media"]["normal"] )
		G.UnitFrames.Target.Health:SetFrameLevel( 5 )
		G.UnitFrames.Target.Health:CreateBorder()
		G.UnitFrames.Target.Health.bg:SetTexture( 0.6, 0.6, 0.6 )

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

		G.UnitFrames.Target.Health.value = S.SetFontString( G.UnitFrames.Target.Health, S.CreateFontString() )
		G.UnitFrames.Target.Health.value:Point( "RIGHT", G.UnitFrames.Target.Health, "RIGHT", -4, 1 )
	end

	------------------------------
	-- power
	------------------------------
	do
		G.UnitFrames.Target.Power:Size( 230, 2 )
		G.UnitFrames.Target.Power:SetStatusBarTexture( C["media"]["normal"] )
		G.UnitFrames.Target.Power:ClearAllPoints()
		G.UnitFrames.Target.Power:Point( "TOPRIGHT", G.UnitFrames.Target.Health, "BOTTOMRIGHT", 0, -7 )
		G.UnitFrames.Target.Power:SetFrameLevel( G.UnitFrames.Target.Health:GetFrameLevel() + 2 )
		G.UnitFrames.Target.Power:CreateBorder()

		G.UnitFrames.Target.Power.value = S.SetFontString( G.UnitFrames.Target.Health, S.CreateFontString() )
		G.UnitFrames.Target.Power.value:Point( "LEFT", G.UnitFrames.Player.Health, "LEFT", 4, 1 )
	end

elseif( C["global"]["unitframelayout"] == "asphyxia2" ) then
	print("uf layout: asphyxia2")
elseif( C["global"]["unitframelayout"] == "asphyxia3" ) then
	print("uf layout: asphyxia3")
elseif( C["global"]["unitframelayout"] == "asphyxia4" ) then
	print("uf layout: asphyxia4")
elseif( C["global"]["unitframelayout"] == "duffed" ) then
	print("uf layout: duffed")
elseif( C["global"]["unitframelayout"] == "duffed2" ) then
	print("uf layout: duffed2")
elseif( C["global"]["unitframelayout"] == "jasje" ) then
	------------------------------
	-- not needed
	------------------------------
	do
		G.UnitFrames.Target:SetBackdrop( nil )
		G.UnitFrames.Target:SetBackdropColor( 0, 0, 0 )
		G.UnitFrames.Target.shadow:Kill()
	end

	------------------------------
	-- panel
	------------------------------
	do
		G.UnitFrames.Target.panel:ClearAllPoints()
		G.UnitFrames.Target.panel:SetPoint( "TOP", G.UnitFrames.Target, "BOTTOM", 0, 16 )
		G.UnitFrames.Target.panel:SetHeight( 12 )
		G.UnitFrames.Target.panel:SetWidth( 224 )
	end

	------------------------------
	-- health
	------------------------------
	do
		G.UnitFrames.Target.Health:Size( 220, 19 )
		G.UnitFrames.Target.Health:SetStatusBarTexture( C["media"]["glamour"] )
		G.UnitFrames.Target.Health:SetFrameLevel( 5 )
		G.UnitFrames.Target.Health:CreateBorder()

		G.UnitFrames.Target.Health.colorTapping = false
		G.UnitFrames.Target.Health.colorDisconnected = false
		G.UnitFrames.Target.Health.colorClass = false
		G.UnitFrames.Target.Health:SetStatusBarColor( 0.2, 0.2, 0.2, 1 )
		G.UnitFrames.Target.Health.bg:SetTexture( 0.6, 0.6, 0.6 )
		G.UnitFrames.Target.Health.bg:SetVertexColor( 0, 0, 0 )

		G.UnitFrames.Target.Name:SetFont( S.CreateFontString() )
		G.UnitFrames.Target.Health.value:SetFont( S.CreateFontString() )
	end

	------------------------------
	-- power
	------------------------------
	do
		G.UnitFrames.Target.Power:Size( 220, 3 )
		G.UnitFrames.Target.Power:ClearAllPoints()
		G.UnitFrames.Target.Power:Point( "LEFT", G.UnitFrames.Target.Health, "BOTTOMLEFT", 0, -9 )
		G.UnitFrames.Target.Power:SetFrameLevel( 3 )
		G.UnitFrames.Target.Power:CreateBorder()

		G.UnitFrames.Target.Power.value:SetFont( S.CreateFontString() )
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
			G.UnitFrames.Target.Health:ClearAllPoints()
			G.UnitFrames.Target.Health:SetPoint( "TOPLEFT", 0, 0 )
			G.UnitFrames.Target.Health:SetPoint( "TOPRIGHT" )
			G.UnitFrames.Target.Portrait:SetFrameLevel( G.UnitFrames.Target.Health:GetFrameLevel() )
		end
	end

	------------------------------
	-- classicons
	------------------------------
	do
		if( C["unitframes"]["classicons"] == true ) then
			local classicon = CreateFrame( "Frame", G.UnitFrames.Target:GetName() .. "_ClassIconBorder", G.UnitFrames.Target )
			classicon:CreatePanel( "Default", 33, 33, "TOPLEFT", G.UnitFrames.Target.Health, "TOPRIGHT", 5, 2 )

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
			G.UnitFrames.Target.CombatFeedbackText:SetFont( S.CreateFontString() )
		end
	end

	------------------------------
	-- castbar
	------------------------------
	do
		if( C["unitframes"]["unitcastbar"] == true ) then
			G.UnitFrames.Target.Castbar:ClearAllPoints()
			G.UnitFrames.Target.Castbar:Point( "BOTTOMRIGHT", G.UnitFrames.Target, "TOPRIGHT", 0, 70 )
			G.UnitFrames.Target.Castbar:SetStatusBarTexture( C["media"]["glamour"] )
			G.UnitFrames.Target.Castbar:CreateBorder()
			G.UnitFrames.Target.Castbar.bg:SetVertexColor( 0.1, 0.1, 0.1 )

			if( C["unitframes"]["cbicons"] == true ) then
				G.UnitFrames.Target.Castbar:Size( 196, 18 )

				G.UnitFrames.Target.Castbar.button:ClearAllPoints()
				G.UnitFrames.Target.Castbar.button:SetPoint( "LEFT", -26, S.Scale( 0 ) )
				G.UnitFrames.Target.Castbar.button:Size( 22 )
				G.UnitFrames.Target.Castbar.button.shadow:Kill()
			else
				G.UnitFrames.Target.Castbar:Size( 220, 18 )
			end

			G.UnitFrames.Target.Castbar.PostCastStart = S.PostCastStart
			G.UnitFrames.Target.Castbar.PostChannelStart = S.PostCastStart

			G.UnitFrames.Target.Castbar.Time = S.SetFontString( G.UnitFrames.Target.Castbar, S.CreateFontString() )
			G.UnitFrames.Target.Castbar.Time:Point( "RIGHT", G.UnitFrames.Target.Castbar, "RIGHT", -4, 0 )

			G.UnitFrames.Target.Castbar.Text = S.SetFontString( G.UnitFrames.Target.Castbar, S.CreateFontString() )
			G.UnitFrames.Target.Castbar.Text:Point( "LEFT", G.UnitFrames.Target.Castbar, "LEFT", 4, 0 )
		end
	end

	------------------------------
	-- buffs, debuffs
	------------------------------
	do
		if( C["unitframes"]["targetauras"] == true ) then
			G.UnitFrames.Target.Debuffs:SetHeight( 26 )
			G.UnitFrames.Target.Debuffs:SetWidth( 220 )
			G.UnitFrames.Target.Debuffs.size = 26
			G.UnitFrames.Target.Debuffs.num = 8
			G.UnitFrames.Target.Debuffs.spacing = 2

			G.UnitFrames.Target.Buffs:SetHeight( 26 )
			G.UnitFrames.Target.Buffs:SetWidth( 220 )
			G.UnitFrames.Target.Buffs.size = 26
			G.UnitFrames.Target.Buffs.num = 8
			G.UnitFrames.Target.Buffs.spacing = 2

			G.UnitFrames.Target.Buffs:ClearAllPoints()
			G.UnitFrames.Target.Buffs:Point( "BOTTOMLEFT", G.UnitFrames.Target, "TOPLEFT", -2, 5 )
			G.UnitFrames.Target.Buffs.ClearAllPoints = S.dummy
			G.UnitFrames.Target.Buffs.SetPoint = S.dummy

			G.UnitFrames.Target.Debuffs:ClearAllPoints()
			G.UnitFrames.Target.Debuffs:Point( "BOTTOMLEFT", G.UnitFrames.Target.Buffs, "TOPLEFT", -30, 2 )
			G.UnitFrames.Target.Debuffs.ClearAllPoints = S.dummy
			G.UnitFrames.Target.Debuffs.SetPoint = S.dummy

			if( G.UnitFrames.Target.Buffs or G.UnitFrames.Target.Debuffs ) then
				for _, frames in pairs( { G.UnitFrames.Target.Buffs, G.UnitFrames.Target.Debuffs } ) do
					if( not frames ) then return end

					frames:Size( 252, 26 )
					frames.size = 26
					frames.num = 8

					hooksecurefunc( frames, "PostCreateIcon", S.SkinAura )
				end
			end
		end
	end

	------------------------------
	-- size
	------------------------------
	do
		G.UnitFrames.Target:Size( 220, 50 )
	end

elseif( C["global"]["unitframelayout"] == "merith" ) then
	print("uf layout: merith")
elseif( C["global"]["unitframelayout"] == "merith2" ) then
	print("uf layout: merith2")
elseif( C["global"]["unitframelayout"] == "sinaris" ) then
	print("uf layout: sinaris")
end

------------------------------
-- position
------------------------------
local TargetPosition = CreateFrame( "Frame" )
TargetPosition:RegisterEvent( "PLAYER_ENTERING_WORLD" )
TargetPosition:SetScript( "OnEvent", function( self, event, addon )
	G.UnitFrames.Target:ClearAllPoints()

	if( IsAddOnLoaded( "AsphyxiaUI_Raid" ) ) then
		G.UnitFrames.Target:SetPoint( "TOP", UIParent, "BOTTOM", 170 , 260 )
	elseif( IsAddOnLoaded( "AsphyxiaUI_Raid_Healing" ) ) then
		G.UnitFrames.Target:SetPoint( "TOP", UIParent, "BOTTOM", 309 , 350 )
	else
		G.UnitFrames.Target:SetPoint( "TOP", UIParent, "BOTTOM", 309 , 350 )
	end
end )