---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["intmodules"]["afkcamera"] ~= true ) then return end

local OnEvent = function( self, event, unit )
	if( event == "PLAYER_FLAGS_CHANGED" ) then
		if( unit == "player" ) then
			if( UnitIsAFK( unit ) ) then
				SpinStart()
			else
				SpinStop()
			end
		end
	elseif( event == "PLAYER_LEAVING_WORLD" ) then
		SpinStop()
	end
end

local AFKPanel = CreateFrame( "Frame" )
AFKPanel:RegisterEvent( "PLAYER_ENTERING_WORLD" )
AFKPanel:RegisterEvent( "PLAYER_LEAVING_WORLD" )
AFKPanel:RegisterEvent( "PLAYER_FLAGS_CHANGED" )
AFKPanel:SetScript( "OnEvent", OnEvent )

function SpinStart()
	spinning = true
	MoveViewRightStart( 0.1 )
end

function SpinStop()
	if( not spinning ) then return end
	spinning = nil
	MoveViewRightStop()
end