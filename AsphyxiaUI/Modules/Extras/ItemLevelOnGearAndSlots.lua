---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["intmodules"]["itemlevelongearandslots"] ~= true ) then return end

local frame = {
	CharacterHeadSlot,
	CharacterNeckSlot,
	CharacterShoulderSlot,
	CharacterBackSlot,
	CharacterChestSlot,
	CharacterWristSlot,
	CharacterShirtSlot,
	CharacterTabardSlot,
	CharacterMainHandSlot,
	CharacterSecondaryHandSlot,
	CharacterHandsSlot,
	CharacterWaistSlot,
	CharacterLegsSlot,
	CharacterFeetSlot,
	CharacterFinger0Slot,
	CharacterFinger1Slot,
	CharacterTrinket0Slot,
	CharacterTrinket1Slot
}

local slot = {
	"HeadSlot",
	"NeckSlot",
	"ShoulderSlot",
	"BackSlot",
	"ChestSlot",
	"WristSlot",
	"ShirtSlot",
	"TabardSlot",
	"MainHandSlot",
	"SecondaryHandSlot",
	"HandsSlot",
	"WaistSlot",
	"LegsSlot",
	"FeetSlot",
	"Finger0Slot",
	"Finger1Slot",
	"Trinket0Slot",
	"Trinket1Slot"
}

local iLow, iHigh, iEqAvg, iAvg

local iQualityFrames = {}
local iDuraFrames = {}

function iLvLrMain()
	iLvLrFrame = CreateFrame( "Frame", "iLvLrFrame", UIParent )

	iLvLrFrame:RegisterEvent( "ADDON_LOADED" )
	iLvLrFrame:RegisterEvent( "UNIT_INVENTORY_CHANGED" )
	iLvLrFrame:RegisterEvent( "UPDATE_INVENTORY_DURABILITY" )
	iLvLrFrame:SetScript( "OnEvent", iLvLrOnEvent )
end

function iLvLrOnLoad()
	iEqAvg, iAvg = GetAverageItemLevel()

	for k, v in pairs( slot ) do
		local iLevel = fetchIlvl( v )
		if( iLevel ) then
			makeText( frame[k] )

			if( v == "ShirtSlot" or v == "TabardSlot" ) then
				frame[k].text:SetFormattedText( "", iLevel )
			else
				if( iLevel <= ( floor( iEqAvg ) - 10 ) ) then
					frame[k].text:SetFormattedText( "|cFFFF0000%i", iLevel )
				elseif( iLevel >= ( floor( iEqAvg ) + 10 ) ) then
					frame[k].text:SetFormattedText( "|cFF00FF00%i", iLevel )
				else
					frame[k].text:SetFormattedText( "|cFFFFFFFF%i", iLevel )
				end
				makeDurability( frame[k], v )
			end
		end
	end
end

function iLvLrOnUpdate()
	iEqAvg, iAvg = GetAverageItemLevel()

	for k, v in pairs( slot ) do
		local iLevel = fetchIlvl( v )

		if( iLevel ) then
			if( not frame[k].text ) then
				makeText( frame[k] )
			end

			if( v == "ShirtSlot" or v == "TabardSlot" ) then
				frame[k].text:SetFormattedText( "", iLevel )
			else
				if( iLevel <= ( floor( iEqAvg ) - 10 ) ) then
					frame[k].text:SetFormattedText( "|cFFFF0000%i", iLevel )
				elseif( iLevel >= ( floor( iEqAvg ) + 10 ) ) then
					frame[k].text:SetFormattedText( "|cFF00FF00%i", iLevel )
				else
					frame[k].text:SetFormattedText( "|cFFFFFFFF%i", iLevel )
				end
				makeDurability( frame[k], v )
			end
		else
			if( frame[k].text ) then
				frame[k].text:SetFormattedText( "" )
			end

			if( iDuraFrames[v] ) then
				iDuraFrames[v]:Hide()
			end
		end
	end
end

function iLvLrOnEvent( self, event, arg1 )
	if( event == "ADDON_LOADED" and arg1 == "iLvLr" ) then
		iLvLrOnLoad()
	elseif( event == "UNIT_INVENTORY_CHANGED" or event == "UPDATE_INVENTORY_DURABILITY" ) then
		iLvLrOnUpdate()
	end
end

function fetchIlvl( slotName )
	local slotId, texture, checkRelic = GetInventorySlotInfo( slotName )
	local itemId = GetInventoryItemID( "player", slotId )

	if( itemId ) then
		local name, link, quality, iLevel, reqLevel, class, subclass, maxStack, equipSlot, texture, vendorPrice = GetItemInfo( itemId )
		return( iLevel )
	end
end

function fetchDura( slotName )
	local slotId, texture, checkRelic = GetInventorySlotInfo( slotName )

	if( slotId ) then
		local itemDurability, itemMaxDurability = GetInventoryItemDurability( slotId )

		if( itemDurability ) then
			return itemDurability, itemMaxDurability
		end
	end
