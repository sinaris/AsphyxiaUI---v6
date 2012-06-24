---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local pWidth, pHeight, pSpacing = C["databars"]["settings"]["width"], C["databars"]["settings"]["height"], C["databars"]["settings"]["spacing"]

S["databars"] = {}

S.maxDatabars = 0
for i, v in pairs( C["databars"] ) do
	if( type( v ) == "number" ) then S.maxDatabars = max( S.maxDatabars, v ) end
end
if( S.maxDatabars == 0 ) then return end

for i = 1, S.maxDatabars do
	S.databars[i] = CreateFrame( "Frame", "TukuiDataBar" .. i .. "_Panel", UIParent )
	S.databars[i]:CreateShadow()
	if( i == 1 ) then
		S.databars[i]:CreatePanel( "Transparent", pWidth, pHeight, "TOPLEFT", UIParent, "TOPLEFT", 2, -2 )
	else
		if( C["databars"]["settings"].vertical ) then
			S.databars[i]:CreatePanel( "Transparent", pWidth, pHeight, "TOPRIGHT", S.databars[i - 1], "BOTTOMRIGHT", 0, -pSpacing )
		else
			S.databars[i]:CreatePanel( "Transparent", pWidth, pHeight, "TOPLEFT", S.databars[i - 1], "TOPRIGHT", pSpacing, 0 )
		end
	end
	
	S.databars[i].statusbar = CreateFrame( "StatusBar",  "TukuiDataBar" .. i .. "_StatusBar", S.databars[i], "TextStatusBar" )
	S.databars[i].statusbar:SetFrameStrata( "BACKGROUND" )
	S.databars[i].statusbar:SetStatusBarTexture( C["media"]["normal"] )
	S.databars[i].statusbar:SetStatusBarColor( 1, 1, 1 )
	S.databars[i].statusbar:SetFrameLevel( 2 )
	S.databars[i].statusbar:SetPoint( "TOPRIGHT", S.databars[i], "TOPRIGHT", -2, -2 )
	S.databars[i].statusbar:SetPoint( "BOTTOMLEFT", S.databars[i], "BOTTOMLEFT", 2, 2 )
	S.databars[i].statusbar:SetMinMaxValues( 0, 1 )
	S.databars[i].statusbar:SetValue( 0 )

	S.databars[i].text = S.databars[i].statusbar:CreateFontString( "DataBar" .. i .. "_Text", "OVERLAY" )
	S.databars[i].text:SetFont( S.CreateFontString() )
	S.databars[i].text:SetPoint( "CENTER", S.databars[i].statusbar, "CENTER", 0, 1 )
end


local function hideDatabars( self )
	for i = 1, S.maxDatabars do
		S.databars[i]:Hide()
	end
	self.text:SetText( "|cff00FF00+|r" )
	self:ClearAllPoints()
	self:SetPoint( S.databars[1]:GetPoint() )
end

local function showDatabars( self )
	for i = 1, S.maxDatabars do
		S.databars[i]:Show()
	end
	self.text:SetText( "|cffFF0000-|r" )
	self:ClearAllPoints()
	if( not C["databars"]["settings"]["vertical"] ) then
		self:SetPoint( "LEFT", S.databars[S.maxDatabars], "RIGHT", pSpacing, 0 )
	else
		self:SetPoint( "TOP", S.databars[S.maxDatabars], "BOTTOM", 0, -pSpacing )
	end
end

S.databars["toggle"] = CreateFrame( "Frame", "TukuiDataBarToggle", UIParent )
S.databars["toggle"]:SetAlpha( 0 )
S.databars["toggle"].text = S.databars["toggle"]:CreateFontString( nil, "OVERLAY" )
S.databars["toggle"].text:SetFont( S.CreateFontString() )
--S.databars["toggle"].text:SetJustifyH( "CENTER" )
S.databars["toggle"].text:SetPoint( "CENTER", 0, 1 )
S.databars["toggle"].text:SetText( "|cffFF0000-|r" )

if( C["databars"]["settings"].vertical ) then
	S.databars["toggle"]:CreatePanel( "Transparent", pWidth, pHeight, "TOP", S.databars[S.maxDatabars], "BOTTOM", 0, -pSpacing )
else
	S.databars["toggle"]:CreatePanel( "Transparent", pHeight, pHeight, "LEFT", S.databars[S.maxDatabars], "RIGHT", pSpacing, 0 )
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