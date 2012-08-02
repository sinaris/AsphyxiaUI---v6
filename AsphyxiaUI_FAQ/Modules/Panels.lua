---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

------------------------------
-- MainFrame
------------------------------
local AsphyxiaUIFAQMainFrame = CreateFrame( "Frame", "AsphyxiaUIFAQMainFrame", UIParent )
AsphyxiaUIFAQMainFrame:SetSize( 650, 350 )
AsphyxiaUIFAQMainFrame:SetPoint( "CENTER" )
AsphyxiaUIFAQMainFrame:SetTemplate( "Transparent" )
AsphyxiaUIFAQMainFrame:CreateShadow( "Default" )
AsphyxiaUIFAQMainFrame:Hide()
AsphyxiaUIFAQMainFrame:SetFrameLevel( 10 )
AsphyxiaUIFAQMainFrame:SetFrameStrata( "BACKGROUND" )

local AsphyxiaUIFAQMainFrameIconTopLeft = CreateFrame( "Frame", "AsphyxiaUIFAQMainFrameIconTopLeft", AsphyxiaUIFAQMainFrame )
AsphyxiaUIFAQMainFrameIconTopLeft:SetSize( 58 )
AsphyxiaUIFAQMainFrameIconTopLeft:SetPoint( "BOTTOMLEFT", AsphyxiaUIFAQMainFrame, "TOPLEFT", 0, 3 )
AsphyxiaUIFAQMainFrameIconTopLeft:SetTemplate( "Default" )
AsphyxiaUIFAQMainFrameIconTopLeft:CreateShadow( "Default" )

local AsphyxiaUIFAQMainFrameIconTopRight = CreateFrame( "Frame", "AsphyxiaUIFAQMainFrameIconTopRight", AsphyxiaUIFAQMainFrame )
AsphyxiaUIFAQMainFrameIconTopRight:SetSize( 58 )
AsphyxiaUIFAQMainFrameIconTopRight:SetPoint( "BOTTOMRIGHT", AsphyxiaUIFAQMainFrame, "TOPRIGHT", 0, 3 )
AsphyxiaUIFAQMainFrameIconTopRight:SetTemplate( "Default" )
AsphyxiaUIFAQMainFrameIconTopRight:CreateShadow( "Default" )

local AsphyxiaUIFAQMainFrameTitle = CreateFrame( "Frame", "AsphyxiaUIFAQMainFrameTitle", AsphyxiaUIFAQMainFrame )
AsphyxiaUIFAQMainFrameTitle:SetSize( AsphyxiaUIFAQMainFrame:GetWidth( ) - 122, 30 )
AsphyxiaUIFAQMainFrameTitle:SetPoint( "BOTTOM", AsphyxiaUIFAQMainFrame, "TOP", 0, 3 )
AsphyxiaUIFAQMainFrameTitle:SetTemplate( "Transparent" )
AsphyxiaUIFAQMainFrameTitle:CreateShadow( "Default" )


------------------------------
-- MainFrame - Navigation
------------------------------
local AsphyxiaUIFAQMainFrameNavigation = CreateFrame( "Frame", "AsphyxiaUIFAQMainFrameNavigation", AsphyxiaUIFAQMainFrame )
AsphyxiaUIFAQMainFrameNavigation:SetSize( 180, 342 )
AsphyxiaUIFAQMainFrameNavigation:SetPoint( "LEFT", 4, 0 )
AsphyxiaUIFAQMainFrameNavigation:SetTemplate( "Transparent" )















local AsphyxiaUIFAQOnLogon = CreateFrame( "Frame" )
AsphyxiaUIFAQOnLogon:RegisterEvent( "PLAYER_ENTERING_WORLD" )
AsphyxiaUIFAQOnLogon:SetScript( "OnEvent", function( self, event )
	self:UnregisterEvent( "PLAYER_ENTERING_WORLD" )

	print( "|cff00AAFFAsphyxiaUI - F.A.Q.|r loaded!" )
end )