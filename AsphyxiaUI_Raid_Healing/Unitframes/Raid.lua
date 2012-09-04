---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

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
		"initial-width", S.Scale( 68 * C["unitframes"]["gridscale"] * S.raidscale ) * C["unitframes"].gridscale * S.raidscale,
		"initial-height", S.Scale( 32 * C["unitframes"]["gridscale"] * S.raidscale ) * C["unitframes"].gridscale * S.raidscale,
		"showParty", true,
		"showRaid", true,
		"showPlayer", true,
		"showSolo", true,
		"xoffset", S.Scale( 7 ),
		"yOffset", S.Scale( -5 ),
		"point", "LEFT",
		"groupFilter", "1,2,3,4,5,6,7,8",
		"groupingOrder", "1,2,3,4,5,6,7,8",
		"groupBy", "GROUP",
		"maxColumns", 8,
		"unitsPerColumn", 5,
		"columnSpacing", S.Scale( 7 ),
		"columnAnchorPoint", "TOP"
end

S.PostUpdateRaidUnit = function( self )
	------------------------------
	-- misc
	------------------------------
	self.panel:Kill()
	self:SetBackdropColor( 0.0, 0.0, 0.0, 0.0 )

	local panel = CreateFrame( "Frame", nil, self )
	panel:SetTemplate( "Transparent" )
	panel:Point( "TOPRIGHT", self, "TOPRIGHT", 2, 2 )
	panel:Point( "BOTTOMLEFT", self, "BOTTOMLEFT", -2, -2 )
	panel:SetFrameLevel( 1 )
	self.panel = panel

	------------------------------
	-- health
	------------------------------
	self.Health:ClearAllPoints()
	self.Health:SetAllPoints( self )
	self.Health:SetStatusBarTexture( C["media"]["normTex"] )
	self.Health:SetFrameLevel( 2 )
	self.Health.colorDisconnected = false
	self.Health.colorClass = false
	self.Health:SetStatusBarColor( 0.2, 0.2, 0.2, 1 )
	self.Health.bg:SetTexture( 0.6, 0.6, 0.6 )
	self.Health.bg:SetVertexColor( 0, 0, 0 )

	self.Health.value:Point( "CENTER", self.Health, 1, -5 )
	self.Health.value:SetFont( S.CreateFontString() )

	self.Health.PostUpdate = S.PostUpdateHealthRaid
	self.Health.frequentUpdates = true

	if( C["unitframes"]["unicolor"] == true ) then
		self.Health.colorDisconnected = false
		self.Health.colorClass = false
		self.Health:SetStatusBarColor( 0.150, 0.150, 0.150, 1 )
		self.Health.bg:SetVertexColor( 0, 0, 0, 1 )
	else
		self.Health.colorDisconnected = true
		self.Health.colorClass = true
		self.Health.colorReaction = true
	end

	if( C["unitframes"]["gradienthealth"] == true and C["unitframes"]["unicolor"] == true ) then
		self:HookScript( "OnEnter", function( self )
			if( not UnitIsConnected( self.unit ) or UnitIsDead( self.unit ) or UnitIsGhost( self.unit ) ) then return end
			local hover = RAID_CLASS_COLORS[select( 2, UnitClass( self.unit ) )]
			-- if( not hover ) then return end
			self.Health:SetStatusBarColor( hover.r, hover.g, hover.b )
			self.Health.classcolored = true
		end )

		self:HookScript( "OnLeave", function( self )
			if( not UnitIsConnected( self.unit ) or UnitIsDead( self.unit ) or UnitIsGhost( self.unit ) ) then return end
			local r, g, b = oUFTukui.ColorGradient( UnitHealth( self.unit ), UnitHealthMax( self.unit ), unpack( C["unitframes"]["gradient"] ) )
			self.Health:SetStatusBarColor( r, g, b )
			self.Health.classcolored = false
		end )
	end

	self:HighlightUnit( 1, 0, 0, 1 )

	------------------------------
	-- name
	------------------------------
	self.Name:SetParent( self.Health )
	self.Name:ClearAllPoints()
	self.Name:SetPoint( "TOP", 0, 8 )
	self.Name:SetPoint( "BOTTOM" )
	self.Name:SetPoint( "LEFT", 4, 0 )
	self.Name:SetPoint( "RIGHT" )
	self.Name:SetShadowOffset( 1.25, -1.25 )
	self.Name:SetFont( S.CreateFontString() )

	------------------------------
	-- power
	------------------------------
	self.Power:ClearAllPoints()
	self.Power:SetPoint( "CENTER", self.Health, "CENTER", 0, -10 )
	self.Power:SetHeight( 1.5 * C["unitframes"]["gridscale"] * S.raidscale )
	self.Power:SetWidth( 54 )
	self.Power:SetFrameLevel( self.Health:GetFrameLevel() + 2 )
	self.Power:CreateBackdrop( "Default" )

	------------------------------
	-- debuffs
	------------------------------
	if( C["unitframes"]["raidunitdebuffwatch"] == true ) then
		self.RaidDebuffs:Height( 21 * C["unitframes"]["gridscale"] )
		self.RaidDebuffs:Width( 21 * C["unitframes"]["gridscale"] )
		self.RaidDebuffs:Point( "CENTER", self.Health, 2, 1 )

		--self.RaidDebuffs.count:ClearAllPoints()
		self.RaidDebuffs.count:SetPoint( "CENTER", self.RaidDebuffs, -6, 6 )
		self.RaidDebuffs.count:SetFont( S.CreateFontString() )

		self.RaidDebuffs.time:ClearAllPoints()
		self.RaidDebuffs.time:SetPoint( "CENTER", self.RaidDebuffs, 2, 0 )
		self.RaidDebuffs.time:SetFont( S.CreateFontString() )
	end

	------------------------------
	-- icons
	------------------------------
	local leader = self.Health:CreateTexture( nil, "OVERLAY" )
	leader:Height( 12 * S.raidscale )
	leader:Width( 12 * S.raidscale )
	leader:SetPoint( "TOPLEFT", 0, 6 )
	self.Leader = leader

	local LFDRole = self.Health:CreateTexture( nil, "OVERLAY" )
	LFDRole:Height( 15 * S.raidscale )
	LFDRole:Width( 15 * S.raidscale )
	LFDRole:Point( "TOP", 0, 10 )
	LFDRole.Override = S.RoleIconUpdate
	self:RegisterEvent( "UNIT_CONNECTION", S.RoleIconUpdate )
	self.LFDRole = LFDRole

	local MasterLooter = self.Health:CreateTexture( nil, "OVERLAY" )
	MasterLooter:Height( 12 * S.raidscale )
	MasterLooter:Width( 12 * S.raidscale )
	self.MasterLooter = MasterLooter
	self:RegisterEvent( "PARTY_LEADER_CHANGED", S.MLAnchorUpdate )
	self:RegisterEvent( "PARTY_MEMBERS_CHANGED", S.MLAnchorUpdate )

	local Resurrect = CreateFrame( "Frame", nil, self.Health )
	Resurrect:SetFrameLevel( self.Health:GetFrameLevel() + 1 )
	Resurrect:Size( 20 )
	Resurrect:SetPoint( "CENTER" )

	local ResurrectIcon = Resurrect:CreateTexture( nil, "OVERLAY" )
	ResurrectIcon:SetAllPoints()
	ResurrectIcon:SetDrawLayer( "OVERLAY", 7 )
	self.ResurrectIcon = ResurrectIcon
