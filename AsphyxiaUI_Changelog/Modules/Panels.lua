---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local AsphyxiaUIChangelogOnLogon = CreateFrame( "Frame" )
AsphyxiaUIChangelogOnLogon:RegisterEvent( "PLAYER_ENTERING_WORLD" )
AsphyxiaUIChangelogOnLogon:SetScript( "OnEvent", function( self, event )
	self:UnregisterEvent( "PLAYER_ENTERING_WORLD" )

	print( "|cff00AAFFAsphyxiaUI - Changelog|r loaded!" )
end )

------------------------------
-- main frame
------------------------------
local AsphyxiaUIChangelogMainFrame = CreateFrame( "Frame", "AsphyxiaUIChangelogMainFrame", UIParent )
AsphyxiaUIChangelogMainFrame:SetSize( 650, 350 )
AsphyxiaUIChangelogMainFrame:SetPoint( "TOP", UIParent, "TOP", 0, -250 )
AsphyxiaUIChangelogMainFrame:SetTemplate( "Transparent" )
AsphyxiaUIChangelogMainFrame:CreateShadow( "Default" )
AsphyxiaUIChangelogMainFrame:SetFrameLevel( 10 )
AsphyxiaUIChangelogMainFrame:SetFrameStrata( "BACKGROUND" )
AsphyxiaUIChangelogMainFrame:Hide()

------------------------------
-- main frame - navigation
------------------------------
local AsphyxiaUIChangelogMainFrameNavigation = CreateFrame( "Frame", "AsphyxiaUIChangelogMainFrameNavigation", AsphyxiaUIChangelogMainFrame )
AsphyxiaUIChangelogMainFrameNavigation:SetSize( 180, 342 )
AsphyxiaUIChangelogMainFrameNavigation:SetPoint( "LEFT", 4, 0 )
AsphyxiaUIChangelogMainFrameNavigation:SetTemplate( "Transparent" )

------------------------------
-- main frame - content
------------------------------
local AsphyxiaUIChangelogMainFrameContent = CreateFrame( "Frame", "AsphyxiaUIChangelogMainFrameContent", AsphyxiaUIChangelogMainFrame )
AsphyxiaUIChangelogMainFrameContent:SetSize( 458, 342 )
AsphyxiaUIChangelogMainFrameContent:SetPoint( "RIGHT", -4, 0 )
AsphyxiaUIChangelogMainFrameContent:SetTemplate( "Transparent" )

local AsphyxiaUIChangelogMainFrameContentScrollFrame = CreateFrame( "ScrollFrame", "AsphyxiaUIChangelogMainFrameContentScrollFrame", AsphyxiaUIChangelogMainFrameContent, "UIPanelScrollFrameTemplate" )
AsphyxiaUIChangelogMainFrameContentScrollFrame:SetPoint( "TOPLEFT", AsphyxiaUIChangelogMainFrameContent, "TOPLEFT", 4, -4 )
AsphyxiaUIChangelogMainFrameContentScrollFrame:SetPoint( "BOTTOMRIGHT", AsphyxiaUIChangelogMainFrameContent, "BOTTOMRIGHT", -27, 4 )
AsphyxiaUIChangelogMainFrameContentScrollFrameScrollBar:SkinScrollBar()

local AsphyxiaUIChangelogMainFrameContentScrollFrameBackground = CreateFrame( "Frame", "AsphyxiaUIChangelogMainFrameContentScrollFrameBackground", AsphyxiaUIChangelogMainFrameContentScrollFrame )
AsphyxiaUIChangelogMainFrameContentScrollFrameBackground:SetPoint( "TOPLEFT" )
AsphyxiaUIChangelogMainFrameContentScrollFrameBackground:SetWidth( AsphyxiaUIChangelogMainFrameContentScrollFrame:GetWidth() )
AsphyxiaUIChangelogMainFrameContentScrollFrameBackground:SetHeight( AsphyxiaUIChangelogMainFrameContentScrollFrame:GetHeight() )
AsphyxiaUIChangelogMainFrameContentScrollFrame:SetScrollChild( AsphyxiaUIChangelogMainFrameContentScrollFrameBackground )

------------------------------
-- main frame - text frames
------------------------------
local AsphyxiaUIChangelogMainFrameContentTitle = AsphyxiaUIChangelogMainFrameContentScrollFrameBackground:CreateFontString( nil, "OVERLAY" )
AsphyxiaUIChangelogMainFrameContentTitle:SetFont( S.CreateFontString() )
AsphyxiaUIChangelogMainFrameContentTitle:SetPoint( "TOP", AsphyxiaUIChangelogMainFrameContentScrollFrameBackground, "TOP", 0, -10 )

