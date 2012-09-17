---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Credits: All credits goes to the original Author: Duffed
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["intmodules"]["spells"] ~= true ) then return end

local AnnounceTo = SAY
local Announce = S.AnnounceSpells

local Name = UnitName( "player" )
local GUID = UnitGUID( "player" )
local format = string.format
local tremove = tremove
local tinsert = tinsert
local unpack = unpack
local select = select
local UnitAura = UnitAura
local SendChatMessage = SendChatMessage
local WaitTable = {}

local OnUpdate = function( self, elapsed )
	local Count = #WaitTable
	local i = 1

	while ( i <= Count ) do
		local Table = tremove( WaitTable, i )
		local Delay = tremove( Table, 1 )
		local Func = tremove( Table, 1 )
		local Args = tremove( Table, 1 )

		if( Delay > elapsed ) then
			tinsert( WaitTable, i, {
				Delay - elapsed, Func, Args
			} )
			i = i + 1
		else
			Count = Count - 1
			Func( unpack( Args ) )
		end
	end
end

local Delay = function( delay, func, ... )
	if( type( delay ) ~= "number" or type( func ) ~= "function" ) then
		return false
	end

	if( not AutoAnnounceWaitFrame ) then
		local WaitFrame = CreateFrame( "Frame", "AutoAnnounceWaitFrame", UIParent )
		WaitFrame:SetScript( "OnUpdate", OnUpdate )
	end

	tinsert( WaitTable, {
		delay, func, { ... } 
	} )
	return true
end

local OnEvent = function( self, event, ... )
	local Time, Type, HideCaster, SourceGUID, SourceName, SourceFlags, SourceRaidFlags, DestGUID, DestName, DestFlags, DestRaidFlags, SpellID, SpellName = ...

	if( SourceGUID ~= GUID ) then
		return
	end

	if( Announce[SpellID] and Type == "SPELL_CAST_SUCCESS" ) then
		if( not DestName ) then
			DestName = SourceName
		end

		local Duration = select( 6, UnitAura( DestName, SpellName ) )
		local SpellString = "\124cff71d5ff\124Hspell:" .. SpellID .. "\124h[" .. SpellName .. "]\124h\124r"

		if( DestName ~= Name ) then
			if( Duration == nil ) then
				SendChatMessage( SpellString .. " is up on " .. DestName .. "!", AnnounceTo )
			else
				SendChatMessage( SpellString .. " is up on " .. DestName .. " for " .. Duration .. " seconds!", AnnounceTo )
			end
		else
			SendChatMessage( SpellString .. " is up for " .. Duration .. " seconds!", AnnounceTo )
		end

		Delay( Duration, SendChatMessage, SpellString .. " is down.", AnnounceTo )
	end
end

local AnnounceFrame = CreateFrame( "Frame" )
AnnounceFrame:RegisterEvent( "COMBAT_LOG_EVENT_UNFILTERED" )
AnnounceFrame:SetScript( "OnEvent", OnEvent )

local ValidTypes = {
	["SAY"] = true,
	["YELL"] = true,
	["RAID"] = true,
	["PARTY"] = true,
	["BATTLEGROUND"] = true,
}

local SetAnnounceTo = function( msg )
	local ChatType = msg:upper()

	if( not ValidTypes[ChatType] ) then
		print( msg .. " |cff00AAFFis not a valid option|r." )
		print( "|cff00AAFFPlease choose|r SAY/RAID/PARTY/BATTLEGROUND." )
	else
		AnnounceTo = ChatType
		print( "|cff00AAFFAutoAnnounce set to|r " .. msg )
	end
end

SLASH_AUTOANNOUNCE1 = "/Announce"
SlashCmdList["AUTOANNOUNCE"] = SetAnnounceTo