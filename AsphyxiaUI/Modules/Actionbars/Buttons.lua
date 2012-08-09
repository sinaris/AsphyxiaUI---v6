---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local TukuiBar1 = TukuiBar1
local TukuiBar2 = TukuiBar2
local TukuiBar3 = TukuiBar3
local TukuiBar4 = TukuiBar4
local TukuiSplitBarLeft = AsphyxiaUISplitBarLeft
local TukuiSplitBarRight = AsphyxiaUISplitBarRight
local TukuiRightBar = AsphyxiaUIRightBar
local TukuiPetBar = TukuiPetBar

TukuiBar2Button:Kill()
TukuiBar3Button:Kill()
TukuiBar4Button:Kill()
TukuiBar5ButtonTop:Kill()
TukuiBar5ButtonBottom:Kill()

local Toggle = CreateFrame( "Frame", "TukuiToggleActionbar", AsphyxiaUIControlPanelActionbarBackground )

local ToggleText = function( index, text, plus, neg )
	if( plus ) then
		Toggle[index].Text:SetText( text )
		Toggle[index].Text:SetTextColor( 0.3, 0.3, 0.9 )
	elseif( neg ) then
		Toggle[index].Text:SetText( text )
		Toggle[index].Text:SetTextColor( 0.9, 0.3, 0.3 )
	end
end

local MainBars = function()
	if( AsphyxiaUISaved.bottomrows == 1 ) then
		TukuiBar1:Height( ( S.buttonsize + S.buttonspacing * 2 ) + 2 )
		TukuiSplitBarLeft:Height( TukuiBar1:GetHeight() )
		TukuiSplitBarRight:Height( TukuiBar1:GetHeight() )

		ToggleText( 1, "+ + +", true )
		UnregisterStateDriver( TukuiBar2, "visibility" )
		TukuiBar2:Hide()

		if( AsphyxiaUISaved.splitbars == true ) then
			MultiBarLeft:ClearAllPoints()
			MultiBarLeft:SetParent( TukuiSplitBarLeft )
			for i = 7, 12 do
				local b = _G["MultiBarLeftButton" .. i]
				b:SetAlpha( 1 )
				b:SetScale( 0.000001 )
			end
		else
			MultiBarLeft:ClearAllPoints()
			MultiBarLeft:SetParent( TukuiBar3 )
		end

	elseif( AsphyxiaUISaved.bottomrows == 2 ) then
		TukuiBar1:Height( ( S.buttonsize * 2 + S.buttonspacing * 3 ) + 2 )
		TukuiSplitBarLeft:Height( TukuiBar1:GetHeight() )
		TukuiSplitBarRight:Height( TukuiBar1:GetHeight() )

		ToggleText( 1, "- - -", false, true )
		RegisterStateDriver( TukuiBar2, "visibility", "[vehicleui][petbattle] hide; show" )
		TukuiBar2:Show()

		if( AsphyxiaUISaved.splitbars == true ) then
			MultiBarLeft:ClearAllPoints()
			MultiBarLeft:SetParent( TukuiSplitBarLeft )
			for i = 7, 12 do
				local b = _G["MultiBarLeftButton" .. i]
				b:SetAlpha( 1 )
				b:SetScale( 1 )
			end
		else
			MultiBarLeft:ClearAllPoints()
			MultiBarLeft:SetParent( TukuiBar3 )
		end

	end
	Toggle[4]:Height( 16 )
	Toggle[4]:Width( 39 )

	Toggle[5]:Height( 16 )
	Toggle[5]:Width( 39 )
end

