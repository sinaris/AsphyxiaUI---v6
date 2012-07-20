---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local function MirrorSkinMirrorBar( timer, value, maxvalue, scale, paused, label )
	for i = 1, total, 1 do
		local frame = _G["MirrorTimer"..i]
		if( frame.isSkinned ) then
			frame:SetTemplate( "Transparent" )
		end
	end
end

hooksecurefunc( "MirrorTimer_Show", MirrorSkinMirrorBar )