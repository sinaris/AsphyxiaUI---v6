---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local myAddon = "AsphyxiaUI"

local frames = {
	WorldStateScoreFrame,
	CharacterFrame,
	ChatConfigFrame,
	ColorPickerFrame
}



-------------- CHECK ALL SHADOWS ON THE FRAMES
-------------- STOPPED AT COLOR PICKER FRAME!!!!!!!!!!!!!!!!!!!!!

local function SkinBlizzardFrames( self, event, addon )
	if( addon == myAddon ) then
		for i, panel in pairs( frames ) do
			panel:SetTemplate( "Transparent" )
		end



	elseif( addon == "Blizzard_AchievementUI" ) then
		AchievementFrame.backdrop:SetTemplate( "Transparent" )
		AchievementFrame.backdrop:CreateShadow( "Default" )
		AchievementFrameCategoriesContainer.backdrop:SetTemplate( "Transparent" )
		AchievementFrameAchievementsContainer.backdrop:SetTemplate( "Transparent" )

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
	elseif( addon == "Blizzard_ArchaeologyUI" ) then
		ArchaeologyFrame:SetTemplate( "Transparent" )
		ArchaeologyFrameRankBar:SetStatusBarTexture( C["media"]["normal"] )
		ArchaeologyFrameArtifactPageSolveFrameStatusBar:SetStatusBarTexture( C["media"]["normal"] )





	elseif( addon == "Blizzard_AuctionUI" ) then
		AuctionFrame:SetTemplate( "Transparent" )
		AuctionProgressFrame:SetTemplate( "Transparent" )

		do
			local frame = _G["SideDressUpFrame"]

			frame:HookScript("OnShow", function( self )
				frame:SetTemplate( "Transparent" )
			end )
		end

	elseif( addon == "Blizzard_BlackMarketUI" ) then
		BlackMarketFrame:SetTemplate( "Transparent" )

	elseif( addon == "Blizzard_BarbershopUI" ) then
		BarberShopFrame:SetTemplate( "Transparent" )
		BarberShopFrame:CreateShadow( "Default" )

	elseif( addon == "Blizzard_BindingUI" ) then
		KeyBindingFrame:SetTemplate( "Transparent" )
		KeyBindingFrame:CreateShadow( "Default" )

	elseif( addon == "Blizzard_Calendar" ) then
		CalendarFrame:SetTemplate( "Transparent" )
		CalendarFrame:CreateShadow( "Default" )
		
		CalendarCreateEventFrame:SetTemplate( "Transparent" )
		CalendarCreateEventFrame:CreateShadow( "Default" )
		
		CalendarTexturePickerFrame:SetTemplate("Transparent")
		CalendarTexturePickerFrame:CreateShadow("Default")
		
		







	elseif( addon == "Blizzard_TimeManager" ) then
		TimeManagerFrame:SetTemplate( "Transparent" )
	elseif( addon == "Blizzard_TalentUI" ) then
		PlayerTalentFrame.backdrop:SetTemplate("Transparent")
	end

	-- bags
	for i = 1, 5 do
		local bag = _G["ContainerFrame" .. i]
		if( bag ) then
			bag.backdrop:SetTemplate( "Transparent" )
		end
	end

	local bank = BankFrame
	if bank then
		bank.backdrop:SetTemplate("Transparent")

		for i = 6, 12 do
			local bag = _G["ContainerFrame"..i]
			if( bag ) then
				bag.backdrop:SetTemplate("Transparent")
			end
		end
	end

	-- character reputation
	local function UpdateFactionSkins()
		for i = 1, GetNumFactions() do
			local statusbar = _G["ReputationBar" .. i .. "ReputationBar"]

			if( statusbar ) then
				statusbar:SetStatusBarTexture( C["media"]["normal"] )
			end
		end
		ReputationDetailFrame:StripTextures()
		ReputationDetailFrame:SetTemplate( "Transparent" )
	end
	ReputationFrame:HookScript( "OnShow", UpdateFactionSkins )
	hooksecurefunc( "ReputationFrame_OnEvent", UpdateFactionSkins )

	-- character currency
	TokenFrame:HookScript("OnShow", function()
		TokenFramePopup:SetTemplate( "Transparent" )
		TokenFramePopup:CreateShadow( "Default" )
		TokenFramePopupCloseButton:SkinCloseButton()
	end )
	
	-- chat config frame
	ChatConfigFrame:CreateShadow( "Default" )
	
	-- color picker
	ColorPickerFrame:CreateShadow( "Default" )







end

local Init = CreateFrame( "Frame" )
Init:RegisterEvent( "ADDON_LOADED" )
Init:SetScript( "OnEvent", SkinBlizzardFrames )