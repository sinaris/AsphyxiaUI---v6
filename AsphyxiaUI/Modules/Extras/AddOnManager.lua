---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["intmodules"]["addonmanager"] ~= true ) then return end

local AsphyxiaUIAddOnManagerBackground = CreateFrame( "Frame", "AsphyxiaUIAddOnManagerBackground", UIParent )
AsphyxiaUIAddOnManagerBackground:Size( 370, 500 )
AsphyxiaUIAddOnManagerBackground:Point( "CENTER", UIParent, "CENTER", 0, 0 )
AsphyxiaUIAddOnManagerBackground:SetTemplate( "Transparent" )
AsphyxiaUIAddOnManagerBackground:EnableMouse( true )
AsphyxiaUIAddOnManagerBackground:SetMovable( true )
AsphyxiaUIAddOnManagerBackground:SetUserPlaced( true )
AsphyxiaUIAddOnManagerBackground:SetClampedToScreen( true )
AsphyxiaUIAddOnManagerBackground:SetScript( "OnMouseDown", function( self ) self:StartMoving() end )
AsphyxiaUIAddOnManagerBackground:SetScript( "OnMouseUp", function( self ) self:StopMovingOrSizing() end )
AsphyxiaUIAddOnManagerBackground:SetFrameStrata( "HIGH" )
AsphyxiaUIAddOnManagerBackground:Hide()

local AsphyxiaUIAddOnManagerHeader = CreateFrame( "Frame", "AsphyxiaUIAddOnManagerHeader", AsphyxiaUIAddOnManagerBackground )
AsphyxiaUIAddOnManagerHeader:Size( AsphyxiaUIAddOnManagerBackground:GetWidth(), 23 )
AsphyxiaUIAddOnManagerHeader:Point( "BOTTOM", AsphyxiaUIAddOnManagerBackground, "TOP", 0, 3 )
AsphyxiaUIAddOnManagerHeader:SetTemplate( "Transparent" )

AsphyxiaUIAddOnManagerHeader.Text = S.SetFontString( AsphyxiaUIAddOnManagerHeader, S.CreateFontString() )
AsphyxiaUIAddOnManagerHeader.Text:SetPoint( "LEFT", 5, 1 )
AsphyxiaUIAddOnManagerHeader.Text:SetText( ADDONS .. ": " .. S.myname )

local AsphyxiaUIAddOnManagerBackgroundScrollFrame = CreateFrame( "ScrollFrame", "AsphyxiaUIAddOnManagerBackgroundScrollFrame", AsphyxiaUIAddOnManagerBackground, "UIPanelScrollFrameTemplate" )
AsphyxiaUIAddOnManagerBackgroundScrollFrame:SetPoint( "TOPLEFT", AsphyxiaUIAddOnManagerBackground, "TOPLEFT", 10, -10 )
AsphyxiaUIAddOnManagerBackgroundScrollFrame:SetPoint( "BOTTOMRIGHT", AsphyxiaUIAddOnManagerBackground, "BOTTOMRIGHT", -30, 40 )
AsphyxiaUIAddOnManagerBackgroundScrollFrameScrollBar:SkinScrollBar()

local AsphyxiaUIAddOnManagerButtonsBackground = CreateFrame( "Frame", "AsphyxiaUIAddOnManagerButtonsBackground", AsphyxiaUIAddOnManagerBackgroundScrollFrame )
AsphyxiaUIAddOnManagerButtonsBackground:SetPoint( "TOPLEFT" )
AsphyxiaUIAddOnManagerButtonsBackground:SetWidth( AsphyxiaUIAddOnManagerBackgroundScrollFrame:GetWidth() )
AsphyxiaUIAddOnManagerButtonsBackground:SetHeight( AsphyxiaUIAddOnManagerBackgroundScrollFrame:GetHeight() )
AsphyxiaUIAddOnManagerBackgroundScrollFrame:SetScrollChild( AsphyxiaUIAddOnManagerButtonsBackground )

