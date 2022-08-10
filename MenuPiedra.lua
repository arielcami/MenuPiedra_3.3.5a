--[[ 
        Ariel Camilo // ariel.cami@gmail.com // 10 de Agosto 2022

    No puedes viajar a ciudades enemigas, y tampoco a zonas que no te corresponden con tu nivel.
    Ej, viajas a Rasganorte siendo nivel 10.

    No se puede usar en combate.

    Los buffos son personales y van variando de acuerdo al nivel.
    Si te bufeas con Bendición de poderío al nivel 40, recibes el buff de ese nivel. Ni más bajo ni más alto. Una maravilla de script.
    
    La comida que se obtiene al solicitar comida y bebida, son las comidas mágicas del Mago, 
    y también van mejorando con el nivel del solicitante.

    Si no usas maná, no te da agua, por ej, si eres Pícaro o Guerrero, no tiene sentido darte agua para beber.

    En el caso de que seas Paladín, si te buffeas usando el Script con Poderío, Reyes, Salvaguardia o Sabiduría,
    este buff contará como propio, y no podrás acumularlo con otra bendición de tu libro de hechizos.

    La Alianza tiene un Menú diferente a la Horda, si deseas agregar más destinos, no olvides agregarlos también a la tabla de la Horda.
]]

local ic = {
    '|TInterface\\Icons\\Ability_Paladin_BeaconofLight.blp:35:35:-17|t',            -- 1 Buffs
    '|TInterface\\Icons\\Spell_Shadow_Teleport.blp:35:35:-17|t',                    -- 2 Teleportes
    '|TInterface\\Icons\\Ability_Mage_ConjureFoodRank10.blp:35:35:-17|t',           -- 3 Comida y bebida
    '|TInterface\\Icons\\Spell_Nature_FarSight.blp:45:45:-17|t',                    -- 4 Azeroth
    '|TInterface\\LFGFrame\\LFGICON-BLACKTEMPLE.BLP:45:45:-17|t',                 -- 5 Terrallende
    '|TInterface\\ICONS\\Achievement_Boss_LichKing.blp:45:45:-17|t',                 -- 6 Rasganorte
    '|TInterface\\Icons\\Spell_Arcane_TeleportStormWind.blp:30:30:-17|t',           -- 7 Ventormenta
    '|TInterface\\Icons\\Spell_Arcane_TeleportExodar.blp:30:30:-17|t',              -- 8 El Exodar
    '|TInterface\\Icons\\Spell_Arcane_TeleportDarnassus.blp:30:30:-17|t',           -- 9 Darnassus
    '|TInterface\\Icons\\Spell_Arcane_TeleportIronForge.blp:30:30:-17|t',           -- 10 Forjaz
    '|TInterface\\Icons\\Spell_Arcane_TeleportOrgrimmar.blp:30:30:-17|t',           -- 11 Orgrimmar
    '|TInterface\\Icons\\Spell_Arcane_TeleportThunderBluff.blp:30:30:-17|t',        -- 12 Cima del Trueno
    '|TInterface\\Icons\\Spell_Arcane_TeleportUnderCity.blp:30:30:-17|t',           -- 13 Entrañas
    '|TInterface\\Icons\\Spell_Arcane_TeleportSilvermoon.blp:30:30:-17|t',          -- 14 Ciudad de Lunargenta
    '|TInterface\\Icons\\INV_Gizmo_02.blp:30:30:-17|t',                             -- 15 Gadgetzan
    '|TInterface\\Icons\\Ability_Spy.blp:30:30:-17|t',                              -- 16 Bahía del botín
    '|TInterface\\Icons\\SPELL_ARCANE_TELEPORTMOONGLADE.BLP:30:30:-17|t',           -- 17 Claro de luna
    '|TInterface\\Icons\\Spell_Holy_WordFortitude.blp:30:30:-17|t',                 -- 18 Palabra de poder: entereza
    '|TInterface\\Icons\\Spell_Holy_DivineSpirit.blp:30:30:-17|t',                  -- 19 Espíritu divino
    '|TInterface\\Icons\\Spell_Nature_Regeneration.blp:30:30:-17|t',                -- 20 Marca de lo salvaje
    '|TInterface\\Icons\\Spell_Holy_MagicalSentry.blp:30:30:-17|t',                 -- 21 Intelecto Arcano
    '|TInterface\\Icons\\Spell_Magic_GreaterBlessingofKings.blp:30:30:-17|t',       -- 22 Bendición de Reyes superior
    '|TInterface\\Icons\\Spell_Holy_GreaterBlessingofKings.blp:30:30:-17|t',        -- 23 Bendición de Poderío superior
    '|TInterface\\Icons\\Spell_Holy_GreaterBlessingofWisdom.blp:30:30:-17|t',       -- 24 Bendición de Sabiduría superior
    '|TInterface\\Icons\\Spell_Holy_GreaterBlessingofSanctuary.blp:30:30:-17|t',    -- 25 Bendición de Salvaguardia superior
}
local ii,ix,via = '|TInterface\\Icons\\Spell_Shadow_Teleport.blp:20:20:-17|t','|TInterface\\Icons\\Spell_Shadow_Teleport.blp:15:15:-17|t',"Para viajar a "
local lev,vil = " debes ser al menos de nivel ","Para viajar al "
local Menu_A = {
    [0] = {
        {8, ic[1].."Buffs", 1, 0},
        {8, ic[2].."Teletransportarse", 2, 0},
        {8, ic[3].."Solicitar comida y bebida", 9, 1},
    },
    --------Pedir Buffs--------------------------------------------------------------
    [1] = {
        {8, ic[18].."Palabra de poder: entereza", 100, 1},          
        {8, ic[19].."Espíritu divino", 101, 2},                     
        {8, ic[20].."Marca de lo salvaje", 102, 3},                 
        {8, ic[21].."Intelecto arcano", 103, 4},                    
        {8, ic[22].."Bendición de Reyes", 104, 5},         
        {8, ic[23].."Bendición de Poderío", 105, 6},       
        {8, ic[24].."Bendición de Sabiduría", 106, 7},     
        {8, ic[25].."Bendición de Salvaguardia", 107, 8},  
        {0,"...Atrás", 0, 0},},

    ----------Teletrasportarse-------------------------------------------------------
    [2] = {
        {8, ic[4].."Azeroth", 3, 0},
        {8, ic[5].."Terrallende", 4, 0},
        {8, ic[6].."Rasganorte", 5, 0},
        {7, "Mazmorras", 20, 0},
        {7, "Bandas", 30, 0},
        {0,"...Atrás", 0, 0},},
    ------------Mazmorras------------------------------------------------------------
    [20] = {
        {7, "Clásicas", 400, 0},
        {7, "The Burning Crusade", 401, 0},
        {7, "Wrath of the Lich King", 402, 0},
        {0,"...Atrás", 2, 0},},

    [30] = {
        {7, "Clásicas", 403, 0},
        {7, "The Burning Crusade", 404, 0},
        {7, "Wrath of the Lich King", 405, 0},
        {0,"...Atrás", 2, 0},},

    [405] = {
        {8, ix.."El Ojo de la Eternidad", 505, 1},
        {8, ix.."Tier 7: Naxxramas", 505, 2},
        {8, ix.."Tier 7: El Sagrario Obsidiana", 505, 3},
        {8, ix.."Tier 8: Ulduar", 505, 4},
        {8, ix.."Tier 9: Prueba del Cruzado", 505, 5},
        {8, ix.."Tier 9/10: La Cámara de Archavon", 505, 6},
        {8, ix.."Tier 10: Ciudadela de la Corona de Hielo", 505, 7},
        {8, ix.."El Sagrario Rubí", 505, 8},
        {0,"...Atrás", 30, 0},},

    [505] = {
        {571, 3862.236328, 6988.39502, 152.041, 5.812057},          -- 1- El Ojo de la Eternidad
        {571, 3661.906494, -1270.057617, 243.885742, 0.096168},     -- 2- Naxxramas
        {571, 3448.450439, 261.582184, -110.164024, 3.235456},      -- 3- El Sagrario Obsidiana
        {571, 9337.295898, -1114.767334, 1245.146851, 6.282593},    -- 4- Ulduar
        {571, 8515.162109, 731.646057, 558.248108, 1.565064},       -- 5- Prueba del Cruzado
        {571, 5474.043945, 2840.551514, 418.675629, 6.279259},      -- 6- La Cámara de Archavon
        {571, 5790.092285, 2071.157959, 636.064392, 3.566044},      -- 7- Ciudadela de la Corona de Hielo
        {571, 3599.480713, 198.515198, -113.758232, 5.336594},},    -- 8- El Sagrario Rubí         
    
    [404] = {
        {8, ix.."Zul'Aman", 504, 1},
        {8, ix.."Tier 4: Karazhan", 504, 2},
        {8, ix.."Tier 4: Guarida de Gruul", 504, 3},
        {8, ix.."Tier 4: Guarida de Magtheridon", 504, 4},
        {8, ix.."Tier 5: Caverna Santuario Serpiente", 504, 5},
        {8, ix.."Tier 5: El Castillo de la Tempestad", 504, 6},
        {8, ix.."Tier 6: La Cima Hyjal", 504, 7},
        {8, ix.."Tier 6: El Templo Oscuro", 504, 8},
        {8, ix.."Tier 6: Meseta de La Fuente del Sol", 504, 9},        
        {0,"...Atrás", 30, 0},},

    [504] = {
        {530, 6851.42627, -7992.63623, 191.598633, 4.697959},         -- 1- Zul'Aman
        {0, -11122.070312, -2013.668823, 47.087719, 0.767705},        -- 2- Karazhan
        {530, 3543.207520, 5090.147949, 3.410233, 5.742854},          -- 3- Guarida de Gruul
        {530, -316.478241, 3092.51416, -116.430534, 5.269278},        -- 4- Guarida de Magtheridon
        {530, 793.940735, 6865.628906, -64.655159, 0},                -- 5- Caverna Santuario Serpiente
        {530, 3088.531982, 1388.140381, 185.089264, 4.628061},        -- 6- El Castillo de la Tempestad
        {1, -8175.373047, -4177.965332, -166.555313, 1.003659},       -- 7- La Cima Hyjal
        {530, -3645.186523, 316.402466, 35.146271, 2.958558},         -- 8- El Templo Oscuro
        {530, 12560.412109, -6774.756836, 15.06293, 3.13788},},       -- 9- Meseta de La Fuente del Sol   

    [403] = {
        {8, ix.."Zul'Gurub", 503, 1},
        {8, ix.."Ruinas de Ahn'Qiraj (20 Man)", 503, 2},
        {8, ix.."Ahn'Qiraj (40 Man)", 503, 3},
        {8, ix.."Tier 1: Núcleo de Magma", 503, 4},
        {8, ix.."Tier 2: Guarida de Alanegra", 503, 5},        
        {0,"...Atrás", 30, 0},},

    [503] = {
        {0, -11916.269531, -1213.478638, 92.287277, 4.722716},      -- Zul'Gurub
        {1, -8412.428711, 1500.856445, 29.160902, 2.636490},        -- Ruinas de Ahn'Qiraj (20 Man)
        {1, -8237.888672, 1993.095337, 129.072006, 0.957310},       -- Ahn'Qiraj 40-Man (40 Man)
        {230, 1118.786133, -457.697784, -102.475357, 3.547354},     -- Núcleo de Magma
        {229, 169.053238, -474.726532, 116.839996, 0.002223},},     -- Guarida de Alanegra   

    [402] = {        
        {8,ix.."68. Fortaleza de Utgarde", 502, 1},
        {8,ix.."69. El Nexo", 502, 2},
        {8,ix.."70. Azjol-Nerub", 502, 3},
        {8,ix.."71. Ahn'kahet: El Antiguo Reino", 502, 4},
        {8,ix.."72. Fortaleza de Drak'Tharon", 502, 5},
        {8,ix.."74. El Bastión Violeta", 502, 6},
        {8,ix.."74. Gundrak", 502, 7},
        {8,ix.."75. Cámaras de Piedra", 502, 8},
        {8,ix.."77. Cámaras de Relámpagos", 502, 9},
        {8,ix.."77. El Oculus", 502, 10},
        {8,ix.."78. La Matanza de Stratholme", 502, 11},
        {8,ix.."78. Pináculo de Utgarde", 502, 12},
        {8,ix.."78. La Forja de Almas", 502, 13},
        {8,ix.."79. Foso de Saron", 502, 14},
        {8,ix.."79. Cámaras de Reflexión", 502, 15},
        {8,ix.."79. Prueba del Campeón", 502, 16},
        {0,"...Atrás", 20, 0},},

    [502] = {
        {571, 1226.941772, -4862.43457, 41.249203, 0.279299},        -- 1 Fortaleza de Utgarde - 65
        {571, 3891.410156, 6985.147949, 69.488228, 0.051485},        -- 2 El Nexo - 66
        {571, 3677.109863, 2166.946533, 35.818439, 2.34244},         -- 3 Azjol Nerub - 70
        {571, 3643.209961, 2036.400146, 1.787595, 4.323483},         -- 4 Ahn'kahet: El Antiguo Reino - 71
        {571, 4774.38916, -2030.158081, 229.379471, 1.556607},       -- 5 Fortaleza de Drak'Tharon - 72
        {571, 5680.279297, 486.713196, 652.400269, 4.009941},        -- 6 El Bastión Violeta - 74
        {571, 6708.150879, -4654.854492, 445.224213, 3.915368},      -- 7 Gundrak - 74
        {571, 8921.771484, -988.377136, 1039.367065, 1.5824},        -- 8 Cámaras de Piedra - 75
        {571, 9182.655273, -1384.757324, 1110.216064, 5.546371},     -- 9 Cámaras de Relámpagos - 77
        {571, 3879.161865, 6984.595703, 106.311996, 3.173132},       -- 10 El Oculus - 77
        {1, -8756.251953, -4453.818359, -200.144745, 4.612549},      -- 11 La Matanza de Stratholme - 78
        {571, 1243.812256, -4857.187012, 217.417511, 3.418464},      -- 12 Pináculo de Utgarde - 78
        {571, 5666.226074, 2009.228027, 798.041016, 5.412203},       -- 13 La Forja de Almas - 78
        {571, 5598.151367, 2015.506592, 798.041748, 3.822912},       -- 14 Foso de Saron - 79
        {571, 5628.901367, 1975.456177, 803.020874, 4.601211},       -- 15 Cámaras de Reflexión - 79
        {571, 8575.023438, 792.300903, 558.514709, 3.125964},},      -- 16 Prueba del Campeón - 79        

    [400] = {        
        {8,ix.."15. Las Cuevas de los Lamentos", 500, 1},
        {8,ix.."18. Las Minas de la Muerte", 500, 2},
        {8,ix.."22. Castillo de Colmillo Oscuro", 500, 3},
        {8,ix.."22. Las Mazmorras de Ventormenta", 500, 4},
        {8,ix.."24. Cavernas de Brazanegra", 500, 5},
        {8,ix.."29. Gnomeregan", 500, 6},
        {8,ix.."30. Horado Rajaciento", 500, 7},
        {8,ix.."26-35. Monasterio Escarlata", 500, 8}, 
        {8,ix.."40. Zahúrda Rajaciento", 500, 9},
        {8,ix.."42. Uldaman", 500, 10},
        {8,ix.."44. Zul'Farrak", 500, 11},
        {8,ix.."46-48. Maraudon", 500, 12},
        {8,ix.."50. El Templo de Atal'Hakkar", 500, 13},
        {8,ix.."52. Profundidades de Roca Negra", 500, 14},
        {8,ix.."55-58. Cumbre de Roca Negra", 500, 15},
        {8,ix.."58. Scholomance", 500, 16},
        {8,ix.."58. Stratholme", 500, 17},
        {8,ix.."58. La Masacre", 500, 18},
        {0,"...Atrás", 20, 0},},

    [500] = {        
        {1, -732.9263, -1719.145, 17.0474, 2.7734},     --1 Las Cuevas de los Lamentos
        {36, -12.8273, -382.9282, 61.7997, 4.6076},     --2 Las Minas de la Muerte
        {0, -234.8294, 1561.6988, 76.8923, 1.1964},     --3 Castillo de Colmillo Oscuro
        {0, -8771.42, 840.8729, 90.6448, 0.6613},       --4 Las Mazmorras de Ventormenta
        {1, 4247.5478, 742.5911, -25.0591, 1.4309},     --5 Cavernas de Brazanegra
        {0, -5163.208, 925.1033, 257.1794, 1.5467},     --6 Gnomeregan 29
        {1, -4463.1386, -1664.3995, 82.2596, 0.8572},   --7 Horado Rajaciento - 30
        {0, 2845.3569, -697.6431, 139.3309, 5.0926},    --8 Monasterio Escarlata - 26/35
        {1, -4658.6367, -2526.319, 81.4823, 4.1396},    --9 Zahúrda Rajaciento - 40
        {0, -6068.6269, -2955.2868, 209.7744, 0.04712}, --10 Uldaman 42
        {1, -6797.7915, -2890.8813, 8.8807, 6.2768},    --11 Zul'Farrak 44 
        {1, -1185.0281, 2880.1237, 85.9017, 4.8536},    --12 Maraudon
        {0, -10183.958, -3993.06, -109.1948, 6.063},    --13 El Templo de Atal'Hakkar - 50
        {0, -7180.2675, -920.1867, 165.5279, 4.9664},   --14 Profundidades de Roca Negra - 52
        {0, -7525.7128, -1227.5332, 285.7322, 5.2606},  --15 Cumbre de Roca Negra - 55/58
        {0, 1267.695, -2556.9502, 94.1269, 0.4831},     --16 Scholomance - 58
        {0, 3392.9897, -3354.2304, 142.2502, 4.722},    --17 Stratholme - 58
        {1, -3981.2221, 781.7203, 161.0041, 4.7084},},  --18 La Masacre - 58

    [401] = {
        {8,ix.."60. Murallas del Fuego Infernal", 501, 1},    
        {8,ix.."61. El Horno de Sangre", 501, 2},
        {8,ix.."62. Recinto de los Esclavos", 501, 3},
        {8,ix.."63. La Sotiénaga", 501, 4},        
        {8,ix.."64. Tumbas de Maná", 501, 5},
        {8,ix.."65. Criptas Auchenai", 501, 6},
        {8,ix.."66. Antiguas Laderas de Trabalomas", 501, 7},
        {8,ix.."67. Salas Sethekk", 501, 8}, 
        {8,ix.."68. La Cámara de Vapor", 501, 9},
        {8,ix.."69. El Laberinto de las Sombras", 501, 10},
        {8,ix.."69. Las Salas Arrasadas", 501, 11},
        {8,ix.."70. La Ciénaga Negra", 501, 12},
        {8,ix.."70. El Invernáculo", 501, 13},
        {8,ix.."70. El Mechanar", 501, 14},
        {8,ix.."70. El Arcatraz", 501, 15},
        {8,ix.."70. Bancal del Magister", 501, 16},
        {0,"...Atrás", 20, 0},},

    [501] = { 
        {530, -361.548035, 3073.503174, -15.080264, 1.889927},   -- 1 Murallas del Fuego Infernal - 60
        {530, -299.520111, 3158.717285, 31.671602, 2.173269},    -- 2 El Horno de Sangre - 61
        {530, 727.9693, 7012.945312, -71.612144, 0.247424},      -- 3 Recinto de los Esclavos - 62
        {530, 781.808899, 6754.566406, -72.537735, 4.713941},    -- 4 La Sotiénaga - 63     
        {530, -3083.557617, 4943.227539, -101.047203, 6.280574}, -- 5 Tumbas de Maná - 64
        {530, -3361.888672, 5218.911621, -101.048576, 1.551475}, -- 6 Criptas Auchenai - 65
        {1, -8342.879883, -4060.647461, -207.963837, 0.631444},  -- 7 Antiguas Laderas de Trabalomas - 66
        {530, -3361.955322, 4665.541504, -101.048347, 4.742997}, -- 8 Salas Sethekk - 67
        {530, 818.348267, 6937.358887, -80.568016, 1.61006},     -- 9 La Cámara de Vapor - 68
        {530, -3548.392334, 4943.180664, -101.395599, 3.147267}, -- 10 El Laberinto de las Sombras - 69
        {530, -308.585907, 3073.683594, -3.64883, 1.806413},     -- 11 Las Salas Arrasadas - 69
        {1, -8761.708, -4184.260742, -209.497147, 2.023536},     -- 12 La Ciénaga Negra - 70
        {530, 3405.032715, 1489.535156, 182.837845, 5.629376},   -- 13 El Invernáculo - 70
        {530, 2871.153076, 1553.972534, 252.159058, 3.867718},   -- 14 El Mechanar - 70
        {530, 3308.134277, 1341.579224, 505.559998, 5.084305},   -- 15 El Arcatraz - 70
        {530, 12886.279297, -7333.544922, 65.488266, 4.249288},},-- 16 Bancal del Magister - 70   

    --------Azeroth------------------------------------------------------------------
    [3] = {
    	{8, ic[7].."Ventormenta", 6, 1},
        {8, ic[8].."El Exodar", 6, 2},
        {8, ic[9].."Darnassus", 6, 3},
        {8, ic[10].."Forjaz", 6, 4},
        {8, ic[15].."Gadgetzan - Tanaris", 6, 5},
        {8, ic[16].."Bahía del Botín - Vega de Tuercespina", 6, 6},
        {8, ic[17].."Claro de la Luna", 6, 7},
        {0, "...Atrás", 2, 0},},
	----Terrallende------------------------------------------------------------------
    [4] = {
    	{8, ii.."Portal Oscuro, Las Tierras Devastadas", 7, 1},
    	{8, ii.."Ciudad de Shattrath", 7, 2},
    	{8, ii.."Península de Fuego Infernal", 7, 3},
        {8, ii.."Marisma de Zangar", 7, 4},
        {8, ii.."Bosque de Terokkar", 7, 5},
        {8, ii.."Montañas Filospada", 7, 6},
        {8, ii.."Nagrand", 7, 7},
        {8, ii.."Tormenta Abisal, Flecha de la Tormenta", 7, 8},
        {8, ii.."Tormenta Abisal, Área 52", 7, 9}, 
        {8, ii.."Valle Sombraluna", 7, 10},
        {0, "...Atrás", 2, 0},},
    --------Rasganorte---------------------------------------------------------------
    [5] = {
    	{4, ii.."Ciudad de Dalaran", 8, 1},
        {4, ii.."Tundra Boreal", 8, 2},
        {4, ii.."Fiordo Aquilonal", 8, 3},
        {4, ii.."Colinas Pardas", 8, 4},
        {4, ii.."Cementerio de Dragones", 8, 5}, 
        {4, ii.."Bosque Canto de Cristal", 8, 6},
        {4, ii.."Zul'Drak", 8, 7},
        {4, ii.."Cuenca de Sholazar", 8, 8},
        {4, ii.."Cumbres Tormentosas", 8, 9},
        {4, ii.."Corona de Hielo", 8, 10},
        {0, "...Atrás", 2, 0},}, 
    --------Azeroth------------------------------------------------------------------
    [6] = {
    	{0,-8833.38,628.628,94,1.06},                    -- Ventormenta
        {530,-3967.7,-11653.6,-138.844,0.852},           -- El Exodar
        {1, 9950.302, 2347.186, 1330.758, 1.562},        -- Darnassus
        {0, -4937.502, -935.658, 503.151, 5.401},        -- Forjaz
        {1, -7222.7397, -3736.8894, 8.3836, 0.9018},     -- Gadgetzan
        {0, -14475.6376, 462.5531, 36.3775, 0.898},      -- Bahía del Botín
        {1, 7875.3525, -2565.9921, 486.9467, 6.2592},},  -- Claro de la Luna    
    --------Terrallende--------------------------------------------------------------
    [7] = {
    	{0, -11810.5224, -3195.4274, -30.7736, 3.3383},  -- Portal Oscuro
        {530, -1868.3526, 5439.7558, -10.4633, 5.13},	 -- Ciudad de Shattrath
        {530, -666.9664, 2713.7558, 94.2486, 3.442},     -- Bastión del Honor
        {530, 208.3183, 6065.6098, 148.3188, 6.0117},    -- Telredor 
        {530, -2994.1147, 3872.2087, 9.5007, 0.7809},    -- Bastión Allerian
        {530, 2187.2998, 6792.2219, 183.2901, 2.7105},   -- Sylvanaar
        {530, -2722.6108, 7304.0097, 88.6018, 2.6908},   -- Telaar
        {530, 4160.7592, 2958.5676, 352.1988, 2.8302},   -- Flecha de la Tormenta
        {530, 3085.2336, 3598.4738, 144.0105, 4.0848},   -- Área 52
        {530, -3984.8073, 2153.5505, 104.4943, 1.7364},},-- Bastión Martillo Salvaje 

    ----------Rasganorte-------------------------------------------------------------
    [8] = {
    	{571,5804.79, 624.37, 647.78, 1.636},            -- Ciudad de Dalaran
        {571, 2272.3935, 5174.6562 ,11.128, 2.767},      -- Fortaleza Denuedo
        {571, 566.8421, -5010.5874, 11.5657, 2.82},      -- Valgarde
        {571, 4584.27, -4253.8657, 182.209, 1.2803},     -- Campamento de la Brigada
        {571, 3712.3371, -697.2811, 215.2738, 3.9024},   -- Fortaleza de Hibergarde
        {571, 5035.1401, -522.1364, 225.6336, 1.6129},   -- Mirador Brisaveloz
        {571, 5520.187, -2673.2902, 303.9527, 0.3268},   -- Confín Argenta
        {571, 5591.5327, 5831.0336, -67.9011, 3.1988},   -- Campamento de Nesingwary
        {571, 6188.939, -1054.0264, 409.91, 2.544},      -- K3
        {571, 6164.8413, -61.4718, 388.1809, 2.1418},},  -- Vanguardia Argenta   
    }

