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
			v1 = slot1
		elseif trade:getItemId(2) == 6147 then 
 			a2 = 517 --Hand-to-Hand
 			v2 = slot2
		elseif trade:getItemId(3) == 6147 then 
			a3 = 517 --Hand-to-Hand
			v3 = slot3
		elseif trade:getItemId(4) == 6147 then 
 			a4 = 517 --Hand-to-Hand
			v4 = slot4
 		end
		
		if trade:getItemId(1) == 6148 then --Dagger Enchiridian > Dagger
			a1 = 258 --Dagger
			v1 = slot1
		elseif trade:getItemId(2) == 6148 then 
 			a2 = 258 --Dagger
 			v2 = slot2
		elseif trade:getItemId(3) == 6148 then 
			a3 = 258 --Dagger
			v3 = slot3
		elseif trade:getItemId(4) == 6148 then 
 			a4 = 258 --Dagger
			v4 = slot4
 		end

		if trade:getItemId(1) == 6149 then --Swing and Stab > Sword
			a1 = 259 --Sword
			v1 = slot1
		elseif trade:getItemId(2) == 6149 then 
 			a2 = 259 --Sword
 			v2 = slot2
		elseif trade:getItemId(3) == 6149 then 
			a3 = 259 --Sword
			v3 = slot3
		elseif trade:getItemId(4) == 6149 then 
 			a4 = 259 --Sword
			v4 = slot4
 		end

		if trade:getItemId(1) == 6150 then --Mieuseloir's Diary > Great Sword
			a1 = 260 --Great Sword
			v1 = slot1
		elseif trade:getItemId(2) == 6150 then 
 			a2 = 260 --Great Sword
 			v2 = slot2
		elseif trade:getItemId(3) == 6150 then 
			a3 = 260 --Great Sword
			v3 = slot3
		elseif trade:getItemId(4) == 6150 then 
 			a4 = 260 --Great Sword
			v4 = slot4
 		end

		if trade:getItemId(1) == 6151 then --Bull's Diary > Axe
			a1 = 261 --Axe
			v1 = slot1
		elseif trade:getItemId(2) == 6151 then 
 			a2 = 261 --Axe
 			v2 = slot2
		elseif trade:getItemId(3) == 6151 then 
			a3 = 261 --Axe
			v3 = slot3
		elseif trade:getItemId(4) == 6151 then 
 			a4 = 261 --Axe
			v4 = slot4
 		end

		if trade:getItemId(1) == 6152 then --Death for Dimwits > Great Axe
			a1 = 262 --Great Axe
			v1 = slot1
		elseif trade:getItemId(2) == 6152 then 
 			a2 = 262 --Great Axe
 			v2 = slot2
		elseif trade:getItemId(3) == 6152 then 
			a3 = 262 --Great Axe
			v3 = slot3
		elseif trade:getItemId(4) == 6152 then 
 			a4 = 262 --Great Axe
			v4 = slot4
 		end

		if trade:getItemId(1) == 6153 then --Ludwig's Report > Scythe
			a1 = 263 --Scythe
			v1 = slot1
		elseif trade:getItemId(2) == 6153 then 
 			a2 = 263 --Scythe
 			v2 = slot2
		elseif trade:getItemId(3) == 6153 then 
			a3 = 263 --Scythe
			v3 = slot3
		elseif trade:getItemId(4) == 6153 then 
 			a4 = 263 --Scythe
			v4 = slot4
 		end

		if trade:getItemId(1) == 6154 then --Clash of Titans > Polearm
			a1 = 264 --Polearm
			v1 = slot1
		elseif trade:getItemId(2) == 6154 then 
 			a2 = 264 --Polearm
 			v2 = slot2
		elseif trade:getItemId(3) == 6154 then 
			a3 = 264 --Polearm
			v3 = slot3
		elseif trade:getItemId(4) == 6154 then 
 			a4 = 264 --Polearm
			v4 = slot4
 		end

		if trade:getItemId(1) == 6155 then --Kagetora's Diary > Katana
			a1 = 265 --Katana
			v1 = slot1
		elseif trade:getItemId(2) == 6155 then 
 			a2 = 265 --Katana
 			v2 = slot2
		elseif trade:getItemId(3) == 6155 then 
			a3 = 265 --Katana
			v3 = slot3
		elseif trade:getItemId(4) == 6155 then 
 			a4 = 265 --Katana
			v4 = slot4
 		end

		if trade:getItemId(1) == 6156 then --Noillurie's Log > Great Katana
			a1 = 266 --Great Katana
			v1 = slot1
		elseif trade:getItemId(2) == 6156 then 
 			a2 = 266 --Great Katana
 			v2 = slot2
		elseif trade:getItemId(3) == 6156 then 
			a3 = 266 --Great Katana
			v3 = slot3
		elseif trade:getItemId(4) == 6156 then 
 			a4 = 266 --Great Katana
			v4 = slot4
 		end

		if trade:getItemId(1) == 6157 then --Ferreous's Diary > Club
			a1 = 267 --Club
			v1 = slot1
		elseif trade:getItemId(2) == 6157 then 
 			a2 = 267 --Club
 			v2 = slot2
		elseif trade:getItemId(3) == 6157 then 
			a3 = 267 --Club
			v3 = slot3
		elseif trade:getItemId(4) == 6157 then 
 			a4 = 267 --Club
			v4 = slot4
 		end

		if trade:getItemId(1) == 6158 then --Kayeel-Payeel's Memoirs > Staff
			a1 = 268 --Staff
			v1 = slot1
		elseif trade:getItemId(2) == 6158 then 
 			a2 = 268 --Staff
 			v2 = slot2
		elseif trade:getItemId(3) == 6158 then 
			a3 = 268 --Staff
			v3 = slot3
		elseif trade:getItemId(4) == 6158 then 
 			a4 = 268 --Staff
			v4 = slot4
 		end

		if trade:getItemId(1) == 6159 then --Perih's Primer > Archery
			a1 = 281 --Archery
			v1 = slot1
		elseif trade:getItemId(2) == 6159 then 
 			a2 = 281 --Archery
 			v2 = slot2
		elseif trade:getItemId(3) == 6159 then 
			a3 = 281 --Archery
			v3 = slot3
		elseif trade:getItemId(4) == 6159 then 
 			a4 = 281 --Archery
			v4 = slot4
 		end

		if trade:getItemId(1) == 6160 then --Barrels of Fun > Marksmanship
			a1 = 282 --Marksmanship
			v1 = slot1
		elseif trade:getItemId(2) == 6160 then 
 			a2 = 282 --Marksmanship
 			v2 = slot2
		elseif trade:getItemId(3) == 6160 then 
			a3 = 282 --Marksmanship
			v3 = slot3
		elseif trade:getItemId(4) == 6160 then 
 			a4 = 282 --Marksmanship
			v4 = slot4
 		end

		if trade:getItemId(1) == 6161 then --Throwing Weapon Enchiridion > Throwing
			a1 = 283 --Throwing
			v1 = slot1
		elseif trade:getItemId(2) == 6161 then 
 			a2 = 283 --Throwing
 			v2 = slot2
		elseif trade:getItemId(3) == 6161 then 
			a3 = 283 --Throwing
			v3 = slot3
		elseif trade:getItemId(4) == 6161 then 
 			a4 = 283 --Throwing
			v4 = slot4
 		end

		if trade:getItemId(1) == 6162 then --Mikhe's Note > Guarding
			a1 = 1 --Guarding
			v1 = slot1
		elseif trade:getItemId(2) == 6162 then 
 			a2 = 1 --Guarding
 			v2 = slot2
		elseif trade:getItemId(3) == 6162 then 
			a3 = 1 --Guarding
			v3 = slot3
		elseif trade:getItemId(4) == 6162 then 
 			a4 = 1 --Guarding
			v4 = slot4
 		end

		if trade:getItemId(1) == 6163 then --Sonia's Diary > Evasion
			a1 = 1 --Evasion
			v1 = slot1
		elseif trade:getItemId(2) == 6163 then 
 			a2 = 1 --Evasion
 			v2 = slot2
		elseif trade:getItemId(3) == 6163 then 
			a3 = 1 --Evasion
			v3 = slot3
		elseif trade:getItemId(4) == 6163 then 
 			a4 = 1 --Evasion
			v4 = slot4
 		end

		if trade:getItemId(1) == 6164 then --The Successor > Shield
			a1 = 286 --Shield
			v1 = slot1
		elseif trade:getItemId(2) == 6164 then 
 			a2 = 286 --Shield
 			v2 = slot2
		elseif trade:getItemId(3) == 6164 then 
			a3 = 286 --Shield
			v3 = slot3
		elseif trade:getItemId(4) == 6164 then 
 			a4 = 286 --Shield
			v4 = slot4
 		end

		if trade:getItemId(1) == 6165 then --Kagetora's Journal > Parry
			a1 = 1 --Parry
			v1 = slot1
		elseif trade:getItemId(2) == 6165 then 
 			a2 = 1 --Parry
 			v2 = slot2
		elseif trade:getItemId(3) == 6165 then 
			a3 = 1 --Parry
			v3 = slot3
		elseif trade:getItemId(4) == 6165 then 
 			a4 = 1 --Parry
			v4 = slot4
 		end

		if trade:getItemId(1) == 6166 then --Altana's Hymn > Divine Magic
			a1 = 288 --Divine Magic
			v1 = slot1
		elseif trade:getItemId(2) == 6166 then 
 			a2 = 288 --Divine Magic
 			v2 = slot2
		elseif trade:getItemId(3) == 6166 then 
			a3 = 288 --Divine Magic
			v3 = slot3
		elseif trade:getItemId(4) == 6166 then 
 			a4 = 288 --Divine Magic
			v4 = slot4
 		end

		if trade:getItemId(1) == 6167 then --Coveffe Musings > Healing Magic
			a1 = 289 --Healing Magic
			v1 = slot1
		elseif trade:getItemId(2) == 6167 then 
 			a2 = 289 --Healing Magic
 			v2 = slot2
		elseif trade:getItemId(3) == 6167 then 
			a3 = 289 --Healing Magic
			v3 = slot3
		elseif trade:getItemId(4) == 6167 then 
 			a4 = 289 --Healing Magic
			v4 = slot4
 		end

		if trade:getItemId(1) == 6168 then --Aid for All > Enhancing Magic
			a1 = 290 --Enhancing magic
			v1 = slot1
		elseif trade:getItemId(2) == 6168 then 
 			a2 = 290 --Enhancing magic
 			v2 = slot2
		elseif trade:getItemId(3) == 6168 then 
			a3 = 290 --Enhancing magic
			v3 = slot3
		elseif trade:getItemId(4) == 6168 then 
 			a4 = 290 --Enhancing magic
			v4 = slot4
 		end

		if trade:getItemId(1) == 6169 then --Investigative Report > Enfeebling MAgic
			a1 = 291 --Enfeebling Magic
			v1 = slot1
		elseif trade:getItemId(2) == 6169 then 
 			a2 = 291 --Enfeebling Magic
 			v2 = slot2
		elseif trade:getItemId(3) == 6169 then 
			a3 = 291 --Enfeebling Magic
			v3 = slot3
		elseif trade:getItemId(4) == 6169 then 
 			a4 = 291 --Enfeebling Magic
			v4 = slot4
 		end

		if trade:getItemId(1) == 6170 then --Bounty List > Elemental Magic
			a1 = 292 --Elemental Magic
			v1 = slot1
		elseif trade:getItemId(2) == 6170 then 
 			a2 = 292 --Elemental Magic
 			v2 = slot2
		elseif trade:getItemId(3) == 6170 then 
			a3 = 292 --Elemental Magic
			v3 = slot3
		elseif trade:getItemId(4) == 6170 then 
 			a4 = 292 --Elemental Magic
			v4 = slot4
 		end

		if trade:getItemId(1) == 6171 then --Dark Deeds > Dark Magic
			a1 = 293 --Dark Magic
			v1 = slot1
		elseif trade:getItemId(2) == 6171 then 
 			a2 = 293 --Dark Magic
 			v2 = slot2
		elseif trade:getItemId(3) == 6171 then 
			a3 = 293 --Dark Magic
			v3 = slot3
		elseif trade:getItemId(4) == 6171 then 
 			a4 = 293 --Dark Magic
			v4 = slot4
 		end

		if trade:getItemId(1) == 6172 then --Breezy Libretto > Singing
			a1 = 296 --Singing
			v1 = slot1
		elseif trade:getItemId(2) == 6172 then 
 			a2 = 296 --Singing
 			v2 = slot2
		elseif trade:getItemId(3) == 6172 then 
			a3 = 296 --Singing
			v3 = slot3
		elseif trade:getItemId(4) == 6172 then 
 			a4 = 296 --Singing
			v4 = slot4
 		end

		if trade:getItemId(1) == 6173 then --Cavernous Score > String Instrument
			a1 = 297 --String Instrument
			v1 = slot1
		elseif trade:getItemId(2) == 6173 then 
 			a2 = 297 --String Instrument
 			v2 = slot2
		elseif trade:getItemId(3) == 6173 then 
			a3 = 297 --String Instrument
			v3 = slot3
		elseif trade:getItemId(4) == 6173 then 
 			a4 = 297 --String Instrument
			v4 = slot4
 		end

		if trade:getItemId(1) == 6174 then --Beaming Score > Wind Instrument
			a1 = 298 --Wind Instrument
			v1 = slot1
		elseif trade:getItemId(2) == 6174 then 
 			a2 = 298 --Wind Instrument
 			v2 = slot2
		elseif trade:getItemId(3) == 6174 then 
			a3 = 298 --Wind Instrument
			v3 = slot3
		elseif trade:getItemId(4) == 6174 then 
 			a4 = 298 --Wind Instrument
			v4 = slot4
 		end

		if trade:getItemId(1) == 6175 then --Yomi's Diagram > Ninjutsu
			a1 = 295 --Ninjutsu
			v1 = slot1
		elseif trade:getItemId(2) == 6175 then 
 			a2 = 295 --Ninjutsu
 			v2 = slot2
		elseif trade:getItemId(3) == 6175 then 
			a3 = 295 --Ninjutsu
			v3 = slot3
		elseif trade:getItemId(4) == 6175 then 
 			a4 = 295 --Ninjutsu
			v4 = slot4
 		end

		if trade:getItemId(1) == 6176 then --Astral Homeland > Summoning Magic
			a1 = 294 --Summoning Magic
			v1 = slot1
		elseif trade:getItemId(2) == 6176 then 
 			a2 = 294 --Summoning Magic
 			v2 = slot2
		elseif trade:getItemId(3) == 6176 then 
			a3 = 294 --Summoning Magic
			v3 = slot3
		elseif trade:getItemId(4) == 6176 then 
 			a4 = 294 --Summoning Magic
			v4 = slot4
 		end

		if trade:getItemId(1) == 6177 then --Life-form Study > Blue Magic
			a1 = 299 --Blue Magic
			v1 = slot1
		elseif trade:getItemId(2) == 6177 then 
 			a2 = 299 --Blue Magic
 			v2 = slot2
		elseif trade:getItemId(3) == 6177 then 
			a3 = 299 --Blue Magic
			v3 = slot3
		elseif trade:getItemId(4) == 6177 then 
 			a4 = 299 --Blue Magic
			v4 = slot4
 		end

		if trade:getItemId(1) == 6178 then --Hrohj's Record > Geomancy
			a1 = 300 --Geomancy
			v1 = slot1
		elseif trade:getItemId(2) == 6178 then 
 			a2 = 300 --Geomancy
 			v2 = slot2
		elseif trade:getItemId(3) == 6178 then 
			a3 = 300 --Geomancy
			v3 = slot3
		elseif trade:getItemId(4) == 6178 then 
 			a4 = 300 --Geomancy
			v4 = slot4
 		end

		if trade:getItemId(1) == 6179 then --The Bell Tolls > Handbell
			a1 = 301 --Handbell
			v1 = slot1
		elseif trade:getItemId(2) == 6179 then 
 			a2 = 301 --Handbell
 			v2 = slot2
		elseif trade:getItemId(3) == 6179 then 
			a3 = 301 --Handbell
			v3 = slot3
		elseif trade:getItemId(4) == 6179 then 
 			a4 = 301 --Handbell
			v4 = slot4
 		end
		
   if(player:getFreeSlotsCount() >= 1) then
		player:tradeComplete();
		player:addItem(prize,1,a1,v1,a2,v2,a3,v3,a4,v4);
		player:messageSpecial(ID.text.ITEM_OBTAINED, itemToGet)
    	player:printToPlayer('Augment Time!!', 0, npc:getPacketName())
		player:printToPlayer('Gimme MOAR!', 0, npc:getPacketName())
   else
   end
 
end;

--onTrigger = function(player, npc)
            -- NOTE: We have to use getPacketName, because the regular name is modified and being used
            --     : for internal lookups
--            player:printToPlayer('Greetings, I can augment your gear!', 0, npc:getPacketName())
--			player:printToPlayer('Trade me gear to augment in the first slot, and ingredients in the next 3!', 0, npc:getPacketName())
--        end
