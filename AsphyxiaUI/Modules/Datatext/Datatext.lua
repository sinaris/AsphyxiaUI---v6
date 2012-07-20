---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local DataTextPosition = function( frame, object, point )
	object:ClearAllPoints()

	if( point == 1 ) then
		object:SetParent( AsphyxiaUILeftDataTextPanel )
		object:SetHeight( AsphyxiaUILeftDataTextPanel:GetHeight() )
		object:SetPoint( "LEFT", AsphyxiaUILeftDataTextPanel, 30, 1 )
		object:SetPoint( "TOP", AsphyxiaUILeftDataTextPanel )
		object:SetPoint( "BOTTOM", AsphyxiaUILeftDataTextPanel )
	elseif( point == 2 ) then
		object:SetParent( AsphyxiaUILeftDataTextPanel )
		object:SetHeight( AsphyxiaUILeftDataTextPanel:GetHeight() )
		object:SetPoint( "TOP", AsphyxiaUILeftDataTextPanel )
		object:SetPoint( "BOTTOM", AsphyxiaUILeftDataTextPanel )
	elseif( point == 3 ) then
		object:SetParent( AsphyxiaUILeftDataTextPanel )
		object:SetHeight( AsphyxiaUILeftDataTextPanel:GetHeight() )
		object:SetPoint( "RIGHT", AsphyxiaUILeftDataTextPanel, -30, 1 )
		object:SetPoint( "TOP", AsphyxiaUILeftDataTextPanel )
		object:SetPoint( "BOTTOM", AsphyxiaUILeftDataTextPanel )
	elseif( point == 4 ) then
		object:SetParent( AsphyxiaUIRightDataTextPanel )
		object:SetHeight( AsphyxiaUIRightDataTextPanel:GetHeight() )
		object:SetPoint( "LEFT", AsphyxiaUIRightDataTextPanel, 30, 1 )
		object:SetPoint( "TOP", AsphyxiaUIRightDataTextPanel )
		object:SetPoint( "BOTTOM", AsphyxiaUIRightDataTextPanel )
	elseif( point == 5 ) then
		object:SetParent( AsphyxiaUIRightDataTextPanel )
		object:SetHeight( AsphyxiaUIRightDataTextPanel:GetHeight() )
		object:SetPoint( "TOP", AsphyxiaUIRightDataTextPanel )
		object:SetPoint( "BOTTOM", AsphyxiaUIRightDataTextPanel )
	elseif( point == 6 ) then
		object:SetParent( AsphyxiaUIRightDataTextPanel )
		object:SetHeight( AsphyxiaUIRightDataTextPanel:GetHeight() )
		object:SetPoint( "RIGHT", AsphyxiaUIRightDataTextPanel, -30, 1 )
		object:SetPoint( "TOP", AsphyxiaUIRightDataTextPanel )
		object:SetPoint( "BOTTOM", AsphyxiaUIRightDataTextPanel )
	elseif( point == 7 ) then
		object:SetParent( AsphyxiaUIInfoCenterLeft )
		object:Height( AsphyxiaUIInfoCenterLeft:GetHeight() )
		object:Point( "CENTER", AsphyxiaUIInfoCenterLeft, 0, 1 )
	elseif( point == 8 ) then
		object:SetParent( AsphyxiaUIInfoCenter )
		object:SetHeight( AsphyxiaUIInfoCenter:GetHeight() )
		object:SetPoint( "LEFT", AsphyxiaUIInfoCenter, 30, 1 )
		object:SetPoint( "TOP", AsphyxiaUIInfoCenter, 0, 1 )
		object:SetPoint( "BOTTOM", AsphyxiaUIInfoCenter )
	elseif( point == 9 ) then
		object:SetParent( AsphyxiaUIInfoCenter )
		object:SetHeight( AsphyxiaUIInfoCenter:GetHeight() )
		object:SetPoint( "TOP", AsphyxiaUIInfoCenter, 0, 1 )
		object:SetPoint( "BOTTOM", AsphyxiaUIInfoCenter )
	elseif( point == 10 ) then
		object:SetParent( AsphyxiaUIInfoCenter )
		object:SetHeight( AsphyxiaUIInfoCenter:GetHeight() )
		object:SetPoint( "RIGHT", AsphyxiaUIInfoCenter, -30, 1 )
		object:SetPoint( "TOP", AsphyxiaUIInfoCenter, 0, 1 )
		object:SetPoint( "BOTTOM", AsphyxiaUIInfoCenter )
	elseif( point == 11 ) then
		object:SetParent( AsphyxiaUIInfoCenterRight )
		object:Height( AsphyxiaUIInfoCenterRight:GetHeight() )
		object:Point( "CENTER", AsphyxiaUIInfoCenterRight, 0, 1 )
	elseif( point == 12 ) then
		object:SetParent( AsphyxiaUITimeWatch )
		object:Height( AsphyxiaUITimeWatch:GetHeight() )
		object:Point( "CENTER", AsphyxiaUITimeWatch, 0, 1 )
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