---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local function Animate( self, x, y, duration )
	self.anim = self:CreateAnimationGroup( "Move_In" )
	self.anim.in1 = self.anim:CreateAnimation( "Translation" )
	self.anim.in1:SetDuration( 0 )
	self.anim.in1:SetOrder( 1 )
	self.anim.in2 = self.anim:CreateAnimation( "Translation" )
	self.anim.in2:SetDuration( duration )
	self.anim.in2:SetOrder( 2 )
	self.anim.in2:SetSmoothing( "OUT" )
	self.anim.out1 = self:CreateAnimationGroup( "Move_Out" )
	self.anim.out2 = self.anim.out1:CreateAnimation( "Translation" )
	self.anim.out2:SetDuration( duration )
	self.anim.out2:SetOrder( 1 )
	self.anim.out2:SetSmoothing( "IN" )
	self.anim.in1:SetOffset( S.Scale( x ), S.Scale( y ) )
	self.anim.in2:SetOffset( S.Scale( -x ), S.Scale( -y ) )
	self.anim.out2:SetOffset( S.Scale( x ), S.Scale( y ) )
	self.anim.out1:SetScript( "OnFinished", function() self:Hide() end )
end

local function CreateBorder( self, shadow )
	if( self:GetFrameStrata() == "BACKGROUND" ) then self:SetFrameStrata( "LOW" ) end

	local border = CreateFrame( "Frame", nil, self )
	border:SetPoint( "TOPLEFT", self, "TOPLEFT", S.Scale( -2 ), S.Scale( 2 ) )
	border:SetPoint( "BOTTOMRIGHT", self, "BOTTOMRIGHT", S.Scale( 2 ), S.Scale( -2 ) )
	border:SetTemplate( "Default" )
	
	if( shadow == true ) then
		border:CreateShadow( "Default" )
	end
	border:SetFrameLevel( self:GetFrameLevel() )
end

local function CreateOverlay( frame )
	if( frame.overlay ) then return end

	local overlay = frame:CreateTexture( frame:GetName() and frame:GetName() .. "Overlay" or nil, "BORDER", frame )
	overlay:ClearAllPoints()
	overlay:Point( "TOPLEFT", 2, -2 )
	overlay:Point( "BOTTOMRIGHT", -2, 2 )
	overlay:SetTexture( C["media"]["normTex"] )
	overlay:SetVertexColor( 0.05, 0.05, 0.05 )
	frame.overlay = overlay
end

local function FadeIn( frame )
	UIFrameFadeIn( frame, 0.4, frame:GetAlpha(), 1 )
end

local function FadeOut( frame )
	UIFrameFadeOut( frame, 0.8, frame:GetAlpha(), 0 )
end

local function SlideIn( self )
	if( not self.anim ) then
		Animate( self )
	end

	self.anim.out1:Stop()
	self:Show()
	self.anim:Play()
end

local function SlideOut( self )
	if( self.anim ) then
		self.anim:Finish()
	end

	self.anim:Stop()
	self.anim.out1:Play()
end

function SkinSlideBar( frame, height, movetext )
	frame:SetTemplate( "Default" )
	frame:SetBackdropColor( 0, 0, 0, .8 )

	if not height then
		height = frame:GetHeight()
	end

	if( movetext ) then
		if( _G[frame:GetName() .. "Low"] ) then _G[frame:GetName() .. "Low"]:Point( "BOTTOM", 0, -18 ) end
		if( _G[frame:GetName() .. "High"] ) then _G[frame:GetName() .. "High"]:Point( "BOTTOM", 0, -18 ) end
		if( _G[frame:GetName() .. "Text"] ) then _G[frame:GetName() .. "Text"]:Point( "TOP", 0, 19 ) end
	end

	_G[frame:GetName()]:SetThumbTexture( [[Interface\AddOns\Tukui\medias\textures\blank.tga]] )
	_G[frame:GetName()]:GetThumbTexture():SetVertexColor( unpack( C["media"].bordercolor ) )
	if( frame:GetWidth() < frame:GetHeight() ) then
		frame:Width( height )
		_G[frame:GetName()]:GetThumbTexture():Size( frame:GetWidth(), frame:GetWidth() + 4 )
	else
		frame:Height( height )
		_G[frame:GetName()]:GetThumbTexture():Size( height + 4, height )
	end
end

local function addapi( object )
	local mt = getmetatable( object ).__index

	if( not object.Animate ) then mt.Animate = Animate end
	if( not object.CreateBorder ) then mt.CreateBorder = CreateBorder end
	if( not object.CreateOverlay ) then mt.CreateOverlay = CreateOverlay end
	if( not object.FadeIn ) then mt.FadeIn = FadeIn end
	if( not object.FadeOut ) then mt.FadeOut = FadeOut end
	if( not object.SlideIn ) then mt.SlideIn = SlideIn end
	if( not object.SlideOut ) then mt.SlideOut = SlideOut end
	if( not object.SkinSlideBar ) then mt.SkinSlideBar = SkinSlideBar end
end

local handled = { ["Frame"] = true }
local object = CreateFrame( "Frame" )
addapi( object )
addapi( object:CreateTexture() )
addapi( object:CreateFontString() )

object = EnumerateFrames()
while object do
	if( not handled[object:GetObjectType()] ) then
		addapi( object )
		handled[object:GetObjectType()] = true
	end

	object = EnumerateFrames( object )
end