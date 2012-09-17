---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Credits: All credits goes to the original Author: Favorit
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["chatbar"]["enable"] ~= true ) then return end

local AsphyxiaUIChatBar = CreateFrame( "Frame", "AsphyxiaUIChatBar", UIParent )
AsphyxiaUIChatBar:Size( 101, 16 )
AsphyxiaUIChatBar:Point( "RIGHT", G.Panels.LeftChatTabsBackground, "RIGHT", -3, 0 )
AsphyxiaUIChatBar:SetTemplate( "Transparent" )

if( C["chatbar"]["hover"] == true ) then
	AsphyxiaUIChatBar:SetAlpha( 0 )
	AsphyxiaUIChatBar:SetScript( "OnEnter", function()
		AsphyxiaUIChatBar:FadeIn()
	end )
	AsphyxiaUIChatBar:SetScript( "OnLeave", function()
		AsphyxiaUIChatBar:FadeOut()
	end )
end

function AsphyxiaUIChatBar:SW( button )
	if( button == "RightButton" ) then
		ChatFrame_OpenChat( "/w ", SELECTED_DOCK_FRAME )
	elseif( button == "MiddleButton" ) then
		ChatFrame_OpenChat( "/y ", SELECTED_DOCK_FRAME )
	else
		ChatFrame_OpenChat( "/s ", SELECTED_DOCK_FRAME )
	end
end

function AsphyxiaUIChatBar:GO( button )
	if( button == "RightButton" ) then
		ChatFrame_OpenChat( "/o ", SELECTED_DOCK_FRAME )
	else
		ChatFrame_OpenChat( "/g ", SELECTED_DOCK_FRAME )
	end
end

function AsphyxiaUIChatBar:RP( button )
	if( button == "RightButton" ) then
		ChatFrame_OpenChat( "/bg ", SELECTED_DOCK_FRAME )
	else
		ChatFrame_OpenChat( "/p ", SELECTED_DOCK_FRAME )
	end
end

function AsphyxiaUIChatBar:GT( button )
	if( button == "RightButton" ) then
		ChatFrame_OpenChat( "/2 ", SELECTED_DOCK_FRAME )
	else
		ChatFrame_OpenChat( "/1 ", SELECTED_DOCK_FRAME )
	end
end

function AsphyxiaUIChatBar:LG( button )
	if( button == "RightButton" ) then
		ChatFrame_OpenChat( "/4 ", SELECTED_DOCK_FRAME )
	else
		ChatFrame_OpenChat( "/3 ", SELECTED_DOCK_FRAME )
	end
end

function AsphyxiaUIChatBar:YR( button )
	if( button == "RightButton" ) then
		ChatFrame_OpenChat( "/rw ", SELECTED_DOCK_FRAME )
	else
		ChatFrame_OpenChat( "/raid ", SELECTED_DOCK_FRAME )
	end
end

local function CreateButton( b, f )
	b:Width( 16 )
	b:Height( 16 )
	b:SetTemplate( "Default" )
	b:RegisterForClicks( "AnyUp" )
	b:SetScript( "OnClick", f )

	b.t = b:CreateTexture( nil, "ARTWORK" )
	b.t:SetTexture( C["media"]["normTex"] )
	b.t:Point( "TOPLEFT", b, "TOPLEFT", 2, -2 )
	b.t:Point( "BOTTOMRIGHT", b, "BOTTOMRIGHT", -2, 2 )
end

local sw = CreateFrame( "Button", "sw", AsphyxiaUIChatBar )
CreateButton( sw, AsphyxiaUIChatBar.SW )
sw:Point( "LEFT", AsphyxiaUIChatBar, "LEFT", 0, 0 )
sw:SetBackdropBorderColor( 0.7, 0.33, 0.82, 1 )
sw.t:SetVertexColor( 0.8, 0.8, 0.8, 1 )
sw:SetScript("OnEnter", function( self )
	if( C["chatbar"]["hover"] == true ) then
		AsphyxiaUIChatBar:FadeIn()
	end

	if( C["chatbar"]["tooltip"] == true ) then
		GameTooltip:ClearLines()
		GameTooltip:SetOwner( self )
		GameTooltip:AddDoubleLine( KEY_BUTTON1, "/s" )
		GameTooltip:AddDoubleLine( KEY_BUTTON2, "/w" )
		GameTooltip:AddDoubleLine( KEY_BUTTON3, "/y" )
		GameTooltip:Show()
		GameTooltip:SetTemplate( "Transparent" )
	end
end )
sw:SetScript( "OnLeave", function( self )
	if( C["chatbar"]["hover"] == true ) then
		AsphyxiaUIChatBar:FadeOut()
	end

	if( C["chatbar"]["tooltip"] == true ) then
		GameTooltip:Hide()
	end
end )

local go = CreateFrame( "Button", "go", AsphyxiaUIChatBar )
CreateButton( go, AsphyxiaUIChatBar.GO )
go:Point( "LEFT", sw, "RIGHT", 1, 0 )
go:SetBackdropBorderColor( 0, 0.54, 0, 1 )
go.t:SetVertexColor( 0, 0.8, 0, 1 )
go:SetScript("OnEnter", function( self )
	if( C["chatbar"]["hover"] == true ) then
		AsphyxiaUIChatBar:FadeIn()
	end

	if( C["chatbar"]["tooltip"] == true ) then
		GameTooltip:ClearLines()
		GameTooltip:SetOwner( self )
		GameTooltip:AddDoubleLine( KEY_BUTTON1, "/g" )
		GameTooltip:AddDoubleLine( KEY_BUTTON2, "/o" )
		GameTooltip:Show()
		GameTooltip:SetTemplate( "Transparent" )
	end
end )
go:SetScript( "OnLeave", function( self )
	if( C["chatbar"]["hover"] == true ) then
		AsphyxiaUIChatBar:FadeOut()
	end

	if( C["chatbar"]["tooltip"] == true ) then
		GameTooltip:Hide()
	end
end )