local AsphyxiaUIChangelogMainFrameContentText = AsphyxiaUIChangelogMainFrameContentScrollFrameBackground:CreateFontString( nil, "OVERLAY" )
AsphyxiaUIChangelogMainFrameContentText:SetJustifyH( "LEFT" )
AsphyxiaUIChangelogMainFrameContentText:SetFont( S.CreateFontString() )
AsphyxiaUIChangelogMainFrameContentText:SetWidth( AsphyxiaUIChangelogMainFrameContentScrollFrameBackground:GetWidth() - 20 )
AsphyxiaUIChangelogMainFrameContentText:SetPoint( "TOPLEFT", AsphyxiaUIChangelogMainFrameContentScrollFrameBackground, "TOPLEFT", 10, -45 )

------------------------------
-- main frame - navigation - buttons
------------------------------
local AsphyxiaUIChangelogMainFrameButtonAttributes = {
	[1] = { "/shelp 1" },
	[2] = { "/shelp 2" },
}

local AsphyxiaUIChangelogMainFrameButtonTexts = {
	[1] = { S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. "AsphyxiaUI - Version 6" },
	[2] = { S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. "AsphyxiaUI - Version 5" },
}

local AsphyxiaUIChangelogMainFrameButton = CreateFrame( "Button", "AsphyxiaUIChangelogMainFrameButton", AsphyxiaUIChangelogMainFrameNavigation )
for i = 1, 2 do
	AsphyxiaUIChangelogMainFrameButton[i] = CreateFrame( "Button", "MainFrameNavigationButton" .. i, AsphyxiaUIChangelogMainFrameNavigation, "SecureActionButtonTemplate" )
	AsphyxiaUIChangelogMainFrameButton[i]:CreatePanel( "Default", AsphyxiaUIChangelogMainFrameNavigation:GetWidth() - 8, 24, "TOP", AsphyxiaUIChangelogMainFrameNavigation, "TOP", 0, -4, true )
	AsphyxiaUIChangelogMainFrameButton[i].Text = S.SetFontString( AsphyxiaUIChangelogMainFrameButton[i], S.CreateFontString() )
	AsphyxiaUIChangelogMainFrameButton[i]:SetFrameLevel( AsphyxiaUIChangelogMainFrameNavigation:GetFrameLevel() + 1 )
	AsphyxiaUIChangelogMainFrameButton[i].Text:Point( "CENTER", AsphyxiaUIChangelogMainFrameButton[i], "CENTER", 0, 0 )
	AsphyxiaUIChangelogMainFrameButton[i].Text:SetText( unpack( AsphyxiaUIChangelogMainFrameButtonTexts[i] ) )

	if( i == 1 ) then
		AsphyxiaUIChangelogMainFrameButton[i]:Point( "TOP", AsphyxiaUIChangelogMainFrameNavigation, "TOP", 0, -5 )
	else
		AsphyxiaUIChangelogMainFrameButton[i]:Point( "TOP", AsphyxiaUIChangelogMainFrameButton[i - 1], "BOTTOM", 0, -3 )
	end
	AsphyxiaUIChangelogMainFrameButton[i]:SetAttribute( "type", "macro" )
	AsphyxiaUIChangelogMainFrameButton[i]:SetAttribute( "macrotext", unpack( AsphyxiaUIChangelogMainFrameButtonAttributes[i] ) )
	AsphyxiaUIChangelogMainFrameButton[i]:CreateOverlay( AsphyxiaUIChangelogMainFrameButton[i] )
	AsphyxiaUIChangelogMainFrameButton[i]:HookScript( "OnEnter", S.SetModifiedBackdrop )
	AsphyxiaUIChangelogMainFrameButton[i]:HookScript( "OnLeave", S.SetOriginalBackdrop )
end

------------------------------
-- slash command
------------------------------
local acl = AsphyxiaUIChangelog or function() end
AsphyxiaUIChangelog = function()
	if( InCombatLockdown() ) then print( ERR_NOT_IN_COMBAT ) return end

	if( AsphyxiaUIChangelogMainFrame:IsVisible() ) then
		AsphyxiaUIChangelogMainFrame:Hide()
	else
		AsphyxiaUIChangelogMainFrame:Show()
	end
end

SlashCmdList.AsphyxiaUIChangelog = AsphyxiaUIChangelog
SLASH_AsphyxiaUIChangelog1 = "/acl"