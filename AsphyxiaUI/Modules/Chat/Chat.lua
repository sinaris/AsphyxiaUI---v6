---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local function SetTabStyle( frame )
	local id = frame:GetID()
	local chat = frame:GetName()
	local tab = _G[chat .. "Tab"]

	_G[chat .. "TabText"]:Show()

	tab:HookScript("OnEnter", function() _G[chat .. "TabText"]:Show() end )
	tab:HookScript("OnLeave", function() _G[chat .. "TabText"]:Show() end )

	if( C["global"]["unitframelayout"] == "jasje" ) then
		_G[chat .. "TabText"]:SetTextColor( unpack( C["media"]["datatextcolor1"] ) )
	else
		_G[chat .. "TabText"]:SetTextColor( 1, 1, 1 )
	end
	_G[chat .. "TabText"]:SetFont( S.CreateFontString() )
	_G[chat .. "TabText"].SetTextColor = S.dummy

	if( C["global"]["unitframelayout"] == "jasje" ) then
		_G[chat .. "Tab"].glow:ClearAllPoints()
		_G[chat .. "Tab"].glow:Point( "CENTER", _G[chat .. "TabText"], 0, 10 )
		_G[chat .. "Tab"].glow:Width( _G[chat .. "TabText"]:GetWidth() + 40 )
		_G[chat .. "Tab"].glow:Height( 30 )
	end
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