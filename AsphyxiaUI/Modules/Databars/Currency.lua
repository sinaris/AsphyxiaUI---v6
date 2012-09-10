---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["databars"]["currency"] ~= true ) then return end

if( C["databars"]["enable"] ~= true ) then return end

local CurrencyData = {}
local tokens = {
	{ 61, 250 },
	{ 81, 250 },
	{ 241, 250 },
	{ 361, 200 },
	{ 390, 3000 },
	{ 391, 2000 },
	{ 392, 4000 },
	{ 395, 4000 },
	{ 396, 4000 },
	{ 402, 250 },
	{ 416, 300 },
}

local function updateCurrency()
	if( CurrencyData[1] ) then
		for i = 1, getn( CurrencyData ) do
			CurrencyData[i]:Kill()
		end
		wipe( CurrencyData ) 
	end

	for i, v in ipairs( tokens ) do
		local id, max = unpack( v )
		local name, amount, icon = GetCurrencyInfo( id )
		local r, g, b = oUFTukui.ColorGradient( amount, max, 0, 0.8, 0, 0.8, 0.8, 0, 0.8, 0, 0 )
		if( name and amount > 0 ) then
			local CurrencyDataFrame = CreateFrame( "Frame", "CurrencyData" .. id, UIParent )
			CurrencyDataFrame:Size( 148, 20 )
			CurrencyDataFrame:Point( "CENTER", UIParent, "CENTER", 0, 0 )
			CurrencyDataFrame:SetTemplate( "Transparent" )
			CurrencyDataFrame:EnableMouse( true )
			CurrencyDataFrame:CreateShadow( "Default" )
			CurrencyDataFrame:Animate( -140, 0, 0.4 )
			CurrencyDataFrame:Hide()

			CurrencyDataFrame.Status = CreateFrame( "StatusBar", "CurrencyDataStatus" .. id, CurrencyDataFrame )
			CurrencyDataFrame.Status:SetFrameLevel( 12 )
			CurrencyDataFrame.Status:SetStatusBarTexture( C["media"]["normTex"] )
			CurrencyDataFrame.Status:SetMinMaxValues( 0, max )
			CurrencyDataFrame.Status:SetValue( amount )
			CurrencyDataFrame.Status:SetStatusBarColor( r, g, b, 1 )
			CurrencyDataFrame.Status:Point( "TOPLEFT", CurrencyDataFrame, "TOPLEFT", 2, -2 )
			CurrencyDataFrame.Status:Point( "BOTTOMRIGHT", CurrencyDataFrame, "BOTTOMRIGHT", -2, 2 )

			CurrencyDataFrame.Text = CurrencyDataFrame.Status:CreateFontString( nil, "OVERLAY" )
			CurrencyDataFrame.Text:SetFont( unpack( S.FontTemplate.DatabarsCurrency.BuildFont ) )
			CurrencyDataFrame.Text:Point( "CENTER", CurrencyDataFrame, "CENTER", 0, 0 )
			CurrencyDataFrame.Text:Width( CurrencyDataFrame:GetWidth() - 4 )
			CurrencyDataFrame.Text:SetShadowColor( 0, 0, 0 )
			CurrencyDataFrame.Text:SetShadowOffset( 1.25, -1.25 )
			CurrencyDataFrame.Text:SetText( format( "%s / %s", amount, max ) )

			CurrencyDataFrame.IconBG = CreateFrame( "Frame", "CurrencyDataIconBG" .. id, CurrencyDataFrame )
			CurrencyDataFrame.IconBG:Size( 20 )
			CurrencyDataFrame.IconBG:Point( "BOTTOMLEFT", CurrencyDataFrame, "BOTTOMRIGHT", S.Scale( 3 ), 0 )
			CurrencyDataFrame.IconBG:SetTemplate( "Default" )
			CurrencyDataFrame.IconBG:CreateShadow("Default")

			CurrencyDataFrame.Icon = CurrencyDataFrame.IconBG:CreateTexture( nil, "ARTWORK" )
			CurrencyDataFrame.Icon:Point( "TOPLEFT", CurrencyDataFrame.IconBG, "TOPLEFT", 4, -2 )
			CurrencyDataFrame.Icon:Point( "BOTTOMRIGHT", CurrencyDataFrame.IconBG, "BOTTOMRIGHT", -2, 2 )
			CurrencyDataFrame.Icon:SetTexCoord( 0.08, 0.92, 0.08, 0.92 )
			CurrencyDataFrame.Icon:SetTexture( "Interface\\Icons\\" .. icon )

			CurrencyDataFrame:SetScript( "OnEnter", function( self )
				CurrencyDataFrame.Text:SetText( format( "%s", name ) )
			end )
			CurrencyDataFrame:SetScript( "OnLeave", function( self )
				CurrencyDataFrame.Text:SetText( format( "%s / %s", amount, max ) )
			end )

			tinsert( CurrencyData, CurrencyDataFrame )
		end
	end

	for key, frame in ipairs( CurrencyData ) do
		frame:ClearAllPoints()
		if( key == 1 ) then
			frame:Point( "TOPLEFT", UIParent, "TOPLEFT", 2, -23 )
		else
			frame:Point( "TOP", CurrencyData[key - 1], "BOTTOM", 0, -3 )
		end
	end
