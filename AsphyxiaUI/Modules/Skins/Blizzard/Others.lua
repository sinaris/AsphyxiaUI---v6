---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["general"]["blizzardreskin"] ~= true ) then return end

local function SkinFrames( self, event, addon )
	if( addon == "AsphyxiaUI" ) then
		local skins = {
			"StaticPopup1",
			"StaticPopup2",
			"StaticPopup3",
			"StaticPopup4",
			"GameMenuFrame",
			"InterfaceOptionsFrame",
			"VideoOptionsFrame",
			"AudioOptionsFrame",
			"LFDDungeonReadyStatus",
			"BNToastFrame",
			"TicketStatusFrameButton",
			"LFDSearchStatus",
			"AutoCompleteBox",
			"ConsolidatedBuffsTooltip",
			"ReadyCheckFrame",
			"StackSplitFrame",
			"CharacterFrame",
			"VoiceChatTalkers"
		}

		for i = 1, getn( skins ) do
			if( _G[skins[i]] ) then
				_G[skins[i]]:SetTemplate( "Transparent" )
				if( _G[skins[i]] ~= _G["AutoCompleteBox"] ) then
					_G[skins[i]]:CreateShadow( "Default" )
				end
			end
		end

		local ChatMenus = {
			"ChatMenu",
			"EmoteMenu",
			"LanguageMenu",
			"VoiceMacroMenu",
		}

		for i = 1, getn( ChatMenus ) do
			if( _G[ChatMenus[i]] == _G["ChatMenu"] ) then
				_G[ChatMenus[i]]:HookScript( "OnShow", function( self )
					self:SetTemplate( "Transparent", true )
					self:SetBackdropColor( unpack( C["media"]["backdropcolor"] ) )
					self:ClearAllPoints()
					self:SetPoint( "BOTTOMLEFT", ChatFrame1, "TOPLEFT", 0, S.Scale( 30 ) )
				end )
			else
				_G[ChatMenus[i]]:HookScript( "OnShow", function( self )
					self:SetTemplate( "Transparent", true )
					self:SetBackdropColor( unpack( C["media"]["backdropcolor"] ) )
				end )
			end
		end

		LFDRoleCheckPopup:SetTemplate( "Transparent" )
		LFDRoleCheckPopup:CreateShadow( "Default" )

		RolePollPopup:SetTemplate( "Transparent" )

		local slides = {
			"InterfaceOptionsCombatPanelSpellAlertOpacitySlider",
			"InterfaceOptionsCombatPanelMaxSpellStartRecoveryOffset",
			"InterfaceOptionsBattlenetPanelToastDurationSlider",
			"InterfaceOptionsCameraPanelMaxDistanceSlider",
			"InterfaceOptionsCameraPanelFollowSpeedSlider",
			"InterfaceOptionsMousePanelMouseSensitivitySlider",
			"InterfaceOptionsMousePanelMouseLookSpeedSlider",
			"Advanced_MaxFPSSlider",
			"Advanced_MaxFPSBKSlider",
			"Advanced_GammaSlider",
			"AudioOptionsSoundPanelSoundQuality",
			"AudioOptionsSoundPanelMasterVolume",
			"AudioOptionsSoundPanelSoundVolume",
			"AudioOptionsSoundPanelMusicVolume",
			"AudioOptionsSoundPanelAmbienceVolume",
			"AudioOptionsVoicePanelMicrophoneVolume",
			"AudioOptionsVoicePanelSpeakerVolume",
			"AudioOptionsVoicePanelSoundFade",
			"AudioOptionsVoicePanelMusicFade",
			"AudioOptionsVoicePanelAmbienceFade",
		}
		
		for i = 1, getn( slides ) do
			if( _G[slides[i]] ) then
				if( _G[slides[i]] ~= AudioOptionsSoundPanelSoundVolume ) then
					SkinSlideBar( _G[slides[i]], 8, true )
				else
					SkinSlideBar( _G[slides[i]], 8 )
				end
			end
		end

		Graphics_Quality:SetScript( "OnUpdate", function( self )
			SkinSlideBar( Graphics_Quality, 11 )
		end )
		Graphics_RightQuality:SetAlpha( 0 )

		Graphics_QualityLow2:Point( "BOTTOM", 0, -20 )
		Graphics_QualityFair:Point( "BOTTOM", 0, -20 )
		Graphics_RightQualityLabel:Point( "TOP", 0, 16 )
		Graphics_QualityMed:Point( "BOTTOM", 0, -20 )
		Graphics_QualityHigh2:Point( "BOTTOM", 0, -20 )
		Graphics_QualityUltra:Point( "BOTTOM", 0, -20 )
	end
end

local Init = CreateFrame( "Frame" )
Init:RegisterEvent( "ADDON_LOADED" )
Init:SetScript( "OnEvent", SkinFrames )