local RightBars = function()
	if( AsphyxiaUISaved.rightbars >= 1 ) then
		TukuiPetBar:ClearAllPoints()
		if( C["actionbar"]["vertical_rightbars"] == true ) then
			if not C["chat"].background then
				TukuiPetBar:Point( "RIGHT", TukuiRightBar, "LEFT", -3, 0 )
			else
				TukuiPetBar:Point( "BOTTOMRIGHT", TukuiRightBar, "BOTTOMLEFT", -3, 0 )
			end
		else
			TukuiPetBar:Point( "BOTTOM", TukuiRightBar, "TOP", 0, 3 )
		end
	else
		TukuiPetBar:ClearAllPoints()
		if( C["chat"]["background"] ~= true ) then
			TukuiPetBar:Point( "RIGHT", UIParent, "RIGHT", -8, 0 )
		elseif( C["actionbar"]["vertical_rightbars"] == true ) then
			TukuiPetBar:Point( "BOTTOMRIGHT", G.Panels.RightChatBackground, "TOPRIGHT", 0, 3 )
		else
			TukuiPetBar:Point( "BOTTOM", G.Panels.RightChatBackground, "TOP", 0, 3 )
		end
	end

	if( AsphyxiaUISaved.rightbars == 1 ) then
		RegisterStateDriver( TukuiRightBar, "visibility", "[vehicleui][petbattle]	 hide; show" )
		UnregisterStateDriver( TukuiBar4, "visibility" )
		TukuiRightBar:Show()
		TukuiBar4:Hide()

		if( C["actionbar"]["vertical_rightbars"] == true ) then
			TukuiRightBar:Width( ( S.buttonsize + S.buttonspacing * 2 ) + 2 )
		else
			TukuiRightBar:Height( ( S.buttonsize + S.buttonspacing * 2 ) + 2 )
		end
		
		if( AsphyxiaUISaved.splitbars ~= true and TukuiBar3:IsShown() ) then
			MultiBarLeft:ClearAllPoints()
			MultiBarLeft:SetParent( TukuiBar3 )
			UnregisterStateDriver( TukuiBar3, "visibility" )
			TukuiBar3:Hide()
		end
	elseif( AsphyxiaUISaved.rightbars == 2 ) then
		RegisterStateDriver( TukuiRightBar, "visibility", "[vehicleui][petbattle] hide; show" )
		RegisterStateDriver( TukuiBar4, "visibility", "[vehicleui][petbattle] hide; show" )
		TukuiRightBar:Show()
		TukuiBar4:Show()

		if( C["actionbar"]["vertical_rightbars"] == true ) then
			TukuiRightBar:Width( ( S.buttonsize * 2 + S.buttonspacing * 3 ) + 2 )
		else
			TukuiRightBar:Height( ( S.buttonsize * 2 + S.buttonspacing * 3 ) + 2 )
		end

		if( AsphyxiaUISaved.splitbars ~= true and TukuiBar3:IsShown() ) then
			MultiBarLeft:ClearAllPoints()
			MultiBarLeft:SetParent( TukuiBar3 )
			UnregisterStateDriver( TukuiBar3, "visibility" )
			TukuiBar3:Hide()
		end
	elseif( AsphyxiaUISaved.rightbars == 3 ) then
		RegisterStateDriver( TukuiRightBar, "visibility", "[vehicleui][petbattle] hide; show" )
		RegisterStateDriver( TukuiBar4, "visibility", "[vehicleui][petbattle] hide; show" )
		TukuiRightBar:Show()
		TukuiBar4:Show()

		if( C["actionbar"]["vertical_rightbars"] == true ) then
			TukuiRightBar:Width( ( S.buttonsize * 3 + S.buttonspacing * 4 ) + 2 )
		else
			TukuiRightBar:Height( ( S.buttonsize * 3 + S.buttonspacing * 4 ) + 2 )
		end

		if( AsphyxiaUISaved.splitbars ~= true ) then
			MultiBarLeft:ClearAllPoints()
			MultiBarLeft:SetParent( TukuiBar3 )
			RegisterStateDriver( TukuiBar3, "visibility", "[vehicleui][petbattle] hide; show" )
			TukuiBar3:Show()

			for i = 1, 12 do
				local b = _G["MultiBarLeftButton" .. i]
				local b2 = _G["MultiBarLeftButton" .. i - 1]
				b:SetSize( S.buttonsize, S.buttonsize )
				b:ClearAllPoints()

				if( i == 1 ) then
					b:Point( "TOPLEFT", TukuiRightBar, 5, -5 )
				else
					if not AsphyxiaUISaved.splitbars and C["actionbar"]["vertical_rightbars"] == true then
						b:Point( "TOP", b2, "BOTTOM", 0, -S.buttonspacing )
					else
						b:Point( "LEFT", b2, "RIGHT", S.buttonspacing, 0 )
					end
				end
			end
		end

	elseif( AsphyxiaUISaved.rightbars == 0 ) then
		UnregisterStateDriver( TukuiRightBar, "visibility" )
		UnregisterStateDriver( TukuiBar4, "visibility" )
		TukuiRightBar:Hide()
		TukuiBar4:Hide()

		if( AsphyxiaUISaved.splitbars ~= true ) then
			MultiBarLeft:ClearAllPoints()
			MultiBarLeft:SetParent( TukuiBar3 )
			UnregisterStateDriver( TukuiBar3, "visibility" )
			TukuiBar3:Hide()
		end
	end
