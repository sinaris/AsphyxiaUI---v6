---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["panellayout"] ~= "jasje" ) then return end

if( C["actionbar"]["enable"] ~= true ) then return end

------------------------------
--
------------------------------
G.ActionBars.Bar2.ShowHideButton:Height( ( S.buttonsize * 1 ) + ( S.buttonspacing * 2 ) )

G.ActionBars.Bar3.ShowHideButton:Height( ( S.buttonsize * 1 ) + ( S.buttonspacing * 2 ) )

G.ActionBars.Bar4.ShowHideButton:Kill()

G.ActionBars.ExitVehicleLeft:Height( ( S.buttonsize * 1 ) + ( S.buttonspacing * 2 ) )
G.ActionBars.ExitVehicleRight:Height( ( S.buttonsize * 1 ) + ( S.buttonspacing * 2 ) )

------------------------------
--
------------------------------
G.ActionBars.Bar2.ShowHideButton.text:SetFont( S.CreateFontString() )

G.ActionBars.Bar3.ShowHideButton.text:SetFont( S.CreateFontString() )

G.ActionBars.Bar2.ShowHideButton.text:SetFont( S.CreateFontString() )

G.ActionBars.Bar5.ShowHideButtonTop.text:SetFont( S.CreateFontString() )
G.ActionBars.Bar5.ShowHideButtonBottom.text:SetFont( S.CreateFontString() )

G.ActionBars.ExitVehicleLeft.text:SetFont( S.CreateFontString() )
G.ActionBars.ExitVehicleRight.text:SetFont( S.CreateFontString() )

------------------------------
--
------------------------------
G.ActionBars.Bar2.ShowHideButton:SetTemplate( "Transparent" )
G.ActionBars.Bar3.ShowHideButton:SetTemplate( "Transparent" )
G.ActionBars.Bar5.ShowHideButtonTop:SetTemplate( "Transparent" )
G.ActionBars.Bar5.ShowHideButtonBottom:SetTemplate( "Transparent" )
G.ActionBars.ExitVehicleLeft:SetTemplate( "Transparent" )
G.ActionBars.ExitVehicleRight:SetTemplate( "Transparent" )