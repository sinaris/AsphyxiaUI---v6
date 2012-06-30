---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

------------------------------
-- main frame
------------------------------
local AsphyxiaUIFAQMainFrame = CreateFrame( "Frame", "AsphyxiaUIFAQMainFrame", UIParent )
AsphyxiaUIFAQMainFrame:SetSize( 650, 350 )
AsphyxiaUIFAQMainFrame:SetPoint( "TOP", UIParent, "TOP", 0, -250 )
AsphyxiaUIFAQMainFrame:SetTemplate( "Transparent" )
AsphyxiaUIFAQMainFrame:CreateShadow( "Default" )
AsphyxiaUIFAQMainFrame:SetFrameLevel( 10 )
AsphyxiaUIFAQMainFrame:SetFrameStrata( "BACKGROUND" )
AsphyxiaUIFAQMainFrame:Hide()

------------------------------
-- slash command
------------------------------
local acl = AsphyxiaUIFAQ or function() end
AsphyxiaUIFAQ = function()
	if( InCombatLockdown() ) then print( ERR_NOT_IN_COMBAT ) return end

	if( AsphyxiaUIFAQMainFrame:IsVisible() ) then
		AsphyxiaUIFAQMainFrame:Hide()
	else
		AsphyxiaUIFAQMainFrame:Show()
	end
end

SlashCmdList.AsphyxiaUIFAQ = AsphyxiaUIFAQ
SLASH_AsphyxiaUIFAQ1 = "/afaq"

local AsphyxiaUIFAQOnLogon = CreateFrame( "Frame" )
AsphyxiaUIFAQOnLogon:RegisterEvent( "PLAYER_ENTERING_WORLD" )
AsphyxiaUIFAQOnLogon:SetScript( "OnEvent", function( self, event )
	self:UnregisterEvent( "PLAYER_ENTERING_WORLD" )

	print( "|cff00AAFFAsphyxiaUI - FAQ|r loaded!" )
end )