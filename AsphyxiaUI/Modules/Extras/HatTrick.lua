---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local GameTooltip = GameTooltip

local hcheck = CreateFrame( "CheckButton", "HelmCheckBox", PaperDollFrame, "OptionsCheckButtonTemplate" )
hcheck:ClearAllPoints()
hcheck:SetWidth( 22 )
hcheck:SetHeight( 22 )
hcheck:SetPoint( "TOPLEFT", CharacterHeadSlot, "BOTTOMRIGHT", 5, 5 )
hcheck:SetScript( "OnClick", function() ShowHelm( not ShowingHelm() ) end )
hcheck:SetScript( "OnEnter", function( self )
 	GameTooltip:SetOwner( self, "ANCHOR_RIGHT" )
	GameTooltip:SetText( OPTION_TOOLTIP_SHOW_HELM )
end )
hcheck:SetScript( "OnLeave", function() GameTooltip:Hide() end )
hcheck:SetScript( "OnEvent", function() hcheck:SetChecked( ShowingHelm() ) end )
hcheck:RegisterEvent( "UNIT_MODEL_CHANGED" )
hcheck:SetToplevel( true )

local ccheck = CreateFrame( "CheckButton", "CloakCheckBox", PaperDollFrame, "OptionsCheckButtonTemplate" )
ccheck:ClearAllPoints()
ccheck:SetWidth( 22 )
ccheck:SetHeight( 22 )
ccheck:SetPoint( "TOPLEFT", CharacterBackSlot, "BOTTOMRIGHT", 5, 5 )
ccheck:SetScript( "OnClick", function() ShowCloak( not ShowingCloak() ) end )
ccheck:SetScript( "OnEnter", function( self )
	GameTooltip:SetOwner( self, "ANCHOR_RIGHT" )
	GameTooltip:SetText( OPTION_TOOLTIP_SHOW_CLOAK )
end)
ccheck:SetScript( "OnLeave", function() GameTooltip:Hide() end )
ccheck:SetScript( "OnEvent", function() ccheck:SetChecked( ShowingCloak() ) end )
ccheck:RegisterEvent( "UNIT_MODEL_CHANGED" )
ccheck:SetToplevel( true )

hcheck:SetChecked( ShowingHelm() )
ccheck:SetChecked( ShowingCloak() )

hcheck:SetFrameLevel( 31 )
ccheck:SetFrameLevel( 31 )