end

local AsphyxiaUIRaidPosition = CreateFrame( "Frame" )
AsphyxiaUIRaidPosition:RegisterEvent( "PLAYER_LOGIN" )
AsphyxiaUIRaidPosition:SetScript( "OnEvent", function( self, event )
	local raid = G.UnitFrames.RaidUnits
	raid:ClearAllPoints()

	if( C["unitframes"]["showraidpets"] == true ) then
		local pets = G.UnitFrames.RaidPets
		pets:ClearAllPoints()
	end

	raid:SetPoint( "TOP", UIParent, "BOTTOM", 0, 415 )
end )

local MaxGroup = CreateFrame( "Frame" )
MaxGroup:RegisterEvent( "PLAYER_ENTERING_WORLD" )
MaxGroup:RegisterEvent( "ZONE_CHANGED_NEW_AREA" )
MaxGroup:SetScript( "OnEvent", function( self )
	local inInstance, instanceType = IsInInstance()
	local _, _, _, _, maxPlayers, _, _ = GetInstanceInfo()

	if( inInstance and instanceType == "raid" and maxPlayers ~= 40 ) then
		G.UnitFrames.RaidUnits:SetAttribute( "groupFilter", "1,2,3,4,5" )
	else
		G.UnitFrames.RaidUnits:SetAttribute( "groupFilter", "1,2,3,4,5,6,7,8" )
	end
end )