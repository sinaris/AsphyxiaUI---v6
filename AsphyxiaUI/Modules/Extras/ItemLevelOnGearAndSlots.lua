---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["intmodules"]["itemlevelongearandslots"] ~= true ) then return end

local GREY = { 0.55, 0.55, 0.55 }
local RED = { 1, 0, 0 }
local ORANGE = { 1, 0.7, 0 }
local YELLOW = { 1, 1, 0 }
local GREEN = { 0, 1, 0 }
local LIGHTBLUE = { 0, 1, 1 }
local BLUE = { 0, 0.8, 1 }
local DARKBLUE = { 0, 0.5, 1 }
local PURPLE = { 0.7, 0, 1 }
local PINK = { 1, 0, 1 }
local WHITE = { 1, 1, 1 }

local ItemLevelSlotList={ 
	"HeadSlot",
	"NeckSlot",
	"ShoulderSlot",
	"BackSlot",
	"ChestSlot",
	"ShirtSlot",
	"TabardSlot",
	"WristSlot",
	"HandsSlot",
	"WaistSlot",
	"LegsSlot",
	"FeetSlot",
	"Finger0Slot",
	"Finger1Slot",
	"Trinket0Slot",
	"Trinket1Slot",
	"MainHandSlot",
	"SecondaryHandSlot",
	"RangedSlot"
}

local VOID_DEPOSIT_MAX = 9
local VOID_WITHDRAW_MAX = 9
local VOID_STORAGE_MAX = 80


local ButtonTable = {};

function IIL_Update(param, value) -- Use with caution not fully implemented
	if param == "font" then
		if value then
			for i=1,#ButtonTable do
				local button = _G[ButtonTable[i]]
				local fontName, fontHeight, fontFlags = button.ilvl:GetFont()
				print(button:GetName().." font set to: "..value)
				button.ilvl:SetFont(value,fontHeight,fontFlags)
			end
		end
	end
end

local function CreateText(frame)
	if not frame.ilvl then
		--tinsert(ButtonTable,frame:GetName()) Ignored for now
		frame.ilvl = frame:CreateFontString(nil,"OVERLAY")
		frame.ilvl:SetFont(Font,fontSize,"OUTLINE")
		frame.ilvl:SetPoint("TOPLEFT",frame,"TOPLEFT",offsetx,offsety)
	end
	frame.ilvl:SetText("")
end

local function SetColor(frame,ilvl)
	if not frame or not ilvl then return end
	if ilvl < 150 then
		frame.ilvl:SetTextColor(unpack(GREY))
	elseif ilvl >= 150 and ilvl < 250 then
		frame.ilvl:SetTextColor(unpack(RED))
	elseif ilvl >= 250 and ilvl < 300 then
		frame.ilvl:SetTextColor(unpack(ORANGE))
	elseif ilvl >= 300 and ilvl < 350 then
		frame.ilvl:SetTextColor(unpack(YELLOW))
	elseif ilvl >= 350 and ilvl < 372 then
		frame.ilvl:SetTextColor(unpack(GREEN))
	elseif ilvl >= 372 and ilvl < 385 then
		frame.ilvl:SetTextColor(unpack(LIGHTBLUE))
	elseif ilvl >= 385 and ilvl < 397 then
		frame.ilvl:SetTextColor(unpack(BLUE))
	elseif ilvl >= 397 and ilvl < 403 then
		frame.ilvl:SetTextColor(unpack(DARKBLUE))
	elseif ilvl >= 397 and ilvl < 403 then
		frame.ilvl:SetTextColor(unpack(PURPLE))
	elseif ilvl >= 403 and ilvl < 410 then
		frame.ilvl:SetTextColor(unpack(PINK))
	elseif ilvl >= 410 then
		frame.ilvl:SetTextColor(unpack(WHITE))
	end
end

