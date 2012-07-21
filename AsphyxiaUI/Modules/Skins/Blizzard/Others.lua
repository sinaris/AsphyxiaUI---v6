---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

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
	end
end

local Init = CreateFrame( "Frame" )
Init:RegisterEvent( "ADDON_LOADED" )
Init:SetScript( "OnEvent", SkinFrames )