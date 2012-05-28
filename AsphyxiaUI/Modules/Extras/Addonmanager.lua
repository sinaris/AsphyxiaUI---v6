local S, C, L, G = unpack( Tukui )

local addonBG = CreateFrame( "Frame", "addonBG", UIParent )
addonBG:CreatePanel( "Transparent", 370, 500, "CENTER", UIParent, "CENTER", 0, 0 )
addonBG:EnableMouse( true )
addonBG:SetMovable( true )
addonBG:SetUserPlaced( true )
addonBG:SetClampedToScreen( true )
addonBG:SetScript( "OnMouseDown", function( self ) self:StartMoving() end )
addonBG:SetScript( "OnMouseUp", function( self ) self:StopMovingOrSizing() end )
addonBG:SetFrameStrata( "HIGH" )
addonBG:Hide()

local addonHeader = CreateFrame( "Frame", "addonHeader", addonBG )
addonHeader:CreatePanel( "Transparent", addonBG:GetWidth(), 23, "BOTTOM", addonBG, "TOP", 0, 3, true )
addonHeader.Text = S.SetFontString( addonHeader, S.CreateFontString() )
addonHeader.Text:SetPoint( "LEFT", 5, 1 )
addonHeader.Text:SetText( ADDONS .. ": " .. S.myname )

local scrollFrame = CreateFrame( "ScrollFrame", "scrollFrame", addonBG, "UIPanelScrollFrameTemplate" )
scrollFrame:SetPoint( "TOPLEFT", addonBG, "TOPLEFT", 10, -10 )
scrollFrame:SetPoint( "BOTTOMRIGHT", addonBG, "BOTTOMRIGHT", -30, 40 )
scrollFrameScrollBar:SkinScrollBar()

local buttonsBG = CreateFrame( "Frame", "buttonsBG", scrollFrame )
buttonsBG:SetPoint( "TOPLEFT" )
buttonsBG:SetWidth( scrollFrame:GetWidth() )
buttonsBG:SetHeight( scrollFrame:GetHeight() )
scrollFrame:SetScrollChild( buttonsBG )

local saveButton = CreateFrame( "Button", "saveButton", addonBG )
saveButton:CreatePanel( "Default", 130, 20, "BOTTOMLEFT", addonBG, "BOTTOMLEFT", 10, 10, true )
saveButton:SetFrameStrata( "TOOLTIP" )
saveButton.Text = S.SetFontString( saveButton, S.CreateFontString() )
saveButton.Text:Point( "CENTER", saveButton, "CENTER", 0, 0 )
saveButton.Text:SetText( SAVE_CHANGES )
saveButton:SetScript( "OnClick", function() ReloadUI() end )
saveButton:HookScript( "OnEnter", S.SetModifiedBackdrop )
saveButton:HookScript( "OnLeave", S.SetOriginalBackdrop )

local closeButton = CreateFrame( "Button", "closeButton", addonBG )
closeButton:CreatePanel( "Default", 130, 20, "BOTTOMRIGHT", addonBG, "BOTTOMRIGHT", -10, 10, true )
closeButton.Text = S.SetFontString( closeButton, S.CreateFontString() )
closeButton.Text:Point( "CENTER", closeButton, "CENTER", 0, 0 )
closeButton.Text:SetText( CANCEL )
closeButton:SetFrameStrata( "TOOLTIP" )
closeButton:SetScript( "OnClick", function() addonBG:Hide() end )
closeButton:HookScript( "OnEnter", S.SetModifiedBackdrop )
closeButton:HookScript( "OnLeave", S.SetOriginalBackdrop )