end

local SplitBars = function()
	if( AsphyxiaUISaved.splitbars == true ) then
		MultiBarLeft:ClearAllPoints()
		MultiBarLeft:SetParent( TukuiSplitBarLeft )
		for i = 1, 12 do
			local b = _G["MultiBarLeftButton" .. i]
			local b2 = _G["MultiBarLeftButton" .. i - 1]
			b:ClearAllPoints()
			if( i == 1 ) then
				b:Point( "BOTTOMLEFT", TukuiSplitBarLeft, 5, 5 )
			else
				if( i == 4 ) then
					b:Point( "BOTTOMLEFT", TukuiSplitBarRight, 5, 5 )
				elseif( i == 7 ) then
					b:Point( "BOTTOMLEFT", _G["MultiBarLeftButton1"], "TOPLEFT", 0, S.buttonspacing )
				elseif( i == 10 ) then
					b:Point( "BOTTOMLEFT", _G["MultiBarLeftButton4"], "TOPLEFT", 0, S.buttonspacing )
				else
					b:Point( "LEFT", b2, "RIGHT", S.buttonspacing, 0 )
				end
			end
		end

		if( AsphyxiaUISaved.rightbars == 3 ) then
			RegisterStateDriver( TukuiRightBar, "visibility", "[vehicleui][petbattle] hide; show" )
			TukuiRightBar:Show()
			if( C["actionbar"]["vertical_rightbars"] == true ) then
				TukuiRightBar:Width( ( S.buttonsize * 2 + S.buttonspacing * 3 ) + 2 )
			else
				TukuiRightBar:Height( ( S.buttonsize * 2 + S.buttonspacing * 3 ) + 2 )
			end
		end

		for i = 7, 12 do
			if( AsphyxiaUISaved.bottomrows == 1 ) then
				local b = _G["MultiBarLeftButton" .. i]
				b:SetAlpha( 1 )
				b:SetScale( 0.000001 )
			elseif( AsphyxiaUISaved.bottomrows == 2 ) then
				local b = _G["MultiBarLeftButton" .. i]
				b:SetAlpha( 1 )	
				b:SetScale( 1 )
			end
		end
		RegisterStateDriver( TukuiSplitBarLeft, "visibility", "[vehicleui][petbattle] hide; show" )
		RegisterStateDriver( TukuiSplitBarRight, "visibility", "[vehicleui][petbattle] hide; show" )
		TukuiSplitBarLeft:Show()
		TukuiSplitBarRight:Show()

		Toggle[4]:ClearAllPoints()
		Toggle[5]:ClearAllPoints()

		Toggle[4]:Point( "BOTTOMLEFT", AsphyxiaUIControlPanelActionbarBackgroundCloseButton, "TOPLEFT", 0, 23 )
		Toggle[4]:CreateOverlay( Toggle[4] )

		Toggle[4]:HookScript( "OnEnter", S.SetModifiedBackdrop )
		Toggle[4]:HookScript( "OnLeave", S.SetOriginalBackdrop )

		Toggle[5]:Point( "LEFT", Toggle[4], "RIGHT", 4, 0 )
		Toggle[5]:CreateOverlay( Toggle[5] )

		Toggle[5]:HookScript( "OnEnter", S.SetModifiedBackdrop )
		Toggle[5]:HookScript( "OnLeave", S.SetOriginalBackdrop )

		ToggleText( 4, ">", false, true )
		ToggleText( 5, "<", false, true )

	elseif( AsphyxiaUISaved.splitbars == false ) then
		MultiBarLeft:ClearAllPoints()
		MultiBarLeft:SetParent( TukuiBar3 )

		for i = 1, 12 do
			local b = _G["MultiBarLeftButton" .. i]
			local b2 = _G["MultiBarLeftButton" .. i - 1]
			b:ClearAllPoints()
			if( i == 1 ) then
				b:Point( "TOPLEFT", TukuiRightBar, 5, -5 )
			else
				b:Point( "LEFT", b2, "RIGHT", S.buttonspacing, 0 )
			end
		end

		Toggle[4]:ClearAllPoints()
		Toggle[5]:ClearAllPoints()

		Toggle[4]:Point( "BOTTOMLEFT", AsphyxiaUIControlPanelActionbarBackgroundCloseButton, "TOPLEFT", 0, 23 )

		Toggle[5]:Point( "LEFT", Toggle[4], "RIGHT", 4, 0 )

		ToggleText( 4, "<", true )
		ToggleText( 5, ">", true )

		RightBars()

		for i = 7, 12 do
			local b = _G["MultiBarLeftButton" .. i]
			b:SetAlpha( 1 )	
			b:SetScale( 1 )
		end

		UnregisterStateDriver( TukuiSplitBarLeft, "visibility" )
		UnregisterStateDriver( TukuiSplitBarRight, "visibility" )
		TukuiSplitBarLeft:Hide()
		TukuiSplitBarRight:Hide()
	end
