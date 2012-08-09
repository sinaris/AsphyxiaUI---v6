---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["chat"]["enable"] ~= true ) then return end

local function SetTabStyle( frame )
	local id = frame:GetID()
	local chat = frame:GetName()
	local tab = _G[chat .. "Tab"]

	_G[chat .. "TabText"]:Show()

	tab:HookScript("OnEnter", function() _G[chat .. "TabText"]:Show() end )
	tab:HookScript("OnLeave", function() _G[chat .. "TabText"]:Show() end )

	_G[chat .. "TabText"]:SetTextColor( unpack( C["media"]["datatextcolor2"] ) )
	_G[chat .. "TabText"]:SetFont( S.CreateFontString() )
	_G[chat .. "TabText"].SetTextColor = S.dummy

	_G[chat .. "EditBox"]:ClearAllPoints()
	_G[chat .. "EditBox"]:Point( "TOPLEFT", G.Panels.LeftChatTabsBackground, 2, -2 )
	_G[chat .. "EditBox"]:Point( "BOTTOMRIGHT", G.Panels.LeftChatTabsBackground, -2, 2 )
end

local function SetupChatStyle( self )
	for i = 1, NUM_CHAT_WINDOWS do
	local frame = _G[format( "ChatFrame%s", i )]
		SetTabStyle( frame )
	end
end

TukuiChat:HookScript( "OnEvent", function( self, event, ... )
	for i = 1, NUM_CHAT_WINDOWS do
		local chat = _G[format( "ChatFrame%s", i )]
		SetupChatStyle( chat )
	end
end )

BNToastFrame:HookScript( "OnShow", function( self )
	self:ClearAllPoints()
	self:Point( "BOTTOMLEFT", G.Panels.LeftChatBackground, "TOPLEFT", 0, 3 )
end )

S.SetDefaultChatPosition = function( frame )
	if( frame ) then
		local id = frame:GetID()
		local name = FCF_GetChatWindowInfo( id )
		local fontSize = select( 2, frame:GetFont() )

		if( fontSize < 12 ) then
			FCF_SetChatWindowFontSize( nil, frame, 12 )
		else
			FCF_SetChatWindowFontSize( nil, frame, fontSize )
		end

		if( id == 1 ) then
			frame:ClearAllPoints()
			frame:Point( "TOPLEFT", G.Panels.LeftChatTabsBackground, "BOTTOMLEFT", 0, -2 )
			frame:Point( "BOTTOMRIGHT", G.Panels.DataTextLeft, "TOPRIGHT", 0, 2 )
		elseif( id == 4 and name == LOOT ) then
			if( not frame.isDocked ) then
				frame:ClearAllPoints()
				frame:Point( "TOPLEFT", G.Panels.RightChatTabsBackground, "BOTTOMLEFT", 0, -2 )
				frame:Point( "BOTTOMRIGHT", G.Panels.DataTextRight, "TOPRIGHT", 0, 2 )
				if( C["chat"]["justifyRight"] == true ) then
					frame:SetJustifyH( "RIGHT" )
				end
			end
		end

		if( not frame.isLocked ) then
			FCF_SetLocked( frame, 1 )
		end
	end
end
hooksecurefunc( "FCF_RestorePositionAndDimensions", S.SetDefaultChatPosition )