--[[local raid_addons = CreateFrame( "Button", "TukuiEnableRaidButton", addonHeader )
raid_addons:CreatePanel( "Transparent", 60, 17, "RIGHT", addonHeader, "RIGHT", -5, 0 )
raid_addons:CreateShadow( "Default" )
raid_addons:SetFrameStrata( addonHeader:GetFrameStrata() )
raid_addons:SetFrameLevel( addonHeader:GetFrameLevel() + 1 )
raid_addons:RegisterForClicks( "AnyUp" )
raid_addons:SetScript( "OnClick", function()
	EnableAddOn( "DBM-Core" )
	EnableAddOn( "Recount" )
	ReloadUI()
end )

raid_addons:HookScript( "OnEnter", S.SetModifiedBackdrop )
raid_addons:HookScript( "OnLeave", S.SetOriginalBackdrop )

raid_addons.Text = S.SetFontString( raid_addons, S.CreateFontString() )
raid_addons.Text:Point( "CENTER", raid_addons, "CENTER", 0, 0 )
raid_addons.Text:SetText( RAID )

local solo_addons = CreateFrame( "Button", "TukuiEnableSoloButton", addonHeader )
solo_addons:CreatePanel( "Transparent", 60, 17, "RIGHT", raid_addons, "LEFT", -3, 0 )
solo_addons:CreateShadow( "Default" )
solo_addons:SetFrameStrata( addonHeader:GetFrameStrata() )
solo_addons:SetFrameLevel( addonHeader:GetFrameLevel() + 1 )
solo_addons:RegisterForClicks( "AnyUp" )
solo_addons:SetScript( "OnClick", function()
	DisableAddOn( "DBM-Core" )
	DisableAddOn( "Recount" )
	ReloadUI()
end )

solo_addons:HookScript( "OnEnter", S.SetModifiedBackdrop )
solo_addons:HookScript( "OnLeave", S.SetOriginalBackdrop )

solo_addons.Text = S.SetFontString( solo_addons, S.CreateFontString() )
solo_addons.Text:Point( "CENTER", solo_addons, "CENTER", 0, 0 )
solo_addons.Text:SetText( SOLO )]]--

local function UpdateAddons()
	local addons = {}
	for i = 1, GetNumAddOns() do
		addons[i] = select( 1, GetAddOnInfo( i ) )
	end
	table.sort( addons )
	local oldb
	for i, v in pairs( addons ) do
		local name, title, notes, enabled, loadable, reason, security = GetAddOnInfo( v )
		local button = CreateFrame( "Button", v .. "_Button", buttonsBG, "SecureActionButtonTemplate" )
		button:SetFrameLevel( buttonsBG:GetFrameLevel() + 1 )
		button:Size( 50, 16 )
		button:SetTemplate( "Default" )

		

		if( enabled ) then
			button:SetBackdropBorderColor( 0, 1, 0 )
		else
			button:SetBackdropBorderColor( 1, 0, 0 )
		end

		if( i == 1 ) then
			button:Point( "TOPLEFT", buttonsBG, "TOPLEFT", 0, 0 )
		else
			button:Point( "TOP", oldb, "BOTTOM", 0, -7 )
		end
		local text = S.SetFontString( button, S.CreateFontString() )
		text:Point( "LEFT", button, "RIGHT", 8, 0 )
		text:SetText( title )

		button:SetScript( "OnEnter", function( self )
			GameTooltip:ClearLines()
			GameTooltip:SetOwner( self, ANCHOR_TOPRIGHT )
			GameTooltip:AddLine( title )
			GameTooltip:Show()
		end )

		button:SetScript( "OnLeave", function( self )
			GameTooltip:Hide()
		end )

		button:SetScript( "OnMouseDown", function()
			if( enabled ) then
				button:SetBackdropBorderColor( 1, 0, 0 )
				DisableAddOn( name )
				enabled = false
			else
				button:SetBackdropBorderColor( 0, 1, 0 )
				EnableAddOn( name )
				enabled = true
			end
		end )

		oldb = button
	end
end
UpdateAddons()

SLASH_ALOAD1 = "/am"
SlashCmdList.ALOAD = function( msg )
	addonBG:Show()
end