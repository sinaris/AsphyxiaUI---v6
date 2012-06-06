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
		G.UnitFrames.Pet:SetBackdrop( nil )
		G.UnitFrames.Pet:SetBackdropColor( 0, 0, 0 )
		G.UnitFrames.Pet.shadow:Kill()
	end

	------------------------------
	-- panel
	------------------------------
	do
		G.UnitFrames.Pet.panel:ClearAllPoints()
		G.UnitFrames.Pet.panel:SetPoint( "TOP", G.UnitFrames.Pet, "BOTTOM", 0, 26 )
		G.UnitFrames.Pet.panel:SetHeight( 12 )
		G.UnitFrames.Pet.panel:SetWidth( 104 )
	end

	------------------------------
	-- health
	------------------------------
	do
		G.UnitFrames.Pet.Health:Size( 220, 19 )
		G.UnitFrames.Pet.Health:SetStatusBarTexture( C["media"]["glamour"] )
		G.UnitFrames.Pet.Health:SetFrameLevel( 5 )
		G.UnitFrames.Pet.Health:CreateBorder()

		G.UnitFrames.Pet.Health.colorTapping = false
		G.UnitFrames.Pet.Health.colorDisconnected = false
		G.UnitFrames.Pet.Health.colorClass = false
		G.UnitFrames.Pet.Health:SetStatusBarColor( 0.2, 0.2, 0.2, 1 )
		G.UnitFrames.Pet.Health.bg:SetTexture( 0.6, 0.6, 0.6 )
		G.UnitFrames.Pet.Health.bg:SetVertexColor( 0, 0, 0 )

		G.UnitFrames.Pet.Name:ClearAllPoints()
		G.UnitFrames.Pet.Name:Point( "CENTER", G.UnitFrames.Pet.panel, "CENTER", 0, 1 )
		G.UnitFrames.Pet.Name:SetFont( S.CreateFontString() )
	end

	------------------------------
	-- power
	------------------------------
	do
		G.UnitFrames.Pet.Power:Kill()
	end

	------------------------------
	-- size, position
	------------------------------
	do
		G.UnitFrames.Pet:Size( 100, 50 )
		G.UnitFrames.Pet:ClearAllPoints()
		G.UnitFrames.Pet:SetPoint( "TOPLEFT", G.UnitFrames.Target, "BOTTOMLEFT", 0, -7 )
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