local Menu_H = {
    [0] = {
        {8, ic[1].."Buffs", 1, 0},
        {8, ic[2].."Teleportarse", 2, 0},
        {8, ic[3].."Comida y bebida", 9, 1},
    },
    --------Pedir Buffs--------------------------------------------------------------
    [1] = {
        {8, ic[18].."Palabra de poder: entereza", 100, 1},          
        {8, ic[19].."Espíritu divino", 101, 2},                     
        {8, ic[20].."Marca de lo salvaje", 102, 3},                 
        {8, ic[21].."Intelecto arcano", 103, 4},                    
        {8, ic[22].."Bendición de Reyes", 104, 5},         
        {8, ic[23].."Bendición de Poderío", 105, 6},       
        {8, ic[24].."Bendición de Sabiduría", 106, 7},     
        {8, ic[25].."Bendición de Salvaguardia", 107, 8},  
        {0,"...Atrás", 0, 0},},

    ----------Teletrasportarse-------------------------------------------------------
    [2] = {
        {8, ic[4].."Azeroth", 3, 0},
        {8, ic[5].."Terrallende", 4, 0},
        {8, ic[6].."Rasganorte", 5, 0},
        {7, "Mazmorras", 20, 0},
        {7, "Bandas", 30, 0},
        {0,"...Atrás", 0, 0},},
    --------Mazmorras----------------------------------------------------------------
    [20] = {
        {7, "Clásicas", 400, 0},
        {7, "The Burning Crusade", 401, 0},
        {7, "Wrath of the Lich King", 402, 0},
        {0,"...Atrás", 2, 0},},

    [30] = {
        {7, "Clásicas", 403, 0},
        {7, "The Burning Crusade", 404, 0},
        {7, "Wrath of the Lich King", 405, 0},
        {0,"...Atrás", 2, 0},},

    [405] = {
        {8,ix.."El Ojo de la Eternidad", 505, 1},
        {8, ix.."Tier 7: Naxxramas", 505, 2},
        {8, ix.."Tier 7: El Sagrario Obsidiana", 505, 3},
        {8, ix.."Tier 8: Ulduar", 505, 4},
        {8, ix.."Tier 9: Prueba del Cruzado", 505, 5},
        {8, ix.."Tier 9/10: La Cámara de Archavon", 505, 6},
        {8, ix.."Tier 10: Ciudadela de la Corona de Hielo", 505, 7},
        {8, ix.."El Sagrario Rubí", 505, 8},
        {0,"...Atrás", 30, 0},},

    [505] = {
        {571, 3862.236328, 6988.39502, 152.041, 5.812057},          -- 1- El Ojo de la Eternidad
        {571, 3661.906494, -1270.057617, 243.885742, 0.096168},     -- 2- Naxxramas
        {571, 3448.450439, 261.582184, -110.164024, 3.235456},      -- 3- El Sagrario Obsidiana
        {571, 9337.295898, -1114.767334, 1245.146851, 6.282593},    -- 4- Ulduar
        {571, 8515.162109, 731.646057, 558.248108, 1.565064},       -- 5- Prueba del Cruzado
        {571, 5474.043945, 2840.551514, 418.675629, 6.279259},      -- 6- La Cámara de Archavon
        {571, 5790.092285, 2071.157959, 636.064392, 3.566044},      -- 7- Ciudadela de la Corona de Hielo
        {571, 3599.480713, 198.515198, -113.758232, 5.336594},},    -- 8- El Sagrario Rubí         
    
    [404] = {
        {8, ix.."Zul'Aman", 504, 1},
        {8, ix.."Tier 4: Karazhan", 504, 2},
        {8, ix.."Tier 4: Guarida de Gruul", 504, 3},
        {8, ix.."Tier 4: Guarida de Magtheridon", 504, 4},
        {8, ix.."Tier 5: Caverna Santuario Serpiente", 504, 5},
        {8, ix.."Tier 5: El Castillo de la Tempestad", 504, 6},
        {8, ix.."Tier 6: La Cima Hyjal", 504, 7},
        {8, ix.."Tier 6: El Templo Oscuro", 504, 8},
        {8, ix.."Tier 6: Meseta de La Fuente del Sol", 504, 9},        
        {0,"...Atrás", 30, 0},},

    [504] = {
        {530, 6851.42627, -7992.63623, 191.598633, 4.697959},         -- 1- Zul'Aman
        {0, -11122.070312, -2013.668823, 47.087719, 0.767705},        -- 2- Karazhan
        {530, 3543.207520, 5090.147949, 3.410233, 5.742854},          -- 3- Guarida de Gruul
        {530, -316.478241, 3092.51416, -116.430534, 5.269278},        -- 4- Guarida de Magtheridon
        {530, 793.940735, 6865.628906, -64.655159, 0},                -- 5- Caverna Santuario Serpiente
        {530, 3088.531982, 1388.140381, 185.089264, 4.628061},        -- 6- El Castillo de la Tempestad
        {1, -8175.373047, -4177.965332, -166.555313, 1.003659},       -- 7- La Cima Hyjal
        {530, -3645.186523, 316.402466, 35.146271, 2.958558},         -- 8- El Templo Oscuro
        {530, 12560.412109, -6774.756836, 15.06293, 3.13788},},       -- 9- Meseta de La Fuente del Sol

    [403] = {
        {8, ix.."Zul'Gurub", 503, 1},
        {8, ix.."Ruinas de Ahn'Qiraj (20 Man)", 503, 2},
        {8, ix.."Ahn'Qiraj (40 Man)", 503, 3},
        {8, ix.."Tier 1: Núcleo de Magma", 503, 4},
        {8, ix.."Tier 2: Guarida de Alanegra", 503, 5},        
        {0,"...Atrás", 30, 0}, 
    },

    [503] = {
        {0, -11916.269531, -1213.478638, 92.287277, 4.722716},      -- Zul'Gurub
        {1, -8412.428711, 1500.856445, 29.160902, 2.636490},        -- Ruinas de Ahn'Qiraj (20 Man)
        {1, -8237.888672, 1993.095337, 129.072006, 0.957310},       -- Ahn'Qiraj 40-Man (40 Man)
        {230, 1118.786133, -457.697784, -102.475357, 3.547354},     -- Núcleo de Magma
        {229, 169.053238, -474.726532, 116.839996, 0.002223},       -- Guarida de Alanegra        
    },

    [402] = {        
        {8,ix.."68. Fortaleza de Utgarde", 502, 1},
        {8,ix.."69. El Nexo", 502, 2},
        {8,ix.."70. Azjol-Nerub", 502, 3},
        {8,ix.."71. Ahn'kahet: El Antiguo Reino", 502, 4},
        {8,ix.."72. Fortaleza de Drak'Tharon", 502, 5},
        {8,ix.."74. El Bastión Violeta", 502, 6},
        {8,ix.."74. Gundrak", 502, 7},
        {8,ix.."75. Cámaras de Piedra", 502, 8},
        {8,ix.."77. Cámaras de Relámpagos", 502, 9},
        {8,ix.."77. El Oculus", 502, 10},
        {8,ix.."78. La Matanza de Stratholme", 502, 11},
        {8,ix.."78. Pináculo de Utgarde", 502, 12},
        {8,ix.."78. La Forja de Almas", 502, 13},
        {8,ix.."79. Foso de Saron", 502, 14},
        {8,ix.."79. Cámaras de Reflexión", 502, 15},
        {8,ix.."79. Prueba del Campeón", 502, 16},
        {0,"...Atrás", 20, 0},        
    },

    [502] = {
        {571, 1226.941772, -4862.43457, 41.249203, 0.279299},        -- 1 Fortaleza de Utgarde - 65
        {571, 3891.410156, 6985.147949, 69.488228, 0.051485},        -- 2 El Nexo - 66
        {571, 3677.109863, 2166.946533, 35.818439, 2.34244},         -- 3 Azjol Nerub - 70
        {571, 3643.209961, 2036.400146, 1.787595, 4.323483},         -- 4 Ahn'kahet: El Antiguo Reino - 71
        {571, 4774.38916, -2030.158081, 229.379471, 1.556607},       -- 5 Fortaleza de Drak'Tharon - 72
        {571, 5680.279297, 486.713196, 652.400269, 4.009941},        -- 6 El Bastión Violeta - 74
        {571, 6708.150879, -4654.854492, 445.224213, 3.915368},      -- 7 Gundrak - 74
        {571, 8921.771484, -988.377136, 1039.367065, 1.5824},        -- 8 Cámaras de Piedra - 75
        {571, 9182.655273, -1384.757324, 1110.216064, 5.546371},     -- 9 Cámaras de Relámpagos - 77
        {571, 3879.161865, 6984.595703, 106.311996, 3.173132},       -- 10 El Oculus - 77
        {1, -8756.251953, -4453.818359, -200.144745, 4.612549},      -- 11 La Matanza de Stratholme - 78
        {571, 1243.812256, -4857.187012, 217.417511, 3.418464},      -- 12 Pináculo de Utgarde - 78
        {571, 5666.226074, 2009.228027, 798.041016, 5.412203},       -- 13 La Forja de Almas - 78
        {571, 5598.151367, 2015.506592, 798.041748, 3.822912},       -- 14 Foso de Saron - 79
        {571, 5628.901367, 1975.456177, 803.020874, 4.601211},       -- 15 Cámaras de Reflexión - 79
        {571, 8575.023438, 792.300903, 558.514709, 3.125964},        -- 16 Prueba del Campeón - 79
    },

    [400] = {
        {8,ix.."10. Cima Ígnea", 500, 1},    
        {8,ix.."15. Las Cuevas de los Lamentos", 500, 2},
        {8,ix.."18. Las Minas de la Muerte", 500, 3},
        {8,ix.."22. Castillo de Colmillo Oscuro", 500, 4},        
        {8,ix.."24. Cavernas de Brazanegra", 500, 5},
        {8,ix.."29. Gnomeregan", 500, 6},
        {8,ix.."30. Horado Rajaciento", 500, 7},
        {8,ix.."26-35. Monasterio Escarlata", 500, 8}, 
        {8,ix.."40. Zahúrda Rajaciento", 500, 9},
        {8,ix.."42. Uldaman", 500, 10},
        {8,ix.."44. Zul'Farrak", 500, 11},
        {8,ix.."46-48. Maraudon", 500, 12},
        {8,ix.."50. El Templo de Atal'Hakkar", 500, 13},
        {8,ix.."52. Profundidades de Roca Negra", 500, 14},
        {8,ix.."55-58. Cumbre de Roca Negra", 500, 15},
        {8,ix.."58. Scholomance", 500, 16},
        {8,ix.."58. Stratholme", 500, 17},
        {8,ix.."58. La Masacre", 500, 18},
        {0,"...Atrás", 20, 0},},

    [500] = { 
        {1, 1812.8153, -4414.6191, -18.246, 5.1707},     --1 Cima Ígnea - 10 
        {1, -732.9263, -1719.145, 17.0474, 2.7734},     --2 Las Cuevas de los Lamentos
        {36, -12.8273, -382.9282, 61.7997, 4.6076},     --3 Las Minas de la Muerte
        {0, -234.8294, 1561.6988, 76.8923, 1.1964},     --4 Castillo de Colmillo Oscuro        
        {1, 4247.5478, 742.5911, -25.0591, 1.4309},     --5 Cavernas de Brazanegra
        {0, -5163.208, 925.1033, 257.1794, 1.5467},     --6 Gnomeregan 29
        {1, -4463.1386, -1664.3995, 82.2596, 0.8572},   --7 Horado Rajaciento - 30
        {0, 2845.3569, -697.6431, 139.3309, 5.0926},    --8 Monasterio Escarlata - 26/35
        {1, -4658.6367, -2526.319, 81.4823, 4.1396},    --9 Zahúrda Rajaciento - 40
        {0, -6068.6269, -2955.2868, 209.7744, 0.04712}, --10 Uldaman 42
        {1, -6797.7915, -2890.8813, 8.8807, 6.2768},    --11 Zul'Farrak 44 
        {1, -1185.0281, 2880.1237, 85.9017, 4.8536},    --12 Maraudon
        {0, -10183.958, -3993.06, -109.1948, 6.063},    --13 El Templo de Atal'Hakkar - 50
        {0, -7180.2675, -920.1867, 165.5279, 4.9664},   --14 Profundidades de Roca Negra - 52
        {0, -7525.7128, -1227.5332, 285.7322, 5.2606},  --15 Cumbre de Roca Negra - 55/58
        {0, 1267.695, -2556.9502, 94.1269, 0.4831},     --16 Scholomance - 58
        {0, 3392.9897, -3354.2304, 142.2502, 4.722},    --17 Stratholme - 58
        {1, -3981.2221, 781.7203, 161.0041, 4.7084},},  --18 La Masacre - 58

    [401] = {
        {8,ix.."60. Murallas del Fuego Infernal", 501, 1},    
        {8,ix.."61. El Horno de Sangre", 501, 2},
        {8,ix.."62. Recinto de los Esclavos", 501, 3},
        {8,ix.."63. La Sotiénaga", 501, 4},        
        {8,ix.."64. Tumbas de Maná", 501, 5},
        {8,ix.."65. Criptas Auchenai", 501, 6},
        {8,ix.."66. Antiguas Laderas de Trabalomas", 501, 7},
        {8,ix.."67. Salas Sethekk", 501, 8}, 
        {8,ix.."68. La Cámara de Vapor", 501, 9},
        {8,ix.."69. El Laberinto de las Sombras", 501, 10},
        {8,ix.."69. Las Salas Arrasadas", 501, 11},
        {8,ix.."70. La Ciénaga Negra", 501, 12},
        {8,ix.."70. El Invernáculo", 501, 13},
        {8,ix.."70. El Mechanar", 501, 14},
        {8,ix.."70. El Arcatraz", 501, 15},
        {8,ix.."70. Bancal del Magister", 501, 16},
        {0,"...Atrás", 20, 0},},

    [501] = { 
        {530, -361.548035, 3073.503174, -15.080264, 1.889927},   -- 1 Murallas del Fuego Infernal - 60
        {530, -299.520111, 3158.717285, 31.671602, 2.173269},    -- 2 El Horno de Sangre - 61
        {530, 727.9693, 7012.945312, -71.612144, 0.247424},      -- 3 Recinto de los Esclavos - 62
        {530, 781.808899, 6754.566406, -72.537735, 4.713941},    -- 4 La Sotiénaga - 63     
        {530, -3083.557617, 4943.227539, -101.047203, 6.280574}, -- 5 Tumbas de Maná - 64
        {530, -3361.888672, 5218.911621, -101.048576, 1.551475}, -- 6 Criptas Auchenai - 65
        {1, -8342.879883, -4060.647461, -207.963837, 0.631444},  -- 7 Antiguas Laderas de Trabalomas - 66
        {530, -3361.955322, 4665.541504, -101.048347, 4.742997}, -- 8 Salas Sethekk - 67
        {530, 818.348267, 6937.358887, -80.568016, 1.61006},     -- 9 La Cámara de Vapor - 68
        {530, -3548.392334, 4943.180664, -101.395599, 3.147267}, -- 10 El Laberinto de las Sombras - 69
        {530, -308.585907, 3073.683594, -3.64883, 1.806413},     -- 11 Las Salas Arrasadas - 69
        {1, -8761.708, -4184.260742, -209.497147, 2.023536},     -- 12 La Ciénaga Negra - 70
        {530, 3405.032715, 1489.535156, 182.837845, 5.629376},   -- 13 El Invernáculo - 70
        {530, 2871.153076, 1553.972534, 252.159058, 3.867718},   -- 14 El Mechanar - 70
        {530, 3308.134277, 1341.579224, 505.559998, 5.084305},   -- 15 El Arcatraz - 70
        {530, 12886.279297, -7333.544922, 65.488266, 4.249288},  -- 16 Bancal del Magister - 70  
    },

    --------Azeroth------------------------------------------------------------------
    [3] = {
        {8, ic[11].."Orgrimmar", 6, 1},
        {8, ic[12].."Cima del Trueno", 6, 2},
        {8, ic[13].."Entrañas", 6, 3},
        {8, ic[14].."Lunargenta", 6, 4},
        {8, ic[15].."Gadgetzan - Tanaris", 6, 5},
        {8, ic[16].."Bahía del Botín - Vega de Tuercespina", 6, 6},
        {8, ic[17].."Claro de la Luna", 6, 7},
        {0, "...Atrás", 2, 0},},
    ----Terrallende------------------------------------------------------------------
    [4] = {
        {4, ix.."Portal Oscuro, Las Tierras Devastadas", 7, 1},
        {4, ix.."Ciudad de Shattrath", 7, 2},
        {4, ix.."Thrallmar", 7, 3},
        {4, ix.."Refugio Rata del Pantano", 7, 4},
        {4, ix.."Bastión Rompepedras", 7, 5},
        {4, ix.."Bastión Señor del Trueno", 7, 6},
        {4, ix.."Garadar", 7, 7},
        {4, ix.."Flecha de la Tormenta", 7, 8},
        {4, ix.."Área 52", 7, 9}, 
        {4, ix.."Aldea Sombraluna", 7, 10},
        {0, "...Atrás", 2, 0},},
    --------Rasganorte---------------------------------------------------------------
    [5] = {
        {4, ix.."Ciudad de Dalaran", 8, 1},
        {4, ix.."Tundra Boreal", 8, 2},
        {4, ix.."Fiordo Aquilonal", 8, 3},
        {4, ix.."Colinas Pardas", 8, 4},
        {4, ix.."Cementerio de Dragones", 8, 5}, 
        {4, ix.."Bosque Canto de Cristal", 8, 6},
        {4, ix.."Zul'Drak", 8, 7},
        {4, ix.."Cuenca de Sholazar", 8, 8},
        {4, ix.."Cumbres Tormentosas", 8, 9},
        {4, ix.."Corona de Hielo", 8, 10},
        {0, "...Atrás", 2, 0},}, 
    --------Azeroth------------------------------------------------------------------
    [6] = {
        {1, 1629.5108, -4373.6211, 31.5407, 5.2468},     -- Orgrimmar
        {1, -1195.7438, 28.1298, 176.949, 2.883},        -- Cima del Trueno
        {0, 1569.0684, 267.1815, -43.1026, 4.3999},      -- Entrañas
        {530, 9847.2158, -7256.6118, 27.8312, 4.3473},   -- Lunargenta
        {1, -7046.5083, -3781.51, 10.1995, 3.5105},      -- Gadgetzan
        {0, -14446.7705, 507.9165, 26.2381, 5.0253},     -- Bahía del Botín
        {1, 7962.2602, -2492.0476, 487.8567, 5.1322},    -- Claro de la Luna
    },
    --------Terrallende--------------------------------------------------------------
    [7] = {
        {0, -11813.5185, -3184.0468, -30.5426, 3.7243},  -- Portal Oscuro
        {530, -1868.3526, 5439.7558, -10.4633, 5.13},    -- Ciudad de Shattrath
        {530, 228.7059, 2632.2966, 87.6851, 2.6173},     -- Thrallmar
        {530, 89.3989, 5215.7871, 23.1932, 5.574},       -- Avanzada Rata del Pantano 
        {530, -2565.5456, 4427.2973, 39.3059, 3.6135},   -- Bastión Rompepedras
        {530, 2447.3496, 6021.4487, 154.4485, 3.7063},   -- Bastión Señor del Trueno
        {530, -1259.1961, 7133.8242, 57.2756, 2.214},    -- Garadar
        {530, 4090.6562, 2980.1093, 355.33807, 0.3559},  -- La Flecha de la Tormenta
        {530, 3083.4995, 3598.7421, 144.0121, 4.3284},   -- Área 52
        {530, -3015.6428, 2556.4323, 78.7539, 1.5801},   -- Aldea Sombraluna
    },    

    ----------Rasganorte-------------------------------------------------------------
    [8] = {
        {571,5804.79, 624.37, 647.78, 1.636},            --1 Ciudad de Dalaran
        {571, 2918.9597, 6245.1479, 208.7505, 3.8733},   --2 Bastión Grito de Guerra
        {571, 1919.606, -6174.5732, 24.2786, 2.5821},    --3 Campo Venganza
        {571, 3259.9372, -1763.2512, 114.2295, 4.3967},  --4 Bastión de la Conquista
        {571, 3246.1154, -661.8128, 166.7912, 4.6748},   --5 Rencor Venenoso
        {571, 5589.6142, -694.5081, 206.627, 1.9345},    --6 Dominio de los Atracasol
        {571, 5523.2167, -2672.7221, 303.9543, 3.1215},  --7 Confín Argenta
        {571, 5591.436, 5831.2285, -67.885, 4.6298},     --8 Campamento Nesingwary
        {571, 6188.939, -1054.0264, 409.91, 2.544},      --9 K3
        {571, 6164.8413, -61.4718, 388.1809, 2.1418},    --10 Vanguardia Argenta
    },}

