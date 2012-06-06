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
		G.UnitFrames.Focus:SetBackdrop( nil )
		G.UnitFrames.Focus:SetBackdropColor( 0, 0, 0 )
		G.UnitFrames.Focus.shadow:Kill()
	end

	------------------------------
	-- panel
	------------------------------
	do
		local panel = CreateFrame( "Frame", nil, G.UnitFrames.Focus )
		panel:Size( 224, 12 )
		panel:Point( "TOP", G.UnitFrames.Focus, "BOTTOM", 0, 16 )
		panel:SetTemplate( "Default" )
		panel:SetFrameLevel( 2 )
		panel:SetFrameStrata( "MEDIUM" )
		G.UnitFrames.Focus.panel = panel
	end

	------------------------------
	-- health
	------------------------------
	do
		G.UnitFrames.Focus.Health:Size( 220, 19 )
		G.UnitFrames.Focus.Health:SetStatusBarTexture( C["media"]["glamour"] )
		G.UnitFrames.Focus.Health:SetFrameLevel( 5 )
		G.UnitFrames.Focus.Health:CreateBorder()

		G.UnitFrames.Focus.Health.colorTapping = false
		G.UnitFrames.Focus.Health.colorDisconnected = false
		G.UnitFrames.Focus.Health.colorClass = false
		G.UnitFrames.Focus.Health:SetStatusBarColor( 0.2, 0.2, 0.2, 1 )
		G.UnitFrames.Focus.Health.bg:SetTexture( 0.6, 0.6, 0.6 )
		G.UnitFrames.Focus.Health.bg:SetVertexColor( 0, 0, 0 )

		G.UnitFrames.Focus.Health.value:ClearAllPoints()
		G.UnitFrames.Focus.Health.value:Point( "RIGHT", G.UnitFrames.Focus.panel, "RIGHT", 0, 0 )
		G.UnitFrames.Focus.Health.value:SetFont( S.CreateFontString() )

		G.UnitFrames.Focus.Name:ClearAllPoints()
		G.UnitFrames.Focus.Name:Point( "CENTER", G.UnitFrames.Focus.panel, 0, 0 )
		G.UnitFrames.Focus.Name:SetFont( S.CreateFontString() )

		G.UnitFrames.Focus.Power.value:ClearAllPoints()
		G.UnitFrames.Focus.Power.value:Point( "LEFT", G.UnitFrames.Focus.panel, "LEFT", 3, 0 )
		G.UnitFrames.Focus.Power.value:SetFont( S.CreateFontString() )
	end

	------------------------------
	-- power
	------------------------------
	do
		G.UnitFrames.Focus.Power:Hide()
	end

	------------------------------
	-- castbar
	------------------------------
	do
		if( C["unitframes"]["unitcastbar"] == true ) then
			G.UnitFrames.Focus.Castbar:ClearAllPoints()
			G.UnitFrames.Focus.Castbar:Size( 380, 25 )
			G.UnitFrames.Focus.Castbar:Point( "CENTER", UIParent, 0, 160 )
			G.UnitFrames.Focus.Castbar:SetStatusBarTexture( C["media"]["glamour"] )

			G.UnitFrames.Focus.Castbar.bg:Kill()
			G.UnitFrames.Focus.Castbar.bg = G.UnitFrames.Focus.Castbar:CreateTexture( nil, "BORDER" )
			G.UnitFrames.Focus.Castbar.bg:SetAllPoints( G.UnitFrames.Focus.Castbar )
			G.UnitFrames.Focus.Castbar.bg:SetTexture( C["media"]["glamour"] )
			G.UnitFrames.Focus.Castbar.bg:SetVertexColor( 0.1, 0.1, 0.1 )

			G.UnitFrames.Focus.Castbar:CreateBorder()

			G.UnitFrames.Focus.Castbar.PostCastStart = S.PostCastStart
			G.UnitFrames.Focus.Castbar.PostChannelStart = S.PostCastStart

			if( C["unitframes"]["cbicons"] == true ) then
				G.UnitFrames.Focus.Castbar.button:ClearAllPoints()
				G.UnitFrames.Focus.Castbar.button:Point( "CENTER", 0, 38 )
				G.UnitFrames.Focus.Castbar.button:Size( 40 )
			else
				G.UnitFrames.Focus.Castbar.button:Hide()
			end

			G.UnitFrames.Focus.Castbar.Text:SetFont( S.CreateFontString() )
			G.UnitFrames.Focus.Castbar.Time:SetFont( S.CreateFontString() )
		end
	end

	------------------------------
	-- buffs, debuffs
	------------------------------
	do
		if( C["unitframes"]["targetauras"] == true ) then
			G.UnitFrames.Focus.Debuffs:ClearAllPoints()
			G.UnitFrames.Focus.Debuffs:Point( "RIGHT", G.UnitFrames.Focus, "LEFT", -5, 3 )
			G.UnitFrames.Focus.Debuffs.ClearAllPoints = S.dummy
			G.UnitFrames.Focus.Debuffs.SetPoint = S.dummy

			if( G.UnitFrames.Focus.Debuffs ) then
				for _, frames in pairs( { G.UnitFrames.Focus.Debuffs } ) do
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
		G.UnitFrames.Focus:Size( 220, 40 )
		G.UnitFrames.Focus:ClearAllPoints()
		G.UnitFrames.Focus:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 12 )
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