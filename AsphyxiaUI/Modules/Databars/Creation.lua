---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

for i = 1, #S.databars do
	if not S.databars[i]:IsShown() then
		S.databars[i]:SetHeight( C["databars"]["settings"]["padding"] )
	end
end