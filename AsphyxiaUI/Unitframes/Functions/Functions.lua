---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

------------------------------
-- castbar
------------------------------
local ticks = {}
function S.HideTicks()
	for _, tick in pairs( ticks ) do
		tick:Hide()
	end
end

function S.SetCastTicks( frame, numTicks )
	S.HideTicks()
	if( numTicks and numTicks > 0 ) then
		local d = frame:GetWidth() / numTicks
		for i = 1, numTicks do
			if( not ticks[i] ) then
				ticks[i] = frame:CreateTexture( nil, "OVERLAY" )
				ticks[i]:SetTexture( C["media"]["normTex"] )

				if( C["castbar"]["classcolor"] == true ) then
					ticks[i]:SetVertexColor( 0, 0, 0 )
				else
					ticks[i]:SetVertexColor( 0.84, 0.75, 0.65 )
				end
				ticks[i]:SetWidth( 2 )
				ticks[i]:SetHeight( frame:GetHeight() )
			end
			ticks[i]:ClearAllPoints()
			ticks[i]:SetPoint( "CENTER", frame, "LEFT", d * i, 0 )
			ticks[i]:Show()
		end
	end
end

S.PostCastStart = function( self, unit, name, rank, castid )
	if( unit == "vehicle" ) then unit = "player" end

	if( name == "Opening" ) then
		self.Text:SetText( "Opening" )
	end

	if( self.interrupt and unit ~= "player" ) then
		if( UnitCanAttack( "player", unit ) ) then
			self:SetStatusBarColor( unpack( C["castbar"]["nointerruptcolor"] ) )
		else
			self:SetStatusBarColor( unpack( C["castbar"]["nointerruptcolor"] ) )
		end
	else
		if( C["castbar"]["classcolor"] == true and ( unit == "player" or unit == "target" ) ) then
			self:SetStatusBarColor( unpack( oUFTukui.colors.class[select( 2, UnitClass( unit ) ) ] ) )
		else
			self:SetStatusBarColor( unpack( C["castbar"]["castbarcolor"] ) )
		end

		local color
		self.unit = unit

		if( C["castbar"]["ticks"] == true and unit == "player" ) then
			local baseTicks = S.ChannelTicks[name]
			if( baseTicks and S.HastedChannelTicks[name] ) then
				local tickIncRate = 1 / baseTicks
				local curHaste = UnitSpellHaste( "player" ) * 0.01
				local firstTickInc = tickIncRate / 2
				local bonusTicks = 0
				if( curHaste >= firstTickInc ) then
					bonusTicks = bonusTicks + 1
				end

				local x = tonumber( S.Round( firstTickInc + tickIncRate, 2 ) )
				while curHaste >= x do
					x = tonumber( S.Round( firstTickInc + ( tickIncRate * bonusTicks ), 2 ) )
					if( curHaste >= x ) then
						bonusTicks = bonusTicks + 1
					end
				end

				S.SetCastTicks( self, baseTicks + bonusTicks )
			elseif( baseTicks ) then
				S.SetCastTicks( self, baseTicks )
			else
				S.HideTicks()
			end
		elseif( unit == "player" ) then
			S.HideTicks()
		end
	end
end

------------------------------
-- target buffs, debuffs
------------------------------
S.SkinAura = function( self, button )
	button.count:ClearAllPoints()
	button.count:Point( "TOPLEFT", button, 1, 5 )
	button.count:SetFont( S.CreateFontString() )

	button.remaining:ClearAllPoints()
	button.remaining:Point( "CENTER", button,2, -2 )
	button.remaining:SetFont( S.CreateFontString() )
end

------------------------------
-- 
------------------------------
hooksecurefunc( S, "PostNamePosition", function( self )
	self.Name:ClearAllPoints()
	
	if( self.Power.value:GetText() and UnitIsEnemy( "player", "target" ) and C["unitframes"]["targetpowerpvponly"] == true ) or ( self.Power.value:GetText() and C["unitframes"]["targetpowerpvponly"] == false ) then
		self.Name:SetPoint( "CENTER", self.Health, "CENTER", 0, 1 )
	else
		self.Name:SetPoint( "CENTER", self.Health, "CENTER", 0, 1 )
	end
end )

