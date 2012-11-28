local S, C, L, G  = unpack( Tukui )

if( C["nameplate"].enable == true ) then return end

if( C["nameplate"]["asphyxia"] ~= true ) then return end

local numChildren = -1
local frames = {}
local noscalemult = S.mult * C.general.uiscale

local NamePlates = CreateFrame( "Frame", nil, UIParent )
NamePlates:SetScript( "OnEvent", function( self, event, ... )
	self[event]( self, ... )
end )
if( C["nameplate"]["debuffs"] == true ) then
	NamePlates:RegisterEvent( "COMBAT_LOG_EVENT_UNFILTERED" )
end

local Abbrev = function( name )
	local newname = ( string.len( name ) > 18 ) and string.gsub( name, "%s?(.[\128-\191]*)%S+%s", "%1. " ) or name
	return S.UTF( newname, 18, false )
end

local function QueueObject( parent, object )
	parent.queue = parent.queue or {}
	parent.queue[object] = true
end

local PlateBlacklist = {
	["Earth Elemental Totem"] = true,
	["Fire Elemental Totem"] = true,
	["Fire Resistance Totem"] = true,
	["Flametongue Totem"] = true,
	["Frost Resistance Totem"] = true,
	["Healing Stream Totem"] = true,
	["Magma Totem"] = true,
	["Mana Spring Totem"] = true,
	["Nature Resistance Totem"] = true,
	["Searing Totem"] = true,
	["Stoneclaw Totem"] = true,
	["Stoneskin Totem"] = true,
	["Strength of Earth Totem"] = true,
	["Windfury Totem"] = true,
	["Totem of Wrath"] = true,
	["Wrath of Air Totem"] = true,
	["Army of the Dead Ghoul"] = true,
}

local function HideObjects( parent )
	for object in pairs( parent.queue ) do
		if( object:GetObjectType() == "Texture" ) then
			object:SetTexture(nil)
			object.SetTexture = S.dummy
		elseif( object:GetObjectType() == "FontString" ) then
			object.ClearAllPoints = S.dummy
			object.SetFont = S.dummy
			object.SetPoint = S.dummy
			object:Hide()
			object.Show = S.dummy
			object.SetText = S.dummy
			object.SetShadowOffset = S.dummy
		else
			object:Hide()
			object.Show = S.dummy
		end
	end
end

local function CreateVirtualFrame( parent, point )
	if( point == nil ) then
		point = parent
	end

	if( point.backdrop ) then
		return
	end

	parent.backdrop = parent:CreateTexture( nil, "BORDER" )
	parent.backdrop:SetDrawLayer( "BORDER", -8 )
	parent.backdrop:SetPoint( "TOPLEFT", point, "TOPLEFT", -noscalemult * 3, noscalemult * 3 )
	parent.backdrop:SetPoint( "BOTTOMRIGHT", point, "BOTTOMRIGHT", noscalemult * 3, -noscalemult * 3 )
	parent.backdrop:SetTexture( unpack( C["media"]["backdropcolor"] ) )

	parent.bordertop = parent:CreateTexture( nil, "BORDER" )
	parent.bordertop:SetPoint( "TOPLEFT", point, "TOPLEFT", -noscalemult * 2, noscalemult * 2 )
	parent.bordertop:SetPoint( "TOPRIGHT", point, "TOPRIGHT", noscalemult * 2, noscalemult * 2 )
	parent.bordertop:SetHeight( noscalemult )
	parent.bordertop:SetTexture( unpack( C["media"]["bordercolor"] ) )
	parent.bordertop:SetDrawLayer( "BORDER", -7 )

	parent.borderbottom = parent:CreateTexture( nil, "BORDER" )
	parent.borderbottom:SetPoint( "BOTTOMLEFT", point, "BOTTOMLEFT", -noscalemult * 2, -noscalemult * 2 )
	parent.borderbottom:SetPoint( "BOTTOMRIGHT", point, "BOTTOMRIGHT", noscalemult * 2, -noscalemult * 2 )
	parent.borderbottom:SetHeight( noscalemult )
	parent.borderbottom:SetTexture( unpack( C["media"]["bordercolor"] ) )
	parent.borderbottom:SetDrawLayer( "BORDER", -7 )

	parent.borderleft = parent:CreateTexture( nil, "BORDER" )
	parent.borderleft:SetPoint( "TOPLEFT", point, "TOPLEFT", -noscalemult * 2, noscalemult * 2 )
	parent.borderleft:SetPoint( "BOTTOMLEFT", point, "BOTTOMLEFT", noscalemult * 2, -noscalemult * 2 )
	parent.borderleft:SetWidth( noscalemult )
	parent.borderleft:SetTexture( unpack( C["media"]["bordercolor"] ) )
	parent.borderleft:SetDrawLayer( "BORDER", -7 )

	parent.borderright = parent:CreateTexture( nil, "BORDER" )
	parent.borderright:SetPoint( "TOPRIGHT", point, "TOPRIGHT", noscalemult * 2, noscalemult * 2 )
	parent.borderright:SetPoint( "BOTTOMRIGHT", point, "BOTTOMRIGHT", -noscalemult * 2, -noscalemult * 2 )
	parent.borderright:SetWidth( noscalemult )
	parent.borderright:SetTexture( unpack( C["media"]["bordercolor"] ) )
	parent.borderright:SetDrawLayer( "BORDER", -7 )
