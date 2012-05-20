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
		G.UnitFrames.Player:SetBackdrop( nil )
		G.UnitFrames.Player:SetBackdropColor( 0, 0, 0 )
		G.UnitFrames.Player.shadow:Kill()
		G.UnitFrames.Player.panel:Kill()
	end

	------------------------------
	-- health
	------------------------------
	do
		G.UnitFrames.Player.Health:Size( 230, 26 )
		G.UnitFrames.Player.Health:SetStatusBarTexture( C["media"]["normal"] )
		G.UnitFrames.Player.Health:SetFrameLevel( 5 )
		G.UnitFrames.Player.Health:CreateBorder()
		G.UnitFrames.Player.Health.bg:SetTexture( 0.6, 0.6, 0.6 )

		if( C["unitframes"]["unicolor"] == true ) then
			G.UnitFrames.Player.Health.colorTapping = false
			G.UnitFrames.Player.Health.colorDisconnected = false
			G.UnitFrames.Player.Health.colorClass = false
			G.UnitFrames.Player.Health:SetStatusBarColor( .125, .125, .125, 1 )
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
		G.UnitFrames.Player.Power:Size( 230, 2 )
		G.UnitFrames.Player.Power:SetStatusBarTexture( C["media"]["normal"] )
		G.UnitFrames.Player.Power:ClearAllPoints()
		G.UnitFrames.Player.Power:Point( "TOPRIGHT", G.UnitFrames.Player.Health, "BOTTOMRIGHT", 0, -7 )
		G.UnitFrames.Player.Power:SetFrameLevel( G.UnitFrames.Player.Health:GetFrameLevel() + 2 )
		G.UnitFrames.Player.Power:CreateBorder()

		G.UnitFrames.Player.Power.value = S.SetFontString( G.UnitFrames.Player.Health, S.CreateFontString() )
		G.UnitFrames.Player.Power.value:Point( "LEFT", G.UnitFrames.Player.Health, "LEFT", 4, 1 )
	end

	------------------------------
	-- portraits
	------------------------------
	do
		if( C["unitframes"]["charportrait"] == true ) then
			G.UnitFrames.Player.Portrait:ClearAllPoints()
			G.UnitFrames.Player.Portrait:SetAllPoints( G.UnitFrames.Player.Health )
			G.UnitFrames.Player.Portrait:SetAlpha( 0.2 )
			G.UnitFrames.Player.Portrait.SetAlpha = S.dummy
			G.UnitFrames.Player.Health:ClearAllPoints()
			G.UnitFrames.Player.Health:SetPoint( "TOPLEFT", 0, 0 )
			G.UnitFrames.Player.Health:SetPoint( "TOPRIGHT" )
			G.UnitFrames.Player.Portrait:SetFrameLevel( G.UnitFrames.Player.Health:GetFrameLevel() )
		end
	end

	------------------------------
	-- classicons
	------------------------------
	do
		if( C["unitframes"]["classicons"] == true ) then
			local classicon = CreateFrame( "Frame", G.UnitFrames.Player:GetName() .. "_ClassIconBorder", G.UnitFrames.Player )
			classicon:CreatePanel( "Default", 30, 30, "TOPRIGHT", G.UnitFrames.Player.Health, "TOPLEFT", -5, 2 )

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
		G.UnitFrames.Player.FlashInfo.ManaLevel = S.SetFontString( FlashInfo, S.CreateFontString() )
		G.UnitFrames.Player.FlashInfo.ManaLevel:SetPoint( "CENTER", G.UnitFrames.Player.Health, "CENTER", 0, 1 )
	end

	------------------------------
	-- experience
	------------------------------
	do

	end

	------------------------------
	-- reputation
	------------------------------
	do

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
	-- position, size
	------------------------------
	do
		G.UnitFrames.Player:Size( 230, 26 )
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
	print("uf layout: jasje")

	------------------------------
	-- not needed
	------------------------------
	do
		G.UnitFrames.Player:SetBackdrop( nil )
		G.UnitFrames.Player:SetBackdropColor( 0, 0, 0 )
		G.UnitFrames.Player.shadow:Kill()
	end

	------------------------------
	-- panel
	------------------------------
	do
		G.UnitFrames.Player.panel:ClearAllPoints()
		G.UnitFrames.Player.panel:SetPoint( "TOP", G.UnitFrames.Player, "BOTTOM", 0, 16 )
		G.UnitFrames.Player.panel:SetHeight( 12 )
		G.UnitFrames.Player.panel:SetWidth( 224 )
	end

	------------------------------
	-- health
	------------------------------
	do
		G.UnitFrames.Player.Health:Size( 220, 19 )
		G.UnitFrames.Player.Health:SetStatusBarTexture( C["media"]["glamour"] )
		G.UnitFrames.Player.Health:SetFrameLevel( 5 )
		G.UnitFrames.Player.Health:CreateBorder()

		G.UnitFrames.Player.Health.colorTapping = false
		G.UnitFrames.Player.Health.colorDisconnected = false
		G.UnitFrames.Player.Health.colorClass = false
		G.UnitFrames.Player.Health:SetStatusBarColor( 0.2, 0.2, 0.2, 1 )
		G.UnitFrames.Player.Health.bg:SetTexture( 0.6, 0.6, 0.6 )
		G.UnitFrames.Player.Health.bg:SetVertexColor( 0, 0, 0 )

		G.UnitFrames.Player.Health.value:SetFont( S.CreateFontString() )
	end

	------------------------------
	-- power
	------------------------------
	do
		G.UnitFrames.Player.Power:Size( 220, 3 )
		G.UnitFrames.Player.Power:ClearAllPoints()
		G.UnitFrames.Player.Power:Point( "LEFT", G.UnitFrames.Player.Health, "BOTTOMLEFT", 0, -9 )
		G.UnitFrames.Player.Power:SetFrameLevel( 3 )
		G.UnitFrames.Player.Power:CreateBorder()

		G.UnitFrames.Player.Power.value:SetFont( C["media"]["pixel_normal"], 12, "OUTLINEMONOCHROME" )
	end

	------------------------------
	-- portraits
	------------------------------
	do
		if( C["unitframes"]["charportrait"] == true ) then
			G.UnitFrames.Player.Portrait:ClearAllPoints()
			G.UnitFrames.Player.Portrait:SetAllPoints( G.UnitFrames.Player.Health )
			G.UnitFrames.Player.Portrait:SetAlpha( 0.2 )
			G.UnitFrames.Player.Portrait.SetAlpha = S.dummy
			G.UnitFrames.Player.Health:ClearAllPoints()
			G.UnitFrames.Player.Health:SetPoint( "TOPLEFT", 0, 0 )
			G.UnitFrames.Player.Health:SetPoint( "TOPRIGHT" )
			G.UnitFrames.Player.Portrait:SetFrameLevel( G.UnitFrames.Player.Health:GetFrameLevel() )
		end
	end

	------------------------------
	-- classicons
	------------------------------
	do
		if( C["unitframes"]["classicons"] == true ) then
			local classicon = CreateFrame( "Frame", G.UnitFrames.Player:GetName() .. "_ClassIconBorder", G.UnitFrames.Player )
			classicon:CreatePanel( "Default", 33, 33, "TOPRIGHT", G.UnitFrames.Player.Health, "TOPLEFT", -5, 2 )

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

	end

	------------------------------
	-- mana flash
	------------------------------
	do

	end

	------------------------------
	-- experience
	------------------------------
	do

	end

	------------------------------
	-- reputation
	------------------------------
	do

	end

	------------------------------
	-- combat feedback
	------------------------------
	do
		G.UnitFrames.Player.CombatFeedbackText:Kill()
	end

	------------------------------
	-- druidmana
	------------------------------
	do

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

			end

			------------------------------
			-- warlock, paladin
			------------------------------
			if( S.myclass == "WARLOCK" or S.myclass == "PALADIN" ) then

			end

			------------------------------
			-- deathknight
			------------------------------
			if( S.myclass == "DEATHKNIGHT" ) then

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
			G.UnitFrames.Player.Castbar:SetHeight( S.Scale( 25 ) )
			G.UnitFrames.Player.Castbar:Point( "BOTTOMRIGHT", TukuiBar4, "TOPRIGHT", -2, 4 )
			G.UnitFrames.Player.Castbar:SetStatusBarTexture( C["media"]["glamour"] )
			G.UnitFrames.Player.Castbar:CreateBorder()
			G.UnitFrames.Player.Castbar.bg:SetVertexColor( 0.1, 0.1, 0.1 )

			if( C["unitframes"]["cbicons"] == true ) then
				G.UnitFrames.Player.Castbar:Width( G.ActionBars.Bar1:GetWidth() - 34 )

				G.UnitFrames.Player.Castbar.button:ClearAllPoints()
				G.UnitFrames.Player.Castbar.button:SetPoint( "LEFT", -32, S.Scale( 0 ) )
				G.UnitFrames.Player.Castbar.button:Size( 29 )
				G.UnitFrames.Player.Castbar.button.shadow:Kill()
			else
				G.UnitFrames.Player.Castbar:Width( G.ActionBars.Bar1:GetWidth() -4 )
			end

			G.UnitFrames.Player.Castbar.PostCastStart = S.PostCastStart
			G.UnitFrames.Player.Castbar.PostChannelStart = S.PostCastStart

			G.UnitFrames.Player.Castbar.Time = S.SetFontString( G.UnitFrames.Player.Castbar, C["media"]["pixel_normal"], 12, "OUTLINEMONOCHROME" )
			G.UnitFrames.Player.Castbar.Time:Point("RIGHT", G.UnitFrames.Player.Castbar, "RIGHT", -4, 0)

			G.UnitFrames.Player.Castbar.Text = S.SetFontString( G.UnitFrames.Player.Castbar, C["media"]["pixel_normal"], 12, "OUTLINEMONOCHROME" )
			G.UnitFrames.Player.Castbar.Text:Point( "LEFT", G.UnitFrames.Player.Castbar, "LEFT", 4, 0 )
		end
	end

	------------------------------
	-- position, size
	------------------------------
	do
		G.UnitFrames.Player:Size( 220, 50 )
	end

elseif( C["global"]["unitframelayout"] == "merith" ) then
	print("uf layout: merith")
elseif( C["global"]["unitframelayout"] == "merith2" ) then
	print("uf layout: merith2")
elseif( C["global"]["unitframelayout"] == "sinaris" ) then
	print("uf layout: sinaris")
end

local f = CreateFrame( "Frame" )
f:RegisterEvent( "PLAYER_ENTERING_WORLD" )
f:SetScript( "OnEvent", function( self, event, addon )
	G.UnitFrames.Player:ClearAllPoints()

	if( IsAddOnLoaded( "AsphyxiaUI_Raid" ) or IsAddOnLoaded( "Tukui_Raid" ) ) then
		G.UnitFrames.Player:SetPoint( "TOP", UIParent, "BOTTOM", -170 , 260 )
	elseif( IsAddOnLoaded( "AsphyxiaUI_Raid_Healing" ) or IsAddOnLoaded( "Tukui_Raid_Healing" ) ) then
		G.UnitFrames.Player:SetPoint( "TOP", UIParent, "BOTTOM", -309 , 350 )
	else
		G.UnitFrames.Player:SetPoint( "TOP", UIParent, "BOTTOM", -309 , 350 )
	end
end )