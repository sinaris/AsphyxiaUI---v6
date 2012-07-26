---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["general"]["blizzardreskin"] ~= true ) then return end

local function SkinFrames( self, event, addon )
	if( addon == "Blizzard_AuctionUI" ) then
		AuctionFrame:SetTemplate( "Transparent" )
		AuctionProgressFrame:SetTemplate( "Transparent" )

		do
			local frame = _G["SideDressUpFrame"]

			frame:HookScript("OnShow", function( self )
				frame:SetTemplate( "Transparent" )
			end )
		end
	elseif( addon == "Blizzard_BlackMarketUI" ) then
		BlackMarketFrame:SetTemplate( "Transparent" )
		BlackMarketFrame:CreateShadow( "Default" )
	end
end

local Init = CreateFrame( "Frame" )
Init:RegisterEvent( "ADDON_LOADED" )
Init:SetScript( "OnEvent", SkinFrames )