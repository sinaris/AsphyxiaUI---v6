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
		G.UnitFrames.TargetTarget:SetBackdrop( nil )
		G.UnitFrames.TargetTarget:SetBackdropColor( 0, 0, 0 )
		G.UnitFrames.TargetTarget.shadow:Kill()
	end

	------------------------------
	-- panel
	------------------------------
	do
		G.UnitFrames.TargetTarget.panel:ClearAllPoints()
		G.UnitFrames.TargetTarget.panel:SetPoint( "TOP", G.UnitFrames.TargetTarget, "BOTTOM", 0, 26 )
		G.UnitFrames.TargetTarget.panel:SetHeight( 12 )
		G.UnitFrames.TargetTarget.panel:SetWidth( 104 )
	end

	------------------------------
	-- health
	------------------------------
	do
		G.UnitFrames.TargetTarget.Health:Size( 220, 19 )
		G.UnitFrames.TargetTarget.Health:SetStatusBarTexture( C["media"]["glamour"] )
		G.UnitFrames.TargetTarget.Health:SetFrameLevel( 5 )
		G.UnitFrames.TargetTarget.Health:CreateBorder()

		G.UnitFrames.TargetTarget.Health.colorTapping = false
		G.UnitFrames.TargetTarget.Health.colorDisconnected = false
		G.UnitFrames.TargetTarget.Health.colorClass = false
		G.UnitFrames.TargetTarget.Health:SetStatusBarColor( 0.2, 0.2, 0.2, 1 )
		G.UnitFrames.TargetTarget.Health.bg:SetTexture( 0.6, 0.6, 0.6 )
		G.UnitFrames.TargetTarget.Health.bg:SetVertexColor( 0, 0, 0 )

		G.UnitFrames.TargetTarget.Name:SetFont( S.CreateFontString() )
	end

	------------------------------
	-- power
	------------------------------
	do

	end

	------------------------------
	-- castbar
	------------------------------
	do
		if( C["unitframes"]["unitcastbar"] == true ) then

		end
	end

	------------------------------
	-- size, position
	------------------------------
	do
		G.UnitFrames.TargetTarget:Size( 100, 50 )
		G.UnitFrames.TargetTarget:ClearAllPoints()
		G.UnitFrames.TargetTarget:SetPoint( "TOPRIGHT", G.UnitFrames.Target, "BOTTOMRIGHT", 0, -7 )
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