---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["unitframes"]["enable"] ~= true ) then return end

if( C["global"]["unitframelayout"] == "asphyxia" ) then
	print("uf layout: asphyxia")
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
		G.UnitFrames.FocusTarget:SetBackdrop( nil )
		G.UnitFrames.FocusTarget:SetBackdropColor( 0, 0, 0 )
		G.UnitFrames.FocusTarget.shadow:Kill()
	end

	------------------------------
	-- panel
	------------------------------
	do
		local panel = CreateFrame( "Frame", nil, G.UnitFrames.FocusTarget )
		panel:Size( 224, 12 )
		panel:Point( "TOP", G.UnitFrames.FocusTarget, "BOTTOM", 0, 16 )
		panel:SetTemplate( "Default" )
		panel:SetFrameLevel( 2 )
		panel:SetFrameStrata( "MEDIUM" )
		G.UnitFrames.FocusTarget.panel = panel
	end

	------------------------------
	-- health
	------------------------------
	do
		G.UnitFrames.FocusTarget.Health:Size( 220, 19 )
		G.UnitFrames.FocusTarget.Health:SetStatusBarTexture( C["media"]["glamour"] )
		G.UnitFrames.FocusTarget.Health:SetFrameLevel( 5 )
		G.UnitFrames.FocusTarget.Health:CreateBorder()

		G.UnitFrames.FocusTarget.Health.colorTapping = false
		G.UnitFrames.FocusTarget.Health.colorDisconnected = false
		G.UnitFrames.FocusTarget.Health.colorClass = false
		G.UnitFrames.FocusTarget.Health:SetStatusBarColor( 0.2, 0.2, 0.2, 1 )
		G.UnitFrames.FocusTarget.Health.bg:SetTexture( 0.6, 0.6, 0.6 )
		G.UnitFrames.FocusTarget.Health.bg:SetVertexColor( 0, 0, 0 )

		G.UnitFrames.FocusTarget.Health.value:ClearAllPoints()
		G.UnitFrames.FocusTarget.Health.value:Point( "RIGHT", G.UnitFrames.FocusTarget.panel, "RIGHT", 0, 0 )
		G.UnitFrames.FocusTarget.Health.value:SetFont( S.CreateFontString() )

		G.UnitFrames.FocusTarget.Name:ClearAllPoints()
		G.UnitFrames.FocusTarget.Name:Point( "CENTER", G.UnitFrames.FocusTarget.panel, 0, 0 )
		G.UnitFrames.FocusTarget.Name:SetFont( S.CreateFontString() )

		G.UnitFrames.FocusTarget.Power.value:ClearAllPoints()
		G.UnitFrames.FocusTarget.Power.value:Point( "LEFT", G.UnitFrames.FocusTarget.panel, "LEFT", 3, 0 )
		G.UnitFrames.FocusTarget.Power.value:SetFont( S.CreateFontString() )
	end

	------------------------------
	-- power
	------------------------------
	do
		G.UnitFrames.FocusTarget.Power:Hide()
	end

	------------------------------
	-- castbar
	------------------------------
	do
		if( C["unitframes"]["unitcastbar"] == true ) then
			G.UnitFrames.FocusTarget.Castbar:ClearAllPoints()
			G.UnitFrames.FocusTarget.Castbar:Size( 220, 16 )
			G.UnitFrames.FocusTarget.Castbar:Point( "BOTTOM", G.UnitFrames.FocusTarget, "TOP", 0, 5 )
			G.UnitFrames.FocusTarget.Castbar:SetStatusBarTexture( C["media"]["glamour"] )

			G.UnitFrames.FocusTarget.Castbar.bg:Kill()
			G.UnitFrames.FocusTarget.Castbar.bg = G.UnitFrames.FocusTarget.Castbar:CreateTexture( nil, "BORDER" )
			G.UnitFrames.FocusTarget.Castbar.bg:SetAllPoints( G.UnitFrames.FocusTarget.Castbar )
			G.UnitFrames.FocusTarget.Castbar.bg:SetTexture( C["media"]["glamour"] )
			G.UnitFrames.FocusTarget.Castbar.bg:SetVertexColor( 0.1, 0.1, 0.1 )

			G.UnitFrames.FocusTarget.Castbar:CreateBorder()

			G.UnitFrames.FocusTarget.Castbar.PostCastStart = S.PostCastStart
			G.UnitFrames.FocusTarget.Castbar.PostChannelStart = S.PostCastStart

			if( C["unitframes"]["cbicons"] == true ) then
				G.UnitFrames.FocusTarget.Castbar.button:Hide()
			else
				G.UnitFrames.FocusTarget.Castbar.button:Hide()
			end

			G.UnitFrames.FocusTarget.Castbar.Text:SetFont( S.CreateFontString() )
			G.UnitFrames.FocusTarget.Castbar.Time:SetFont( S.CreateFontString() )
		end
	end

	------------------------------
	-- buffs, debuffs
	------------------------------
	do
		if( C["unitframes"]["targetauras"] == true ) then
			G.UnitFrames.FocusTarget.Debuffs:ClearAllPoints()
			G.UnitFrames.FocusTarget.Debuffs:Point( "RIGHT", G.UnitFrames.FocusTarget, "LEFT", -5, 3 )
			G.UnitFrames.FocusTarget.Debuffs.ClearAllPoints = S.dummy
			G.UnitFrames.FocusTarget.Debuffs.SetPoint = S.dummy

			if( G.UnitFrames.FocusTarget.Debuffs ) then
				for _, frames in pairs( { G.UnitFrames.FocusTarget.Debuffs } ) do
					if( not frames ) then return end

					frames:Size( 300, 37 )
					frames.size = 38
					frames.num = 5

					hooksecurefunc( frames, "PostCreateIcon", S.SkinAura )
				end
			end
		end
	end

	------------------------------
	-- size, position
	------------------------------
	do
		G.UnitFrames.FocusTarget:Size( 220, 40 )
		G.UnitFrames.FocusTarget:ClearAllPoints()
		G.UnitFrames.FocusTarget:SetPoint( "BOTTOMLEFT", G.UnitFrames.Focus, "TOPLEFT", 0, 12 )
	end

elseif( C["global"]["unitframelayout"] == "merith" ) then
	print("uf layout: merith")
elseif( C["global"]["unitframelayout"] == "merith2" ) then
	print("uf layout: merith2")
elseif( C["global"]["unitframelayout"] == "sinaris" ) then
	print("uf layout: sinaris")
elseif( C["global"]["unitframelayout"] == "smelly" ) then
	print("uf layout: smelly")
end