S.ShortValue = function( v )
	if( v >= 1e6 ) then
		return ( "%.1fm" ):format( v / 1e6 ):gsub( "%.?0+([km])$", "%1" )
	elseif( v >= 1e3 or v <= -1e3 ) then
		return ( "%.1fk" ):format( v / 1e3 ):gsub( "%.?0+([km])$", "%1" )
	else
		return v
	end
end

S.ShortValueNegative = function( v )
	if( v <= 999 ) then return v end
	if( v >= 1000000 ) then
		local value = string.format( "%.1fm", v / 1000000 )
		return value
	elseif( v >= 1000 ) then
		local value = string.format( "%.1fk", v / 1000 )
		return value
	end
end

hooksecurefunc( S, "PostUpdateHealth", function( health, unit, min, max )
	if not UnitIsConnected( unit ) or UnitIsDead( unit ) or UnitIsGhost( unit ) then
		if not UnitIsConnected( unit ) then
			health.value:SetText( "|cffD7BEA5" .. L.unitframes_ouf_offline .. "|r" )
		elseif( UnitIsDead( unit ) ) then
			health.value:SetText( "|cffD7BEA5" .. L.unitframes_ouf_dead .. "|r" )
		elseif( UnitIsGhost( unit ) ) then
			health.value:SetText( "|cffD7BEA5" .. L.unitframes_ouf_ghost .. "|r" )
		end
	else
		local r, g, b

		if( C["unitframes"]["gradienthealth"] == true and C["unitframes"]["unicolor"] == true ) then
			local r, g, b = oUFTukui.ColorGradient( min, max, unpack( C["unitframes"]["gradient"] ) )
			health:SetStatusBarColor( r, g, b )
		end

		S.AuraFilter = function( icons, unit, icon, name, rank, texture, count, dtype, duration, timeLeft, caster, isStealable, shouldConsolidate, spellID )
			local inInstance, instanceType = IsInInstance()
			icon.owner = caster
			icon.isStealable = isStealable

			if( unit and unit:find( "arena%d" ) ) then
				if( dtype ) then
					if( T.DebuffWhiteList[name] ) then
						return true
					else
						return false
					end
				else
					if( S.ArenaBuffWhiteList[name] ) then
						return true
					else
						return false
					end
				end
			elseif( unit == "target" or ( unit and unit:find( "boss%d" ) ) ) then
				if( C["unitframes"]["playerdebuffsonly"] == true ) then
					if( UnitIsFriend( "player", "target" ) ) then
						return true
					end

					local isPlayer
					if( caster == "player" or caster == "vehicle" ) then
						isPlayer = true
					else
						isPlayer = false
					end

					if( isPlayer ) then
						return true
					elseif( S.DebuffWhiteList[name] or ( inInstance and ( ( instanceType == "pvp" or instanceType == "arena" ) and S.TargetPVPOnly[name] ) ) ) then
						return true
					else
						return false
					end
				else
					return true
				end
			else
				if( unit ~= "player" and unit ~= "targettarget" and unit ~= "focus" and inInstance and ( instanceType == "pvp" or instanceType == "arena" ) ) then
					if( S.DebuffWhiteList[name] or S.TargetPVPOnly[name] ) then
						return true
					else
						return false
					end
				else
					if( S.DebuffBlacklist[name] ) then
						return false
					else
						return true
					end
				end
			end
		end

		if( C["unitframes"]["unicolor"] ~= true and C["unitframes"]["enemyhcolor"] == true and unit == "target" and UnitIsEnemy( unit, "player" ) and UnitIsPlayer( unit ) ) or ( C["unitframes"]["unicolor"] ~= true and unit == "target" and not UnitIsPlayer( unit ) and UnitIsFriend( unit, "player" ) ) then
			local c = S.UnitColor.reaction[UnitReaction( unit, "player" )]
			if( c ) then 
				r, g, b = c[1], c[2], c[3]
				health:SetStatusBarColor( r, g, b )
			else
				r, g, b = 75 / 255, 175 / 255, 76 / 255
				health:SetStatusBarColor( r, g, b )
			end
		end

		if( min ~= max ) then
			local r, g, b
			r, g, b = oUFTukui.ColorGradient( min, max, 0.69, 0.31, 0.31, 0.65, 0.63, 0.35, 0.33, 0.59, 0.33 )
			if( unit == "player" and health:GetAttribute( "normalUnit" ) ~= "pet" ) then
				if( C["unitframes"]["showtotalhpmp"] == true ) then
					health.value:SetFormattedText( "|cff559655%s|r |cffD7BEA5|||r |cff559655%s|r", S.ShortValue( min ), S.ShortValue( max ) )
				else
					health.value:SetFormattedText( "|cffAF5050%d|r |cffD7BEA5-|r |cff%02x%02x%02x%d%%|r", min, r * 255, g * 255, b * 255, floor( min / max * 100 ) )
				end
			elseif( unit == "target" or ( unit and unit:find( "boss%d" ) ) ) then
				if( C["unitframes"]["showtotalhpmp"] == true ) then
					health.value:SetFormattedText( "|cff559655%s|r |cffD7BEA5|||r |cff559655%s|r", S.ShortValue( min ), S.ShortValue( max ) )
				else
					health.value:SetFormattedText( "|cffAF5050%s|r |cffD7BEA5-|r |cff%02x%02x%02x%d%%|r", S.ShortValue( min ), r * 255, g * 255, b * 255, floor( min / max * 100 ) )
				end
			elseif( ( unit and unit:find( "arena%d" ) ) or unit == "focus" or unit == "focustarget" ) then
				health.value:SetText( "|cff559655" .. S.ShortValue( min ) .. "|r" )
			else
				health.value:SetText( "|cff559655-" .. ShortValueNegative( max - min ) .. "|r" )
			end
		else
			if( unit == "player" and health:GetAttribute( "normalUnit" ) ~= "pet" ) then
				health.value:SetText( "|cff559655" .. max .. "|r" )
			elseif( unit == "target" or unit == "focus"  or unit == "focustarget" or ( unit and unit:find( "arena%d" ) ) ) then
				health.value:SetText( "|cff559655" .. S.ShortValue( max ) .. "|r" )
			else
				health.value:SetText( " " )
			end
		end
	end
end )