end

local function SetVirtualBorder( parent, r, g, b )
	parent.bordertop:SetTexture( r, g, b )
	parent.borderbottom:SetTexture( r, g, b )
	parent.borderleft:SetTexture( r, g, b )
	parent.borderright:SetTexture( r, g, b )
end

local function CreateAuraIcon( parent )
	local button = CreateFrame( "Frame", nil, parent )
	button:SetWidth( C["nameplate"]["aurassize"] )
	button:SetHeight( C["nameplate"]["aurassize"] )

	button.bg = button:CreateTexture( nil, "BACKGROUND" )
	button.bg:SetTexture( unpack( C["media"]["backdropcolor"] ) )
	button.bg:SetAllPoints( button )

	button.bord = button:CreateTexture( nil, "BORDER" )
	button.bord:SetTexture( unpack( C["media"]["bordercolor"] ) )
	button.bord:SetPoint( "TOPLEFT", button, "TOPLEFT", noscalemult, -noscalemult )
	button.bord:SetPoint( "BOTTOMRIGHT", button, "BOTTOMRIGHT", -noscalemult, noscalemult )

	button.bg2 = button:CreateTexture( nil, "ARTWORK" )
	button.bg2:SetTexture( unpack( C["media"]["backdropcolor"] ) )
	button.bg2:SetPoint( "TOPLEFT", button, "TOPLEFT", noscalemult * 2, -noscalemult * 2 )
	button.bg2:SetPoint( "BOTTOMRIGHT", button, "BOTTOMRIGHT", -noscalemult * 2, noscalemult * 2 )

	button.icon = button:CreateTexture( nil, "OVERLAY" )
	button.icon:SetPoint( "TOPLEFT", button, "TOPLEFT", noscalemult * 3, -noscalemult * 3 )
	button.icon:SetPoint( "BOTTOMRIGHT", button, "BOTTOMRIGHT", -noscalemult * 3, noscalemult * 3 )
	button.icon:SetTexCoord( 0.1, 0.9, 0.1, 0.9 )

	button.cd = CreateFrame( "Cooldown", nil, button )
	button.cd:SetAllPoints( button )
	button.cd:SetReverse( true )

	button.count = button:CreateFontString( nil, "OVERLAY" )
	button.count:SetFont( unpack( S.FontTemplate.NameplatesCount.BuildFont ) )
	button.count:SetShadowOffset( 1.25, -1.25 )
	button.count:SetPoint( "BOTTOMRIGHT", button, "BOTTOMRIGHT", 0, 0 )

	return button
end

