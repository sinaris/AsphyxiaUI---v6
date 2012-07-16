---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local function SkinFrames( self, event, addon )
	if( addon == "AsphyxiaUI" ) then
		CharacterFrame:SetTemplate( "Transparent" )

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

		TokenFrame:HookScript("OnShow", function()
			TokenFramePopup:SetTemplate( "Transparent" )
			TokenFramePopup:CreateShadow( "Default" )
			TokenFramePopupInactiveCheckBox:SkinCheckBox()
			TokenFramePopupBackpackCheckBox:SkinCheckBox()
			TokenFramePopupCloseButton:SkinCloseButton()
		end )

		PaperDollEquipmentManagerPane:HookScript( "OnShow", function( self )
			GearManagerDialogPopup:SetTemplate( "Transparent" )
			GearManagerDialogPopup:CreateShadow( "Default" )
		end )
	end
end

local Init = CreateFrame( "Frame" )
Init:RegisterEvent( "ADDON_LOADED" )
Init:SetScript( "OnEvent", SkinFrames )