---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local width, height, showParty, showRaid, showPlayer, xOffset, yOffset, point, columnSpacing, columnAnchorPoint

if( C["global"]["unitframelayout"] == "asphyxia" or C["global"]["unitframelayout"] == "asphyxia2" or C["global"]["unitframelayout"] == "asphyxia3" or C["global"]["unitframelayout"] == "asphyxia4" ) then
	print("raid layout: asphyxia")

elseif( C["global"]["unitframelayout"] == "duffed" or C["global"]["unitframelayout"] == "duffed2" or C["global"]["unitframelayout"] == "merith" or C["global"]["unitframelayout"] == "merith2" ) then
	print("raid layout: duffed")

	width = 68
	height = 32
	showParty = true
	showRaid = true
	showPlayer = true
	xOffset = 7
	yOffset = -5
	point = "LEFT"
	columnSpacing = 5
	columnAnchorPoint = "TOP"

elseif( C["global"]["unitframelayout"] == "jasje" ) then
	print("raid layout: jasje")

	width = 68
	height = 32
	showParty = true
	showRaid = true
	showPlayer = true
	xOffset = 7
	yOffset = -5
	point = "LEFT"
	columnSpacing = 5
	columnAnchorPoint = "TOP"

elseif( C["global"]["unitframelayout"] == "sinaris" ) then
	print("raid layout: sinaris")

elseif( C["global"]["unitframelayout"] == "smelly" ) then
	print("raid layout: smelly")

end

S.RaidFrameAttributes = function()
	return
		"TukuiRaid",
		nil,
		"solo,raid,party",
		"oUF-initialConfigFunction", [[
			local header = self:GetParent()
			self:SetWidth( header:GetAttribute( "initial-width" ) )
			self:SetHeight( header:GetAttribute( "initial-height" ) )
		]],
		"initial-width", S.Scale( width * C["unitframes"].gridscale * S.raidscale ),
		"initial-height", S.Scale( height * C["unitframes"].gridscale * S.raidscale ),
		"showParty", true,
		"showRaid", true,
		"showPlayer", true,
		"showSolo", true,
		"xoffset", S.Scale( 3 ),
		"yOffset", S.Scale( -3 ),
		"point", point,
		"groupFilter", "1,2,3,4,5,6,7,8",
		"groupingOrder", "1,2,3,4,5,6,7,8",
		"groupBy", "GROUP",
		"maxColumns", 8,
		"unitsPerColumn", 5,
		"columnSpacing", S.Scale( columnSpacing ),
		"columnAnchorPoint", columnAnchorPoint
end