local function UpdateAuraIcon( button, unit, index, filter )
	local name, _, icon, count, debuffType, duration, expirationTime, _, _, _, spellID = UnitAura( unit, index, filter )

	button.icon:SetTexture( icon )
	button.cd:SetCooldown( expirationTime - duration, duration )
	button.expirationTime = expirationTime
	button.duration = duration
	button.spellID = spellID
	if( count > 1 ) then
		button.count:SetText( count )
	else
		button.count:SetText( "" )
	end
	button.cd:SetScript( "OnUpdate", function( self )
		if( not button.cd.timer ) then
			self:SetScript( "OnUpdate", nil )
			return
		end
		button.cd.timer.text:SetFont( unpack( S.FontTemplate.NameplatesCount.BuildFont ) )
		button.cd.timer.text:SetShadowOffset( 1.25, -1.25 )
	end )
	button:Show()
end

local function OnAura( frame, unit )
	if( not frame.icons or not frame.unit ) then return end

	local i = 1
	for index = 1, 40 do
		if( i > C["nameplate"]["width"] / C["nameplate"]["aurassize"] ) then return end

		local match
		local name, _, _, _, _, duration, _, caster, _, _, spellid = UnitAura( frame.unit, index, "HARMFUL" )

		if( C["nameplate"]["debuffs"] == true ) then
			if( caster == "player" ) then
				match = true
			end
		end

		if( duration and match == true ) then
			if( not frame.icons[i] ) then
				frame.icons[i] = CreateAuraIcon( frame )
			end
			local icon = frame.icons[i]
			if( i == 1 ) then
				icon:SetPoint( "RIGHT", frame.icons, "RIGHT" )
			end
			if( i ~= 1 and i <= C["nameplate"]["width"] / C["nameplate"]["aurassize"] ) then
				icon:SetPoint( "RIGHT", frame.icons[i - 1], "LEFT", -2, 0 )
			end
			i = i + 1
			UpdateAuraIcon( icon, frame.unit, index, "HARMFUL" )
		end
	end
	for index = i, #frame.icons do frame.icons[index]:Hide() end
end

local function UpdateCastbar( frame )
	frame:ClearAllPoints()
	frame:SetSize( C["nameplate"]["width"], C["nameplate"]["height"] )
	frame:SetPoint( "TOP", frame:GetParent().hp, "BOTTOM", 0, -8 )
	frame:GetStatusBarTexture():SetHorizTile( true )
	if( frame.shield:IsShown() ) then
		frame:SetStatusBarColor( 0.78, 0.25, 0.25, 1 )
	end
end

local function UpdateCastText( frame, curValue )
	local minValue, maxValue = frame:GetMinMaxValues()

	if( UnitChannelInfo( "target" ) ) then
		frame.time:SetFormattedText( "%.1f ", curValue )
		if( C["nameplate"]["showcastbarname"] == true ) then
			frame.name:SetText( select( 1, ( UnitChannelInfo( "target" ) ) ) )
		end
	end

	if( UnitCastingInfo( "target" ) ) then
		frame.time:SetFormattedText( "%.1f ", maxValue - curValue )
		if( C["nameplate"]["showcastbarname"] == true ) then
			frame.name:SetText( select( 1, ( UnitCastingInfo( "target" ) ) ) )
		end
	end
end

local OnValueChanged = function( self, curValue )
	UpdateCastText( self, curValue )
	if( self.needFix ) then
		UpdateCastbar( self )
		self.needFix = nil
	end
end

local OnSizeChanged = function( self )
	self.needFix = true
end

local function OnHide( frame )
	frame.hp:SetStatusBarColor( frame.hp.rcolor, frame.hp.gcolor, frame.hp.bcolor )
	frame.hp.name:SetTextColor(1, 1, 1)
	frame.hp:SetScale(1)
	frame.overlay:Hide()
	frame.cb:Hide()
	frame.unit = nil
	frame.guid = nil
	frame.hasClass = nil
	frame.isFriendly = nil
	frame.hp.rcolor = nil
	frame.hp.gcolor = nil
	frame.hp.bcolor = nil
	frame.hp.shadow:SetAlpha( 0 )
	if( frame.icons ) then
		for _, icon in ipairs( frame.icons ) do
			icon:Hide()
		end
	end

	frame:SetScript( "OnUpdate", nil )
end