local function clickpiedra(e,j,o)       local A,H = j:IsAlliance(),j:IsHorde() 	

    if j:IsInCombat() then j:SendBroadcastMessage("Estoy en combate.") return end 

        if H then
            for i = 1, #Menu_H[0] do local icon, text, send, int = table.unpack(Menu_H[0][i])
            j:GossipMenuAddItem(icon, text, send, int) end              
        else
            for i = 1, #Menu_A[0] do local icon, text, send, int = table.unpack(Menu_A[0][i])
            j:GossipMenuAddItem(icon, text, send, int) end        
        end
    j:GossipSendMenu(1,o)
    end

local function clickmenu(e,j,o,s,intid) 	local L,C,A,H,buf,ya = j:GetLevel(),j:GetClassMask(),j:IsAlliance(),j:IsHorde(),"|cff00ff80Buff aplicado!","Ya tengo ese buff."
if A then  
	if s <=5 or s ==20 or s ==21 or s ==22 or s ==23 or s==30 or s ==400 or s ==401 or s ==402 or s ==403 or s ==404 or s ==405 then
        for i = 1, #Menu_A[s] do
            local icon, text, send, int = table.unpack( Menu_A[s][i] )
            j:GossipMenuAddItem(icon, text, send, int)
        end
        j:GossipSendMenu(1,o)
    end