local f = CreateFrame("frame");
f:RegisterEvent("PLAYER_LOGIN");
f:RegisterEvent("ADDON_LOADED");
f:SetScript("OnEvent", function(self,event,...)
	local arg1,arg2 = ...
	if event == "PLAYER_LOGIN" then
		-- Player Bag Frame
		hooksecurefunc("ContainerFrame_Update", function(frame)
			local id = frame:GetID();
			local name = frame:GetName();
			local button;
			for i=1, frame.size, 1 do
				button = _G[name.."Item"..i];
				CreateText(button)
				local _,_,_,_,_,_,itemLink = GetContainerItemInfo(id, button:GetID());
				if itemLink then
					local _,_,_,itemLevel = GetItemInfo(itemLink);
					if itemLevel then
						button.ilvl:SetText(itemLevel);
						itemLevel = tonumber(itemLevel)
						SetColor(button,itemLevel)
					end
				end
			end
		end)
		-- Player Bank Frame
		hooksecurefunc("BankFrameItemButton_Update", function(button)
			CreateText(button)
			local _,_,_,_,_,_,itemLink = GetContainerItemInfo(BANK_CONTAINER, button:GetID());
			if itemLink then
				local _,_,_,itemLevel = GetItemInfo(itemLink);
				if itemLevel then
					button.ilvl:SetText(itemLevel);
					itemLevel = tonumber(itemLevel)
					SetColor(button,itemLevel)
				end
			end
		end)
		-- Paperdoll Frame
		hooksecurefunc("PaperDollItemSlotButton_Update",function() 
			for i=1,#slotsList do
				local button = _G["Character"..slotsList[i]]
				CreateText(button)	
				local slotID, textureName = GetInventorySlotInfo(slotsList[i])
				if slotID then
					local itemID = GetInventoryItemID("player",slotID)
					if itemID then
						local _,_,_,itemLevel = GetItemInfo(itemID);
						if itemLevel then
							button.ilvl:SetText(itemLevel);
							itemLevel = tonumber(itemLevel)
							SetColor(button,itemLevel)
						end
					end
				end
			end
		end)
		-- Paperdoll Flyout Menu
		hooksecurefunc("EquipmentFlyout_DisplayButton", function(button,paperDollItemSlot)
			CreateText(button)
			local location = button.location;
			if location < EQUIPMENTFLYOUT_FIRST_SPECIAL_LOCATION then -- Required to keep EquipmentManager_GetItemInfoByLocation from calling an invalid location.
				local itemID = EquipmentManager_GetItemInfoByLocation(location);
				if itemID then
					local _,_,_,itemLevel = GetItemInfo(itemID);
					if itemLevel then
						button.ilvl:SetText(itemLevel);
						itemLevel = tonumber(itemLevel)
						SetColor(button,itemLevel)
					end
				end
			end
		end)
	elseif event == "ADDON_LOADED" and arg1 == "Blizzard_GuildBankUI" then
		hooksecurefunc("GuildBankFrame_Update", function()
			for i=1, MAX_GUILDBANK_SLOTS_PER_TAB do
				local index = mod(i, NUM_SLOTS_PER_GUILDBANK_GROUP);
				local tab = GetCurrentGuildBankTab();
				if ( index == 0 ) then
					index = NUM_SLOTS_PER_GUILDBANK_GROUP;
				end
				local column = ceil((i-0.5)/NUM_SLOTS_PER_GUILDBANK_GROUP);
				local button = _G["GuildBankColumn"..column.."Button"..index];
				button:SetID(i);
				CreateText(button)
				
				local itemLink = GetGuildBankItemLink(tab, i)
				if itemLink then
					local _,_,_,itemLevel = GetItemInfo(itemLink);
					if itemLevel then
						button.ilvl:SetText(itemLevel);
						itemLevel = tonumber(itemLevel)
						SetColor(button,itemLevel)
					end
				end
			end
		end)
	elseif event == "ADDON_LOADED" and arg1 == "Blizzard_VoidStorageUI" then
		hooksecurefunc("VoidStorage_ItemsUpdate",function(doDeposit,doContents)
			if ( doDeposit ) then
				for i = 1, VOID_DEPOSIT_MAX do
					button = _G["VoidStorageDepositButton"..i];
					CreateText(button)
					
					local itemID, textureName = GetVoidTransferDepositInfo(i);
					if itemID then
						local _,_,_,itemLevel = GetItemInfo(itemID);
						if itemLevel then
							button.ilvl:SetText(itemLevel);
							itemLevel = tonumber(itemLevel)
							SetColor(button,itemLevel)
						end
					end
				end
			end
			if ( doContents ) then
				-- withdrawal
				for i = 1, VOID_WITHDRAW_MAX do
					button = _G["VoidStorageWithdrawButton"..i];
					CreateText(button)
					
					local itemID, textureName = GetVoidTransferWithdrawalInfo(i);
					if itemID then
						local _,_,_,itemLevel = GetItemInfo(itemID);
						if itemLevel then
							button.ilvl:SetText(itemLevel);
							itemLevel = tonumber(itemLevel)
							SetColor(button,itemLevel)
						end
					end
				end
		
				-- storage
				for i = 1, VOID_STORAGE_MAX do
					button = _G["VoidStorageStorageButton"..i];
					CreateText(button)
					
					local itemID, textureName, locked, recentDeposit, isFiltered = GetVoidItemInfo(i);
					if itemID then
						local _,_,_,itemLevel = GetItemInfo(itemID);
						if itemLevel then
							button.ilvl:SetText(itemLevel);
							itemLevel = tonumber(itemLevel)
							SetColor(button,itemLevel)
						end
					end
				end
			end
		end)
	elseif event == "ADDON_LOADED" and arg1 == "Blizzard_ItemAlterationUI" then
		hooksecurefunc("TransmogrifyFrame_UpdateSlotButton",function(button)
			CreateText(button)
			local _,_,_,_,_,visibleItemID = GetTransmogrifySlotInfo(button.id);
			if visibleItemID then
				local _,_,_,itemLevel = GetItemInfo(visibleItemID);
				if itemLevel then
					button.ilvl:SetText(itemLevel);
					itemLevel = tonumber(itemLevel)
					SetColor(button,itemLevel)
				end
			end
		end)
	elseif event == "ADDON_LOADED" and arg1 == "Blizzard_InspectUI" then
		hooksecurefunc("InspectPaperDollItemSlotButton_Update",function(button)
			CreateText(button)
			local unit = InspectFrame.unit;
			if unit then
				local itemID = GetInventoryItemID(unit, button:GetID())
				if itemID then
					local _,_,_,itemLevel = GetItemInfo(itemID);
					if itemLevel then
						button.ilvl:SetText(itemLevel);
						itemLevel = tonumber(itemLevel)
						SetColor(button,itemLevel)
					end
				end
			end
		end)
	--[[elseif event == "ADDON_LOADED" and arg1 == "Blizzard_ItemSocketingUI" then
		hooksecurefunc("ItemSocketingFrame_Update",function()
			for i=1, MAX_NUM_SOCKETS do
				button = _G["ItemSocketingSocket"..i];
				CreateText(button)	
				local itemName
				itemName = GetNewSocketInfo(i);
				if itemName then
					local itemName,_,_,itemLevel, _,_,_,_,_,_,_ = GetItemInfo(itemName)
					if itemLevel then
						button.ilvl:SetText(itemLevel);
						itemLevel = tonumber(itemLevel)
						SetColor(button,itemLevel)
						print(itemLevel)
					end
				else
					itemName = GetExistingSocketInfo(i)
					if itemName then
						local itemName,_,_,itemLevel, _,_,_,_,_,_,_ = GetItemInfo(itemName)
						if itemLevel then
							print(itemLevel)
							button.ilvl:SetText(itemLevel);
							itemLevel = tonumber(itemLevel)
							SetColor(button,itemLevel)
						end
					end
				end
			end
		end)
		]]--
	end
end)