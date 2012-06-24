---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local pairs = pairs
local string = string
local gsub = string.gsub
local strsub = string.sub
local strfind = string.find
local format = string.format
local strlower = string.lower

local Wrapper = "|cff%s[%s]|r"
local WordList = {
	["sinaris"] = "00AAFF",
	["sinsin"] = "FF0000",
	["sina"] = "FF0000",
}

local FindURL = function( msg )
	local String, Found = gsub( msg, "(%a+)://(%S+)%s?", "%1://%2" )
	if( Found > 0 ) then
		return String
	end

	String, Found = gsub( msg, "www%.([_A-Za-z0-9-]+)%.(%S+)%s?", "www.%1.%2" )
	if( Found > 0 ) then
		return String
	end

	String, Found = gsub( msg, "([_A-Za-z0-9-%.]+)@([_A-Za-z0-9-]+)(%.+)([_A-Za-z0-9-%.]+)%s?", "%1@%2%3%4" )
	if( Found > 0 ) then
		return String
	end
end

local WordFilter = function( self, event, message, author, ... )
	local msg = strlower( message )

	for key, value in pairs( WordList ) do
		if( strfind( msg, key ) ) then
			local Word = strsub( message, strfind( msg, key ) )
			local Link = FindURL( message )

			if( ( not Link ) or ( Link and not strfind( Link, Word ) ) ) then
				return false, gsub( message, Word, format( Wrapper, value, Word ) ), author, ...
			end
		end
	end
end

ChatFrame_AddMessageEventFilter( "CHAT_MSG_CHANNEL", WordFilter )
ChatFrame_AddMessageEventFilter( "CHAT_MSG_GUILD", WordFilter )