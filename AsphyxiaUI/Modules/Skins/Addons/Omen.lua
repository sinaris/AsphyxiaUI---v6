---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( not IsAddOnLoaded( "Omen" ) or C["addonskins"]["omen"] ~= true ) then return end

if( TukuiThreatBar ) then TukuiThreatBar:Kill() end

local Omen = LibStub( "AceAddon-3.0" ):GetAddon( "Omen" )
local borderWidth = S.Scale( 2, 2 )

Omen.UpdateBarTextureSettings_ = Omen.UpdateBarTextureSettings
Omen.UpdateBarTextureSettings = function( self )
	for i, v in ipairs( self.Bars ) do
		v.texture:SetTexture( C["media"]["normTex"] )
	end
end

Omen.UpdateBarLabelSettings_ = Omen.UpdateBarLabelSettings
Omen.UpdateBarLabelSettings = function( self )
	self:UpdateBarLabelSettings_()
	for i, v in ipairs( self.Bars ) do
		v.Text1:SetFont( S.CreateFontString() )
		v.Text2:SetFont( S.CreateFontString() )
		v.Text3:SetFont( S.CreateFontString() )
	end
end

Omen.UpdateTitleBar_ = Omen.UpdateTitleBar
Omen.UpdateTitleBar = function( self )
	Omen.db.profile.Scale = 1
	Omen.db.profile.Background.EdgeSize = 1
	Omen.db.profile.Background.BarInset = borderWidth
	Omen.db.profile.TitleBar.UseSameBG = true
	self:UpdateTitleBar_()
	self.Title:SetHeight( 23 )
	self.TitleText:SetFont( S.CreateFontString() )
	self.TitleText:ClearAllPoints()
	self.TitleText:SetPoint( "CENTER" )
	self.BarList:SetPoint( "TOPLEFT", self.Title, "BOTTOMLEFT", 0, -1 )
end

Omen.UpdateBackdrop_ = Omen.UpdateBackdrop
Omen.UpdateBackdrop = function( self )
	Omen.db.profile.Scale = 1
	Omen.db.profile.Background.EdgeSize = 1
	Omen.db.profile.Background.BarInset = borderWidth
	self:UpdateBackdrop_()
	self.BarList:SetTemplate( "Transparent" )
	self.Title:SetTemplate( "Transparent" )
	self.BarList:SetPoint( "TOPLEFT", self.Title, "BOTTOMLEFT", 0, -1 )
end

local omen_mt = getmetatable( Omen.Bars )
local oldidx = omen_mt.__index
omen_mt.__index = function( self, barID )
	local bar = oldidx( self, barID )
	Omen:UpdateBarTextureSettings()
	Omen:UpdateBarLabelSettings()
	return bar
end

Omen.db.profile.Bar.Spacing = 2
Omen.db.profile.Bar.Height = 15
Omen.db.profile.Bar.ShowHeadings = false

Omen:UpdateBarTextureSettings()
Omen:UpdateBarLabelSettings()
Omen:UpdateTitleBar()
Omen:UpdateBackdrop()
Omen:ReAnchorBars()
Omen:ResizeBars()

if( C["addonskins"]["embedright"] ~= "omen" ) then return end

Omen.db.profile.Locked = true
Omen:UpdateGrips()
Omen.UpdateGrips = function( ... )
	local db = Omen.db.profile
	Omen.VGrip1:ClearAllPoints()
	Omen.VGrip1:SetPoint( "TOPLEFT", Omen.BarList, "TOPLEFT", db.VGrip1, 0 )
	Omen.VGrip1:SetPoint( "BOTTOMLEFT", Omen.BarList, "BOTTOMLEFT", db.VGrip1, 0 )
	Omen.VGrip2:ClearAllPoints()
	Omen.VGrip2:SetPoint( "TOPLEFT", Omen.BarList, "TOPLEFT", db.VGrip2, 0 )
	Omen.VGrip2:SetPoint( "BOTTOMLEFT", Omen.BarList, "BOTTOMLEFT", db.VGrip2, 0 )
	Omen.Grip:Hide()
	if( db.Locked ) then
		Omen.VGrip1:Hide()
		Omen.VGrip2:Hide()
	else
		Omen.VGrip1:Show()
		if( db.Bar.ShowTPS ) then
			Omen.VGrip2:Show()
		else
			Omen.VGrip2:Hide()
		end
	end
end

local EmbeddingWindow = CreateFrame( "Frame" )
EmbeddingWindow:RegisterEvent( "PLAYER_ENTERING_WORLD" )
EmbeddingWindow:SetScript( "OnEvent", function( self, event )
	if( event == "PLAYER_ENTERING_WORLD" ) then
		OmenTitle:Kill()
		OmenAnchor:ClearAllPoints()
		OmenAnchor:SetPoint( "TOPLEFT", AsphyxiaUIEmbedRightBackground or G.Panels.RightChatBackground, "TOPLEFT", 0, 16 )
		OmenAnchor:SetWidth( C["chat"]["width"] )
		OmenAnchor:SetHeight( C["chat"]["height"] + 12 )
		OmenAnchor:SetFrameStrata( "MEDIUM" )
	end
end )