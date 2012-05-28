---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["panellayout"] ~= "jasje" ) then return end

if( C["actionbar"]["enable"] ~= true ) then return end

local active = {}
local hooked = {}

local function OnShow( self )
	active[self] = true
end

local function OnHide( self )
	active[self] = nil
end

local function Update( self )
	if( self.timer and self.timer.text ) then
		local font = self.timer.text:GetFont()
			self.timer.text:SetFont( C["media"]["pixel_normal"], 20, "OUTLINE" )
	end
end

local EventWatcher = CreateFrame( "Frame" )
EventWatcher:SetScript( "OnEvent", function( self, event )
	for cooldown in pairs( active ) do
		Update( cooldown )
	end
end )
EventWatcher:RegisterEvent( "ACTIONBAR_UPDATE_COOLDOWN" )

local function Register( frame )
	local cooldown = frame.cooldown
	if( not hooked[cooldown] ) then
		cooldown:HookScript( "OnShow", OnShow )
		cooldown:HookScript( "OnHide", OnHide )
	end
end

if( _G["ActionBarButtonEventsFrame"].frames ) then
	for i, frame in pairs( _G["ActionBarButtonEventsFrame"].frames ) do
		Register( frame )
	end
end

hooksecurefunc( "ActionBarButtonEventsFrame_RegisterFrame", Register )