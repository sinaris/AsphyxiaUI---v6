---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["chat"]["enable"] ~= true ) then return end

TukuiChatCopyFrame:SetTemplate( "Transparent" )
TukuiChatCopyFrame:CreateShadow( "Default" )

local function ChatCopyButtons()
	for i = 1, NUM_CHAT_WINDOWS do
		local button = format( "TukuiButtonCF%d", i )

		button:SetNormalTexture( C["media"]["copyicon"] )
	end
end

ChatCopyButtons()