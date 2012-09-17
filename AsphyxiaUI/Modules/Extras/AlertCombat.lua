---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Credits: All credits goes to the original Author: Alleykat
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["intmodules"]["alertcombat"] ~= true ) then return end

local speed = .057799924
local font = C["media"]["asphyxia"]
local fontflag = "MONOCHROMEOUTLINE"
local fontsize = 16
 
local GetNextChar = function( word, num )
	local c = word:byte( num )
	local shift
	if not c then return "", num end
		if( c > 0 and c <= 127 ) then
			shift = 1
		elseif( c >= 192 and c <= 223 ) then
			shift = 2
		elseif( c >= 224 and c <= 239 ) then
			shift = 3
		elseif( c >= 240 and c <= 247 ) then
			shift = 4
		end
	return word:sub( num, num + shift - 1 ), ( num + shift )
end
 
local updaterun = CreateFrame( "Frame" )
 
local flowingframe = CreateFrame( "Frame", nil, UIParent )
	flowingframe:SetFrameStrata( "HIGH" )
	flowingframe:SetPoint( "CENTER", UIParent, 0, 170 )
	flowingframe:SetHeight( 64 )
 
local flowingtext = flowingframe:CreateFontString( nil, "OVERLAY" )
flowingtext:SetFont( font, fontsize, fontflag )
flowingtext:SetShadowOffset( 1, -1 )
 
local rightchar = flowingframe:CreateFontString( nil, "OVERLAY" )
rightchar:SetFont( font, 60, fontflag )
rightchar:SetShadowOffset( 1, -1 )
rightchar:SetJustifyH( "LEFT" )
 
local count, len, step, word, stringE, a, backstep
 
local nextstep = function()
	a, step = GetNextChar( word, step )
	flowingtext:SetText( stringE )
	stringE = stringE .. a
	a = string.upper( a )
	rightchar:SetText( a )
end
 
local backrun = CreateFrame( "Frame" )
backrun:Hide()
 
local updatestring = function( self, t )
	count = count - t

	if( count < 0 ) then
		count = speed
		if( step > len ) then
			self:Hide()
			flowingtext:SetText( stringE )
			rightchar:SetText()
			flowingtext:ClearAllPoints()
			flowingtext:SetPoint( "RIGHT" )
			flowingtext:SetJustifyH( "RIGHT" )
			rightchar:ClearAllPoints()
			rightchar:SetPoint( "RIGHT", flowingtext, "LEFT" )
			rightchar:SetJustifyH( "RIGHT" )
			self:Hide()
			count = 1.456789
			backrun:Show()
		else
			nextstep()
		end
	end
end
 
updaterun:SetScript( "OnUpdate", updatestring )
updaterun:Hide()
 
local backstepf = function()
	local a = backstep
	local firstchar
	local texttemp = ""
	local flagon = true
	while a <= len do
		local u
		u, a = GetNextChar( word, a )
		if( flagon == true ) then
			backstep = a
			flagon = false
			firstchar = u
		else
			texttemp = texttemp .. u
		end
	end

	flowingtext:SetText( texttemp )
	firstchar = string.upper( firstchar )
	rightchar:SetText( firstchar )
end

local rollback = function( self, t )
	count = count - t

	if( count < 0 ) then
		count = speed
		if( backstep > len ) then
			self:Hide()
			flowingtext:SetText()
			rightchar:SetText()
		else
			backstepf()
		end
	end
end
backrun:SetScript( "OnUpdate", rollback )

local allertrun = function( f, r, g, b )
	flowingframe:Hide()
	updaterun:Hide()
	backrun:Hide()

	flowingtext:SetText( f )
	local l = flowingtext:GetWidth()

	local color1 = r or 1
	local color2 = g or 1
	local color3 = b or 1
 
	flowingtext:SetTextColor( color1 * .95, color2 * .95, color3 * .95 )
	rightchar:SetTextColor( color1, color2, color3 )
 
	word = f
	len = f:len()
	step,backstep = 1,1
	count = speed
	stringE = ""
	a = ""
 
	flowingtext:SetText( "" )
	flowingframe:SetWidth( l )
	flowingtext:ClearAllPoints()
	flowingtext:SetPoint( "LEFT" )
	flowingtext:SetJustifyH( "LEFT" )
	rightchar:ClearAllPoints()
	rightchar:SetPoint( "LEFT", flowingtext, "RIGHT" )
	rightchar:SetJustifyH( "LEFT" )
 
	rightchar:SetText( "" )
	updaterun:Show()
	flowingframe:Show()
end
 
SlashCmdList.ALLEYRUN = function( lol )
	allertrun(lol)
end
SLASH_ALLEYRUN1 = "/arn"
 
local a = CreateFrame( "Frame" )
a:RegisterEvent( "PLAYER_REGEN_ENABLED" )
a:RegisterEvent( "PLAYER_REGEN_DISABLED" )
a:SetScript( "OnEvent", function( self, event )
	if( UnitIsDead( "player" ) ) then return end
	if( event == "PLAYER_REGEN_ENABLED" ) then
		allertrun( "LEAVING COMBAT", 0.1, 1, 0.1 )
	else
		allertrun( "ENTERING COMBAT", 1, 0.1, 0.1 )
	end
end )