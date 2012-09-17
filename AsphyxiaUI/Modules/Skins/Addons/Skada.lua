---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["addonskins"]["enable"] ~= true ) then return end

if not IsAddOnLoaded( "Skada" ) or C["addonskins"]["skada"] ~= true then return end

local Skada = Skada

local Skada = Skada
local barSpacing = S.Scale( 1, 1 )
local borderWidth = S.Scale( 2, 2 )

local barmod = Skada.displays["bar"]

local function StripOptions( options )
	options.baroptions.args.barspacing = nil
	options.titleoptions.args.texture = nil
	options.titleoptions.args.bordertexture = nil
	options.titleoptions.args.thickness = nil
	options.titleoptions.args.margin = nil
	options.titleoptions.args.color = nil
	options.windowoptions = nil
	options.baroptions.args.barfont = nil
	options.titleoptions.args.font = nil
end

local barmod = Skada.displays["bar"]
barmod.AddDisplayOptions_ = barmod.AddDisplayOptions
barmod.AddDisplayOptions = function( self, win, options )
	self:AddDisplayOptions_( win, options )
	StripOptions( options )
end

for k, options in pairs( Skada.options.args.windows.args ) do
	if( options.type == "group" ) then
		StripOptions( options.args )
	end
end

local titleBG = {
	bgFile = C["media"].normTex,
	tile = false,
	tileSize = 0
}

barmod.ApplySettings_ = barmod.ApplySettings
barmod.ApplySettings = function( self, win )
	barmod.ApplySettings_( self, win )

	local skada = win.bargroup

	if( win.db.enabletitle ) then
		skada.button:SetBackdrop( titleBG )
	end

	skada:SetTexture( C["media"].normTex )
	skada:SetSpacing( barSpacing )
	skada:SetFont( C["media"].pixelfont, C["datatext"].fontsize, "" )
	skada:SetFrameLevel( 5 )
	
	if not skada.TitleBackGround then
		skada.TitleBackGround = CreateFrame( "Frame", nil, skada.button )
		skada.TitleBackGround:SetPoint( "TOP" )
		skada.TitleBackGround:SetPoint( "LEFT" )
		skada.TitleBackGround:SetPoint( "RIGHT" )
		skada.TitleBackGround:SetPoint( "BOTTOM", 0, 1 )
		skada.TitleBackGround:SetTemplate( "Default" )
		skada.TitleBackGround:SetFrameLevel( skada.button:GetFrameLevel() -1 )
	end
	
	local titlefont = CreateFont( "TitleFont" .. win.db.name )
	titlefont:SetFont( C.media.pixelfont, 12, "MONOCHROMEOUTLINE" )
	skada.button:SetNormalFontObject( titlefont )

	local color = win.db.title.color
	skada.button:SetBackdropColor( 0, 0, 0, 0 )

	skada:SetBackdrop( nil )
	if not skada.backdrop then
		skada:CreateBackdrop( "Default" )
	end
	skada.backdrop:ClearAllPoints()
	if( win.db.enabletitle ) then
		skada.backdrop:Point( "TOPLEFT", skada.button, "TOPLEFT", -2, 2 )
	else
		skada.backdrop:Point( "TOPLEFT", skada, "TOPLEFT", -2, 2 )
	end
	skada.backdrop:Point( "BOTTOMRIGHT", skada, "BOTTOMRIGHT", 2, -2 )

	if( C["addonskins"].embedright == "skada" ) then
		win.bargroup.button:SetFrameStrata( "MEDIUM" )
		win.bargroup.button:SetFrameLevel( 5 )	
		win.bargroup:SetFrameStrata( "MEDIUM" )
	end
end

local function EmbedWindow( window, width, barheight, height, point, relativeFrame, relativePoint, ofsx, ofsy )
	window.db.barwidth = width
	window.db.barheight = barheight
	if( window.db.enabletitle ) then 
		height = height - barheight
	end
	window.db.background.height = height
	window.db.spark = false
	window.db.barslocked = true
	window.bargroup:ClearAllPoints()
	window.bargroup:SetPoint( point, relativeFrame, relativePoint, ofsx, ofsy )
	
	barmod.ApplySettings( barmod, window )
end

