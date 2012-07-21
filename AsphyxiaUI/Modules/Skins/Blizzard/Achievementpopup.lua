---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local function SkinFrames( self, event, addon )
	if( addon == "Blizzard_AchievementUI" ) then
		local function SkinAchievePopUp()
			for i = 1, MAX_ACHIEVEMENT_ALERTS do
				local frame = _G["AchievementAlertFrame" .. i]

				if( frame ) then
					if( frame.backdrop ) then
						frame.backdrop:SetTemplate( "Transparent" )
						frame.backdrop:CreateShadow( "Default" )
					end
				end
			end
		end
		hooksecurefunc( "AlertFrame_SetAchievementAnchors", SkinAchievePopUp )

		local function SkinDungeonPopUp()
			for i = 1, DUNGEON_COMPLETION_MAX_REWARDS do
				local frame = _G["DungeonCompletionAlertFrame" .. i]

				if( frame ) then
					if( frame.backdrop ) then
						frame.backdrop:SetTemplate( "Transparent" )
						frame.backdrop:CreateShadow( "Default" )
					end
				end
			end
		end
		hooksecurefunc( "AlertFrame_SetDungeonCompletionAnchors", SkinDungeonPopUp )

		local function SkinGuildChallengePopUp()
			local frame = _G["GuildChallengeAlertFrame"]

			if( frame ) then
				if( frame.backdrop ) then
					frame.backdrop:SetTemplate( "Transparent" )
					frame.backdrop:CreateShadow( "Default" )
				end
			end
		end
		hooksecurefunc( "AlertFrame_SetGuildChallengeAnchors", SkinGuildChallengePopUp )

		local function SkinChallengePopUp()
			local frame = _G["ChallengeModeAlertFrame1"]

			if( frame ) then
				if( frame.backdrop ) then
					frame.backdrop:SetTemplate( "Transparent" )
					frame.backdrop:CreateShadow( "Default" )
				end
			end
		end
		hooksecurefunc( "AlertFrame_SetChallengeModeAnchors", SkinChallengePopUp )

		local function SkinScenarioPopUp()
			local frame = _G["ScenarioAlertFrame1"]

			if( frame ) then
				if( frame.backdrop ) then
					frame.backdrop:SetTemplate( "Transparent" )
					frame.backdrop:CreateShadow( "Default" )
				end
			end
		end
		hooksecurefunc( "AlertFrame_SetScenarioAnchors", SkinScenarioPopUp )

		local function SkinCriteriaPopUp()
			for i = 1, MAX_ACHIEVEMENT_ALERTS do
				local frame = _G["CriteriaAlertFrame" .. i]

				if( frame ) then
					if( frame.backdrop ) then
						frame.backdrop:SetTemplate( "Transparent" )
						frame.backdrop:CreateShadow( "Default" )
					end
				end
			end
		end
		hooksecurefunc( "AlertFrame_SetCriteriaAnchors", SkinCriteriaPopUp )

		local function SetLootWonAnchors()
			for i = 1, #LOOT_WON_ALERT_FRAMES do
				local frame = LOOT_WON_ALERT_FRAMES[i]
	
				if( frame ) then
					if( frame.backdrop ) then
						frame.backdrop:SetTemplate( "Transparent" )
						frame.backdrop:CreateShadow( "Default" )
					end
				end
			end
		end
		hooksecurefunc( "AlertFrame_SetLootWonAnchors", SetLootWonAnchors )

		local function SetMoneyWonAnchors()
			for i = 1, #MONEY_WON_ALERT_FRAMES do
				local frame = MONEY_WON_ALERT_FRAMES[i]

				if( frame ) then
					if( frame.backdrop ) then
						frame.backdrop:SetTemplate( "Transparent" )
						frame.backdrop:CreateShadow( "Default" )
					end
				end
			end
		end
		hooksecurefunc( "AlertFrame_SetMoneyWonAnchors", SetMoneyWonAnchors )
	end
end

local Init = CreateFrame( "Frame" )
Init:RegisterEvent( "ADDON_LOADED" )
Init:SetScript( "OnEvent", SkinFrames )