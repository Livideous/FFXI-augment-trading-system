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
			a1 = 515 --AGI
			v1 = 0 -- 0=1
		elseif trade:getItemId(2) == 4098 then 
 			a2 = 515 --AGI
 			v2 = 0 -- 0=1
		elseif trade:getItemId(3) == 4098 then 
			a3 = 515 --AGI
			v3 = 0 -- 0=1
		elseif trade:getItemId(4) == 4098 then 
 			a4 = 515 --AGI
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

		if trade:getItemId(1) == 4102 then --Light Crystal > CHR
			a1 = 1 --HP
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 1 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 1 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 1 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4103 then --Dark Crystal > CHR
			a1 = 4 --MP
			v1 = slot1 -- +1 HP for each Dark Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4103 then 
 			a2 = 4 --MP
 			v2 = slot2 -- +1 HP for each Dark Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4103 then 
			a3 = 4 --MP
			v3 = slot3 -- +1 HP for each Dark Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4103 then 
 			a4 = 4 --MP
			v4 = slot4 -- +1 HP for each Dark Crystal in Augment slot 4, or Trade slot 5
 		end
		
		if trade:getItemId(1) == 6147 then --Mikhe's Memo > Hand-to-Hand
			a1 = 257 --Hand-to-Hand
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
		
		if trade:getItemId(1) == 4101 then --Dagger Enchiridian > Dagger
			a1 = 258 --Dagger
			v1 = 0 -- 0=1
		elseif trade:getItemId(2) == 4101 then 
 			a2 = 258 --MND
 			v2 = 0 -- 0=1
		elseif trade:getItemId(3) == 4101 then 
			a3 = 258 --MND
			v3 = 0 -- 0=1
		elseif trade:getItemId(4) == 4101 then 
 			a4 = 258 --MND
			v4 = 0 -- 0=1
 		end

		if trade:getItemId(1) == 4102 then --Swing and Stab > Sword
			a1 = 259 --Sword
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 259 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 259 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 259 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Mieuseloir's Diary > Great Sword
			a1 = 260 --Great Sword
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 260 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 260 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 260 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Bull's Diary > Axe
			a1 = 261 --Axe
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 261 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 261 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 261 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Death for Dimwits > Great Axe
			a1 = 262 --Great Axe
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 262 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 262 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 262 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Ludwig's Report > Scythe
			a1 = 263 --Scythe
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 263 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 263 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 263 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Clash of Titans > Polearm
			a1 = 264 --Polearm
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 264 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 264 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 264 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Kagetora's Diary > Katana
			a1 = 265 --Katana
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 265 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 265 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 265 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Noillurie's Log > Great Katana
			a1 = 266 --Great Katana
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 266 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 266 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 266 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Ferreous's Diary > Club
			a1 = 267 --Club
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 267 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 267 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 267 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Kayeel-Payeel's Memoirs > Staff
			a1 = 268 --Staff
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 268 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 268 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 268 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Perih's Primer > Archery
			a1 = 281 --Archery
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 281 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 281 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 281 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Barrels of Fun > Marksmanship
			a1 = 282 --Marksmanship
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 282 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 282 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 282 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Throwing Weapon Enchiridion > Throwing
			a1 = 283 --Throwing
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 283 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 283 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 283 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Mikhe's Note > Guarding
			a1 = 1 --Guarding
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 1 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 1 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 1 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Sonia's Diary > Evasion
			a1 = 1 --Evasion
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 1 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 1 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 1 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --The Successor > Shield
			a1 = 286 --Shield
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 286 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 286 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 286 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Kagetora's Journal > Parry
			a1 = 1 --Parry
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 1 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 1 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 1 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Altana's Hymn > Divine Magic
			a1 = 288 --Divine Magic
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 288 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 288 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 288 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Coveffe Musings > Healing Magic
			a1 = 289 --Healing Magic
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 289 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 289 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 289 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Aid for All > Enhancing Magic
			a1 = 290 --Enhancing magic
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 290 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 290 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 290 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Investigative Report > Enfeebling MAgic
			a1 = 291 --Enfeebling Magic
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 291 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 291 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 291 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Bounty List > Elemental Magic
			a1 = 292 --Elemental Magic
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 292 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 292 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 292 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Dark Deeds > Dark Magic
			a1 = 293 --Dark Magic
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 293 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 293 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 293 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Breezy Libretto > Singing
			a1 = 296 --Singing
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 296 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 296 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 296 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Cavernous Score > String Instrument
			a1 = 297 --String Instrument
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 297 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 297 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 297 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Beaming Score > Wind Instrument
			a1 = 298 --Wind Instrument
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 298 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 298 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 298 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Yomi's Diagram > Ninjutsu
			a1 = 295 --Ninjutsu
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 295 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 295 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 295 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Astral Homeland > Summoning Magic
			a1 = 294 --Summoning Magic
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 294 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 294 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 294 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Life-form Study > Blue Magic
			a1 = 299 --Blue Magic
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 299 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 299 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 299 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --Hrohj's Record > Geomancy
			a1 = 300 --Geomancy
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 300 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 300 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 300 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end

		if trade:getItemId(1) == 4102 then --The Bell Tolls > Handbell
			a1 = 301 --Handbell
			v1 = slot1 -- +1 HP for each Light Crystal in Augment slot 1, or Trade slot 2
		elseif trade:getItemId(2) == 4102 then 
 			a2 = 301 --HP
 			v2 = slot2 -- +1 HP for each Light Crystal in Augment slot 2, or Trade slot 3
		elseif trade:getItemId(3) == 4102 then 
			a3 = 301 --HP
			v3 = slot3 -- +1 HP for each Light Crystal in Augment slot 3, or Trade slot 4
		elseif trade:getItemId(4) == 4102 then 
 			a4 = 301 --HP
			v4 = slot4 -- +1 HP for each Light Crystal in Augment slot 4, or Trade slot 5
 		end
		
   if(player:getFreeSlotsCount() >= 1) then
      player:tradeComplete();
      player:addItem(prize,1,a1,v1,a2,v2,a3,v3,a4,v4);
      player:printToPlayer('Augment Time!!', 0, npc:getPacketName())
	  player:printToPlayer('Gimme MOAR!', 0, npc:getPacketName())
   else
   end
 
end;
