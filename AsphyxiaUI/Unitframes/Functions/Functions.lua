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

	button.Glow:Kill()
end

------------------------------
-- 
------------------------------
hooksecurefunc( S, "PostNamePosition", function( self )
	self.Name:ClearAllPoints()
	
	if( self.Power.value:GetText() and UnitIsEnemy( "player", "target" ) and C["unitframes"]["targetpowerpvponly"] == true ) or ( self.Power.value:GetText() and C["unitframes"]["targetpowerpvponly"] == false ) then
		if( C["global"]["unitframelayout"] == "jasje" ) then
			self.Name:SetPoint( "LEFT", self.panel, "LEFT", 3, 1 )
		else
			self.Name:SetPoint( "CENTER", self.Health, "CENTER", 0, 1 )
		end
	else
		if( C["global"]["unitframelayout"] == "jasje" ) then
			self.Name:SetPoint( "LEFT", self.panel, "LEFT", 3, 1 )
		else
			self.Name:SetPoint( "CENTER", self.Health, "CENTER", 0, 1 )
		end
	end
end )