elseif H then
    if s <= 5 or s == 20 or s == 21 or s == 22 or s == 23 or s==30 or s == 400 or s == 401 or s == 402 or s == 403 or s ==404 or s ==405 then
        for i= 1, #Menu_H[s] do
            local icon, text, send, int = table.unpack( Menu_H[s][i] )
            j:GossipMenuAddItem(icon, text, send, int)
        end
        j:GossipSendMenu(1,o)
    end
end

--Gestor de comidas y bebidas------------------------------------------------------------------------

	if s == 9 and L <= 4 then 
         if C == 1 or C == 8 or C == 32 then j:AddItem(5349, 20)
        else
            j:AddItem(5350, 20) j:AddItem(5349, 20)         
            clickmenu(e, j, o, 0, 0) end 
        end 

    if s == 9 and L >= 5 and L <= 14 then
         if C == 1 or C == 8 or C == 32 then j:AddItem(1113, 20)
        else
            j:AddItem(1113, 20) j:AddItem(2288, 20)
            clickmenu(e, j, o, 0, 0) end
        end

    if s == 9 and L >= 15 and L <= 24 then    
         if C == 1 or C == 8 or C == 32 then j:AddItem(1114, 20)
       else
            j:AddItem(2136, 20) j:AddItem(1114, 20)
            clickmenu(e, j, o, 0, 0) end
        end

    if s == 9 and L >= 25 and L <= 34 then
         if C == 1 or C == 8 or C == 32 then j:AddItem(1487, 20)
        else
            j:AddItem(3772, 20) j:AddItem(1487, 20)
            clickmenu(e, j, o, 0, 0) end
        end

    if s == 9 and L >= 35 and L <= 44 then      
         if C == 1 or C == 8 or C == 32 then j:AddItem(8075, 20)
        else
            j:AddItem(8075, 20) j:AddItem(8077, 20)
            clickmenu(e, j, o, 0, 0) end
        end

    if s == 9 and L >= 45 and L <= 54 then
        if C == 1 or C == 8 or C == 32 then
            j:AddItem(8076, 20)
        else
            j:AddItem(8078, 20) j:AddItem(8076, 20)
            clickmenu(e, j, o, 0, 0) end
        end

    if s == 9 and L >= 55 and L <= 59 then 
         if C == 1 or C == 8 or C == 32 then
            j:AddItem(22895, 20)
        else
            j:AddItem(22895, 20) j:AddItem(8079, 20)
            clickmenu(e, j, o, 0, 0) end
        end

    if s == 9 and L >= 60 and L <= 64 then
         if C == 1 or C == 8 or C == 32 then
            j:AddItem(22895, 20)
        else
            j:AddItem(22895, 20) j:AddItem(30703, 20)
            clickmenu(e, j, o, 0, 0) end
        end

    if s == 9 and L >= 65 and L <= 73 then        
            j:AddItem(34062, 20)
            clickmenu(e, j, o, 0, 0) end

    if s == 9 and L >= 74 and L <= 79 then        
            j:AddItem(43518, 20)
            clickmenu(e, j, o, 0, 0) end

    if s == 9 and L == 80 then
        if j:HasItem(43523, 80) then
             j:SendBroadcastMessage("Solo puedo cargar con 80 raciones de comida.")
             clickmenu(e, j, o, 0, 0)
         else
             j:AddItem(43523, 20)
             clickmenu(e, j, o, 0, 0) end
         end
