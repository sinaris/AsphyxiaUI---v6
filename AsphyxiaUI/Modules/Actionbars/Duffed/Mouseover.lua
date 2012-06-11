---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["panellayout"] ~= "duffed" ) then return end

if( C["actionbar"]["enable"] ~= true ) then return end

if( C["actionbar"]["duffedrightbarsmouseover"] ~= true ) then return end

local rbmoh = CreateFrame( "Frame", nil, TukuiBar3 )
rbmoh:Point( "RIGHT", UIParent, "RIGHT", 0, -14 )
rbmoh:SetSize( 24, ( S.buttonsize * 12 ) + ( S.buttonspacing * 13 ) )

function TukuiRightBarsMouseover( alpha )
	TukuiBar3:SetAlpha( alpha )
	DuffedBar3Button2:SetAlpha( alpha )
	DuffedBar3Button:SetAlpha( alpha )
	MultiBarRight:SetAlpha( alpha )
	MultiBarLeft:SetAlpha( alpha )

	if( C["actionbar"]["horizontal_petbar"] ~= true ) then
		TukuiLineToPetActionBarBackground:SetAlpha( alpha )
	end
	if( C["actionbar"]["petbaralwaysvisible"] ~= true and C["actionbar"]["horizontal_petbar"] ~= true ) then
		TukuiPetBar:SetAlpha( alpha )
		for i = 1, NUM_PET_ACTION_SLOTS do
			_G["PetActionButton" .. i]:SetAlpha( alpha )
		end
	end
end

local function mouseover( f )
	f:EnableMouse( true )
	f:SetAlpha( 0 )
	f:HookScript( "OnEnter", function() TukuiRightBarsMouseover( 1 ) end )
	f:HookScript( "OnLeave", function() TukuiRightBarsMouseover( 0 ) end )
end
mouseover( TukuiBar3 )
mouseover( rbmoh )

if( C["actionbar"]["horizontal_petbar"] ~= true ) then
	mouseover( TukuiLineToPetActionBarBackground )
end

for i = 1, 12 do
	_G["MultiBarRightButton" .. i]:EnableMouse( true )
	_G["MultiBarRightButton" .. i]:HookScript( "OnEnter", function() TukuiRightBarsMouseover( 1 ) end )
	_G["MultiBarRightButton" .. i]:HookScript( "OnLeave", function() TukuiRightBarsMouseover( 0 ) end )

	_G["MultiBarLeftButton" .. i]:EnableMouse( true )
	_G["MultiBarLeftButton" .. i]:HookScript( "OnEnter", function() TukuiRightBarsMouseover( 1 ) end )
	_G["MultiBarLeftButton" .. i]:HookScript( "OnLeave", function() TukuiRightBarsMouseover( 0 ) end )
end

if( C["actionbar"]["petbaralwaysvisible"] ~= true and C["actionbar"]["horizontal_petbar"] ~= true ) then
	for i = 1, NUM_PET_ACTION_SLOTS do
		_G["PetActionButton" .. i]:EnableMouse( true )
		_G["PetActionButton" .. i]:HookScript( "OnEnter", function() TukuiRightBarsMouseover( 1 ) end )
		_G["PetActionButton" .. i]:HookScript( "OnLeave", function() TukuiRightBarsMouseover( 0 ) end )
	end
	mouseover( TukuiPetBar )
else
	TukuiLineToPetActionBarBackground:Hide()
end