S.PostUpdateRaidUnit = function( self )
	if( C["global"]["unitframelayout"] == "asphyxia" or C["global"]["unitframelayout"] == "asphyxia2" or C["global"]["unitframelayout"] == "asphyxia3" or C["global"]["unitframelayout"] == "asphyxia4" ) then
		print("raid layout: asphyxia")

	elseif( C["global"]["unitframelayout"] == "duffed" or C["global"]["unitframelayout"] == "duffed2" or C["global"]["unitframelayout"] == "merith" or C["global"]["unitframelayout"] == "merith2" ) then
		print("raid layout: duffed")

	elseif( C["global"]["unitframelayout"] == "jasje" ) then
		print("raid layout: jasje")

		------------------------------
		-- misc
		------------------------------
		self.panel:Kill()
		self:SetBackdropColor( 0.0, 0.0, 0.0, 0.0 )

		------------------------------
		-- health
		------------------------------
		self.Health:ClearAllPoints()
		self.Health:SetAllPoints( self )
		self.Health:SetStatusBarTexture( C["media"]["glamour"] )
		self.Health:CreateBorder()

		self.Health.colorDisconnected = false
		self.Health.colorClass = false
		self.Health:SetStatusBarColor( 0.2, 0.2, 0.2, 1 )
		self.Health.bg:SetTexture( 0.6, 0.6, 0.6 )
		self.Health.bg:SetVertexColor( 0, 0, 0 )

		self.Health.value:Point( "CENTER", self.Health, 1, -5 )
		self.Health.value:SetFont( S.CreateFontString() )

		self.Health.Smooth = true

		------------------------------
		-- power
		------------------------------
		self.Power:ClearAllPoints()
		self.Power:Height( 1 )
		self.Power:CreateBorder()
		self.Power:Point( "BOTTOMLEFT", self.Health, "BOTTOMLEFT", 4, 4 )
		self.Power:Point( "BOTTOMRIGHT", self.Health, "BOTTOMRIGHT", -4, 4 )
		self.Power:SetStatusBarTexture( C["media"]["glamour"] )
		self.Power:SetFrameLevel( self.Health:GetFrameLevel() + 1 )

		self.Power.bg:SetAllPoints( self.Power )
		self.Power.bg:SetTexture( C["media"]["glamour"] )
		self.Power.bg:SetAlpha( 1 )
		self.Power.bg.multiplier = 0.4
		self.Power.colorClass = true
		self.Power.bg.multiplier = 0.1

		self.Power.Smooth = true

		------------------------------
		-- name
		------------------------------
		self.Name:SetParent( self.Health )
		self.Name:ClearAllPoints()
		self.Name:SetPoint( "TOP", 0, -5 )
		self.Name:SetFont( S.CreateFontString() )

		------------------------------
		-- debuffs
		------------------------------
		self.RaidDebuffs.count:ClearAllPoints()
		self.RaidDebuffs.count:SetPoint( "CENTER", self.Raiddebuff, -6, 6 )
		self.RaidDebuffs.count:SetFont( S.CreateFontString() )

		self.RaidDebuffs.time:ClearAllPoints()
		self.RaidDebuffs.time:SetPoint( "CENTER", self.Raiddebuff, 2, 0 )
		self.RaidDebuffs.time:SetFont( S.CreateFontString() )

		------------------------------
		-- icons
		------------------------------
		local Resurrect = CreateFrame( "Frame", nil, self.Health )
		Resurrect:SetFrameLevel( self.Health:GetFrameLevel() + 1 )
		Resurrect:Size( 20 )
		Resurrect:SetPoint( "CENTER" )

		local ResurrectIcon = Resurrect:CreateTexture( nil, "OVERLAY" )
		ResurrectIcon:SetAllPoints()
		ResurrectIcon:SetDrawLayer( "OVERLAY", 7 )
		self.ResurrectIcon = ResurrectIcon

	elseif( C["global"]["unitframelayout"] == "sinaris" ) then
		print("raid layout: sinaris")

	end
end

local AsphyxiaUIRaidPosition = CreateFrame( "Frame" )
AsphyxiaUIRaidPosition:RegisterEvent( "PLAYER_LOGIN" )
AsphyxiaUIRaidPosition:SetScript( "OnEvent", function( self, event )
	local raid = G.UnitFrames.RaidUnits
	local pets = G.UnitFrames.RaidPets
	raid:ClearAllPoints()

	if( C["global"]["unitframelayout"] == "asphyxia" or C["global"]["unitframelayout"] == "asphyxia2" or C["global"]["unitframelayout"] == "asphyxia3" or C["global"]["unitframelayout"] == "asphyxia4" ) then
		print("raid layout: asphyxia")
	
	elseif( C["global"]["unitframelayout"] == "duffed" or C["global"]["unitframelayout"] == "duffed2" or C["global"]["unitframelayout"] == "merith" or C["global"]["unitframelayout"] == "merith2" ) then
		print("raid layout: duffed")
	
	elseif( C["global"]["unitframelayout"] == "jasje" ) then
		print("raid layout: jasje")
	
		raid:SetPoint( "CENTER", UIParent, "CENTER", -250, 20 )
	
	elseif( C["global"]["unitframelayout"] == "sinaris" ) then
		print("raid layout: sinaris")
	
	elseif( C["global"]["unitframelayout"] == "smelly" ) then
		print("raid layout: smelly")
	
	end
end )