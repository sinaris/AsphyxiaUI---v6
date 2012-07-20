---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

S.InfoLeftRightWidth = 370

local bags_BACKPACK = { 0, 1, 2, 3, 4 }
local bags_BANK = { -1, 5, 6, 7, 8, 9, 10, 11 }
local ST_NORMAL = 1
local ST_FISHBAG = 2
local ST_SPECIAL = 3
local bag_bars = 0
	
local function BagsSlotUpdate( self, b )
	local scount = _G[b.frame:GetName() .. "Count"]
	scount:SetFont( S.CreateFontString() )
	scount:Point( "BOTTOMRIGHT", 0, 2 )
end
hooksecurefunc( Stuffing, "SlotUpdate", BagsSlotUpdate )

local function BagsUpdateBagsPosition( self )
	TukuiBags:ClearAllPoints()

	if( C["chat"].background ~= true ) then
		TukuiBags:SetPoint( "BOTTOMLEFT", AsphyxiaUIRightDataTextPanel, "TOPLEFT", 0, 3 )
	elseif( HasPetUI() ) then
		if( C["actionbar"].vertical_rightbars == true ) then
			TukuiBags:SetPoint( "BOTTOMRIGHT", AsphyxiaUIRightChatBackground, "TOPRIGHT", 0, 3 )
		else
			TukuiBags:SetPoint( "BOTTOM", AsphyxiaUIPetBar, "TOP", 0, 3 )
		end
	elseif( UnitHasVehicleUI( "player" ) ) then
		TukuiBags:SetPoint( "BOTTOMRIGHT", AsphyxiaUIRightChatBackground, "TOPRIGHT", 0, 3 )
	else
		if( C["actionbar"].vertical_rightbars == true ) then
			TukuiBags:SetPoint( "BOTTOMRIGHT", AsphyxiaUIRightChatBackground, "TOPRIGHT", 0, 3 )
		else
			if( TukuiSaved.rightbars >= 1 ) then
				TukuiBags:SetPoint( "BOTTOMRIGHT", AsphyxiaUIRightBar, "TOPRIGHT", 0, 3 )
			else
				TukuiBags:SetPoint( "BOTTOMRIGHT", AsphyxiaUIRightChatBackground, "TOPRIGHT", 0, 3 )
			end
		end
	end
end
TukuiBags:HookScript( "OnUpdate", BagsUpdateBagsPosition )

local function BagsUpdateBankPosition( self, value )
	local bag = _G["Tukui" .. value]
	if( value == "Bank" ) then
		bag:ClearAllPoints()
		if( C["chat"]["background"] ~= true ) then
			bag:SetPoint( "BOTTOMLEFT", AsphyxiaUILeftDataTextPanel, "TOPLEFT", 0, 3 )
		else
			bag:SetPoint( "BOTTOMLEFT", AsphyxiaUILeftChatBackground, "TOPLEFT", 0, 3 )
		end
	end
end
hooksecurefunc( Stuffing, "CreateBagFrame", BagsUpdateBankPosition )

local function BagsCreateBagFrame( self, f )

end