---------------------------------------------------------------------------------------------------------------------------
    if A then
    	if s == 6 and intid == 5 and L <= 41 then j:SendBroadcastMessage(via.."Gadgetzan"..lev.."42.") 		 			clickmenu(e,j,o,3,0) return     
    elseif s == 6 and intid == 6 and L <= 34 then j:SendBroadcastMessage(via.."Bahía del Botín"..lev.."35.") 			clickmenu(e,j,o,3,0) return
    elseif s == 6 and intid == 7 and L <= 9  then j:SendBroadcastMessage(via.."Claro de la Luna"..lev.."10.") 			clickmenu(e,j,o,3,0) return
    elseif s == 7 and intid == 1 and L <= 57 then j:SendBroadcastMessage(vil.."Portal Oscuro"..lev.."58.")  			clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 2 and L <= 61 then j:SendBroadcastMessage(via.."Shattrath"..lev.."62.") 		 			clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 3 and L <= 57 then j:SendBroadcastMessage(vil.."Bastión del Honor"..lev.."58.") 		    clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 4 and L <= 59 then j:SendBroadcastMessage(via.."Telredor"..lev.."60.") 					clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 5 and L <= 62 then j:SendBroadcastMessage(vil.."Bastión Allerian"..lev.."63.") 			clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 6 and L <= 63 then j:SendBroadcastMessage(via.."Sylvanaar"..lev.."64.") 					clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 7 and L <= 64 then j:SendBroadcastMessage(via.."Telaar"..lev.."65.") 					    clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 8 and L <= 66 then j:SendBroadcastMessage(via.."Flecha de la Tormenta"..lev.."67.") 		clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 9 and L <= 66 then j:SendBroadcastMessage(via.."Área 52"..lev.."67.") 					clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 10 and L <= 67 then j:SendBroadcastMessage(vil.."Bastión Martillo Salvaje"..lev.."68.")  clickmenu(e,j,o,4,0) return
    elseif s == 8 and intid == 1 and L <= 73 then j:SendBroadcastMessage(via.."Dalaran"..lev.."74.") 					clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 2 and L <= 67 then j:SendBroadcastMessage(via.."la Fortaleza Denuedo"..lev.."68.") 		clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 3 and L <= 67 then j:SendBroadcastMessage(via.."Valgarde"..lev.."68.") 			        clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 4 and L <= 72 then j:SendBroadcastMessage(vil.."Campamento de la Brigada"..lev.."73.")   clickmenu(e,j,o,5,0) return 
    elseif s == 8 and intid == 5 and L <= 70 then j:SendBroadcastMessage(via.."la Fortaleza de Hibergarde"..lev.."71.")  clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 6 and L <= 73 then j:SendBroadcastMessage(vil.."Mirador Brisaveloz"..lev.."74.")         clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 7 and L <= 73 then j:SendBroadcastMessage(vil.."Confín Argenta"..lev.."74.")             clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 8 and L <= 75 then j:SendBroadcastMessage(vil.."Campamento Base de Nesingwary"..lev.."76.") clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 9 and L <= 76 then j:SendBroadcastMessage(via.."K3"..lev.."77.")                          clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 10 and L <= 76 then j:SendBroadcastMessage(via.."La Vanguardia Argenta"..lev.."77.")      clickmenu(e,j,o,5,0) return
    elseif s == 500 and intid == 1 and L <= 14 then j:SendBroadcastMessage(via.."Cuevas de los Lamentos"..lev.."15.")    clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 2 and L <= 17 then j:SendBroadcastMessage(via.."Las Minas de la Muerte"..lev.."18.")    clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 3 and L <= 21 then j:SendBroadcastMessage(vil.."Castillo de Colmillo Oscuro"..lev.."22.") clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 4 and L <= 21 then j:SendBroadcastMessage(via.."Las Mazmorras"..lev.."22.")              clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 5 and L <= 23 then j:SendBroadcastMessage(via.."Cavernas de Brazanegra"..lev.."24.")     clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 6 and L <= 28 then j:SendBroadcastMessage(via.."Gnomeregan"..lev.."29.")                 clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 7 and L <= 29 then j:SendBroadcastMessage(via.."Horado Rajaciento"..lev.."30.")          clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 8 and L <= 25 then j:SendBroadcastMessage(via.."Monasterio Escarlata"..lev.."26.")       clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 9 and L <= 39 then j:SendBroadcastMessage(via.."Zahúrda Rajaciento"..lev.."40.")         clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 10 and L <= 41 then j:SendBroadcastMessage(via.."Uldaman"..lev.."42.")                   clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 11 and L <= 43 then j:SendBroadcastMessage(via.."Zul'Farrak"..lev.."44.")                clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 12 and L <= 45 then j:SendBroadcastMessage(via.."Maraudon"..lev.."46.")                  clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 13 and L <= 49 then j:SendBroadcastMessage(vil.."Templo de Atal'Hakkar"..lev.."50.")    clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 14 and L <= 51 then j:SendBroadcastMessage(via.."Profundidades de Roca Negra"..lev.."52.") clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 15 and L <= 54 then j:SendBroadcastMessage(via.."Cumbre de Roca Negra"..lev.."55.")      clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 16 and L <= 57 then j:SendBroadcastMessage(via.."Scholomance"..lev.."58.")               clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 17 and L <= 57 then j:SendBroadcastMessage(via.."Stratholme"..lev.."58.")                clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 18 and L <= 57 then j:SendBroadcastMessage(via.."La Masacre"..lev.."58.")                clickmenu(e,j,o,400,0) return
    elseif s == 501 and intid == 1 and L <= 59 then j:SendBroadcastMessage(via.."Murallas del Fuego Infernal"..lev.."60.") clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 2 and L <= 60 then j:SendBroadcastMessage(vil.."Horno de Sangre"..lev.."61.")            clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 3 and L <= 61 then j:SendBroadcastMessage(vil.."Recinto de los Esclavos"..lev.."62.")    clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 4 and L <= 62 then j:SendBroadcastMessage(via.."La Sotiénaga"..lev.."63.")                clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 5 and L <= 63 then j:SendBroadcastMessage(via.."Tumbas de Maná"..lev.."64.")              clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 6 and L <= 64 then j:SendBroadcastMessage(via.."Criptas Auchenai"..lev.."65.")            clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 7 and L <= 65 then j:SendBroadcastMessage(via.."Antiguas Laderas de Trabalomas"..lev.."66.") clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 8 and L <= 66 then j:SendBroadcastMessage(via.."Salas Sethekk"..lev.."67.")               clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 9 and L <= 67 then j:SendBroadcastMessage(via.."La Cámara de Vapor"..lev.."68.")          clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 10 and L <= 68 then j:SendBroadcastMessage(vil.."Laberinto de las Sombras"..lev.."69.")  clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 11 and L <= 68 then j:SendBroadcastMessage(via.."Las Salas Arrasadas"..lev.."69.")        clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 12 and L <= 69 then j:SendBroadcastMessage(via.."La Ciénaga Negra"..lev.."70.")           clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 13 and L <= 69 then j:SendBroadcastMessage(vil.."Invernáculo"..lev.."70.")               clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 14 and L <= 69 then j:SendBroadcastMessage(vil.."Mechanar"..lev.."70.")                  clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 15 and L <= 69 then j:SendBroadcastMessage(vil.."Arcatraz"..lev.."70.")                  clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 16 and L <= 69 then j:SendBroadcastMessage(via.."Bancal del Magister"..lev.."70.")       clickmenu(e,j,o,401,0) return
    elseif s == 502 and intid == 1 and L <= 67 then j:SendBroadcastMessage(via.."Fortaleza de Utgarde"..lev.."68.")      clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 2 and L <= 68 then j:SendBroadcastMessage(via.."El Nexo"..lev.."69.")                   clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 3 and L <= 69 then j:SendBroadcastMessage(via.."Azjol Nerub"..lev.."70.")               clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 4 and L <= 70 then j:SendBroadcastMessage(via.."Ahn'kahet"..lev.."71.")                 clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 5 and L <= 71 then j:SendBroadcastMessage(via.."la Fortaleza de Drak'Tharon"..lev.."72.") clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 6 and L <= 73 then j:SendBroadcastMessage(via.."Bastión Violeta"..lev.."74.")           clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 7 and L <= 73 then j:SendBroadcastMessage(via.."Gundrak"..lev.."74.")                   clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 8 and L <= 74 then j:SendBroadcastMessage(via.."Cámaras de Piedra"..lev.."75.")         clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 9 and L <= 76 then j:SendBroadcastMessage(via.."Cámaras de Relámpagos"..lev.."77.")     clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 10 and L <= 76 then j:SendBroadcastMessage(via.."El Oculus"..lev.."77.")                clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 11 and L <= 77 then j:SendBroadcastMessage(via.."La Matanza de Stratholme"..lev.."78.") clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 12 and L <= 77 then j:SendBroadcastMessage(vil.."Pináculo de Utgarde"..lev.."78.")     clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 13 and L <= 77 then j:SendBroadcastMessage(via.."La Forja de Almas"..lev.."78.")        clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 14 and L <= 78 then j:SendBroadcastMessage(vil.."Foso de Saron"..lev.."79.")           clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 15 and L <= 78 then j:SendBroadcastMessage(via.."Cámaras de Reflexión"..lev.."79.")     clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 16 and L <= 78 then j:SendBroadcastMessage(via.."Prueba del Campeón"..lev.."79.")       clickmenu(e,j,o,402,0) return
    elseif s == 503 and L <= 59 then j:SendBroadcastMessage(via.."cualquier banda clásica"..lev.."60.")                  clickmenu(e,j,o,403,0) return
    elseif s == 504 and L <= 69 then j:SendBroadcastMessage(via.."cualquier banda de The Burning Crusade"..lev.."70.")   clickmenu(e,j,o,404,0) return
    elseif s == 505 and L <= 79 then j:SendBroadcastMessage(via.."cualquier banda de Wrath of The Lich King"..lev.."80.")         clickmenu(e,j,o,405,0) return
        end
    else
        if s == 6 and intid == 5 and L <= 41 then j:SendBroadcastMessage(via.."Gadgetzan"..lev.."42.")                   clickmenu(e,j,o,3,0) return     
    elseif s == 6 and intid == 6 and L <= 34 then j:SendBroadcastMessage(via.."Bahía del Botín"..lev.."35.")             clickmenu(e,j,o,3,0) return
    elseif s == 6 and intid == 7 and L <= 9  then j:SendBroadcastMessage(via.."Claro de la Luna"..lev.."10.")            clickmenu(e,j,o,3,0) return
    elseif s == 7 and intid == 1 and L <= 57 then j:SendBroadcastMessage(vil.."Portal Oscuro"..lev.."58.")              clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 2 and L <= 61 then j:SendBroadcastMessage(via.."Shattrath"..lev.."62.")                   clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 3 and L <= 57 then j:SendBroadcastMessage(vil.."Thrallmar"..lev.."58.")                  clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 4 and L <= 59 then j:SendBroadcastMessage(via.."Rata del Pantano"..lev.."60.")            clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 5 and L <= 62 then j:SendBroadcastMessage(vil.."Bastión Rompepedras"..lev.."63.")        clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 6 and L <= 63 then j:SendBroadcastMessage(via.."Bastión Señor del Trueno"..lev.."64.")    clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 7 and L <= 63 then j:SendBroadcastMessage(via.."Garadar"..lev.."64.")                     clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 8 and L <= 66 then j:SendBroadcastMessage(via.."La Flecha de la Tormenta"..lev.."67.")    clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 9 and L <= 66 then j:SendBroadcastMessage(via.."Área 52"..lev.."67.")                     clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 10 and L <= 67 then j:SendBroadcastMessage(via.."Aldea Sombraluna"..lev.."68.")           clickmenu(e,j,o,4,0) return
    elseif s == 8 and intid == 1 and L <= 73 then j:SendBroadcastMessage(via.."Dalaran"..lev.."74.")                     clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 2 and L <= 67 then j:SendBroadcastMessage(via.."Bastión Grito de Guerra"..lev.."68.")     clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 3 and L <= 67 then j:SendBroadcastMessage(via.."Campo Venganza"..lev.."68.")              clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 4 and L <= 72 then j:SendBroadcastMessage(via.."Bastión de la Conquista"..lev.."73.")     clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 5 and L <= 71 then j:SendBroadcastMessage(via.."Rencor Venenoso"..lev.."72.")             clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 6 and L <= 73 then j:SendBroadcastMessage(via.."Dominio Atracasol"..lev.."74.")           clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 7 and L <= 73 then j:SendBroadcastMessage(vil.."Confín Argenta"..lev.."74.")             clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 8 and L <= 75 then j:SendBroadcastMessage(vil.."Campamento Base de Nesingwary"..lev.."76.") clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 9 and L <= 76 then j:SendBroadcastMessage(via.."K3"..lev.."77.")                          clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 10 and L <= 76 then j:SendBroadcastMessage(via.."La Vanguardia Argenta"..lev.."77.")      clickmenu(e,j,o,5,0) return
    elseif s == 500 and intid == 1 and L <= 9 then j:SendBroadcastMessage(via.."Cima Ígnea"..lev.."10.")                clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 2 and L <= 14 then j:SendBroadcastMessage(via.."Cueva de los Lamentos"..lev.."15.")    clickmenu(e,j,o,400,0) return  
    elseif s == 500 and intid == 3 and L <= 17 then j:SendBroadcastMessage(via.."Las Minas de la Muerte"..lev.."18.")    clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 4 and L <= 21 then j:SendBroadcastMessage(vil.."Castillo de Colmillo Oscuro"..lev.."22.") clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 5 and L <= 23 then j:SendBroadcastMessage(via.."Cavernas de Brazanegra"..lev.."24.")     clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 6 and L <= 28 then j:SendBroadcastMessage(via.."Gnomeregan"..lev.."29.")                 clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 7 and L <= 29 then j:SendBroadcastMessage(via.."Horado Rajaciento"..lev.."30.")          clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 8 and L <= 25 then j:SendBroadcastMessage(via.."Monasterio Escarlata"..lev.."26.")       clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 9 and L <= 39 then j:SendBroadcastMessage(via.."Zahúrda Rajaciento"..lev.."40.")         clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 10 and L <= 41 then j:SendBroadcastMessage(via.."Uldaman"..lev.."42.")                   clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 11 and L <= 43 then j:SendBroadcastMessage(via.."Zul'Farrak"..lev.."44.")                clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 12 and L <= 45 then j:SendBroadcastMessage(via.."Maraudon"..lev.."46.")                  clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 13 and L <= 49 then j:SendBroadcastMessage(vil.."Templo de Atal'Hakkar"..lev.."50.")    clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 14 and L <= 51 then j:SendBroadcastMessage(via.."Profundidades de Roca Negra"..lev.."52.") clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 15 and L <= 54 then j:SendBroadcastMessage(via.."Cumbre de Roca Negra"..lev.."55.")      clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 16 and L <= 57 then j:SendBroadcastMessage(via.."Scholomance"..lev.."58.")               clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 17 and L <= 57 then j:SendBroadcastMessage(via.."Stratholme"..lev.."58.")                clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 18 and L <= 57 then j:SendBroadcastMessage(via.."La Masacre"..lev.."58.")                clickmenu(e,j,o,400,0) return
    elseif s == 501 and intid == 1 and L <= 59 then j:SendBroadcastMessage(via.."Murallas del Fuego Infernal"..lev.."60.") clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 2 and L <= 60 then j:SendBroadcastMessage(vil.."Horno de Sangre"..lev.."61.")            clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 3 and L <= 61 then j:SendBroadcastMessage(vil.."Recinto de los Esclavos"..lev.."62.")    clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 4 and L <= 62 then j:SendBroadcastMessage(via.."La Sotiénaga"..lev.."63.")                clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 5 and L <= 63 then j:SendBroadcastMessage(via.."Tumbas de Maná"..lev.."64.")              clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 6 and L <= 64 then j:SendBroadcastMessage(via.."Criptas Auchenai"..lev.."65.")            clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 7 and L <= 65 then j:SendBroadcastMessage(via.."Antiguas Laderas de Trabalomas"..lev.."66.") clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 8 and L <= 66 then j:SendBroadcastMessage(via.."Salas Sethekk"..lev.."67.")               clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 9 and L <= 67 then j:SendBroadcastMessage(via.."La Cámara de Vapor"..lev.."68.")          clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 10 and L <= 68 then j:SendBroadcastMessage(vil.."Laberinto de las Sombras"..lev.."69.")  clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 11 and L <= 68 then j:SendBroadcastMessage(via.."Las Salas Arrasadas"..lev.."69.")        clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 12 and L <= 69 then j:SendBroadcastMessage(via.."La Ciénaga Negra"..lev.."70.")           clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 13 and L <= 69 then j:SendBroadcastMessage(vil.."Invernáculo"..lev.."70.")               clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 14 and L <= 69 then j:SendBroadcastMessage(vil.."Mechanar"..lev.."70.")                  clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 15 and L <= 69 then j:SendBroadcastMessage(vil.."Arcatraz"..lev.."70.")                  clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 16 and L <= 69 then j:SendBroadcastMessage(via.."Bancal del Magister"..lev.."70.")       clickmenu(e,j,o,401,0) return
    elseif s == 502 and intid == 1 and L <= 67 then j:SendBroadcastMessage(via.."Fortaleza de Utgarde"..lev.."68.")      clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 2 and L <= 68 then j:SendBroadcastMessage(via.."El Nexo"..lev.."69.")                   clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 3 and L <= 69 then j:SendBroadcastMessage(via.."Azjol Nerub"..lev.."70.")               clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 4 and L <= 70 then j:SendBroadcastMessage(via.."Ahn'kahet"..lev.."71.")                 clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 5 and L <= 71 then j:SendBroadcastMessage(via.."la Fortaleza de Drak'Tharon"..lev.."72.") clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 6 and L <= 73 then j:SendBroadcastMessage(via.."Bastión Violeta"..lev.."74.")           clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 7 and L <= 73 then j:SendBroadcastMessage(via.."Gundrak"..lev.."74.")                   clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 8 and L <= 74 then j:SendBroadcastMessage(via.."Cámaras de Piedra"..lev.."75.")         clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 9 and L <= 76 then j:SendBroadcastMessage(via.."Cámaras de Relámpagos"..lev.."77.")     clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 10 and L <= 76 then j:SendBroadcastMessage(via.."El Oculus"..lev.."77.")                clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 11 and L <= 77 then j:SendBroadcastMessage(via.."La Matanza de Stratholme"..lev.."78.") clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 12 and L <= 77 then j:SendBroadcastMessage(vil.."Pináculo de Utgarde"..lev.."78.")     clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 13 and L <= 77 then j:SendBroadcastMessage(via.."La Forja de Almas"..lev.."78.")        clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 14 and L <= 78 then j:SendBroadcastMessage(vil.."Foso de Saron"..lev.."79.")           clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 15 and L <= 78 then j:SendBroadcastMessage(via.."Cámaras de Reflexión"..lev.."79.")     clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 16 and L <= 78 then j:SendBroadcastMessage(via.."Prueba del Campeón"..lev.."79.")       clickmenu(e,j,o,402,0) return
    elseif s == 503 and L <= 59 then j:SendBroadcastMessage(via.."cualquier banda clásica"..lev.."60.")                  clickmenu(e,j,o,403,0) return
    elseif s == 504 and L <= 69 then j:SendBroadcastMessage(via.."cualquier banda de The Burning Crusade"..lev.."70.")   clickmenu(e,j,o,404,0) return
    elseif s == 505 and L <= 79 then j:SendBroadcastMessage(via.."cualquier banda de Wrath of The Lich King debo ser nivel 80.")         clickmenu(e,j,o,405,0) return
        end
    end