local windows = {}
function EmbedSkada()
	if( #windows == 1 ) then
		EmbedWindow( windows[1], TukuiChatBackgroundRight:GetWidth() - 4, ( TukuiChatBackgroundRight:GetHeight() - 4 - ( barSpacing * 4 ) ) / 10, ( TukuiChatBackgroundRight:GetHeight() ), "BOTTOMRIGHT", TukuiChatBackgroundRight, "BOTTOMRIGHT", -2, 2 )
	elseif( #windows == 2 ) then
		EmbedWindow( windows[1], ( ( TukuiChatBackgroundRight:GetWidth() - 4 ) / 2 ) - ( borderWidth + S.mult ), ( TukuiChatBackgroundRight:GetHeight() - 4 - ( barSpacing * 4 ) ) / 10, TukuiChatBackgroundRight:GetHeight(), "BOTTOMRIGHT", TukuiChatBackgroundRight, "BOTTOMRIGHT", -2, 2 )
		EmbedWindow( windows[2], ( ( TukuiChatBackgroundRight:GetWidth() - 4 ) / 2 ) - ( borderWidth + S.mult ), ( TukuiChatBackgroundRight:GetHeight() - 4 - ( barSpacing * 4 ) ) / 10, TukuiChatBackgroundRight:GetHeight(), "BOTTOMLEFT", TukuiChatBackgroundRight, "BOTTOMLEFT", 2, 2 )
	elseif( #windows > 2 ) then
		EmbedWindow( windows[1], ( ( TukuiChatBackgroundRight:GetWidth() - 4 ) / 2 ) - ( borderWidth + S.mult ), ( TukuiChatBackgroundRight:GetHeight() - 4 - ( barSpacing * 4 ) ) / 10, TukuiChatBackgroundRight:GetHeight(), "BOTTOMRIGHT", TukuiChatBackgroundRight, "BOTTOMRIGHT", -2, 2 )
		EmbedWindow( windows[2], ( ( TukuiChatBackgroundRight:GetWidth() - 4 ) / 2 ) - ( borderWidth + S.mult ), ( ( TukuiChatBackgroundRight:GetHeight() - 6 / 2 ) - ( barSpacing * 4 ) ) / 10, TukuiChatBackgroundRight:GetHeight() / 2 - 2,  "BOTTOMLEFT", TukuiChatBackgroundRight, "BOTTOMLEFT", 2, 2 )
		EmbedWindow( windows[3], windows[2].db.barwidth -1 , ( ( TukuiChatBackgroundRight:GetHeight() - 6 / 2 ) - ( barSpacing * 4 ) ) / 10, TukuiChatBackgroundRight:GetHeight() / 2 - 2,  "BOTTOMLEFT", windows[2].bargroup.backdrop, "TOPLEFT", 0, 0 )
	end
end

for _, window in ipairs( Skada:GetWindows() ) do
	window:UpdateDisplay()
end

if( C["addonskins"].embedright == "skada" ) then
	Skada.CreateWindow_ = Skada.CreateWindow
	function Skada:CreateWindow( name, db )
		Skada:CreateWindow_( name, db )

		windows = {}
		for _, window in ipairs( Skada:GetWindows() ) do
			tinsert( windows, window )
		end	

		EmbedSkada()
	end

	Skada.DeleteWindow_ = Skada.DeleteWindow
	function Skada:DeleteWindow( name )
		Skada:DeleteWindow_( name )

		windows = {}
		for _, window in ipairs( Skada:GetWindows() ) do
			tinsert( windows, window )
		end	

		EmbedSkada()
	end

	local Skada_Skin = CreateFrame( "Frame" )
	Skada_Skin:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	Skada_Skin:SetScript( "OnEvent", function( self )
		self:UnregisterAllEvents()
		self = nil

		EmbedSkada()
	end )

	if( TukuiTabsRightBackground ) then
		local button = CreateFrame( "Button", "SkadaToggleSwitch", TukuiTabsRightBackground )
		button:Width( 90 )
		button:Height( TukuiTabsRightBackground:GetHeight() - 4 )
		button:Point( "CENTER", TukuiTabsRightBackground, "CENTER", 2, -2 )

		button.tex = button:CreateTexture( nil, "OVERLAY" )
		button.tex:SetTexture( C["media"]["addonstoggle"] )
		button.tex:Point( "TOPRIGHT", -2, 0 )
		button.tex:Height( button:GetHeight() - 4 )
		button.tex:Width( 16 )

		button:FontString( nil, S.CreateFontString() )
		button.text:SetPoint( "RIGHT", button.tex, "LEFT" )
		button.text:SetTextColor( unpack( C["media"].datatextcolor2 ) )
		
		button:SetScript( "OnEnter", function( self ) button.text:SetText( "Toogle Skada" ) end )
		button:SetScript( "OnLeave", function( self ) self.tex:Point( "TOPRIGHT", -2, 0 ) button.text:SetText( nil ) end )
		button:SetScript( "OnMouseDown", function( self ) self.tex:Point( "TOPRIGHT", -4, -4 ) end )
		button:SetScript( "OnMouseUp", function( self ) self.tex:Point( "TOPRIGHT", -2, -2 ) end )
		button:SetScript( "OnClick", function( self ) Skada:ToggleWindow() end )
	end	

	if( C["addonskins"].embedrighttoggle == true ) then
		TukuiChatBackgroundRight:HookScript( "OnShow", function()
			for _, window in ipairs( Skada:GetWindows() ) do
				window:Hide()
			end
		end )
		TukuiChatBackgroundRight:HookScript("OnHide", function()
			for _, window in ipairs( Skada:GetWindows() ) do
				window:Show()
			end
		end )
	end
end