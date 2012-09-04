---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
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