---------------------------------------------------------------------------------------------------------------------------
--Gestor de Teletransportes

	if s >= 6 and s <= 8 or s >= 500 then 
		if intid >= 1 and intid <= 18
				then 
                    if j:IsAlliance() then 
                        local m,x,y,z,o = table.unpack(Menu_A[s][intid]) j:Teleport(m,x,y,z,o) j:GossipComplete()
                    else 
                        local m,x,y,z,o = table.unpack(Menu_H[s][intid]) j:Teleport(m,x,y,z,o) j:GossipComplete() 
                    end
	       end
	end

-- Buffs -- Palabra de poder: entereza ------------------------------------------------------------ 

    if s == 100 and intid == 1 then  
        if L == 1 then  
            if j:HasAura(1243) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
                else 
                    j:CastSpell(j, 1243, true) 
                    j:SendAreaTriggerMessage(buf)
                    clickmenu(e,j,o,1,0) end

    elseif
        L >= 2 and L <= 13 then 
        if j:HasAura(1244) then j:SendBroadcastMessage(ya)
        clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 1244, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end 

    elseif
        L >= 14 and L <= 26 then 
        if j:HasAura(1245) then j:SendBroadcastMessage(ya)
        clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 1245, true) 
                j:SendAreaTriggerMessage(buf)
                clickmenu(e,j,o,1,0) end 

    elseif
        L >= 27 and L <= 38 then 
        if j:HasAura(2791) then j:SendBroadcastMessage(ya)
        clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 2791, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end 

    elseif
        L >= 39 and L <= 50 then 
        if j:HasAura(10937) then j:SendBroadcastMessage(ya)
        clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 10937, true) 
                j:SendAreaTriggerMessage(buf)
                clickmenu(e,j,o,1,0) end 

    elseif
        L >= 51 and L <= 59 then 
        if j:HasAura(10938) then j:SendBroadcastMessage(ya)
        clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 10938, true) 
                j:SendAreaTriggerMessage(buf)
                clickmenu(e,j,o,1,0) end 

    elseif
        L >= 60 and L <= 69 then 
        if j:HasAura(25389) then j:SendBroadcastMessage(ya)
        clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 25389, true) 
                j:SendAreaTriggerMessage(buf)
                clickmenu(e,j,o,1,0) end             
    elseif
        L >= 70 then 
        if j:HasAura(48161) then j:SendBroadcastMessage(ya)
        clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 48161, true) 
                j:SendAreaTriggerMessage(buf)
                clickmenu(e,j,o,1,0) end                
            end
        end

