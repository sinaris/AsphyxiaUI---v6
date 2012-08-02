---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["general"]["blizzardreskin"] ~= true ) then return end

local function SkinFrames( self, event, addon )
	if( addon == "Blizzard_Calendar" ) then
		CalendarFrame:SetTemplate( "Transparent" )
		CalendarFrame:CreateShadow( "Default" )

		CalendarCreateEventFrame:SetTemplate( "Transparent" )
		CalendarCreateEventFrame:CreateShadow( "Default" )

		CalendarTexturePickerFrame:SetTemplate("Transparent")
		CalendarTexturePickerFrame:CreateShadow( "Default" )

		CalendarViewRaidFrame:SetTemplate( "Transparent" )
		CalendarViewRaidFrame:CreateShadow( "Default" )

		CalendarViewHolidayFrame:SetTemplate( "Transparent" )
		CalendarViewHolidayFrame:CreateShadow( "Default" )

		CalendarViewEventFrame:SetTemplate( "Transparent" )
		CalendarViewEventFrame:CreateShadow( "Default" )
	end
end

local Init = CreateFrame( "Frame" )
Init:RegisterEvent( "ADDON_LOADED" )
Init:SetScript( "OnEvent", SkinFrames )