local AsphyxiaUIAddOnManagerSaveButton = CreateFrame( "Button", "AsphyxiaUIAddOnManagerSaveButton", AsphyxiaUIAddOnManagerBackground )
AsphyxiaUIAddOnManagerSaveButton:Size( 130, 20 )
AsphyxiaUIAddOnManagerSaveButton:Point( "BOTTOMLEFT", AsphyxiaUIAddOnManagerBackground, "BOTTOMLEFT", 10, 10 )
AsphyxiaUIAddOnManagerSaveButton:SetTemplate( "Default" )
AsphyxiaUIAddOnManagerSaveButton:SetFrameStrata( "TOOLTIP" )

AsphyxiaUIAddOnManagerSaveButton.Text = S.SetFontString( AsphyxiaUIAddOnManagerSaveButton, S.CreateFontString() )
AsphyxiaUIAddOnManagerSaveButton.Text:Point( "CENTER", AsphyxiaUIAddOnManagerSaveButton, "CENTER", 0, 0 )
AsphyxiaUIAddOnManagerSaveButton.Text:SetText( SAVE_CHANGES )

AsphyxiaUIAddOnManagerSaveButton:SetScript( "OnClick", function() ReloadUI() end )
AsphyxiaUIAddOnManagerSaveButton:HookScript( "OnEnter", S.SetModifiedBackdrop )
AsphyxiaUIAddOnManagerSaveButton:HookScript( "OnLeave", S.SetOriginalBackdrop )

local AsphyxiaUIAddOnManagerCloseButton = CreateFrame( "Button", "AsphyxiaUIAddOnManagerCloseButton", AsphyxiaUIAddOnManagerBackground )
AsphyxiaUIAddOnManagerCloseButton:Size( 130, 20 )
AsphyxiaUIAddOnManagerCloseButton:Point( "BOTTOMRIGHT", AsphyxiaUIAddOnManagerBackground, "BOTTOMRIGHT", -10, 10 )
AsphyxiaUIAddOnManagerCloseButton:SetTemplate( "Default" )
AsphyxiaUIAddOnManagerCloseButton:SetFrameStrata( "TOOLTIP" )

AsphyxiaUIAddOnManagerCloseButton.Text = S.SetFontString( AsphyxiaUIAddOnManagerCloseButton, S.CreateFontString() )
AsphyxiaUIAddOnManagerCloseButton.Text:Point( "CENTER", AsphyxiaUIAddOnManagerCloseButton, "CENTER", 0, 0 )
AsphyxiaUIAddOnManagerCloseButton.Text:SetText( CANCEL )

AsphyxiaUIAddOnManagerCloseButton:SetScript( "OnClick", function() AsphyxiaUIAddOnManagerBackground:Hide() end )
AsphyxiaUIAddOnManagerCloseButton:HookScript( "OnEnter", S.SetModifiedBackdrop )
AsphyxiaUIAddOnManagerCloseButton:HookScript( "OnLeave", S.SetOriginalBackdrop )


local function UpdateAddons()
	local addons = {}
	for i = 1, GetNumAddOns() do
		addons[i] = select( 1, GetAddOnInfo( i ) )
	end
	table.sort( addons )
	local oldb
	for i, v in pairs( addons ) do
		local name, title, notes, enabled, loadable, reason, security = GetAddOnInfo( v )
		local button = CreateFrame( "Button", v .. "_Button", AsphyxiaUIAddOnManagerButtonsBackground, "SecureActionButtonTemplate" )
		button:SetFrameLevel( AsphyxiaUIAddOnManagerButtonsBackground:GetFrameLevel() + 1 )
		button:Size( 50, 16 )
		button:SetTemplate( "Default" )

		if( enabled ) then
			button:SetBackdropBorderColor( 0, 1, 0 )
		else
			button:SetBackdropBorderColor( 1, 0, 0 )
		end

		if( i == 1 ) then
			button:Point( "TOPLEFT", AsphyxiaUIAddOnManagerButtonsBackground, "TOPLEFT", 0, 0 )
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
	AsphyxiaUIAddOnManagerBackground:Show()
end