local function Colorize( frame )
	local r, g, b = frame.healthOriginal:GetStatusBarColor()

	for class, color in pairs( RAID_CLASS_COLORS ) do
		local r, g, b = floor( r * 100 + 0.5 ) / 100, floor( g * 100 + 0.5 ) / 100, floor( b * 100 + 0.5 ) / 100
		if( RAID_CLASS_COLORS[class].r == r and RAID_CLASS_COLORS[class].g == g and RAID_CLASS_COLORS[class].b == b ) then
			frame.hasClass = true
			frame.isFriendly = false
			frame.hp:SetStatusBarColor( unpack( oUFTukui.colors.class[class] ) )
			return
		end
	end

	if( g + b == 0 ) then
		r, g, b = 222 / 255, 95 / 255, 95 / 255
		frame.isFriendly = false
	elseif( r + b == 0 ) then
		r, g, b = 0.31, 0.45, 0.63
		frame.isFriendly = true
	elseif( r + g > 1.95 ) then
		r, g, b = 218 / 255, 197 / 255, 92 / 255
		frame.isFriendly = false
	elseif( r + g == 0 ) then
		r, g, b = 75 / 255,  175 / 255, 76 / 255
		frame.isFriendly = true
	else
		frame.isFriendly = false
	end
	frame.hasClass = false

	frame.hp:SetStatusBarColor( r, g, b )
end

local function UpdateObjects( frame )
	local frame = frame:GetParent()

	local r, g, b = frame.hp:GetStatusBarColor()

	frame.hp:ClearAllPoints()
	frame.hp:SetSize( C["nameplate"]["width"], C["nameplate"]["height"] )
	frame.hp:SetPoint( "TOP", frame, "TOP", 0, -15 )
	frame.hp:GetStatusBarTexture():SetHorizTile( true )

	frame.hp:SetMinMaxValues( frame.healthOriginal:GetMinMaxValues() )
	frame.hp:SetValue( frame.healthOriginal:GetValue() - 1 )
	frame.hp:SetValue( frame.healthOriginal:GetValue() )

	--Colorize( frame )
	--frame.hp.rcolor, frame.hp.gcolor, frame.hp.bcolor = frame.hp:GetStatusBarColor()
	--frame.hp.hpbg:SetTexture( frame.hp.rcolor, frame.hp.gcolor, frame.hp.bcolor, 0.25 )
	SetVirtualBorder( frame.hp, unpack( C["media"]["bordercolor"] ) )
	--if( C["nameplate"]["enhancethreat"] == true ) then
	--	frame.hp.name:SetTextColor( frame.hp.rcolor, frame.hp.gcolor, frame.hp.bcolor )
	--end

	if( C["nameplate"]["nameabbrev"] == true and C["nameplate"]["debuffs"] ~= true ) then
		frame.hp.name:SetText( Abbrev( frame.hp.oldname:GetText() ) )
	else
		frame.hp.name:SetText( frame.hp.oldname:GetText() )
	end

	while frame.hp:GetEffectiveScale() < 1 do
		frame.hp:SetScale(frame.hp:GetScale() + 0.01)
	end

	local level, elite, mylevel = tonumber( frame.hp.oldlevel:GetText() ), frame.hp.elite:IsShown(), UnitLevel( "player" )
	frame.hp.level:ClearAllPoints()
	frame.hp.level:SetPoint( "RIGHT", frame.hp, "LEFT", -2, 0 )
	frame.hp.level:SetTextColor( frame.hp.oldlevel:GetTextColor() )
	if( frame.hp.boss:IsShown() ) then
		frame.hp.level:SetText( "??" )
		frame.hp.level:SetTextColor( 0.8, 0.05, 0 )
		frame.hp.level:Show()
	elseif( not elite and level == mylevel ) then
		frame.hp.level:Hide()
	else
		frame.hp.level:SetText( level .. ( elite and "+" or "" ) )
		frame.hp.level:Show()
	end

	frame.overlay:ClearAllPoints()
	frame.overlay:SetAllPoints( frame.hp )

	if( C["nameplate"]["debuffs"] == true ) then
		if( frame.icons ) then return end

		frame.icons = CreateFrame( "Frame", nil, frame )
		frame.icons:SetPoint( "BOTTOMRIGHT", frame.hp, "TOPRIGHT", 0, 19 )
		frame.icons:SetWidth( 20 + C["nameplate"]["width"] )
		frame.icons:SetHeight( 25 )
		frame.icons:SetFrameLevel( frame.hp:GetFrameLevel() + 2 )
		frame:RegisterEvent( "UNIT_AURA" )
		frame:HookScript( "OnEvent", OnAura )
	end

	HideObjects(frame)
