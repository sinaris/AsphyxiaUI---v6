---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["tooltip"]["enable"] ~= true or C["tooltip"]["icon"] ~= true ) then return end

--[[local function AddTooltipIcon( self, icon )
	if( icon ) then
		local title = _G[self:GetName() .. "TextLeft1"]
		if( title and not title:GetText():find( "|T" .. icon ) ) then
			title:SetFormattedText( "|T%s:20:20:0:0:64:64:5:59:5:59:%d|t %s", icon, 40, title:GetText() )
		end
	end
end

local function hookItem( tip )
	tip:HookScript( "OnTooltipSetItem", function( self, ... )
		local name, link = self:GetItem()
		local icon = link and GetItemIcon( link )
		AddTooltipIcon( self, icon )
	end )
end
hookItem( _G["GameTooltip"] )
hookItem( _G["ItemRefTooltip"] )

local function hookSpell( tip )
	tip:HookScript( "OnTooltipSetSpell", function( self, ... )
		if( self:GetSpell() ) then
			local name, rank, icon = GetSpellInfo( self:GetSpell() )
			AddTooltipIcon( self, icon )
		end
	end )
end
hookSpell( _G["GameTooltip"] )
hookSpell( _G["ItemRefTooltip"] )]]

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