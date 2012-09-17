---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local AsphyxiaUITest = AsphyxiaUITest or function() end
AsphyxiaUITest = function( msg )
	if( msg == "uf" or msg == "unitframes" ) then
		_G["TukuiTarget"]:Show()
		_G["TukuiTarget"].Hide = function() end
		_G["TukuiTarget"].unit = "player"

		_G["TukuiTargetTarget"]:Show()
		_G["TukuiTargetTarget"].Hide = function() end
		_G["TukuiTargetTarget"].unit = "player"

		_G["TukuiFocus"]:Show()
		_G["TukuiFocus"].Hide = function() end
		_G["TukuiFocus"].unit = "player"

		_G["TukuiFocusTarget"]:Show()
		_G["TukuiFocusTarget"].Hide = function() end
		_G["TukuiFocusTarget"].unit = "player"

		_G["TukuiPet"]:Show()
		_G["TukuiPet"].Hide = function() end
		_G["TukuiPet"].unit = "player"
	elseif( msg == "a" or msg == "arena" ) then
		for i = 1, 3 do
			_G["TukuiArena" .. i]:Show()
			_G["TukuiArena" .. i].Hide = function() end
			_G["TukuiArena" .. i].unit = "player"
			_G["TukuiArena" .. i].Trinket.Icon:SetTexture( "Interface\\Icons\\INV_Jewelry_Necklace_37" )
		end
	elseif( msg == "b" or msg == "boss" ) then
		for i = 1, 3 do
			_G["TukuiBoss" .. i]:Show()
			_G["TukuiBoss" .. i].Hide = function() end
			_G["TukuiBoss" .. i].unit = "player"
		end
	end
end

SlashCmdList.AsphyxiaUITest = AsphyxiaUITest
SLASH_AsphyxiaUITest1 = "/atest"