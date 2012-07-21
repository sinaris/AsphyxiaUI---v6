---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local function SkinFrames( self, event, addon )
	if( addon == "AsphyxiaUI" ) then
		QuestFrame.backdrop:SetTemplate( "Transparent" )

		QuestNPCModel.backdrop:SetTemplate( "Transparent" )
		QuestNPCModel.backdrop:CreateShadow( "Default" )

		QuestNPCModelTextFrame.backdrop:SetTemplate( "Transparent" )
		QuestNPCModelTextFrame.backdrop:CreateShadow( "Default" )

		QuestLogDetailFrame:SetTemplate( "Transparent" )
		QuestLogDetailFrame:CreateShadow( "Default" )
	end
end

local Init = CreateFrame( "Frame" )
Init:RegisterEvent( "ADDON_LOADED" )
Init:SetScript( "OnEvent", SkinFrames )