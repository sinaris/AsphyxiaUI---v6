---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local function ActionBarStyleButtons( self )
	local name = self:GetName()
	local action = self.action
	local Button = self
	local Count = _G[name .. "Count"]
	local Btname = _G[name .. "Name"]
	local HotKey = _G[name .. "HotKey"]
	local normal  = _G[name .. "NormalTexture"]

	Count:ClearAllPoints()
	Count:Point( "BOTTOMRIGHT", 0, 2 )
	Count:SetFont( S.CreateFontString() )

	if( Btname and normal and C["actionbar"]["macro"] == true ) then
		local query = GetActionText( action )
		if( query ) then
			local text = string.sub( query, 1, 5 )
			Btname:SetText( text )
			Btname:SetAlphaGradient( 0, Button:GetWidth() )
			Btname:SetFont( S.CreateFontString() )
		end
	end

	HotKey:ClearAllPoints()
	HotKey:Point( "TOPRIGHT", 0, -3 )
	HotKey:SetFont( S.CreateFontString() )
	HotKey.ClearAllPoints = S.dummy
	HotKey.SetPoint = S.dummy

	if( C["actionbar"]["hotkey"] ~= true ) then
		HotKey:SetText( "" )
		HotKey:Kill()
	end
end

hooksecurefunc( "ActionButton_Update", ActionBarStyleButtons )

function S.ShowHighlightActionButton( self )
	if( self.overlay ) then
		self.overlay:Hide()
		ActionButton_HideOverlayGlow( self )
		self.shine = SpellBook_GetAutoCastShine()
		self.shine:Show()
		self.shine:SetParent( self )
		self.shine:SetPoint( "CENTER", self, "CENTER" )
		AutoCastShine_AutoCastStart( self.shine, S.ClassColor.r, S.ClassColor.g, S.ClassColor.b )

		for _, sparkle in next, self.shine.sparkles do
			sparkle:SetHeight( sparkle:GetHeight() * 2 )
			sparkle:SetWidth( sparkle:GetWidth() * 2 )
		end
	end
end

function S.HideHighlightActionButton( self )
	if( self.shine ) then
		AutoCastShine_AutoCastStop( self.shine )
	end
end

hooksecurefunc( "ActionButton_ShowOverlayGlow", S.ShowHighlightActionButton )
hooksecurefunc( "ActionButton_HideOverlayGlow", S.HideHighlightActionButton )

S.SetDefaultActionButtonCooldownFont = C["media"]["asphyxia"]