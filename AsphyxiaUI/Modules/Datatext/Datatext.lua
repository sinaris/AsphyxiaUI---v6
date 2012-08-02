---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local DataTextPosition = function( frame, object, point )
	local InfoLeft = G.Panels.DataTextLeft
	local InfoRight = G.Panels.DataTextRight
	local DataCenter = AsphyxiaUIInfoCenter
	local DataLeft = AsphyxiaUIInfoCenterLeft
	local DataRight = AsphyxiaUIInfoCenterRight
	local Minimap = AsphyxiaUITimeWatch

	object:ClearAllPoints()

	if( point == 1 ) then
		object:SetParent( InfoLeft )
		object:SetHeight( InfoLeft:GetHeight() )
		object:SetPoint( "LEFT", InfoLeft, 30, 1 )
		object:SetPoint( "TOP", InfoLeft )
		object:SetPoint( "BOTTOM", InfoLeft )
	elseif( point == 2 ) then
		object:SetParent( InfoLeft )
		object:SetHeight( InfoLeft:GetHeight() )
		object:SetPoint( "TOP", InfoLeft )
		object:SetPoint( "BOTTOM", InfoLeft )
	elseif( point == 3 ) then
		object:SetParent( InfoLeft )
		object:SetHeight( InfoLeft:GetHeight() )
		object:SetPoint( "RIGHT", InfoLeft, -30, 1 )
		object:SetPoint( "TOP", InfoLeft )
		object:SetPoint( "BOTTOM", InfoLeft )
	elseif( point == 4 ) then
		object:SetParent( InfoRight )
		object:SetHeight( InfoRight:GetHeight() )
		object:SetPoint( "LEFT", InfoRight, 30, 1 )
		object:SetPoint( "TOP", InfoRight )
		object:SetPoint( "BOTTOM", InfoRight )
	elseif( point == 5 ) then
		object:SetParent( InfoRight )
		object:SetHeight( InfoRight:GetHeight() )
		object:SetPoint( "TOP", InfoRight )
		object:SetPoint( "BOTTOM", InfoRight )
	elseif( point == 6 ) then
		object:SetParent( InfoRight )
		object:SetHeight( InfoRight:GetHeight() )
		object:SetPoint( "RIGHT", InfoRight, -30, 1 )
		object:SetPoint( "TOP", InfoRight )
		object:SetPoint( "BOTTOM", InfoRight )
	elseif( point == 7 ) then
		object:SetParent( DataLeft )
		object:Height( DataLeft:GetHeight() )
		object:Point( "CENTER", DataLeft, 0, 1 )
	elseif( point == 8 ) then
		object:SetParent( DataCenter )
		object:SetHeight( DataCenter:GetHeight() )
		object:SetPoint( "LEFT", DataCenter, 30, 1 )
		object:SetPoint( "TOP", DataCenter, 0, 1 )
		object:SetPoint( "BOTTOM", DataCenter )
	elseif( point == 9 ) then
		object:SetParent( DataCenter )
		object:SetHeight( DataCenter:GetHeight() )
		object:SetPoint( "TOP", DataCenter, 0, 1 )
		object:SetPoint( "BOTTOM", DataCenter )
	elseif( point == 10 ) then
		object:SetParent( DataCenter )
		object:SetHeight( DataCenter:GetHeight() )
		object:SetPoint( "RIGHT", DataCenter, -30, 1 )
		object:SetPoint( "TOP", DataCenter, 0, 1 )
		object:SetPoint( "BOTTOM", DataCenter )
	elseif( point == 11 ) then
		object:SetParent( DataRight )
		object:Height( DataRight:GetHeight() )
		object:Point( "CENTER", DataRight, 0, 1 )
	elseif( point == 12 ) then
		object:SetParent( Minimap )
		object:Height( Minimap:GetHeight() )
		object:Point( "CENTER", Minimap, 0, 1 )
	else
		frame:Hide()
		object:Hide()
	end
end

local HookDatatext = {
	"Guild", 
	"Friends",
	"Gold",
	"FPS",
	"System",
	"Bags",
	"Gold",
	"Time",
	"Durability",
	"Heal",
	"Damage",
	"Power",
	"Haste",
	"Crit",
	"Avoidance",
	"Armor",
	"Currency",
	"Hit",
	"Mastery",
	"MicroMenu",
	"Regen",
	"Talent",
	"CallToArms",
}

for _, data in pairs( HookDatatext ) do
	local t = "TukuiStat"
	local frame = _G[t .. data]
	local text = _G[t .. data .. "Text"]

	if( frame and frame.Option ) then
		DataTextPosition( frame, text, frame.Option )
		text:SetFont( S.CreateFontString() )
	end
end

GameTooltip:SetTemplate( "Transparent" )