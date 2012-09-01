---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["intmodules"]["autorole"] ~= true ) then return end

--[[local ATT = GetActiveSpecGroup( false, false )
local PTT = GetSpecialization( false, false, ATT )
local frame = CreateFrame("Frame")

local function SetRole()
	ATT = GetActiveSpecGroup( false, false )
	PTT = GetSpecialization( false, false, ATT )

	if( S.level >= 10 ) then
		if( PTT == nil ) then
			UnitSetRole( "player", "No Role" )
		elseif( PTT ~= nil ) then
			if( GetNumSubgroupMembers() > 0 or GetNumGroupMembers() > 0 ) then
				if( S.Role == "Tank" ) then
					UnitSetRole( "player", "TANK" )
				elseif( S.Role == "Healer" ) then
					UnitSetRole( "player", "HEALER" )
				elseif( S.Role == "Melee" or S.Role == "Caster" ) then
					UnitSetRole( "player", "DAMAGER" )
				end
			end
		end
	end
end

frame:RegisterEvent( "PLAYER_ENTERING_BATTLEGROUND" )
frame:RegisterEvent( "ACTIVE_TALENT_GROUP_CHANGED" )
frame:RegisterEvent( "GROUP_ROSTER_UPDATE" )
frame:RegisterEvent( "PLAYER_TALENT_UPDATE" )
frame:SetScript( "OnEvent", SetRole )]]