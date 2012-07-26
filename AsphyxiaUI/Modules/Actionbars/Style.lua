---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local function ActionBarStyleButtons( self )
	local name = self:GetName()
	local Count = _G[name .. "Count"]
	local Btname = _G[name .. "Name"]
	local HotKey = _G[name .. "HotKey"]

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