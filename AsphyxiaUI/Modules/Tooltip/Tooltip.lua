---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local NeedBackdropBorderRefresh = true

G.Tooltips.GameTooltip.Anchor:ClearAllPoints()
if( C["chat"]["background"] == true and TukuiChatBackgroundRight ) then
	G.Tooltips.GameTooltip.Anchor:SetPoint( "BOTTOMRIGHT", TukuiChatBackgroundRight, "TOPRIGHT", 0, -25 )
else
	G.Tooltips.GameTooltip.Anchor:SetPoint( "BOTTOMRIGHT", TukuiInfoRight )
end

local function TooltipUpdateTooltip( self )
	local owner = self:GetOwner()
	if( not owner ) then return end
	local name = owner:GetName()

	local x = S.Scale( 5 )

	if( self:GetAnchorType() == "ANCHOR_CURSOR" ) then
		if( NeedBackdropBorderRefresh ) then
			self:ClearAllPoints()
			NeedBackdropBorderRefresh = false
			self:SetBackdropColor( unpack( C["media"]["backdropcolor"] ) )
			if( not C["tooltip"]["cursor"] ) then
				self:SetBackdropBorderColor( unpack( C["media"]["bordercolor"] ) )
			end
		end
	elseif( self:GetAnchorType() == "ANCHOR_NONE" and InCombatLockdown() and C["tooltip"]["hidecombat"] == true ) then
		self:Hide()
	end

	if( name and ( TukuiPlayerBuffs or TukuiPlayerDebuffs ) ) then
		if( TukuiPlayerBuffs:GetPoint():match( "LEFT" ) or TukuiPlayerDebuffs:GetPoint():match( "LEFT" ) ) and ( name:match( "TukuiPlayerBuffs" ) or name:match( "TukuiPlayerDebuffs" ) ) then
			self:SetAnchorType( "ANCHOR_BOTTOMRIGHT", x, -x )
		end
	end

	if( ( owner == MiniMapBattlefieldFrame or owner == MiniMapMailFrame ) and TukuiMinimap ) then
		if( TukuiMinimap:GetPoint():match( "LEFT" ) ) then
			self:SetAnchorType( "ANCHOR_TOPRIGHT", x, -x )
		end
	end

	if( self:GetAnchorType() == "ANCHOR_NONE" and TukuiTooltipAnchor ) then
		local point = TukuiTooltipAnchor:GetPoint()
		if( point == "TOPLEFT" ) then
			self:ClearAllPoints()
			self:SetPoint( "TOPLEFT", TukuiTooltipAnchor, "BOTTOMLEFT", 0, -x )
		elseif( point == "TOP" ) then
			self:ClearAllPoints()
			self:SetPoint( "TOP", TukuiTooltipAnchor, "BOTTOM", 0, -x )
		elseif( point == "TOPRIGHT" ) then
			self:ClearAllPoints()
			self:SetPoint( "TOPRIGHT", TukuiTooltipAnchor, "BOTTOMRIGHT", 0, -x )
		elseif( point == "BOTTOMLEFT" or point == "LEFT" ) then
			self:ClearAllPoints()
			self:SetPoint( "BOTTOMLEFT", TukuiTooltipAnchor, "TOPLEFT", 0, x )
		elseif( point == "BOTTOMRIGHT" or point == "RIGHT" ) then
			if( TukuiBags and TukuiBags:IsShown() ) then
				self:ClearAllPoints()
				self:SetPoint( "BOTTOMRIGHT", TukuiBags, "TOPRIGHT", 0, x )
			else
				if( not C["actionbar"]["enable"] ) then
					if( not C["chat"]["background"] ) then
						self:ClearAllPoints()
						self:SetPoint( "BOTTOMRIGHT", TukuiInfoRight, "TOPRIGHT", 0, x )
					else
						self:ClearAllPoints()
						self:SetPoint( "BOTTOMRIGHT", TukuiChatBackgroundRight, "TOPRIGHT", 0, x )
					end
				else
					if( not C["chat"]["background"] ) then
						self:ClearAllPoints()
						self:SetPoint( "BOTTOMRIGHT", TukuiInfoRight, "TOPRIGHT", 0, x )
					elseif( HasPetUI() ) then
						if( C["actionbar"]["vertical_rightbars"] == true ) then
							self:ClearAllPoints()
							self:SetPoint( "BOTTOMRIGHT", TukuiPetBar, "BOTTOMLEFT", -x, 0 )
						else
							self:ClearAllPoints()
							self:SetPoint( "BOTTOMRIGHT", TukuiPetBar, "TOPRIGHT", 0, x )
						end
					else
						if( C["actionbar"]["vertical_rightbars"] == true and AsphyxiaUISaved.rightbars > 0 ) then
							self:ClearAllPoints()
							self:SetPoint( "BOTTOMRIGHT", AsphyxiaUIRightBar, "BOTTOMLEFT", -x, 0 )
						elseif( not C["actionbar"]["vertical_rightbars"] and AsphyxiaUISaved.rightbars > 0 ) then
							self:ClearAllPoints()
							self:SetPoint( "BOTTOMRIGHT", AsphyxiaUIRightBar, "TOPRIGHT", 0, x )
						else
							self:ClearAllPoints()
							self:SetPoint( "BOTTOMRIGHT", TukuiChatBackgroundRight, "TOPRIGHT", 0, x )
						end
					end
				end
			end
		else
			self:ClearAllPoints()
			self:SetPoint( "BOTTOM", TukuiTooltipAnchor, "TOP", 0, x )
		end
	end
