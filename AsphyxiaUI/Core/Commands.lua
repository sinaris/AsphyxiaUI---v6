---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

-- This is for testing only and will be removed later!
SlashCmdList.TEST_ACHIEVEMENT = function()
	PlaySound( "LFG_Rewards" )
	AchievementFrame_LoadUI()
	AchievementAlertFrame_ShowAlert( 5780 )
	AchievementAlertFrame_ShowAlert( 5000 )
	GuildChallengeAlertFrame_ShowAlert( 3, 2, 5 )
	ChallengeModeAlertFrame_ShowAlert()
	CriteriaAlertFrame_GetAlertFrame()
	AlertFrame_AnimateIn( CriteriaAlertFrame1 )
	AlertFrame_AnimateIn( DungeonCompletionAlertFrame1 )
	AlertFrame_AnimateIn( ScenarioAlertFrame1 )
	MoneyWonAlertFrame_ShowAlert( 1 )

	local _, itemLink = GetItemInfo( 6948 )
	LootWonAlertFrame_ShowAlert( itemLink, -1, 1, 1 )
	AlertFrame_FixAnchors()
end
SLASH_TEST_ACHIEVEMENT1 = "/testalerts"