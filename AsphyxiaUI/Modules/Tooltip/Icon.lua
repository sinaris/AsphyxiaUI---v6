---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["tooltip"]["enable"] ~= true or C["tooltip"]["icon"] ~= true ) then return end

local function setTooltipIcon( self, icon )
	local title = icon and _G[self:GetName() .. "TextLeft1"]
	if( title ) then
		title:SetFormattedText( "|T%s:20:20:0:0:64:64:5:59:5:59:%d|t %s", icon, 20, title:GetText() )
	end
end


local function newTooltipHooker( method, func )
	return function( tooltip )
		local modified = false

		tooltip:HookScript( "OnTooltipCleared", function( self, ... )
			modified = false
		end )

		tooltip:HookScript( method, function( self, ... )
			if( not modified ) then
				modified = true
				func( self, ... )
			end
		end )
	end
end

local hookItem = newTooltipHooker( "OnTooltipSetItem", function( self, ... )
	local name, link = self:GetItem()
	if( link ) then
		setTooltipIcon( self, GetItemIcon( link ) )
	end
end )

local hookSpell = newTooltipHooker( "OnTooltipSetSpell", function( self, ... )
	local name, rank, id = self:GetSpell()
	if( id ) then
		setTooltipIcon( self, select( 3, GetSpellInfo( id ) ) )
	end
end )

for _, tooltip in pairs{
	GameTooltip,
	ItemRefTooltip
} do
	hookItem( tooltip )
	hookSpell( tooltip )
end