end

hooksecurefunc( "GameTooltip_SetDefaultAnchor", function( self, parent )
	if( C["tooltip"]["cursor"] == true ) then
		if( IsAddOnLoaded( "AsphyxiaUI_Raid_Healing" ) and parent ~= UIParent ) then
			self:SetOwner( parent, "ANCHOR_NONE" )
		else
			self:SetOwner( parent, "ANCHOR_CURSOR" )
		end
	else
		self:SetOwner( parent, "ANCHOR_NONE" )
	end

	self:SetPoint( "BOTTOMRIGHT", parent, "BOTTOMRIGHT", -111111, -111111 )
end )

GameTooltip:HookScript( "OnUpdate", function( self, ... )
	TooltipUpdateTooltip( self )
end )



local StatNames = {
ITEM_MOD_SPIRIT_SHORT, ITEM_MOD_DODGE_RATING_SHORT, ITEM_MOD_PARRY_RATING_SHORT, ITEM_MOD_HIT_RATING_SHORT,
ITEM_MOD_CRIT_RATING_SHORT, ITEM_MOD_HASTE_RATING_SHORT, ITEM_MOD_EXPERTISE_RATING_SHORT, ITEM_MOD_MASTERY_RATING_SHORT
}
local ReforgeIDs = {
{1, 2}, {1, 3}, {1, 4}, {1, 5}, {1, 6}, {1, 7}, {1, 8},
{2, 1}, {2, 3}, {2, 4}, {2, 5}, {2, 6}, {2, 7}, {2, 8},
{3, 1}, {3, 2}, {3, 4}, {3, 5}, {3, 6}, {3, 7}, {3, 8},
{4, 1}, {4, 2}, {4, 3}, {4, 5}, {4, 6}, {4, 7}, {4, 8},
{5, 1}, {5, 2}, {5, 3}, {5, 4}, {5, 6}, {5, 7}, {5, 8},
{6, 1}, {6, 2}, {6, 3}, {6, 4}, {6, 5}, {6, 7}, {6, 8},
{7, 1}, {7, 2}, {7, 3}, {7, 4}, {7, 5}, {7, 6}, {7, 8},
{8, 1}, {8, 2}, {8, 3}, {8, 4}, {8, 5}, {8, 6}, {8, 7},
}
local function ReforgeInfo(self)
local name, item = self:GetItem()
if item then
local regions = {self:GetRegions()}
local itemLink = select(2, GetItemInfo(item))
for i = 1, #regions do
local region = regions[i]
if region and region:GetObjectType() == "FontString" then
local text = region:GetText()
if text and text == REFORGED then
local rid = tonumber(itemLink:match("item:%d+:%d+:%d+:%d+:%d+:%d+:%-?%d+:%-?%d+:%d+:(%d+)"))
local info = ReforgeIDs[rid - 113 + 1]
if info[1] and info[2] then
region:SetText(text.." ("..StatNames[info[1]].." -> "..StatNames[info[2]]..")")
end
end
end
end
end
end

GameTooltip:HookScript("OnTooltipSetItem", ReforgeInfo)
ItemRefTooltip:HookScript("OnTooltipSetItem", ReforgeInfo)
ItemRefShoppingTooltip1:HookScript("OnTooltipSetItem", ReforgeInfo)
ItemRefShoppingTooltip2:HookScript("OnTooltipSetItem", ReforgeInfo)
ItemRefShoppingTooltip3:HookScript("OnTooltipSetItem", ReforgeInfo)
ShoppingTooltip1:HookScript("OnTooltipSetItem", ReforgeInfo)
ShoppingTooltip2:HookScript("OnTooltipSetItem", ReforgeInfo)
ShoppingTooltip3:HookScript("OnTooltipSetItem", ReforgeInfo)