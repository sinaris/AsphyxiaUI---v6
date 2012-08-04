---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

S["databars"] = {}

S.maxDatabars = 0
for i, v in pairs( C["databars"] ) do
	if( type( v ) == "number" ) then
		S.maxDatabars = max( S.maxDatabars, v )
	end
end
if( S.maxDatabars == 0 ) then return end

for i = 1, S.maxDatabars do
	S.databars[i] = CreateFrame( "Frame", "AsphyxiaUIDataBar" .. i .. "_Panel", UIParent )
	S.databars[i]:CreateShadow()
	if( i == 1 ) then
		S.databars[i]:Size( C["databars"]["settings"]["width"], C["databars"]["settings"]["height"] )
		S.databars[i]:Point( "TOPLEFT", UIParent, "TOPLEFT", 2, -2 )
		S.databars[i]:SetTemplate( "Transparent" )
	else
		if( C["databars"]["settings"]["vertical"] == true ) then
			S.databars[i]:Size( C["databars"]["settings"]["width"], C["databars"]["settings"]["height"] )
			S.databars[i]:Point( "TOPRIGHT", S.databars[i - 1], "BOTTOMRIGHT", 0, -C["databars"]["settings"]["spacing"] )
			S.databars[i]:SetTemplate( "Transparent" )
		else
			S.databars[i]:Size( C["databars"]["settings"]["width"], C["databars"]["settings"]["height"] )
			S.databars[i]:Point( "TOPLEFT", S.databars[i - 1], "TOPRIGHT", C["databars"]["settings"]["spacing"], 0 )
			S.databars[i]:SetTemplate( "Transparent" )
		end
	end
	S.databars[i]:SetFrameLevel( 2 )
	S.databars[i]:SetFrameStrata( "BACKGROUND" )

	S.databars[i].statusbar = CreateFrame( "StatusBar",  "AsphyxiaUIDataBar" .. i .. "_StatusBar", S.databars[i], "TextStatusBar" )
	S.databars[i].statusbar:SetFrameStrata( "BACKGROUND" )
	S.databars[i].statusbar:SetStatusBarTexture( C["media"]["normTex"] )
	S.databars[i].statusbar:SetStatusBarColor( 1, 1, 1 )
	S.databars[i].statusbar:SetFrameLevel( 2 )
	S.databars[i].statusbar:SetPoint( "TOPRIGHT", S.databars[i], "TOPRIGHT", -2, -2 )
	S.databars[i].statusbar:SetPoint( "BOTTOMLEFT", S.databars[i], "BOTTOMLEFT", 2, 2 )
	S.databars[i].statusbar:SetMinMaxValues( 0, 1 )
	S.databars[i].statusbar:SetValue( 0 )

	S.databars[i].Text = S.databars[i].statusbar:CreateFontString( "DataBar" .. i .. "_Text", "OVERLAY" )
	S.databars[i].Text:SetFont( S.CreateFontString() )
	S.databars[i].Text:SetPoint( "CENTER", S.databars[i].statusbar, "CENTER", 0, 1 )
end


local function hideDatabars( self )
	for i = 1, S.maxDatabars do
		S.databars[i]:Hide()
	end
	self.Text:SetText( "|cff00FF00+|r" )
	self:ClearAllPoints()
	self:SetPoint( S.databars[1]:GetPoint() )
end

local function showDatabars( self )
	for i = 1, S.maxDatabars do
		S.databars[i]:Show()
	end
	self.Text:SetText( "|cffFF0000-|r" )
	self:ClearAllPoints()
	if( not C["databars"]["settings"]["vertical"] ) then
		self:SetPoint( "LEFT", S.databars[S.maxDatabars], "RIGHT", C["databars"]["settings"]["spacing"], 0 )
	else
		self:SetPoint( "TOP", S.databars[S.maxDatabars], "BOTTOM", 0, -C["databars"]["settings"]["spacing"] )
	end
end

S.databars["toggle"] = CreateFrame( "Frame", "AsphyxiaUIDataBarToggle", UIParent )
S.databars["toggle"]:Size( C["databars"]["settings"]["width"], C["databars"]["settings"]["height"] )
S.databars["toggle"]:SetTemplate( "Transparent" )
S.databars["toggle"]:SetAlpha( 0 )
S.databars["toggle"].Text = S.databars["toggle"]:CreateFontString( nil, "OVERLAY" )
S.databars["toggle"].Text:SetFont( S.CreateFontString() )
--S.databars["toggle"].Text:SetJustifyH( "CENTER" )
S.databars["toggle"].Text:SetPoint( "CENTER", 0, 1 )
S.databars["toggle"].Text:SetText( "|cffFF0000-|r" )

if( C["databars"]["settings"]["vertical"] == true ) then
	S.databars["toggle"]:ClearAllPoints()
	S.databars["toggle"]:Point( "TOP", S.databars[S.maxDatabars], "BOTTOM", 0, -C["databars"]["settings"]["spacing"] )
else
	S.databars["toggle"]:ClearAllPoints()
	S.databars["toggle"]:Point( "LEFT", S.databars[S.maxDatabars], "RIGHT", C["databars"]["settings"]["spacing"], 0 )
end
S.databars["toggle"]:CreateShadow()

S.databars["toggle"]:EnableMouse( true )
S.databars["toggle"]:HookScript( "OnMouseDown", function( self ) 
	if( S.databars[1]:IsShown() ) then
		hideDatabars( self )
	else
		showDatabars( self )
	end
end )
S.databars["toggle"]:HookScript( "OnEnter", function( self ) self:SetAlpha( 1 ) end )
S.databars["toggle"]:HookScript( "OnLeave", function( self ) self:SetAlpha( 0 ) end )