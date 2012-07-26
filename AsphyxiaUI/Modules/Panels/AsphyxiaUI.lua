---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

------------------------------
-- Chat
------------------------------
local AsphyxiaUILeftChatBackground = CreateFrame( "Frame", "AsphyxiaUILeftChatBackground", UIParent )
AsphyxiaUILeftChatBackground:Size( C["chat"]["width"], C["chat"]["height"] )
AsphyxiaUILeftChatBackground:Point( "BOTTOMLEFT", UIParent, "BOTTOMLEFT", 2, 2 )
AsphyxiaUILeftChatBackground:SetTemplate( "Transparent" )
AsphyxiaUILeftChatBackground:CreateShadow( "Default" )
AsphyxiaUILeftChatBackground:SetFrameLevel( 1 )
AsphyxiaUILeftChatBackground:SetFrameStrata( "BACKGROUND" )

local AsphyxiaUIRightChatBackground = CreateFrame( "Frame", "AsphyxiaUIRightChatBackground", UIParent )
AsphyxiaUIRightChatBackground:Size( C["chat"]["width"], C["chat"]["height"] )
AsphyxiaUIRightChatBackground:Point( "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -2, 2 )
AsphyxiaUIRightChatBackground:SetTemplate( "Transparent" )
AsphyxiaUIRightChatBackground:CreateShadow( "Default" )
AsphyxiaUIRightChatBackground:SetFrameLevel( 1 )
AsphyxiaUIRightChatBackground:SetFrameStrata( "BACKGROUND" )

local AsphyxiaUILeftChatTab = CreateFrame( "Frame", "AsphyxiaUILeftChatTab", UIParent )
AsphyxiaUILeftChatTab:Size( AsphyxiaUILeftChatBackground:GetWidth() - 10, 23 )
AsphyxiaUILeftChatTab:Point( "TOP", AsphyxiaUILeftChatBackground, "TOP", 0, -5 )
AsphyxiaUILeftChatTab:SetTemplate( "Transparent" )
AsphyxiaUILeftChatTab:CreateOverlay( AsphyxiaUILeftChatTab )
AsphyxiaUILeftChatTab:SetFrameLevel( 2 )
AsphyxiaUILeftChatTab:SetFrameStrata( "BACKGROUND" )

local AsphyxiaUIRightChatTab = CreateFrame( "Frame", "AsphyxiaUIRightChatTab", UIParent )
AsphyxiaUIRightChatTab:Size( AsphyxiaUIRightChatBackground:GetWidth() - 10, 23 )
AsphyxiaUIRightChatTab:Point( "TOP", AsphyxiaUIRightChatBackground, "TOP", 0, -5 )
AsphyxiaUIRightChatTab:SetTemplate( "Transparent" )
AsphyxiaUIRightChatTab:CreateOverlay( AsphyxiaUIRightChatTab )
AsphyxiaUIRightChatTab:SetFrameLevel( 2 )
AsphyxiaUIRightChatTab:SetFrameStrata( "BACKGROUND" )

------------------------------
-- Actionbars
------------------------------
local AsphyxiaUIActionbar1 = CreateFrame( "Frame", "AsphyxiaUIActionbar1", UIParent, "SecureHandlerStateTemplate" )
AsphyxiaUIActionbar1:Size( ( S.buttonsize * 12 ) + ( S.buttonspacing * 13 ) + 2, ( S.buttonsize * 2 ) + ( S.buttonspacing * 3 ) + 2 )
AsphyxiaUIActionbar1:Point( "BOTTOM", UIParent, "BOTTOM", 0, 48 )
AsphyxiaUIActionbar1:SetTemplate( "Transparent" )
AsphyxiaUIActionbar1:CreateShadow( "Default" )
AsphyxiaUIActionbar1:SetFrameStrata("BACKGROUND")
AsphyxiaUIActionbar1:SetFrameLevel( 1 )

local AsphyxiaUIActionbar2 = CreateFrame( "Frame", "AsphyxiaUIActionbar2", UIParent )
AsphyxiaUIActionbar2:SetAllPoints( AsphyxiaUIActionbar1 )

local AsphyxiaUIActionbar3 = CreateFrame( "Frame", "AsphyxiaUIActionbar3", UIParent )
AsphyxiaUIActionbar3:SetAllPoints( AsphyxiaUIActionbar1 )

local AsphyxiaUIActionbar4 = CreateFrame( "Frame", "AsphyxiaUIActionbar4", UIParent )
AsphyxiaUIActionbar4:SetAllPoints( AsphyxiaUIActionbar1 )

local AsphyxiaUISplitBarLeft = CreateFrame( "Frame", "AsphyxiaUISplitBarLeft", UIParent )
AsphyxiaUISplitBarLeft:Size( ( S.buttonsize * 3 ) + ( S.buttonspacing * 4 ) + 2, AsphyxiaUIActionbar1:GetHeight() )
AsphyxiaUISplitBarLeft:Point( "BOTTOMRIGHT", AsphyxiaUIActionbar1, "BOTTOMLEFT", -3, 0 )
AsphyxiaUISplitBarLeft:SetTemplate( "Transparent" )
AsphyxiaUISplitBarLeft:CreateShadow( "Default" )

local AsphyxiaUISplitBarRight = CreateFrame( "Frame", "AsphyxiaUISplitBarRight", UIParent )
AsphyxiaUISplitBarRight:Size( ( S.buttonsize * 3 ) + ( S.buttonspacing * 4 ) + 2, AsphyxiaUIActionbar1:GetHeight() )
AsphyxiaUISplitBarRight:Point( "BOTTOMLEFT", AsphyxiaUIActionbar1, "BOTTOMRIGHT", 3, 0 )
AsphyxiaUISplitBarRight:SetTemplate( "Transparent" )
AsphyxiaUISplitBarRight:CreateShadow( "Default" )

local AsphyxiaUIRightBar = CreateFrame( "Frame", "AsphyxiaUIRightBar", UIParent )
AsphyxiaUIRightBar:Size( ( S.buttonsize * 12 + S.buttonspacing * 13 ) + 2,  ( S.buttonsize * 12 + S.buttonspacing * 13 ) + 2 )
AsphyxiaUIRightBar:SetTemplate( "Transparent" )
AsphyxiaUIRightBar:Point("BOTTOMRIGHT", AsphyxiaUIRightChatBackground, "TOPRIGHT", 0, 3  )
AsphyxiaUIRightBar:CreateShadow( "Default" )
if( C["chat"]["background"] ~= true ) then
	AsphyxiaUIRightBar:ClearAllPoints()
	AsphyxiaUIRightBar:Point( "RIGHT", UIParent, "RIGHT", -8, 0 )
end
AsphyxiaUIRightBar:SetFrameStrata("BACKGROUND")
AsphyxiaUIRightBar:SetFrameLevel( 1 )

local AsphyxiaUIPetBar = CreateFrame( "Frame", "AsphyxiaUIPetBar", UIParent )
if( C["actionbar"]["vertical_rightbars"] == true ) then
	AsphyxiaUIPetBar:Width( ( S.petbuttonsize + S.buttonspacing * 2 ) + 2 )
	AsphyxiaUIPetBar:Height( ( S.petbuttonsize * NUM_PET_ACTION_SLOTS + S.buttonspacing * 11 ) + 2 )
else
	AsphyxiaUIPetBar:Width( ( S.petbuttonsize * NUM_PET_ACTION_SLOTS + S.buttonspacing * 11 ) + 2 )
	AsphyxiaUIPetBar:Height( ( S.petbuttonsize + S.buttonspacing * 2 ) + 2 )
end
AsphyxiaUIPetBar:Point( "BOTTOM", AsphyxiaUIRightBar, "TOP", 0, 3 )
AsphyxiaUIPetBar:SetTemplate( "Transparent" )
AsphyxiaUIPetBar:CreateShadow( "Default" )

------------------------------
-- Datatext Panels
------------------------------
local AsphyxiaUILeftDataTextPanel = CreateFrame( "Frame", "AsphyxiaUILeftDataTextPanel", UIParent )
AsphyxiaUILeftDataTextPanel:Size( AsphyxiaUILeftChatBackground:GetWidth() - 10, 23 )
AsphyxiaUILeftDataTextPanel:Point( "BOTTOM", AsphyxiaUILeftChatBackground, "BOTTOM", 0, 5 )
AsphyxiaUILeftDataTextPanel:SetTemplate( "Transparent" )
AsphyxiaUILeftDataTextPanel:CreateOverlay( AsphyxiaUILeftDataTextPanel )

local AsphyxiaUIRightDataTextPanel = CreateFrame( "Frame", "AsphyxiaUIRightDataTextPanel", UIParent )
AsphyxiaUIRightDataTextPanel:Size( AsphyxiaUIRightChatBackground:GetWidth() - 10, 23 )
AsphyxiaUIRightDataTextPanel:Point( "BOTTOM", AsphyxiaUIRightChatBackground, "BOTTOM", 0, 5 )
AsphyxiaUIRightDataTextPanel:SetTemplate( "Transparent" )
AsphyxiaUIRightDataTextPanel:CreateOverlay( AsphyxiaUIRightDataTextPanel )

local AsphyxiaUIInfoCenter = CreateFrame( "Frame", "AsphyxiaUIInfoCenter", AsphyxiaUIActionbar1 )
AsphyxiaUIInfoCenter:Size( AsphyxiaUIActionbar1:GetWidth(), 20 )
AsphyxiaUIInfoCenter:Point( "TOP", AsphyxiaUIActionbar1, "BOTTOM", 0, -3 )
AsphyxiaUIInfoCenter:SetTemplate( "Default" )
AsphyxiaUIInfoCenter:CreateShadow( "Default" )
AsphyxiaUIInfoCenter:SetFrameLevel( 2 )
AsphyxiaUIInfoCenter:SetFrameStrata( "BACKGROUND" )
AsphyxiaUIInfoCenter:CreateOverlay( AsphyxiaUIInfoCenter )

local AsphyxiaUIInfoCenterLeft = CreateFrame( "Frame", "AsphyxiaUIInfoCenterLeft", AsphyxiaUISplitBarLeft )
AsphyxiaUIInfoCenterLeft:Size( AsphyxiaUISplitBarLeft:GetWidth(), 20 )
AsphyxiaUIInfoCenterLeft:Point( "TOP", AsphyxiaUISplitBarLeft, "BOTTOM", 0, -3 )
AsphyxiaUIInfoCenterLeft:SetTemplate( "Default" )
AsphyxiaUIInfoCenterLeft:CreateShadow( "Default" )
AsphyxiaUIInfoCenterLeft:SetFrameLevel( 2 )
AsphyxiaUIInfoCenterLeft:SetFrameStrata( "BACKGROUND" )
AsphyxiaUIInfoCenterLeft:CreateOverlay( AsphyxiaUIInfoCenterLeft )

local AsphyxiaUIInfoCenterRight = CreateFrame( "Frame", "AsphyxiaUIInfoCenterRight", AsphyxiaUISplitBarRight )
AsphyxiaUIInfoCenterRight:Size( AsphyxiaUISplitBarRight:GetWidth(), 20 )
AsphyxiaUIInfoCenterRight:Point( "TOP", AsphyxiaUISplitBarRight, "BOTTOM", 0, -3 )
AsphyxiaUIInfoCenterRight:SetTemplate( "Default" )
AsphyxiaUIInfoCenterRight:CreateShadow( "Default" )
AsphyxiaUIInfoCenterRight:SetFrameLevel( 2 )
AsphyxiaUIInfoCenterRight:SetFrameStrata( "BACKGROUND" )
AsphyxiaUIInfoCenterRight:CreateOverlay( AsphyxiaUIInfoCenterRight )

------------------------------
-- Minimap
------------------------------
if( TukuiMinimap ) then
	local AsphyxiaUITimeWatch = CreateFrame( "Frame", "AsphyxiaUITimeWatch", Minimap )
	AsphyxiaUITimeWatch:Size( 55, 17 )
	AsphyxiaUITimeWatch:Point( "TOP", Minimap, "BOTTOM", 0, 8 )
	AsphyxiaUITimeWatch:SetTemplate( "Default" )
	AsphyxiaUITimeWatch:CreateShadow( "Default" )
	AsphyxiaUITimeWatch:SetFrameLevel( 3 )
	AsphyxiaUITimeWatch:SetFrameStrata( "MEDIUM" )
	AsphyxiaUITimeWatch:CreateOverlay( AsphyxiaUITimeWatch )
end