hooksecurefunc( S, "PostUpdateHealthRaid", function( health, unit, min, max )
	if( not UnitIsConnected( unit ) or UnitIsDead( unit ) or UnitIsGhost( unit ) ) then
		if( not UnitIsConnected( unit ) ) then
			health.value:SetText( "|cffD7BEA5" .. L.unitframes_ouf_offline .. "|r" )
		elseif( UnitIsDead( unit ) ) then
			health.value:SetText("|cffD7BEA5" .. L.unitframes_ouf_dead .. "|r" )
		elseif( UnitIsGhost( unit ) ) then
			health.value:SetText( "|cffD7BEA5" .. L.unitframes_ouf_ghost .. "|r" )
		end
	else
		if( not UnitIsPlayer( unit ) and UnitIsFriend( unit, "player" ) and C["unitframes"]["unicolor"] ~= true ) then
			local c = S.UnitColor.reaction[5]
			local r, g, b = c[1], c[2], c[3]
			health:SetStatusBarColor( r, g, b )
			health.bg:SetTexture( 0.1, 0.1, 0.1 )
		end

		if( C["unitframes"]["gradienthealth"] == true and C["unitframes"]["unicolor"] == true ) then
			if( not UnitIsConnected( unit ) or UnitIsDead( unit ) or UnitIsGhost( unit ) ) then return end
			if( not health.classcolored ) then
				local r, g, b = oUF.ColorGradient( min, max, unpack( C["unitframes"]["gradient"] ) )
				health:SetStatusBarColor( r, g, b )
			end
		end
		
		if( min ~= max ) then
			health.value:SetText( "|cff559655-" .. S.ShortValueNegative( max - min ) .. "|r" )
		else
			health.value:SetText( " " )
		end
	end
end )