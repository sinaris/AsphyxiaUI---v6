---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["combattext"]["enable"] ~= true ) then return end

if( C["combattext"]["healing"] == true ) then
	S.healfilter = {}
end

if( C["combattext"]["mergeaoespam"] == true ) then
	S.aoespam = {}
end

if( S.myclass == "WARLOCK" ) then
	if( C["combattext"]["mergeaoespam"] == true ) then
		S.aoespam[27243] = true
		S.aoespam[27285] = true
		S.aoespam[87385] = true
		S.aoespam[172] = true
		S.aoespam[87389] = true
		S.aoespam[30108] = true
		S.aoespam[348] = true
		S.aoespam[980] = true
		S.aoespam[80240] = true
		S.aoespam[42223] = true
		S.aoespam[689] = true
		S.aoespam[89420] = true
		S.aoespam[5857] = true
		S.aoespam[129476] = true
		S.aoespam[103103] = true
		S.aoespam[86040] = true
		S.aoespam[124915] = true
		S.aoespam[47960] = true
		S.aoespam[50590] = true
		S.aoespam[30213] = true
		S.aoespam[89753] = true
		S.aoespam[20153] = true
		S.aoespam[103988] = true
		S.aoespam[108371] = true
		S.aoespam[115707] = true
	end
	if( C["combattext"]["healing"] == true ) then
		S.healfilter[63106] = true
		S.healfilter[89653] = true
		S.healfilter[125314] = true
		S.healfilter[108366] = true
		S.healfilter[108359] = true
	end
elseif( S.myclass == "DRUID" ) then
	if( C["combattext"]["mergeaoespam"] == true ) then
		S.aoespam[774] = true
		S.aoespam[48438] = true
		S.aoespam[8936] = true
		S.aoespam[33763] = true
		S.aoespam[44203] = true
		S.aoespam[81269] = true
		S.aoespam[102792] = true
		S.aoespam[8921] = true
		S.aoespam[93402] = true
		S.aoespam[42231] = true
		S.aoespam[106998] = true
		S.aoespam[50288] = true
		S.aoespam[78777] = true
		S.aoespam[61391] = true
		S.aoespam[1822] = true
		S.aoespam[33876] = true
		S.aoespam[33878] = true
		S.aoespam[62078] = true
		S.aoespam[779] = true
		S.aoespam[33745] = true
		S.aoespam[77758] = true
		S.aoespam[1079] = true
	end
elseif( S.myclass == "PALADIN" ) then
	if( C["combattext"]["mergeaoespam"] == true ) then
		S.aoespam[20167] = true
		S.aoespam[53652] = true
		S.aoespam[85222] = true
		S.aoespam[82327] = true
		S.aoespam[121129] = true
		S.aoespam[81297] = true
		S.aoespam[119072] = true
		S.aoespam[53385] = true
		S.aoespam[31803] = true
		S.aoespam[42463] = true
		S.aoespam[101423] = true
		S.aoespam[88263] = true
		S.aoespam[31935] = true
		S.aoespam[96172] = true
	end
elseif( S.myclass == "PRIEST" ) then
	if( C["combattext"]["mergeaoespam"] == true ) then
		S.aoespam[47750] = true
		S.aoespam[23455] = true
		S.aoespam[139] = true
		S.aoespam[596] = true
		S.aoespam[64844] = true
		S.aoespam[32546] = true
		S.aoespam[77489] = true
		S.aoespam[34861] = true
		S.aoespam[33110] = true
		S.aoespam[63544] = true
		S.aoespam[81751] = true
		S.aoespam[94472] = 81751
		S.aoespam[47666] = true
		S.aoespam[132157] = true
		S.aoespam[589] = true
		S.aoespam[34914] = true
		S.aoespam[2944] = true
		S.aoespam[15407] = true
		S.aoespam[49821] = true
		S.aoespam[87532] = true
		S.aoespam[14914] = true
	end
	if( C["combattext"]["healing"] == true ) then
		S.healfilter[127626] = true
		S.healfilter[15290] = true
	end
