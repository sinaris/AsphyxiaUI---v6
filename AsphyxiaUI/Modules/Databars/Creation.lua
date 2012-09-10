---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["databars"]["enable"] ~= true ) then return end

for i = 1, #S.databars do
	if not S.databars[i]:IsShown() then
		S.databars[i]:SetHeight( C["databars"]["padding"] )
	end
end