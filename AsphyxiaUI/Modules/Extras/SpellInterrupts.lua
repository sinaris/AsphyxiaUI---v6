---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["intmodules"]["interrupts"] ~= true ) then return end

local AsphyxiaUIInterruptAnnounce = CreateFrame( "Frame" )
AsphyxiaUIInterruptAnnounce:RegisterEvent( "COMBAT_LOG_EVENT_UNFILTERED" )
AsphyxiaUIInterruptAnnounce:SetScript( "OnEvent", function( self, _, ... )
	local _, event, _, sourceGUID, _, _, _, _, destName, _, _, _, _, _, spellID = ...
	if( not ( event == "SPELL_INTERRUPT" and sourceGUID == UnitGUID( "player" ) ) ) then return end

	if( IsInRaid() ) then
		SendChatMessage( INTERRUPTED .. " " .. destName .. ": " .. GetSpellLink( spellID ), "RAID" )
	elseif( IsInGroup() ) then
		SendChatMessage( INTERRUPTED .. " " .. destName .. ": " .. GetSpellLink( spellID ), "PARTY" )
	else
		SendChatMessage( INTERRUPTED .. " " .. destName .. ": " .. GetSpellLink( spellID ), "SAY" )
	end
end )