local function BagsLayout( self, lb )
	local slots = 0
	local rows = 0
	local off = 26
	local cols
	local f
	local bs

	local bgvalue = 0
	if( C["chat"].background ~= true ) then
		bgvalue = 10
	end

	if( lb ) then
		bs = bags_BANK
		cols = ( floor( ( S.InfoLeftRightWidth - bgvalue ) / 370 * 10 ) + 1 )
		f = self.bankFrame
	else
		bs = bags_BACKPACK
		cols = ( floor( ( S.InfoLeftRightWidth - bgvalue ) / 370 * 10 ) + 1 )
		f = self.frame

		f.gold:SetText( GetMoneyString( GetMoney(), 12 ) )
		f.editbox:SetFont( S.CreateFontString() )
		f.detail:SetFont( S.CreateFontString() )
		f.gold:SetFont( S.CreateFontString() )

		f.detail:ClearAllPoints()
		f.detail:Point( "TOPLEFT", f, 12, -10 )
		f.detail:Point( "RIGHT", -( 16 + 24 ), 0 )
	end

	f:SetClampedToScreen( 1 )
	f:SetTemplate( "Transparent" )
	f:CreateShadow( "Default" )

	local fb = f.bags_frame
	if( bag_bars == 1 ) then
		fb:SetClampedToScreen( 1 )
		fb:SetTemplate( "Transparent" )
		fb:CreateShadow( "Default" )

		local bsize = 24
		if( lb ) then bsize = 23.3 end

		local w = 2 * 12
		w = w + ( ( #bs - 1 ) * bsize )
		w = w + ( 12 * ( #bs - 2 ) )

		fb:Height( 2 * 12 + bsize )
		fb:Width( w )
		fb:Show()
	else
		fb:Hide()
	end


	local idx = 0
	for _, v in ipairs( bs ) do
		if( not lb and v <= 3 ) or ( lb and v ~= -1 ) then
			local bsize = 30
			if( lb ) then bsize = 30 end

			local b = self:BagFrameSlotNew( v, fb )

			local xoff = 12

			xoff = xoff + ( idx * bsize )
			xoff = xoff + ( idx * 4 )

			b.frame:ClearAllPoints()
			b.frame:Point( "LEFT", fb, "LEFT", xoff, 0 )
			b.frame:Show()

			local iconTex = _G[b.frame:GetName() .. "IconTexture"]
			iconTex:SetTexCoord( 0.09, 0.91, 0.09, 0.91 )
			iconTex:Point( "TOPLEFT", b.frame, 2, -2 )
			iconTex:Point( "BOTTOMRIGHT", b.frame, -2, 2 )

			iconTex:Show()
			b.iconTex = iconTex

			b.frame:SetTemplate( "Default" )
			b.frame:SetBackdropColor( 0, 0, 0 )
			b.frame:StyleButton()

			idx = idx + 1
		end
	end

	for _, i in ipairs( bs ) do
		local x = GetContainerNumSlots( i )
		if( x > 0 ) then
			if( not self.bags[i] ) then
				self.bags[i] = self:BagNew( i, f )
			end

			slots = slots + GetContainerNumSlots( i )
		end
	end

	rows = floor ( slots / cols )
	if( ( slots % cols ) ~= 0 ) then
		rows = rows + 1
	end

	f:Width( C["chat"].width - bgvalue )
	f:Height( rows * 30 + ( rows - 1 ) * 2 + off + 12 * 2 )

	local sf = CreateFrame( "Frame", "SlotFrame", f )
	sf:Width( ( 31 + 1 ) * cols )
	sf:Height( f:GetHeight() - ( 6 ) )
	sf:Point( "BOTTOM", f, "BOTTOM" )

	local idx = 0
	for _, i in ipairs( bs ) do
		local bag_cnt = GetContainerNumSlots( i )

		if( bag_cnt > 0 ) then
			self.bags[i] = self:BagNew( i, f )
			local bagType = self.bags[i].bagType

			self.bags[i]:Show()
			for j = 1, bag_cnt do
				local b, isnew = self:SlotNew( i, j )
				local xoff
				local yoff
				local x = ( idx % cols )
				local y = floor( idx / cols )

				if( isnew ) then
					table.insert( self.buttons, idx + 1, b )
				end

				xoff = ( x * 31 ) + ( x * 1 )

				yoff = off + 12 + ( y * 31 )

				yoff = yoff * -1

				b.frame:ClearAllPoints()
				b.frame:Point( "TOPLEFT", sf, "TOPLEFT", xoff, yoff )
				b.frame:Height( 29 )
				b.frame:Width( 29 )
				b.frame:SetPushedTexture( "" )
				b.frame:SetNormalTexture( "" )
				b.frame:Show()
				b.frame:SetTemplate( "Default" )
				b.frame:SetBackdropColor( 0, 0, 0 )
				b.frame:StyleButton()

				if( bagType == ST_FISHBAG ) then
					b.frame:SetBackdropBorderColor( 1, 0, 0 )
					b.frame.lock = true
				end

				if( bagType == ST_SPECIAL ) then
					b.frame:SetBackdropBorderColor( 255 / 255, 243 / 255,  82 / 255 )
					b.frame.lock = true
				end

				self:SlotUpdate( b )
				
				local iconTex = _G[b.frame:GetName() .. "IconTexture"]
				iconTex:SetTexCoord( 0.08, 0.92, 0.08, 0.92 )
				iconTex:Point( "TOPLEFT", b.frame, 2, -2 )
				iconTex:Point( "BOTTOMRIGHT", b.frame, -2, 2 )

				iconTex:Show()
				b.iconTex = iconTex
				
				idx = idx + 1
			end
		end
	end
end
hooksecurefunc( Stuffing, "Layout", BagsLayout )

function Stuffing.Menu( self, level )
	if( not level ) then
		return
	end

	local info = self.info

	wipe( info )

	if( level ~= 1 ) then
		return
	end

	wipe( info )
	info.text = L.bags_sortmenu
	info.notCheckable = 1
	info.func = function()
		Stuffing_Sort( "d" )
	end
	UIDropDownMenu_AddButton( info, level )

	wipe( info )
	info.text = L.bags_stackmenu
	info.notCheckable = 1
	info.func = function()
		Stuffing:SetBagsForSorting( "d" )
		Stuffing:Restack()
	end
	UIDropDownMenu_AddButton( info, level )

	wipe( info )
	info.text = L.bags_showbags
	info.checked = function()
		return bag_bars == 1
	end

	info.func = function()
		if( bag_bars == 1 ) then
			bag_bars = 0
		else
			bag_bars = 1
		end
		Stuffing:Layout()
		if( Stuffing.bankFrame and Stuffing.bankFrame:IsShown() ) then
			Stuffing:Layout( true )
		end
	end
	UIDropDownMenu_AddButton( info, level )

	wipe( info )
	info.disabled = nil
	info.notCheckable = 1
	info.text = CLOSE
	info.func = self.HideMenu
	info.tooltipTitle = CLOSE
	UIDropDownMenu_AddButton( info, level )
end