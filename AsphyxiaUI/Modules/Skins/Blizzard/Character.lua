---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["general"]["blizzardreskin"] ~= true ) then return end

local function SkinFrames( self, event, addon )
	if( addon == "AsphyxiaUI" ) then
		CharacterFrame:SetTemplate( "Transparent" )

		local function UpdateFactionSkins()
			ReputationDetailFrame:StripTextures()
			ReputationDetailFrame:SetTemplate( "Transparent" )
		end
		ReputationFrame:HookScript( "OnShow", UpdateFactionSkins )
		hooksecurefunc( "ReputationFrame_OnEvent", UpdateFactionSkins )

		TokenFrame:HookScript("OnShow", function()
			TokenFramePopup:SetTemplate( "Transparent" )
			TokenFramePopup:CreateShadow( "Default" )
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