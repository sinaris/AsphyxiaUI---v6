---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["actionbar"]["enable"] ~= true ) then return end

local bar = TukuiPetBar

bar:HookScript( "OnEvent", function( self, event, arg1 )
	if( event == "PLAYER_ENTERING_WORLD" ) then
		PetActionBarFrame.showgrid = 1

		local button
		for i = 1, 10 do
			button = _G["PetActionButton" .. i]
			button:ClearAllPoints()
			button:SetParent( TukuiPetBar )
			button:SetSize( S.petbuttonsize, S.petbuttonsize )

			if( i == 1 ) then
				button:SetPoint( "TOPLEFT", 5, -5 )
			else
				if( C["actionbar"]["vertical_rightbars"] == true ) then
					button:SetPoint( "TOP", _G["PetActionButton" .. ( i - 1 )], "BOTTOM", 0, -S.buttonspacing )
				else
					button:SetPoint( "LEFT", _G["PetActionButton" .. ( i - 1 )], "RIGHT", S.buttonspacing, 0 )
				end
			end
			button:Show()
			self:SetAttribute( "addchild", button )

			G.ActionBars.Pet["Button" .. i] = button
		end
		RegisterStateDriver( self, "visibility", "[pet,novehicleui,nobonusbar:5] show; hide" )
		hooksecurefunc( "PetActionBar_Update", S.PetBarUpdate )
	end
end )

RegisterStateDriver( bar, "visibility", "[vehicleui][petbattle][overridebar] hide; show" )