-- Espíritu divino --------------------------------------------------------------------------------

    if s == 101 and intid == 2 
        then if L <= 19 
        then j:SendBroadcastMessage("Necesito ser al menos nivel 20.")
        clickmenu(e,j,o,1,0) end

    if s == 101 and intid == 2 and L >= 20 and L <= 29 
        then if j:HasAura(14752) then j:SendBroadcastMessage(ya)
                clickmenu(e,j,o,1,0)             
            else 
                j:CastSpell(j, 14752, true) 
                j:SendAreaTriggerMessage(buf)
                clickmenu(e,j,o,1,0) end

    elseif L >= 30 and L <= 39 then 
        if j:HasAura(14818) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 14818, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 40 and L <= 49 then 
        if j:HasAura(14819) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 14819, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 50 and L <= 59 then 
        if j:HasAura(27841) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 27841, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 60 and L <= 69 then 
        if j:HasAura(25312) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 25312, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif
        L >= 70 then 
        if j:HasAura(48073) then j:SendBroadcastMessage(ya)
        clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 48073, true) 
                j:SendAreaTriggerMessage(buf)
                clickmenu(e,j,o,1,0) end       
                end
            end

-- Marca de lo salvaje ----------------------------------------------------------------------------

    if s == 102 and intid == 3 then  
        if L >= 1 and L <= 9 then  
            if j:HasAura(5232) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
                else 
                    j:CastSpell(j, 5232, true) 
                    j:SendAreaTriggerMessage(buf)
                    clickmenu(e,j,o,1,0) end

    elseif L >= 10 and L <= 19 then 
        if j:HasAura(6756) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 6756, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 20 and L <= 29 then 
        if j:HasAura(5234) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 5234, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 30 and L <= 39 then 
        if j:HasAura(8907) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 8907, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 40 and L <= 49 then 
        if j:HasAura(9884) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 9884, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 50 and L <= 59 then 
        if j:HasAura(9885) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 9885, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 60 and L <= 69 then 
        if j:HasAura(26990) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 26990, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 70 then 
        if j:HasAura(48469) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 48469, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end
                end
            end  
             
