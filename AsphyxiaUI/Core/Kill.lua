---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

-----------------------------------------------------------------------------------------
---	Test Blizzard Alerts
-----------------------------------------------------------------------------------------
SlashCmdList.TEST_ACHIEVEMENT = function()
	PlaySound("LFG_Rewards")
	AchievementFrame_LoadUI()
	AchievementAlertFrame_ShowAlert(5780)
	AchievementAlertFrame_ShowAlert(5000)
	GuildChallengeAlertFrame_ShowAlert(3, 2, 5)
	ChallengeModeAlertFrame_ShowAlert()
end
SLASH_TEST_ACHIEVEMENT1 = "/testalert"