end

local function LockCheck( index )
	if( AsphyxiaUISaved.actionbarsLocked == true ) then
		Toggle[index].Text:SetText( "unlock" )
	elseif AsphyxiaUISaved.actionbarsLocked == false then
		Toggle[index].Text:SetText( "lock" )
	end
end

for i = 1, 6 do
	Toggle[i] = CreateFrame( "Frame", "TukuiToggle" .. i, Toggle )
	Toggle[i]:EnableMouse( true )
	Toggle[i]:SetAlpha( 1 )

	Toggle[i].Text = Toggle[i]:CreateFontString( nil, "OVERLAY" )
	Toggle[i].Text:SetFont( S.CreateFontString() )
	Toggle[i].Text:Point( "CENTER", 2, 1 )

	if( i == 1 ) then
		Toggle[i]:Size( AsphyxiaUIControlPanelActionbarBackground:GetWidth() - 8, 15 )
		Toggle[i]:Point( "TOP", AsphyxiaUIControlPanelActionbarBackground, "TOP", 0, -4 )
		Toggle[i]:SetTemplate( "Default" )
		Toggle[i]:SetFrameLevel( AsphyxiaUIControlPanelActionbarBackground:GetFrameLevel() + 1 )
		Toggle[i]:CreateOverlay( Toggle[i] )

		Toggle[i]:HookScript( "OnEnter", S.SetModifiedBackdrop )
		Toggle[i]:HookScript( "OnLeave", S.SetOriginalBackdrop )

		Toggle[i]:SetScript( "OnMouseDown", function()
			if( InCombatLockdown() ) then return end

			AsphyxiaUISaved.bottomrows = AsphyxiaUISaved.bottomrows + 1

			if( AsphyxiaUISaved.bottomrows > 2 ) then
				AsphyxiaUISaved.bottomrows = 1
			end

			MainBars()
		end )
		Toggle[i]:SetScript( "OnEvent", MainBars )

	elseif( i == 2 ) then
		Toggle[i]:Size( S.buttonsize, AsphyxiaUIControlPanelActionbarBackground:GetHeight() - 44 )
		Toggle[i]:Point( "RIGHT", AsphyxiaUIControlPanelActionbarBackground, "RIGHT", -4, 0 )
		Toggle[i]:SetTemplate( "Default" )
		Toggle[i]:SetFrameLevel( AsphyxiaUIControlPanelActionbarBackground:GetFrameLevel() + 1 )
		Toggle[i]:CreateOverlay( Toggle[i] )

		if( C["actionbar"].vertical_rightbars == true ) then
			ToggleText( i, ">", false, true )
		else
			ToggleText( i, "-", false, true )
		end

		Toggle[i]:HookScript( "OnEnter", S.SetModifiedBackdrop )
		Toggle[i]:HookScript( "OnLeave", S.SetOriginalBackdrop )

		Toggle[i]:SetScript( "OnMouseDown", function()
			if( InCombatLockdown() ) then return end

			AsphyxiaUISaved.rightbars = AsphyxiaUISaved.rightbars - 1

			if( AsphyxiaUISaved.splitbars == true and AsphyxiaUISaved.rightbars > 2 ) then
				AsphyxiaUISaved.rightbars = 1
			elseif( AsphyxiaUISaved.rightbars < 0 ) then
				if( AsphyxiaUISaved.splitbars == true ) then
					AsphyxiaUISaved.rightbars = 2
				else
					AsphyxiaUISaved.rightbars = 3
				end
			end
			RightBars()
		end )
		Toggle[i]:SetScript( "OnEvent", RightBars )

	elseif( i == 3 ) then
		Toggle[i]:Size( Toggle[i - 1]:GetWidth(), Toggle[i - 1]:GetHeight() )
		Toggle[i]:Point( "TOPRIGHT", Toggle[i - 1], "TOPLEFT", -3, 0 )
		Toggle[i]:SetTemplate( "Default" )
		Toggle[i]:SetFrameLevel( AsphyxiaUIControlPanelActionbarBackground:GetFrameLevel() + 1 )
		Toggle[i]:CreateOverlay( Toggle[i] )

		if( C["actionbar"].vertical_rightbars == true ) then
			ToggleText( i, "<", true, false )
		else
			ToggleText( i, "+", true, false )
		end

		Toggle[i]:HookScript( "OnEnter", S.SetModifiedBackdrop )
		Toggle[i]:HookScript( "OnLeave", S.SetOriginalBackdrop )

		Toggle[i]:SetScript( "OnMouseDown", function()
			if( InCombatLockdown() ) then return end

			AsphyxiaUISaved.rightbars = AsphyxiaUISaved.rightbars + 1

			if( AsphyxiaUISaved.splitbars == true and AsphyxiaUISaved.rightbars > 2 ) then
				AsphyxiaUISaved.rightbars = 0
			elseif( AsphyxiaUISaved.rightbars > 3 ) then
				AsphyxiaUISaved.rightbars = 0
			end

			RightBars()
		end )
		Toggle[i]:SetScript( "OnEvent", RightBars )

	elseif( i == 4 ) then
		Toggle[i]:Size( S.buttonsize / 2, 15 )
		Toggle[i]:Point( "BOTTOMRIGHT", AsphyxiaUIControlPanelActionbarBackground, "BOTTOMLEFT", -3, 0 )
		Toggle[i]:SetTemplate( "Default" )
	elseif( i == 5 ) then
		Toggle[i]:Size( S.buttonsize / 2, 15 )
		Toggle[i]:Point( "BOTTOMLEFT", AsphyxiaUIControlPanelActionbarBackground, "BOTTOMRIGHT", 3, 0 )
		Toggle[i]:SetTemplate( "Default" )
	elseif( i == 6 ) then
		Toggle[i]:Size( 82, 17 )
		Toggle[i]:Point( "BOTTOMLEFT", AsphyxiaUIControlPanelActionbarBackgroundCloseButton, "TOPLEFT", 0, 3 )
		Toggle[i]:SetTemplate( "Default" )
		Toggle[i]:SetFrameLevel( AsphyxiaUIControlPanelActionbarBackground:GetFrameLevel() + 1 )
		Toggle[i]:CreateOverlay( Toggle[i] )

		Toggle[i]:HookScript( "OnEnter", S.SetModifiedBackdrop )
		Toggle[i]:HookScript( "OnLeave", S.SetOriginalBackdrop )

		Toggle[i]:SetScript( "OnMouseDown", function()	
			if( InCombatLockdown() ) then return end

			if( AsphyxiaUISaved.actionbarsLocked == true ) then
				AsphyxiaUISaved.actionbarsLocked = false
				print( L.AsphyxiaUI_Actionbars_Buttons_Text_Unlocked )
			elseif( AsphyxiaUISaved.actionbarsLocked == false ) then
				AsphyxiaUISaved.actionbarsLocked = true
				print( L.AsphyxiaUI_Actionbars_Buttons_Text_Locked )
			end

			LockCheck( i )
		end )

		Toggle[i]:SetScript( "OnEvent", function()
			LockCheck( i )
		end )
	end

	if( i == 4 or i == 5 ) then
		Toggle[i]:SetScript( "OnMouseDown", function()
			if( InCombatLockdown() ) then return end

			if( AsphyxiaUISaved.splitbars == false ) then
				AsphyxiaUISaved.splitbars = true
			elseif( AsphyxiaUISaved.splitbars == true ) then
				AsphyxiaUISaved.splitbars = false
			end
			SplitBars()
		end )
		Toggle[i]:SetScript( "OnEvent", SplitBars )
	end
	Toggle[i]:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	Toggle[i]:RegisterEvent( "PLAYER_REGEN_DISABLED" )
	Toggle[i]:RegisterEvent( "PLAYER_REGEN_ENABLED" )

	Toggle[i]:SetScript( "OnUpdate", function() 
		if( AsphyxiaUISaved.actionbarsLocked == true ) then
			for i = 1, 5 do
				Toggle[i]:EnableMouse( false )
			end
		elseif( AsphyxiaUISaved.actionbarsLocked == false ) then
			for i = 1, 5 do
				Toggle[i]:EnableMouse( true )
			end
		end
	end )
end

local vehicle = CreateFrame( "Button", "TukuiExitVehicleButton", UIParent, "SecureHandlerClickTemplate" )
vehicle:Size( S.buttonsize * 2, S.buttonsize + 1 )
vehicle:Point( "BOTTOMRIGHT", TukuiChatBackgroundRight, "BOTTOMLEFT", -3, 0 )
vehicle:SetTemplate( "Transparent" )
vehicle:CreateOverlay( vehicle )
vehicle:RegisterForClicks( "AnyUp" )
vehicle:SetScript( "OnClick", function() VehicleExit() end )

vehicle.Text = S.SetFontString( vehicle, S.CreateFontString() )
vehicle.Text:Point( "CENTER", 1, 1 )
vehicle.Text:SetText( S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. EXIT )
RegisterStateDriver( vehicle, "visibility", "[target=vehicle,exists] show;hide" )

vehicle:HookScript( "OnEnter", S.SetModifiedBackdrop )
vehicle:HookScript( "OnLeave", S.SetOriginalBackdrop )