local rp = CreateFrame( "Button", "rp", AsphyxiaUIChatBar )
CreateButton( rp, AsphyxiaUIChatBar.RP )
rp:Point( "LEFT", go, "RIGHT", 1, 0 )
rp:SetBackdropBorderColor( 0.8, 0.4, 0.1, 1 )
rp.t:SetVertexColor( 0.11, 0.5, 0.7, 1 )
rp:SetScript("OnEnter", function( self )
	if( C["chatbar"]["hover"] == true ) then
		AsphyxiaUIChatBar:FadeIn()
	end

	if( C["chatbar"]["tooltip"] == true ) then
		GameTooltip:ClearLines()
		GameTooltip:SetOwner( self )
		GameTooltip:AddDoubleLine( KEY_BUTTON1, "/p" )
		GameTooltip:AddDoubleLine( KEY_BUTTON2, "/bg" )
		GameTooltip:Show()
		GameTooltip:SetTemplate( "Transparent" )
	end
end )
rp:SetScript( "OnLeave", function( self )
	if( C["chatbar"]["hover"] == true ) then
		AsphyxiaUIChatBar:FadeOut()
	end

	if( C["chatbar"]["tooltip"] == true ) then
		GameTooltip:Hide()
	end
end )

local yr = CreateFrame( "Button", "yr", AsphyxiaUIChatBar )
CreateButton( yr, AsphyxiaUIChatBar.YR )
yr:Point( "LEFT", rp, "RIGHT", 1, 0 )
yr:SetBackdropBorderColor( 0.96, 0.2, 0.2, 1 )
yr.t:SetVertexColor( 1, 0.3, 0, 1 )
yr:SetScript("OnEnter", function( self )
	if( C["chatbar"]["hover"] == true ) then
		AsphyxiaUIChatBar:FadeIn()
	end

	if( C["chatbar"]["tooltip"] == true ) then
		GameTooltip:ClearLines()
		GameTooltip:SetOwner( self )
		GameTooltip:AddDoubleLine( KEY_BUTTON1, "/raid" )
		GameTooltip:AddDoubleLine( KEY_BUTTON2, "/rw" )
		GameTooltip:Show()
		GameTooltip:SetTemplate( "Transparent" )
	end
end )
yr:SetScript( "OnLeave", function( self )
	if( C["chatbar"]["hover"] == true ) then
		AsphyxiaUIChatBar:FadeOut()
	end

	if( C["chatbar"]["tooltip"] == true ) then
		GameTooltip:Hide()
	end
end )

local gt = CreateFrame( "Button", "gt", AsphyxiaUIChatBar )
CreateButton( gt, AsphyxiaUIChatBar.GT )
gt:Point( "LEFT", yr, "RIGHT", 1, 0 )
gt:SetBackdropBorderColor( 0.7, 0.7, 0, 1 )
gt.t:SetVertexColor( 0.93, 0.8, 0.8, 1 )
gt:SetScript("OnEnter", function( self )
	if( C["chatbar"]["hover"] == true ) then
		AsphyxiaUIChatBar:FadeIn()
	end

	if( C["chatbar"]["tooltip"] == true ) then
		GameTooltip:ClearLines()
		GameTooltip:SetOwner( self )
		GameTooltip:AddDoubleLine( KEY_BUTTON1, "/1" )
		GameTooltip:AddDoubleLine( KEY_BUTTON2, "/2" )
		GameTooltip:Show()
		GameTooltip:SetTemplate( "Transparent" )
	end
end )
gt:SetScript( "OnLeave", function( self )
	if( C["chatbar"]["hover"] == true ) then
		AsphyxiaUIChatBar:FadeOut()
	end

	if( C["chatbar"]["tooltip"] == true ) then
		GameTooltip:Hide()
	end
end )

local lg = CreateFrame( "Button", "lg", AsphyxiaUIChatBar )
CreateButton( lg, AsphyxiaUIChatBar.LG )
lg:Point( "LEFT", gt, "RIGHT", 1, 0 )
lg:SetBackdropBorderColor( 0.5, 1, 0.83, 1 )
lg.t:SetVertexColor( 1, 0.75, 0.75, 1 )
lg:SetScript("OnEnter", function( self )
	if( C["chatbar"]["hover"] == true ) then
		AsphyxiaUIChatBar:FadeIn()
	end

	if( C["chatbar"]["tooltip"] == true ) then
		GameTooltip:ClearLines()
		GameTooltip:SetOwner( self )
		GameTooltip:AddDoubleLine( KEY_BUTTON1, "/3" )
		GameTooltip:AddDoubleLine( KEY_BUTTON2, "/4" )
		GameTooltip:Show()
		GameTooltip:SetTemplate( "Transparent" )
	end
end )
lg:SetScript( "OnLeave", function( self )
	if( C["chatbar"]["hover"] == true ) then
		AsphyxiaUIChatBar:FadeOut()
	end

	if( C["chatbar"]["tooltip"] == true ) then
		GameTooltip:Hide()
	end
end )