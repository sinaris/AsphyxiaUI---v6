---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["general"]["blizzardreskin"] ~= true ) then return end

local function SkinFrames( self, event, addon )
	if( addon == "Blizzard_AchievementUI" ) then
		AchievementFrame.backdrop:SetTemplate( "Transparent" )
		AchievementFrame.backdrop:CreateShadow( "Default" )
		AchievementFrameCategoriesContainer.backdrop:SetTemplate( "Transparent" )
		AchievementFrameAchievementsContainer.backdrop:SetTemplate( "Transparent" )

		hooksecurefunc( "AchievementButton_DisplayAchievement", function( frame )
			if( frame.accountWide and frame.bg3 ) then
				frame.bg3:SetTexture( ACHIEVEMENTUI_BLUEBORDER_R, ACHIEVEMENTUI_BLUEBORDER_G, ACHIEVEMENTUI_BLUEBORDER_B )
			elseif( frame.bg3 ) then
				frame.bg3:SetTexture( unpack( C["media"]["bordercolor"] ) )
			end
		end )

		hooksecurefunc( "AchievementFrameSummary_UpdateAchievements", function()
			for i = 1, ACHIEVEMENTUI_MAX_SUMMARY_ACHIEVEMENTS do
				local frame = _G["AchievementFrameSummaryAchievement" .. i]

				if( frame.accountWide ) then
					frame.backdrop:SetBackdropBorderColor( ACHIEVEMENTUI_BLUEBORDER_R, ACHIEVEMENTUI_BLUEBORDER_G, ACHIEVEMENTUI_BLUEBORDER_B )
				else
					frame.backdrop:SetBackdropBorderColor( unpack( C["media"]["bordercolor"] ) )
				end
			end
		end )
	end
end

local Init = CreateFrame( "Frame" )
Init:RegisterEvent( "ADDON_LOADED" )
Init:SetScript( "OnEvent", SkinFrames )