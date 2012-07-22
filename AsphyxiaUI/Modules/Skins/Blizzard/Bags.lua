---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["bags"]["enable"] == true ) then return end

local function SkinFrames( self, event, addon )
	if( addon == "AsphyxiaUI" ) then
		for i = 1, 5 do
			local bag = _G["ContainerFrame" .. i]
			if( bag ) then
				bag.backdrop:SetTemplate( "Transparent" )
			end
		end

		local bank = BankFrame
		if( bank ) then
			bank.backdrop:SetTemplate( "Transparent" )

			for i = 6, 12 do
				local bag = _G["ContainerFrame" .. i]
				if( bag ) then
					bag.backdrop:SetTemplate( "Transparent" )
				end
			end
		end
	end
end

local Init = CreateFrame( "Frame" )
Init:RegisterEvent( "ADDON_LOADED" )
Init:SetScript( "OnEvent", SkinFrames )