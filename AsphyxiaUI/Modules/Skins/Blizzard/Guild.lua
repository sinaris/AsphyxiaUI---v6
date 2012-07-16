---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local function SkinFrames( self, event, addon )
	if( addon == "Blizzard_GuildUI" ) then
		GuildFrame:SetTemplate( "Transparent" )

		GuildFactionBar.progress:SetTexture( C["media"]["normal"] )

		GuildXPBar.progress:SetTexture( C["media"]["normal"] )
	end
end

local Init = CreateFrame( "Frame" )
Init:RegisterEvent( "ADDON_LOADED" )
Init:SetScript( "OnEvent", SkinFrames )