end

local function SkinObjects(frame, nameFrame)
	local oldhp, cb = frame:GetChildren()
	local threat, hpborder, overlay, oldlevel, bossicon, raidicon, elite = frame:GetRegions()
	local oldname = nameFrame:GetRegions()
	local _, cbborder, cbshield, cbicon = cb:GetRegions()

	frame.healthOriginal = oldhp
	local hp = CreateFrame( "Statusbar", nil, frame )
	hp:SetFrameLevel( oldhp:GetFrameLevel() )
	hp:SetFrameStrata( oldhp:GetFrameStrata() )
	hp:SetStatusBarTexture( C["media"]["normTex"] )
	hp:CreateShadow( "Default" )
	CreateVirtualFrame( hp )


	hp.level = hp:CreateFontString( nil, "OVERLAY" )
	hp.level:SetFont( unpack( S.FontTemplate.NameplatesLevel.BuildFont ) )
	hp.level:SetShadowColor( 0, 0, 0, 1 )
	hp.level:SetTextColor( 1, 1, 1 )
	hp.level:SetShadowOffset( S.mult, -S.mult )
	hp.oldlevel = oldlevel
	hp.boss = bossicon
	hp.elite = elite

	if( C["nameplate"]["showhealth"] == true ) then
		hp.value = hp:CreateFontString( nil, "OVERLAY" )
		hp.value:SetFont( unpack( S.FontTemplate.NameplatesHealth.BuildFont ) )
		hp.value:SetShadowColor( 0, 0, 0, 1 )
		hp.value:SetPoint( "CENTER", 0, 1 )
		hp.value:SetTextColor( 1, 1, 1 )
		hp.value:SetShadowOffset( S.mult, -S.mult )
	end

	hp.name = hp:CreateFontString( nil, "OVERLAY" )
	hp.name:SetPoint( "BOTTOMLEFT", hp, "TOPLEFT", -10, 3 )
	hp.name:SetPoint( "BOTTOMRIGHT", hp, "TOPRIGHT", 10, 3 )
	hp.name:SetFont( unpack( S.FontTemplate.NameplatesName.BuildFont ) )
	hp.name:SetShadowColor( 0, 0, 0, 0.4 )
	hp.name:SetShadowOffset( S.mult, -S.mult )
	hp.oldname = oldname

	hp.hpbg = hp:CreateTexture( nil, "BORDER" )
	hp.hpbg:SetAllPoints( hp )
	hp.hpbg:SetTexture(unpack(C.media.backdropcolor))

	hp:HookScript( "OnShow", UpdateObjects )
	frame.hp = hp

	if not frame.threat then
		frame.threat = threat
	end

	cb:SetStatusBarTexture( C["media"]["normTex"] )
	CreateVirtualFrame( cb )

	cb.cbbg = cb:CreateTexture( nil, "BORDER" )
	cb.cbbg:SetAllPoints( cb )
	cb.cbbg:SetTexture( 0.75, 0.75, 0.25, 0.15 )

	cb.time = cb:CreateFontString( nil, "ARTWORK" )
	cb.time:SetPoint( "RIGHT", cb, "RIGHT", 3, 0 )
	cb.time:SetFont( unpack( S.FontTemplate.NameplatesCount.BuildFont ) )
	cb.time:SetShadowOffset( 1.25, -1.25 )
	cb.time:SetTextColor( 1, 1, 1 )

	if( C["nameplate"]["showcastbarname"] == true ) then
		cb.name = cb:CreateFontString( nil, "ARTWORK" )
		cb.name:SetPoint( "LEFT", cb, "LEFT", 3, 0 )
		cb.name:SetFont( unpack( S.FontTemplate.NameplatesName.BuildFont ) )
		cb.name:SetShadowOffset( 1.25, -1.25 )
		cb.name:SetTextColor( 1, 1, 1 )
	end

	cbicon:ClearAllPoints()
	cbicon:SetPoint( "TOPLEFT", hp, "TOPRIGHT", 8, 0 )
	cbicon:SetSize( ( C["nameplate"]["height"] * 2 ) + 8, ( C["nameplate"]["height"] * 2 ) + 8 )
	cbicon:SetTexCoord( 0.1, 0.9, 0.1, 0.9 )
	cbicon:SetDrawLayer( "OVERLAY" )
	cb.icon = cbicon
	CreateVirtualFrame( cb, cb.icon )

	cb.shield = cbshield
	cbshield:ClearAllPoints()
	cbshield:SetPoint( "TOP", cb, "BOTTOM" )
	cb:HookScript( "OnShow", UpdateCastbar )
	cb:HookScript( "OnSizeChanged", OnSizeChanged )
	cb:HookScript( "OnValueChanged", OnValueChanged )
	frame.cb = cb

	overlay:SetTexture( 1, 1, 1, 0.15 )
	overlay:SetAllPoints( hp )
	frame.overlay = overlay

	raidicon:ClearAllPoints()
	raidicon:SetPoint( "BOTTOM", hp, "TOP", 0, C["nameplate"]["debuffs"] == true and 38 or 16 )
	raidicon:SetSize( ( C["nameplate"]["height"] * 2 ) + 8, ( C["nameplate"]["height"] * 2 ) + 8 )
	frame.raidicon = raidicon

	QueueObject( frame, oldhp )
	QueueObject( frame, oldlevel )
	QueueObject( frame, threat )
	QueueObject( frame, hpborder )
	QueueObject( frame, cbshield )
	QueueObject( frame, cbborder )
	QueueObject( frame, oldname )
	QueueObject( frame, bossicon )
	QueueObject( frame, elite )

	UpdateObjects( hp )
	UpdateCastbar( cb )

	frame:HookScript( "OnHide", OnHide )
	frames[frame] = true