end

function makeText( frame )
	local ilvlText = frame:CreateFontString( nil, "ARTWORK" )
	isValid = ilvlText:SetFont( S.CreateFontString() )

	if( frame == CharacterHeadSlot or frame == CharacterNeckSlot or frame == CharacterShoulderSlot or frame == CharacterBackSlot or frame == CharacterChestSlot or frame == CharacterWristSlot or frame == CharacterShirtSlot or frame == CharacterTabardSlot ) then
		ilvlText:SetPoint( "CENTER", frame, "CENTER", 42, 0 )
	elseif( frame == CharacterHandsSlot or frame == CharacterWaistSlot or frame == CharacterLegsSlot or frame == CharacterFeetSlot or frame == CharacterFinger0Slot or frame == CharacterFinger1Slot or frame == CharacterTrinket0Slot or frame == CharacterTrinket1Slot ) then
		ilvlText:SetPoint( "CENTER", frame, "CENTER", -42, 0 )
	elseif( frame == CharacterMainHandSlot or frame == CharacterSecondaryHandSlot or frame == CharacterRangedSlot ) then
		ilvlText:SetPoint( "CENTER", frame, "CENTER", 0, 42 )
	end

	frame.text = ilvlText
end

function makeDurability( frame, slot )
	local iDura = iDuraFrames[slot]

	if( not iDura ) then
		iDura = CreateFrame( "Frame", nil, frame )

		if( frame == CharacterHeadSlot or frame == CharacterNeckSlot or frame == CharacterShoulderSlot or frame == CharacterBackSlot or frame == CharacterChestSlot or frame == CharacterWristSlot or frame == CharacterShirtSlot or frame == CharacterTabardSlot ) then
			iDura:SetPoint( "BOTTOM", frame, "BOTTOM", 42, 0 )
		elseif( frame == CharacterHandsSlot or frame == CharacterWaistSlot or frame == CharacterLegsSlot or frame == CharacterFeetSlot or frame == CharacterFinger0Slot or frame == CharacterFinger1Slot or frame == CharacterTrinket0Slot or frame == CharacterTrinket1Slot ) then
			iDura:SetPoint( "BOTTOM", frame, "BOTTOM", -42, 0 )
		elseif( frame == CharacterMainHandSlot or frame == CharacterSecondaryHandSlot or frame == CharacterRangedSlot ) then
			iDura:SetPoint( "BOTTOM", frame, "BOTTOM", 0, 42 )
		end

		iDura:SetSize( 10, 10 )
		--iDura:SetBackdrop( {bgFile = nil, edgeFile = nil, tile = false, tileSize = 32, edgeSize = 0, insets = {left = 0, right = 0, top = 0, bottom = 0}})
		--iDura:SetBackdropColor(0,0,0,0)
		
		local iDuraText = iDura:CreateFontString( nil, "ARTWORK" )
		isValid = iDuraText:SetFont( S.CreateFontString() )
		iDuraText:SetPoint( "CENTER", iDura, "CENTER", 0, 0 )
		iDura.text = iDuraText

		itemDurability, itemMaxDurability = fetchDura( slot )
		if( itemDurability ) then
			local itemDurabilityPercentage = ( itemDurability / itemMaxDurability ) * 100

			if( itemDurabilityPercentage > 25 ) then
				iDura.text:SetFormattedText( "|cFF00FF00%i%%", itemDurabilityPercentage )
			elseif( itemDurabilityPercentage > 0 and itemDurabilityPercentage <= 25 ) then
				iDura.text:SetFormattedText( "|cFFFFFF00%i%%", itemDurabilityPercentage )
			elseif( itemDurabilityPercentage == 0 ) then
				iDura.text:SetFormattedText( "|cFFFF0000%i%%", itemDurabilityPercentage )
			end
		else
			iDura.text:SetFormattedText( "" )
		end
		iDuraFrames[slot] = iDura
	else
		itemDurability, itemMaxDurability = fetchDura( slot )
		if( itemDurability ) then
			itemDurabilityPercentage = ( itemDurability / itemMaxDurability ) * 100

			if( itemDurabilityPercentage > 25 ) then
				iDura.text:SetFormattedText( "|cFF00FF00%i%%", itemDurabilityPercentage )
			elseif( itemDurabilityPercentage > 0 and itemDurabilityPercentage <= 25 ) then
				iDura.text:SetFormattedText( "|cFFFFFF00%i%%", itemDurabilityPercentage )
			elseif( itemDurabilityPercentage == 0 ) then
				iDura.text:SetFormattedText( "|cFFFF0000%i%%", itemDurabilityPercentage )
			end
		else
			iDura.text:SetFormattedText( "" )
		end

		iDuraFrames[slot] = iDura
	end

	iDura:Show()
end

iLvLrMain()