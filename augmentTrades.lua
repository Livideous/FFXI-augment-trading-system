--entity.onTrade = function(player, npc, trade)
--onTrade = function(player, npc, trade)

--copy everything below into the trade function listed above that is present in your NPC file. Only one will be present, and line 1 is the most common use-case. Line 2 is for custom NPC modules.
--All Augment values begin at the internal value of 0, so 0+1, therefore 0=1, 1=2, 4=5, 16=17, etc. All values overflow at 31, with a maximum value of 32 in game. Values over 31 will overflow back to 0 and revert to going up from 1. This means there will be limitations to how high your augments can go. This can be modified on the client dats and in the server database, but it's highly recommended NOT to do so.

--Initialize variables
    local slot1 = trade:getSlotQty(1); --Quantity/Amount of Items in slot 2 of the trade interface
    local slot2 = trade:getSlotQty(2); --Quantity/Amount of Items in slot 3 of the trade interface
    local slot3 = trade:getSlotQty(3); --Quantity/Amount of Items in slot 4 of the trade interface
    local slot4 = trade:getSlotQty(4); --Quantity/Amount of Items in slot 5 of the trade interface
    local prize = trade:getItemId(0); --Resolved the ID of the item being Augmented in the first trade slot.
    local a1 = 0; --Augment 1 ID. 0 is Blank.
    local a2 = 0; --Augment 2 ID. 0 is Blank.
    local a3 = 0; --Augment 3 ID. 0 is Blank.
    local a4 = 0; --Augment 4 ID. 0 is Blank.
    local v1 = 0; --Augment 1 Value. Value starts at 0, so 0=1.
    local v2 = 0; --Augment 2 Value. Value starts at 0, so 0=1.
    local v3 = 0; --Augment 3 Value. Value starts at 0, so 0=1.
    local v4 = 0; --Augment 4 Value. Value starts at 0, so 0=1.
		
		if trade:getItemId(1) == 4096 then --Fire crystals > STR
			a1 = 512 --STR
			v1 = 0 -- 0=1
		elseif trade:getItemId(2) == 4096 then 
 			a2 = 512 --STR
 			v2 = 0 -- 0=1
		elseif trade:getItemId(3) == 4096 then 
			a3 = 512 --STR
			v3 = 0 -- 0=1
		elseif trade:getItemId(4) == 4096 then 
 			a4 = 512 --STR
			v4 = 0 -- 0=1
 		end
		
		if trade:getItemId(1) == 4100 then --lightning crystals > DEX
			a1 = 513 --DEX
			v1 = 0 -- 0=1
		elseif trade:getItemId(2) == 4100 then 
 			a2 = 513 --DEX
 			v2 = 0 -- 0=1
		elseif trade:getItemId(3) == 4100 then 
			a3 = 513 --DEX
			v3 = 0 -- 0=1
		elseif trade:getItemId(4) == 4100 then 
 			a4 = 513 --DEX
			v4 = 0 -- 0=1
 		end

		if trade:getItemId(1) == 4099 then --Earth crystals > VIT
			a1 = 514 --VIT
			v1 = 0 -- 0=1
		elseif trade:getItemId(2) == 4099 then 
 			a2 = 514 --VIT
 			v2 = 0 -- 0=1
		elseif trade:getItemId(3) == 4099 then 
			a3 = 514 --VIT
			v3 = 0 -- 0=1
		elseif trade:getItemId(4) == 4099 then 
 			a4 = 514 --VIT
			v4 = 0 -- 0=1
 		end
		
		if trade:getItemId(1) == 4098 then --Wind Crystals > AGI
			a1 = 515
			v1 = 0 -- 0=1
		elseif trade:getItemId(2) == 4098 then 
 			a2 = 515
 			v2 = 0 -- 0=1
		elseif trade:getItemId(3) == 4098 then 
			a3 = 515
			v3 = 0 -- 0=1
		elseif trade:getItemId(4) == 4098 then 
 			a4 = 515
			v4 = 0 -- 0=1
 		end
		
		if trade:getItemId(1) == 4097 then --Ice Crystals > INT
			a1 = 516 --INT
			v1 = 0 -- 0=1
		elseif trade:getItemId(2) == 4097 then 
 			a2 = 516 --INT
 			v2 = 0 -- 0=1
		elseif trade:getItemId(3) == 4097 then 
			a3 = 516 --INT
			v3 = 0 -- 0=1
		elseif trade:getItemId(4) == 4097 then 
 			a4 = 516 --INT
			v4 = 0 -- 0=1
 		end
		
		if trade:getItemId(1) == 4101 then --Water Crystals > MND
			a1 = 517 --MND
			v1 = 0 -- 0=1
		elseif trade:getItemId(2) == 4101 then 
 			a2 = 517 --MND
 			v2 = 0 -- 0=1
		elseif trade:getItemId(3) == 4101 then 
			a3 = 517 --MND
			v3 = 0 -- 0=1
		elseif trade:getItemId(4) == 4101 then 
 			a4 = 517 --MND
			v4 = 0 -- 0=1
 		end

		if trade:getItemId(1) == 613 then --Faded Crystal > CHR
			a1 = 518 --CHR
			v1 = slot1 -- +1 CHR for each Faded Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 613 then 
 			a2 = 518 --CHR
 			v2 = slot2 -- +1 CHR for each Faded Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 613 then 
			a3 = 518 --CHR
			v3 = slot3 -- +1 CHR for each Faded Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 613 then 
 			a4 = 518 --CHR
			v4 = slot4 -- +1 CHR for each Faded Crystal in Augment slot 4, or Trade slot 5
 		end
		
   if(player:getFreeSlotsCount() >= 1) then
      player:tradeComplete();
      player:addItem(prize,1,a1,v1,a2,v2,a3,v3,a4,v4);
      player:printToPlayer('Augment Time!!', 0, npc:getPacketName())
	  player:printToPlayer('Gimme MOAR!', 0, npc:getPacketName())
   else
   end
 
end;