end

local function UpdateThreat( frame, elapsed )
	frame.hp:Show()
	if( frame.hasClass == true ) then return end

	if frame.threat:IsShown() then
		if Role == "TANK" then
			frame.hp.name:SetTextColor(0, 1, 0)
		else
			frame.hp.name:SetTextColor(1, 0, 0)
		end
	else
		frame.hp.name:SetTextColor(1, 1, 1)
	end
end

local function CheckBlacklist( frame, ... )
	if( C["nameplate"]["nameabbrev"] == true ) then return end

	if( PlateBlacklist[frame.hp.name:GetText()] ) then
		frame:SetScript( "OnUpdate", function() end )
		frame.hp:Hide()
		frame.cb:Hide()
		frame.overlay:Hide()
		frame.hp.oldlevel:Hide()
	end
end

local function HideDrunkenText( frame, ... )
	if( frame and frame.hp.oldlevel and frame.hp.oldlevel:IsShown() ) then
		frame.hp.oldlevel:Hide()
	end
end

local function AdjustNameLevel( frame, ... )
	if( UnitName( "target" ) == frame.hp.name:GetText() and frame:GetAlpha() == 1 ) then
		frame.hp.name:SetDrawLayer( "OVERLAY" )
	else
		frame.hp.name:SetDrawLayer( "BORDER" )
	end
end

local function ShowHealth( frame, ... )
	local minHealth, maxHealth = frame.healthOriginal:GetMinMaxValues()
	local valueHealth = frame.healthOriginal:GetValue()
	local d =( valueHealth / maxHealth ) * 100

	frame.hp:SetValue( valueHealth - 1 )
	frame.hp:SetValue( valueHealth )

	if( C["nameplate"]["showhealth"] == true ) then
		frame.hp.value:SetText( S.ShortValue( valueHealth ) .. " - " .. ( string.format( "%d%%", math.floor( ( valueHealth / maxHealth ) * 100 ) ) ) )
	end

	if( frame.hasClass == true or frame.isFriendly == true ) then
		if( d <= 50 and d >= 20 ) then
			SetVirtualBorder( frame.hp, 1, 1, 0 )
		elseif( d < 20 ) then
			SetVirtualBorder( frame.hp, 1, 0, 0 )
		else
			SetVirtualBorder( frame.hp, unpack( C["media"]["bordercolor"] ) )
		end
	elseif( ( frame.hasClass ~= true and frame.isFriendly ~= true ) and C["nameplate"]["enhancethreat"] == true ) then
		SetVirtualBorder( frame.hp, unpack( C["media"]["bordercolor"] ) )
	end
