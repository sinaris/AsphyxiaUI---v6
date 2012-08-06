---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

G.Tooltips.GameTooltip.Anchor:ClearAllPoints()
if( C["chat"]["background"] == true and TukuiChatBackgroundRight ) then
	G.Tooltips.GameTooltip.Anchor:SetPoint( "BOTTOMRIGHT", TukuiChatBackgroundRight, "TOPRIGHT", 0, -25 )
else
	G.Tooltips.GameTooltip.Anchor:SetPoint( "BOTTOMRIGHT", TukuiInfoRight )
end