elseif( S.myclass == "SHAMAN" ) then
	if( C["combattext"]["mergeaoespam"] == true ) then
		S.aoespam[73921] = true
		S.aoespam[52042] = true
		S.aoespam[1064] = true
		S.aoespam[51945] = true
		S.aoespam[61295] = true
		S.aoespam[98021] = true
		S.aoespam[114911] = true
		S.aoespam[118800] = true
		S.aoespam[114942] = true
		S.aoespam[421] = true
		S.aoespam[45297] = true
		S.aoespam[8349] = true
		S.aoespam[77478] = true
		S.aoespam[51490] = true
		S.aoespam[8187] = true
		S.aoespam[8050] = true
		S.aoespam[25504] = true
		S.aoespam[3606] = true
	end
elseif( S.myclass == "MAGE" ) then
	if( C["combattext"]["mergeaoespam"] == true ) then
		S.aoespam[44457] = true
		S.aoespam[44461] = true
		S.aoespam[2120] = true
		S.aoespam[12654] = true
		S.aoespam[11366] = true
		S.aoespam[31661] = true
		S.aoespam[42208] = true
		S.aoespam[122] = true
		S.aoespam[1449] = true
		S.aoespam[83853] = true
		S.aoespam[11113] = true
		S.aoespam[120] = true
		S.aoespam[114923] = true
		S.aoespam[114954] = true
		S.aoespam[7268] = true
		S.aoespam[113092] = true
		S.aoespam[44425] = true
		S.aoespam[84721] = true
	end
elseif( S.myclass == "WARRIOR" ) then
	if( C["combattext"]["mergeaoespam"] == true ) then
		S.aoespam[845] = true
		S.aoespam[46968] = true
		S.aoespam[6343] = true
		S.aoespam[1680] = true
		S.aoespam[115767] = true
		S.aoespam[50622] = true
		S.aoespam[52174] = true
		S.aoespam[118000] = true
		S.aoespam[76858] = true
	end
	if( C["combattext"]["healing"] == true ) then
		S.healfilter[117313] = true
		S.healfilter[55694] = true
	end
elseif( S.myclass == "HUNTER" ) then
	if( C["combattext"]["mergeaoespam"] == true ) then
		S.aoespam[2643] = true
		S.aoespam[83077] = true
		S.aoespam[118253] = true
		S.aoespam[13812] = true
		S.aoespam[53301] = true
		S.aoespam[63468] = true
		S.aoespam[118459] = true
		S.aoespam[120699] = true
		S.aoespam[131900] = true
		S.aoespam[34655] = true
	end
elseif( S.myclass == "MONK" ) then
	if( C["combattext"]["mergeaoespam"] == true ) then
		S.aoespam[115175] = true
		S.aoespam[125953] = 115175
		S.aoespam[126890] = true
		S.aoespam[117640] = true
		S.aoespam[132463] = true
		S.aoespam[124101] = true
		S.aoespam[117952] = true
		S.aoespam[117418] = true
		S.aoespam[120274] = true
		S.aoespam[128531] = true
		S.aoespam[123725] = true
		S.aoespam[107270] = true
		S.aoespam[132467] = true
		S.aoespam[125033] = true
		S.aoespam[123586] = true
	end
elseif( S.myclass == "DEATHKNIGHT" ) then
	if( C["combattext"]["mergeaoespam"] == true ) then
		S.aoespam[55095] = true
		S.aoespam[55078] = true
		S.aoespam[48721] = true
		S.aoespam[49184] = true
		S.aoespam[52212] = true
		S.aoespam[55050] = true
		S.aoespam[119980] = true
		S.aoespam[49020] = true
		S.aoespam[66198] = 49020
		S.aoespam[49998] = true
		S.aoespam[66188] = 49998
		S.aoespam[45462] = true
		S.aoespam[66216] = 45462
		S.aoespam[49143] = true
		S.aoespam[66196] = 49143
	end
elseif( S.myclass == "ROGUE" ) then
	if( C["combattext"]["mergeaoespam"] == true ) then
		S.aoespam[51723] = true
		S.aoespam[121411] = true
		S.aoespam[122233] = true
		S.aoespam[2818] = true
		S.aoespam[8680] = true
		S.aoespam[5374] = true
		S.aoespam[27576] = 5374
	end
end