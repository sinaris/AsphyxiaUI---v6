---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local function SkinFrames( self, event, addon )
	if( addon == "Blizzard_AchievementUI" ) then
		AchievementFrame.backdrop:SetTemplate( "Transparent" )
		AchievementFrame.backdrop:CreateShadow( "Default" )
		AchievementFrameCategoriesContainer.backdrop:SetTemplate( "Transparent" )
		AchievementFrameAchievementsContainer.backdrop:SetTemplate( "Transparent" )
	end
end

local Init = CreateFrame( "Frame" )
Init:RegisterEvent( "ADDON_LOADED" )
Init:SetScript( "OnEvent", SkinFrames )