---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

print"PetbattleUi loaded"

G.PetBattle.Ally.Icon:Size( 40 )

G.PetBattle.Ally:ClearAllPoints()
G.PetBattle.Ally:SetPoint( "CENTER", UIParent, "CENTER", -350, 0)
G.PetBattle.Ally.healthBarWidth = 250
G.PetBattle.Ally.HealthBarBackdrop:Width( G.PetBattle.Ally.healthBarWidth + 4 )

G.PetBattle.Ally.ActualHealthBar:Point( "TOPLEFT", G.PetBattle.Ally.Icon, "TOPRIGHT", 7, 0 )

local AsphyxiaUIPetBattleUIAllyFramePanel = CreateFrame( "Frame", "AsphyxiaUIPetBattleUIAllyFramePanel", G.PetBattle.Ally )
AsphyxiaUIPetBattleUIAllyFramePanel:Size( 301, 16 )
AsphyxiaUIPetBattleUIAllyFramePanel:Point( "TOPLEFT", G.PetBattle.Ally.Icon, "BOTTOMLEFT", -2, -5 )
AsphyxiaUIPetBattleUIAllyFramePanel:SetTemplate( "Transparent" )
AsphyxiaUIPetBattleUIAllyFramePanel:SetFrameStrata("BACKGROUND")

G.PetBattle.Ally.Name:ClearAllPoints()
G.PetBattle.Ally.Name:SetPoint( "LEFT", AsphyxiaUIPetBattleUIAllyFramePanel, "LEFT", 10, 0 )
G.PetBattle.Ally.Name:SetFont( S.CreateFontString() )

G.PetBattle.Ally.PetTypeFrame:ClearAllPoints()
G.PetBattle.Ally.PetTypeFrame:SetPoint( "RIGHT", AsphyxiaUIPetBattleUIAllyFramePanel, "RIGHT", -10, 0 )
G.PetBattle.Ally.PetTypeFrame.text:SetFont( S.CreateFontString() )

G.PetBattle.Ally.HealthText:SetFont( S.CreateFontString() )