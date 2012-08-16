---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["tooltip"]["enable"] ~= true ) then return end

local function addLine( self, id, isItem )
	if( isItem ) then
		self:AddLine( " " )
		self:AddLine( L.Tooltip_ITEMID .. " |cffffffff" .. id .. "|r" )
	else
		self:AddLine( " " )
		self:AddLine( L.Tooltip_SPELLID .. " |cffffffff" .. id .. "|r" )
	end
	self:Show()
end

hooksecurefunc( GameTooltip, "SetUnitBuff", function( self, ... )
	local id = select( 11, UnitBuff( ... ) )
	if( id ) then
		addLine( self, id )
	end
end )

hooksecurefunc( GameTooltip, "SetUnitDebuff", function( self, ... )
	local id = select( 11, UnitDebuff( ... ) )
	if( id ) then
		addLine( self, id )
	end
end )

hooksecurefunc( GameTooltip, "SetUnitAura", function( self, ... )
	local id = select( 11, UnitAura( ... ) )
	if( id ) then
		addLine( self, id )
	end
end )

GameTooltip:HookScript( "OnTooltipSetSpell", function( self )
	local id = select( 3, self:GetSpell() )
	if( id ) then
		addLine( self, id )
	end
end )

hooksecurefunc( "SetItemRef", function( link, ... )
	local id = tonumber( link:match( "spell:(%d+)" ) )
	if( id ) then
		addLine( ItemRefTooltip, id )
	end
end )

local function attachItemTooltip( self )
	local link = select( 2, self:GetItem() )
	if( not link ) then return end

	local id = select( 3, strfind( link, "^|%x+|Hitem:(%-?%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%-?%d+):(%-?%d+)" ) )
	if( id ) then
		addLine( self, id, true )
	end
end

GameTooltip:HookScript( "OnTooltipSetItem", attachItemTooltip )
ItemRefTooltip:HookScript( "OnTooltipSetItem", attachItemTooltip )
ItemRefShoppingTooltip1:HookScript( "OnTooltipSetItem", attachItemTooltip )
ItemRefShoppingTooltip2:HookScript( "OnTooltipSetItem", attachItemTooltip )
ItemRefShoppingTooltip3:HookScript( "OnTooltipSetItem", attachItemTooltip )
ShoppingTooltip1:HookScript( "OnTooltipSetItem", attachItemTooltip )
ShoppingTooltip2:HookScript( "OnTooltipSetItem", attachItemTooltip )
ShoppingTooltip3:HookScript( "OnTooltipSetItem", attachItemTooltip )