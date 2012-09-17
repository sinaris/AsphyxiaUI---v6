---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Credits: All credits goes to the original Author: Hydra
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["intmodules"]["nickalert"]["enable"] ~= true ) then return end

local AsphyxiUIChatNickAlert = CreateFrame( "Frame" )
AsphyxiUIChatNickAlert:RegisterEvent( "CHAT_MSG_GUILD" )
AsphyxiUIChatNickAlert:RegisterEvent( "CHAT_MSG_BATTLEGROUND" )
AsphyxiUIChatNickAlert:RegisterEvent( "CHAT_MSG_BATTLEGROUND_LEADER" )
AsphyxiUIChatNickAlert:RegisterEvent( "CHAT_MSG_OFFICER" )
AsphyxiUIChatNickAlert:RegisterEvent( "CHAT_MSG_PARTY" )
AsphyxiUIChatNickAlert:RegisterEvent( "CHAT_MSG_PARTY_LEADER" )
AsphyxiUIChatNickAlert:RegisterEvent( "CHAT_MSG_RAID" )
AsphyxiUIChatNickAlert:RegisterEvent( "CHAT_MSG_RAID_LEADER" )

AsphyxiUIChatNickAlert:SetScript( "OnEvent", function( event, msg, sender )
	sender = strlower( sender )

	for _, v in pairs( C["intmodules"]["nickalert"]["names"] ) do
		if( strfind( sender, strlower( v ) ) ) then
			PlaySoundFile( C["intmodules"]["nickalert"]["sound"], "MASTER" )
			return
		end
	end
end )