-- Intelecto arcano -------------------------------------------------------------------------------

    if s == 103 and intid == 4 then
        if L >= 1 and L <= 3 then  
            if j:HasAura(1459) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
                else 
                    j:CastSpell(j, 1459, true) 
                    j:SendAreaTriggerMessage(buf)
                    clickmenu(e,j,o,1,0) end

    elseif L >= 4 and L <= 17 then 
        if j:HasAura(1460) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 1460, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 18 and L <= 31 then 
        if j:HasAura(1461) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 1461, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 32 and L <= 45 then 
        if j:HasAura(10156) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 10156, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 46 and L <= 59 then 
        if j:HasAura(10157) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 10157, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 60 and L <= 69 then 
        if j:HasAura(27126) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 27126, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 70 then 
        if j:HasAura(42995) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 42995, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end
            end
        end

-- Bendición de reyes inferior/superior -----------------------------------------------------------

    if s == 104 and intid == 5 
        then if L <= 11 
        then j:SendBroadcastMessage("Necesito ser al menos nivel 12.")
        clickmenu(e,j,o,1,0) end

    if s == 104 and intid == 5 then
        if L >= 12 and L <= 49 then  
            if j:HasAura(20217) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
                else                    
                    j:CastSpell(j, 20217, true) 
                    j:SendAreaTriggerMessage(buf)
                    clickmenu(e,j,o,1,0) end

    elseif s == 104 and intid == 5 then
        if L >= 50 then  
            if j:HasAura(25898) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:RemoveAura(48934)
                j:RemoveAura(48938)
                j:RemoveAura(25899)
                    j:CastSpell(j, 25898, true) -- REYES
                    j:SendAreaTriggerMessage(buf)
                    clickmenu(e,j,o,1,0) end
                    end
                end
            end
        end

-- Bendición de poderío inferior/superior ---------------------------------------------------------
    
    if s == 105 and intid == 6 then
        if L == 1 then  
           if j:HasAura(19740) then j:SendBroadcastMessage(ya)
                clickmenu(e,j,o,1,0) 
               else 
                    j:CastSpell(j, 19740, true) 
                    j:SendAreaTriggerMessage(buf)
                    clickmenu(e,j,o,1,0) end

    elseif L >= 2 and L <= 11 then 
        if j:HasAura(19834) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 19834, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 12 and L <= 21 then 
        if j:HasAura(19835) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 19835, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 22 and L <= 31 then 
        if j:HasAura(19836) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 19836, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 32 and L <= 41 then 
        if j:HasAura(19837) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 19837, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 42 and L <= 49 then 
        if j:HasAura(25782) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 25782, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 50 and L <= 59 then 
        if j:HasAura(25916) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 25916, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 60 and L <= 62 then 
        if j:HasAura(27141) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 27141, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 63 and L <= 68 then 
        if j:HasAura(48933) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 48933, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 69 then 
        if j:HasAura(48934) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
        else 
            j:RemoveAura(25898)
            j:RemoveAura(48938)
            j:RemoveAura(25899)
                j:CastSpell(j, 48934, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end
            end
        end

-- Bendición de sabiduría inferior/superior -------------------------------------------------------

    if s == 106 and intid == 7 
        then if L <= 3 
            then j:SendBroadcastMessage("Necesito ser al menos nivel 4.")
                 clickmenu(e,j,o,1,0) end

    if s == 106 and intid == 7 then
        if L >= 4 and L <= 13 then  
            if j:HasAura(19742) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
                else 
                    j:CastSpell(j, 19742, true) 
                    j:SendAreaTriggerMessage(buf)
                    clickmenu(e,j,o,1,0) end

    elseif L >= 14 and L <= 23 then 
        if j:HasAura(19850) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 19850, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 24 and L <= 33 then 
        if j:HasAura(19852) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 19852, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 34 and L <= 43 then 
        if j:HasAura(19853) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 19853, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 44 and L <= 49 then 
        if j:HasAura(25894) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 25894, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 50 and L <= 54 then 
        if j:HasAura(25918) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 25918, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 55 and L <= 60 then 
        if j:HasAura(27143) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 27143, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 61 and L <= 66 then 
        if j:HasAura(48937) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 48937, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 67 then 
        if j:HasAura(48938) then j:SendBroadcastMessage(ya)
            clickmenu(e,j,o,1,0) 
        else 
            j:RemoveAura(25898)
            j:RemoveAura(48934)
            j:RemoveAura(25899) 
                j:CastSpell(j, 48938, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end
                end
            end
        end

-- Bendición de salvaguardia inferior/superior ----------------------------------------------------

    if s == 107 and intid == 8 then
        if L <= 19 then
            j:SendBroadcastMessage("Necesito ser al menos nivel 20.")
            clickmenu(e,j,o,1,0) end

    if s == 107 and intid == 8 then
        if L >= 20 and L <= 50 then  
            if j:HasAura(20911) then j:SendBroadcastMessage(ya)
                clickmenu(e,j,o,1,0) 
            else 
                    j:CastSpell(j, 20911, true) 
                    j:SendAreaTriggerMessage(buf)
                    clickmenu(e,j,o,1,0) end

    elseif s == 107 and intid == 8 then
        if L >= 51 then  
            if j:HasAura(25899) then j:SendBroadcastMessage(ya)
                clickmenu(e,j,o,1,0) 
            else 
                j:RemoveAura(25898)
                j:RemoveAura(48934)
                j:RemoveAura(48938)
                    j:CastSpell(j, 25899, true) 
                    j:SendAreaTriggerMessage(buf)
                    clickmenu(e,j,o,1,0) end                    
                end
            end
        end
    end
end
RegisterItemGossipEvent(6948, 1, clickpiedra)
RegisterItemGossipEvent(6948, 2, clickmenu)