end

local AsphyxiaUICurrencyToggleButton = CreateFrame( "Frame", "AsphyxiaUICurrencyToggleButton", UIParent )
AsphyxiaUICurrencyToggleButton:Size( 30, 15 )
AsphyxiaUICurrencyToggleButton:Point( "TOPRIGHT", G.Panels.RightChatBackground, "TOPRIGHT", -5, -84 )
AsphyxiaUICurrencyToggleButton:SetTemplate( "Default" )
AsphyxiaUICurrencyToggleButton:EnableMouse( true )
AsphyxiaUICurrencyToggleButton:SetFrameStrata( "MEDIUM" )
AsphyxiaUICurrencyToggleButton:SetFrameLevel( 10 )
AsphyxiaUICurrencyToggleButton:CreateOverlay( toggle )
AsphyxiaUICurrencyToggleButton:CreateShadow( "Default" )
AsphyxiaUICurrencyToggleButton:SetAlpha( 0 )
AsphyxiaUICurrencyToggleButton:HookScript( "OnEnter", S.SetModifiedBackdrop )
AsphyxiaUICurrencyToggleButton:HookScript( "OnLeave", S.SetOriginalBackdrop )
AsphyxiaUICurrencyToggleButton:SetScript("OnEnter", function( self )
	if( InCombatLockdown() ) then
		print( ERR_NOT_IN_COMBAT )
		return
	end

	AsphyxiaUICurrencyToggleButton:FadeIn()

	GameTooltip:ClearLines()
	GameTooltip:SetOwner( self )
	GameTooltip:AddLine( L.Gametooltip_SHOW_HIDE_CURRENCYBARS )
	GameTooltip:Show()
end )

AsphyxiaUICurrencyToggleButton:SetScript( "OnLeave", function( self )
	AsphyxiaUICurrencyToggleButton:FadeOut()

	GameTooltip:Hide()
end )

AsphyxiaUICurrencyToggleButton.Text = AsphyxiaUICurrencyToggleButton:CreateFontString( nil, "OVERLAY" )
AsphyxiaUICurrencyToggleButton.Text:SetFont( unpack( S.FontTemplate.DatabarsCurrencyTglBtn.BuildFont ) )
AsphyxiaUICurrencyToggleButton.Text:Point( "CENTER", AsphyxiaUICurrencyToggleButton, "CENTER", 0, 0 )
AsphyxiaUICurrencyToggleButton.Text:SetText( S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "C" )
AsphyxiaUICurrencyToggleButton:SetScript( "OnMouseUp", function( self )
	for _, frame in pairs( CurrencyData ) do
		if( frame and frame:IsVisible() ) then
			frame:SlideOut()
		else
			frame:SlideIn()
		end
	end
end )

local updater = CreateFrame( "Frame" )
updater:RegisterEvent( "PLAYER_HONOR_GAIN" )
updater:SetScript( "OnEvent", updateCurrency )
hooksecurefunc( "BackpackTokenFrame_Update", updateCurrency )