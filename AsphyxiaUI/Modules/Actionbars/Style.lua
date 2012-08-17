---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local function ActionBarStyleButtons( self )
	local name = self:GetName()
	local Count = _G[name .. "Count"]
	local Btname = _G[name .. "Name"]
	local HotKey = _G[name .. "HotKey"]

	if( name:match( "MultiCast" ) ) then return end

	if( name:match( "ExtraActionButton" ) ) then return end

	Count:ClearAllPoints()
	Count:Point( "BOTTOMRIGHT", 0, 2 )
	Count:SetFont( S.CreateFontString() )

	if( C["actionbar"]["macrotext"] ~= true ) then
		if( Btname ) then
			Btname:SetText( "" )
			Btname:Kill()
		end
	else
		if( Btname ) then
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
		local color = RAID_CLASS_COLORS[S.myclass]
		self.overlay:Hide()
		ActionButton_HideOverlayGlow( self )
		self.shine = SpellBook_GetAutoCastShine()
		self.shine:Show()
		self.shine:SetParent( self )
		self.shine:SetPoint( "CENTER", self, "CENTER" )
		AutoCastShine_AutoCastStart( self.shine, color.r, color.g, color.b )

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