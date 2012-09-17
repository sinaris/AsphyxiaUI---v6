---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["addonskins"]["enable"] ~= true ) then return end

if( not IsAddOnLoaded( "CoolLine" ) ) then return end

local cl = CoolLine
local db = CoolLineDB

db.h = S.Scale( 20 )
db.bgcolor = { r = 0, g = 0, b = 0, a = 0, }
db.border = "None"
db.inactivealpha = 1.0
db.activealpha = 1.0
db.font = [[Interface\AddOns\AsphyxiaUI\Media\Fonts\Asphyxia.ttf]]
db.spellcolor = { r = S.ClassColor.r, g = S.ClassColor.g, b = S.ClassColor.b, a = 1, }

local setup = function()
	local CoolLineBackground = CreateFrame( "Frame", "CoolLineBackground", cl )
	CoolLineBackground:SetPoint( "TOPLEFT", -S.Scale( 2 ), S.Scale( 2 ) )
	CoolLineBackground:SetPoint( "BOTTOMRIGHT", S.Scale( 2 ), -S.Scale( 2 ) )
	CoolLineBackground:SetFrameLevel( cl:GetFrameLevel() - 1 )
	CoolLineBackground:SetTemplate( "Default" )
	cl.CoolLineBackground = CoolLineBackground
end

local update = function()
	db.w = ( G.ActionBars.Bar1:GetWidth() - 4 )
	db.h = ( 20 )

	cl:updatelook()
	cl:SetPoint( "BOTTOMLEFT", G.ActionBars.Bar1, "TOPLEFT", 2, 3 )
end

update()
setup()