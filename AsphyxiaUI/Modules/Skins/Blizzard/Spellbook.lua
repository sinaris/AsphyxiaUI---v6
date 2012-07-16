---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local function SkinFrames( self, event, addon )
	if( addon == "AsphyxiaUI" ) then
		SpellBookFrame.backdrop:SetTemplate( "Transparent" )
		SpellBookFrame.backdrop:CreateShadow( "Default" )

		local professionstatusbars = {
			"PrimaryProfession1StatusBar",
			"PrimaryProfession2StatusBar",
			"SecondaryProfession1StatusBar",
			"SecondaryProfession2StatusBar",
			"SecondaryProfession3StatusBar",
			"SecondaryProfession4StatusBar"
		}

		for _, statusbar in pairs( professionstatusbars ) do
			local statusbar = _G[statusbar]
			statusbar:SetStatusBarTexture( C["media"]["normal"] )
		end
	end
end

local Init = CreateFrame( "Frame" )
Init:RegisterEvent( "ADDON_LOADED" )
Init:SetScript( "OnEvent", SkinFrames )