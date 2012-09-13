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

		hooksecurefunc( "AchievementButton_DisplayAchievement", function( frame, category, achievement )
			local _, _, _, completed = GetAchievementInfo( category, achievement )

			if( completed ) then
				if( frame.accountWide and frame.bg3 ) then
					frame.bg3:SetTexture( 0.1, 0.6, 0.8 )
					frame.label:SetTextColor( 0.1, 0.6, 0.8 )
				elseif( frame.bg3 ) then
					frame.bg3:SetTexture( unpack( C["media"]["bordercolor"] ) )
					frame.label:SetTextColor( 1, 0.82, 0 )
				end
			else
				if( frame.accountWide and frame.bg3 ) then
					frame.bg3:SetTexture( 0.1, 0.6, 0.8 )
					frame.label:SetTextColor( 0.6, 0.6, 0.6 )
				elseif( frame.bg3 ) then
					frame.bg3:SetTexture( unpack( C["media"]["bordercolor"] ) )
					frame.label:SetTextColor( 0.6, 0.6, 0.6 )
				end
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