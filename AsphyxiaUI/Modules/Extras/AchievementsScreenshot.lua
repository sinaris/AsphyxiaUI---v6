---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Credits: All credits goes to the original Author: Blamdarot
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["intmodules"]["achscreen"] ~= true ) then return end

local function TakeScreen( delay, func, ... )
	local waitTable = {}
	local waitFrame = CreateFrame( "Frame", "WaitFrame", UIParent )
	waitFrame:SetScript( "onUpdate", function ( self, elapse )
		local count = #waitTable
		local i = 1
		while( i <= count ) do
			local waitRecord = tremove( waitTable, i )
			local d = tremove( waitRecord, 1 )
			local f = tremove( waitRecord, 1 )
			local p = tremove( waitRecord, 1 )
			if( d > elapse ) then
				tinsert( waitTable, i, { d - elapse, f, p } )
				i = i + 1
			else
				count = count - 1
				f( unpack( p ) )
			end
		end
	end )
	tinsert( waitTable, { delay, func, {...} } )
end

local function OnEvent( ... )
	TakeScreen( 1, Screenshot )
end

local frame = CreateFrame( "Frame" )
frame:RegisterEvent( "ACHIEVEMENT_EARNED" )
frame:SetScript( "OnEvent", OnEvent )