end

local function CheckUnit_Guid( frame, ... )
	if( UnitExists( "target" ) and frame:GetAlpha() == 1 and UnitName( "target" ) == frame.hp.name:GetText() ) then
		frame.guid = UnitGUID( "target" )
		frame.unit = "target"
		OnAura( frame, "target" )
	elseif( frame.overlay:IsShown() and UnitExists( "mouseover" ) and UnitName( "mouseover" ) == frame.hp.name:GetText() ) then
		frame.guid = UnitGUID( "mouseover" )
		frame.unit = "mouseover"
		OnAura( frame, "mouseover" )
	else
		frame.unit = nil
	end
end

local function MatchGUID( frame, destGUID, spellID )
	if( not frame.guid ) then return end

	if( frame.guid == destGUID ) then
		for _, icon in ipairs( frame.icons ) do
			if( icon.spellID == spellID ) then
				icon:Hide()
			end
		end
	end
end

local function ForEachPlate( functionToRun, ... )
	for frame in pairs( frames ) do
		if frame and frame:IsShown() then
			functionToRun( frame, ... )
		end
	end
end

local select = select
local function HookFrames( ... )
	for index = 1, select( "#", ... ) do
		local frame = select( index, ... )
		local region = frame:GetRegions()

		if(not frames[frame] and (frame:GetName() and not frame.isSkinned and frame:GetName():find("NamePlate%d"))) then
			SkinObjects(frame:GetChildren())
			frame.isSkinned = true
		end
	end
end

NamePlates:SetScript( "OnUpdate", function( self, elapsed )
	if( WorldFrame:GetNumChildren() ~= numChildren ) then
		numChildren = WorldFrame:GetNumChildren()
		HookFrames( WorldFrame:GetChildren() )
	end

	if( self.elapsed and self.elapsed > 0.2 ) then
		if C.nameplate.enhancethreat then
			ForEachPlate(UpdateThreat, self.elapsed)
		end
		ForEachPlate( AdjustNameLevel )
		self.elapsed = 0
	else
		self.elapsed = ( self.elapsed or 0 ) + elapsed
	end

	ForEachPlate( ShowHealth )
	ForEachPlate( CheckBlacklist )
	ForEachPlate( HideDrunkenText )
	ForEachPlate( CheckUnit_Guid )
	ForEachPlate(Colorize)
end)

function NamePlates:COMBAT_LOG_EVENT_UNFILTERED( _, event, ... )
	if( event == "SPELL_AURA_REMOVED" ) then
		local _, sourceGUID, _, _, _, destGUID, _, _, _, spellID = ...

		if( sourceGUID == UnitGUID( "player" ) ) then
			ForEachPlate( MatchGUID, destGUID, spellID )
		end
	end
end

if( C["nameplate"]["combat"] == true ) then
	NamePlates:RegisterEvent( "PLAYER_REGEN_ENABLED" )
	NamePlates:RegisterEvent( "PLAYER_REGEN_DISABLED" )

	function NamePlates:PLAYER_REGEN_ENABLED()
		SetCVar( "nameplateShowEnemies", 0 )
	end

	function NamePlates:PLAYER_REGEN_DISABLED()
		SetCVar( "nameplateShowEnemies", 1 )
	end
end

NamePlates:RegisterEvent( "PLAYER_ENTERING_WORLD" )
function NamePlates:PLAYER_ENTERING_WORLD()
	if( C["nameplate"]["combat"] == true ) then
		if( InCombatLockdown() ) then
			SetCVar( "nameplateShowEnemies", 1 )
		else
			SetCVar( "nameplateShowEnemies", 0 )
		end
	end
end