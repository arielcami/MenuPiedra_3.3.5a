--[[ 
        Ariel Camilo // ariel.cami@gmail.com // 13 de Junio 2021

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

local Menu_A = {
    [0] = {
        {7, "Buffs", 1, 0},
        {7, "Teleportarse", 2, 0},
        {4, "Solicitar comida y bebida", 9, 1},
    },
    --------Pedir Buffs--------------------------------------------------------------
    [1] = {
        {4, "Palabra de poder: entereza", 100, 1},          
        {4, "Espíritu divino", 101, 2},                     
        {4, "Marca de lo salvaje", 102, 3},                 
        {4, "Intelecto arcano", 103, 4},                    
        {4, "Bendición de Reyes", 104, 5},         
        {4, "Bendición de Poderío", 105, 6},       
        {4, "Bendición de Sabiduría", 106, 7},     
        {4, "Bendición de Salvaguardia", 107, 8},  
        {0,"...Atrás", 0, 0},},

    ----------Teletrasportarse-------------------------------------------------------
    [2] = {
        {7, "Azeroth", 3, 0},
        {7, "Terrallende", 4, 0},
        {7, "Rasganorte", 5, 0},
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
        {7, "El Ojo de la Eternidad", 505, 1},
        {7, "Tier 7: Naxxramas", 505, 2},
        {7, "Tier 7: El Sagrario Obsidiana", 505, 3},
        {7, "Tier 8: Ulduar", 505, 4},
        {7, "Tier 9: Prueba del Cruzado", 505, 5},
        {7, "Tier 9/10: La Cámara de Archavon", 505, 6},
        {7, "Tier 10: Ciudadela de la Corona de Hielo", 505, 7},
        {7, "El Sagrario Rubí", 505, 8},
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
        {7, "Zul'Aman", 504, 1},
        {7, "Tier 4: Karazhan", 504, 2},
        {7, "Tier 4: Guarida de Gruul", 504, 3},
        {7, "Tier 4: Guarida de Magtheridon", 504, 4},
        {7, "Tier 5: Caverna Santuario Serpiente", 504, 5},
        {7, "Tier 5: El Castillo de la Tempestad", 504, 6},
        {7, "Tier 6: La Cima Hyjal", 504, 7},
        {7, "Tier 6: El Templo Oscuro", 504, 8},
        {7, "Tier 6: Meseta de La Fuente del Sol", 504, 9},        
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
        {7, "Zul'Gurub", 503, 1},
        {7, "Ruinas de Ahn'Qiraj (20 Man)", 503, 2},
        {7, "Ahn'Qiraj (40 Man)", 503, 3},
        {7, "Tier 1: Núcleo de Magma", 503, 4},
        {7, "Tier 2: Guarida de Alanegra", 503, 5},        
        {0,"...Atrás", 30, 0},},

    [503] = {
        {0, -11916.269531, -1213.478638, 92.287277, 4.722716},      -- Zul'Gurub
        {1, -8412.428711, 1500.856445, 29.160902, 2.636490},        -- Ruinas de Ahn'Qiraj (20 Man)
        {1, -8237.888672, 1993.095337, 129.072006, 0.957310},       -- Ahn'Qiraj 40-Man (40 Man)
        {230, 1118.786133, -457.697784, -102.475357, 3.547354},     -- Núcleo de Magma
        {229, 169.053238, -474.726532, 116.839996, 0.002223},},     -- Guarida de Alanegra   

    [402] = {        
        {7,"68. Fortaleza de Utgarde", 502, 1},
        {7,"69. El Nexo", 502, 2},
        {7,"70. Azjol-Nerub", 502, 3},
        {7,"71. Ahn'kahet: El Antiguo Reino", 502, 4},
        {7,"72. Fortaleza de Drak'Tharon", 502, 5},
        {7,"74. El Bastión Violeta", 502, 6},
        {7,"74. Gundrak", 502, 7},
        {7,"75. Cámaras de Piedra", 502, 8},
        {7,"77. Cámaras de Relámpagos", 502, 9},
        {7,"77. El Oculus", 502, 10},
        {7,"78. La Matanza de Stratholme", 502, 11},
        {7,"78. Pináculo de Utgarde", 502, 12},
        {7,"78. La Forja de Almas", 502, 13},
        {7,"79. Foso de Saron", 502, 14},
        {7,"79. Cámaras de Reflexión", 502, 15},
        {7,"79. Prueba del Campeón", 502, 16},
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
        {7,"Las Cuevas de los Lamentos - 15", 500, 1},
        {7,"Las Minas de la Muerte - 18", 500, 2},
        {7,"Castillo de Colmillo Oscuro - 22", 500, 3},
        {7,"Las Mazmorras de Ventormenta - 22", 500, 4},
        {7,"Cavernas de Brazanegra - 24", 500, 5},
        {7,"Gnomeregan - 29", 500, 6},
        {7,"Horado Rajaciento - 30", 500, 7},
        {7,"Monasterio Escarlata - 26/35", 500, 8}, 
        {7,"Zahúrda Rajaciento - 40", 500, 9},
        {7,"Uldaman - 42", 500, 10},
        {7,"Zul'Farrak - 44", 500, 11},
        {7,"Maraudon - 46/48", 500, 12},
        {7,"El Templo de Atal'Hakkar - 50", 500, 13},
        {7,"Profundidades de Roca Negra - 52", 500, 14},
        {7,"Cumbre de Roca Negra - 55/58", 500, 15},
        {7,"Scholomance - 58", 500, 16},
        {7,"Stratholme - 58", 500, 17},
        {7,"La Masacre - 58", 500, 18},
        {0,"...Atrás", 20, 0},},

    [500] = {        
        {1, -732.9263, -2219.145, 17.0474, 2.7734},     --1 Las Cuevas de los Lamentos
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
        {7,"60. Murallas del Fuego Infernal", 501, 1},    
        {7,"61. El Horno de Sangre", 501, 2},
        {7,"62. Recinto de los Esclavos", 501, 3},
        {7,"63. La Sotiénaga", 501, 4},        
        {7,"64. Tumbas de Maná", 501, 5},
        {7,"65. Criptas Auchenai", 501, 6},
        {7,"66. Antiguas Laderas de Trabalomas", 501, 7},
        {7,"67. Salas Sethekk", 501, 8}, 
        {7,"68. La Cámara de Vapor", 501, 9},
        {7,"69. El Laberinto de las Sombras", 501, 10},
        {7,"69. Las Salas Arrasadas", 501, 11},
        {7,"70. La Ciénaga Negra", 501, 12},
        {7,"70. El Invernáculo", 501, 13},
        {7,"70. El Mechanar", 501, 14},
        {7,"70. El Arcatraz", 501, 15},
        {7,"70. Bancal del Magister", 501, 16},
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
    	{4, "Ventormenta", 6, 1},
        {4, "El Exodar", 6, 2},
        {4, "Darnassus", 6, 3},
        {4, "Forjaz", 6, 4},
        {4, "Gadgetzan - Tanaris", 6, 5},
        {4, "Bahía del Botín - Vega de Tuercespina", 6, 6},
        {4, "Claro de la Luna", 6, 7},
        {0, "...Atrás", 2, 0},},
	----Terrallende------------------------------------------------------------------
    [4] = {
    	{4, "Portal Oscuro - Las Tierras Devastadas", 7, 1},
    	{4, "Ciudad de Shattrath", 7, 2},
    	{4, "Bastión del Honor - Península", 7, 3},
        {4, "Telredor - Marisma de Zangar", 7, 4},
        {4, "Bastión Allerian - Terokkar", 7, 5},
        {4, "Sylvanaar - Montañas Filospada", 7, 6},
        {4, "Telaar - Nagrand", 7, 7},
        {4, "Flecha de la Tormenta - Tormenta Abisal", 7, 8},
        {4, "Área 52 - Tormanta Abisal", 7, 9}, 
        {4, "Bastión Martillo Salvaje - Sombraluna", 7, 10},
        {0, "...Atrás", 2, 0},},
    --------Rasganorte---------------------------------------------------------------
    [5] = {
    	{4, "Ciudad de Dalaran", 8, 1},
        {4, "Fortaleza Denuedo - Tundra Boreal", 8, 2},
        {4, "Valgarde - Fiordo Aquilonal", 8, 3},
        {4, "Camp. de la Brigada - Colinas Pardas", 8, 4},
        {4, "Fort. Hibergarde - Cementerio Dragones", 8, 5}, 
        {4, "Mirador Brisaveloz - Bosque Canto de C.", 8, 6},
        {4, "Confín Argenta - Zul'Drak", 8, 7},
        {4, "Camp. Nesingwary - Cuenca de Sholazar", 8, 8},
        {4, "K3 - Cumbres Tormentosas", 8, 9},
        {4, "La Vanguardia Argenta - Corona de Hielo", 8, 10},
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
        {7, "Buffs", 1, 0},
        {7, "Teleportarse", 2, 0},
        {4, "Comida y bebida", 9, 1},
    },
    --------Pedir Buffs--------------------------------------------------------------
    [1] = {
        {4, "Palabra de poder: entereza", 100, 1},          
        {4, "Espíritu divino", 101, 2},                     
        {4, "Marca de lo salvaje", 102, 3},                 
        {4, "Intelecto arcano", 103, 4},                    
        {4, "Bendición de Reyes", 104, 5},         
        {4, "Bendición de Poderío", 105, 6},       
        {4, "Bendición de Sabiduría", 106, 7},     
        {4, "Bendición de Salvaguardia", 107, 8},  
        {0,"...Atrás", 0, 0},},

    ----------Teletrasportarse-------------------------------------------------------
    [2] = {
        {7, "Azeroth", 3, 0},
        {7, "Terrallende", 4, 0},
        {7, "Rasganorte", 5, 0},
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
        {7, "El Ojo de la Eternidad", 505, 1},
        {7, "Tier 7: Naxxramas", 505, 2},
        {7, "Tier 7: El Sagrario Obsidiana", 505, 3},
        {7, "Tier 8: Ulduar", 505, 4},
        {7, "Tier 9: Prueba del Cruzado", 505, 5},
        {7, "Tier 9/10: La Cámara de Archavon", 505, 6},
        {7, "Tier 10: Ciudadela de la Corona de Hielo", 505, 7},
        {7, "El Sagrario Rubí", 505, 8},
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
        {7, "Zul'Aman", 504, 1},
        {7, "Tier 4: Karazhan", 504, 2},
        {7, "Tier 4: Guarida de Gruul", 504, 3},
        {7, "Tier 4: Guarida de Magtheridon", 504, 4},
        {7, "Tier 5: Caverna Santuario Serpiente", 504, 5},
        {7, "Tier 5: El Castillo de la Tempestad", 504, 6},
        {7, "Tier 6: La Cima Hyjal", 504, 7},
        {7, "Tier 6: El Templo Oscuro", 504, 8},
        {7, "Tier 6: Meseta de La Fuente del Sol", 504, 9},        
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
        {7, "Zul'Gurub", 503, 1},
        {7, "Ruinas de Ahn'Qiraj (20 Man)", 503, 2},
        {7, "Ahn'Qiraj (40 Man)", 503, 3},
        {7, "Tier 1: Núcleo de Magma", 503, 4},
        {7, "Tier 2: Guarida de Alanegra", 503, 5},        
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
        {7,"68. Fortaleza de Utgarde", 502, 1},
        {7,"69. El Nexo", 502, 2},
        {7,"70. Azjol-Nerub", 502, 3},
        {7,"71. Ahn'kahet: El Antiguo Reino", 502, 4},
        {7,"72. Fortaleza de Drak'Tharon", 502, 5},
        {7,"74. El Bastión Violeta", 502, 6},
        {7,"74. Gundrak", 502, 7},
        {7,"75. Cámaras de Piedra", 502, 8},
        {7,"77. Cámaras de Relámpagos", 502, 9},
        {7,"77. El Oculus", 502, 10},
        {7,"78. La Matanza de Stratholme", 502, 11},
        {7,"78. Pináculo de Utgarde", 502, 12},
        {7,"78. La Forja de Almas", 502, 13},
        {7,"79. Foso de Saron", 502, 14},
        {7,"79. Cámaras de Reflexión", 502, 15},
        {7,"79. Prueba del Campeón", 502, 16},
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
        {7,"Cima Ígnea - 10", 500, 1},    
        {7,"Las Cuevas de los Lamentos - 15", 500, 2},
        {7,"Las Minas de la Muerte - 18", 500, 3},
        {7,"Castillo de Colmillo Oscuro - 22", 500, 4},        
        {7,"Cavernas de Brazanegra - 24", 500, 5},
        {7,"Gnomeregan - 29", 500, 6},
        {7,"Horado Rajaciento - 30", 500, 7},
        {7,"Monasterio Escarlata - 26/35", 500, 8}, 
        {7,"Zahúrda Rajaciento - 40", 500, 9},
        {7,"Uldaman - 42", 500, 10},
        {7,"Zul'Farrak - 44", 500, 11},
        {7,"Maraudon - 46/48", 500, 12},
        {7,"El Templo de Atal'Hakkar - 50", 500, 13},
        {7,"Profundidades de Roca Negra - 52", 500, 14},
        {7,"Cumbre de Roca Negra - 55/58", 500, 15},
        {7,"Scholomance - 58", 500, 16},
        {7,"Stratholme - 58", 500, 17},
        {7,"La Masacre - 58", 500, 18},
        {0,"...Atrás", 20, 0},},

    [500] = { 
        {1, 1812.8153, -4414.6191, -18.246, 5.1707},     --1 Cima Ígnea - 10 
        {1, -732.9263, -2219.145, 17.0474, 2.7734},     --2 Las Cuevas de los Lamentos
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
        {7,"60. Murallas del Fuego Infernal", 501, 1},    
        {7,"61. El Horno de Sangre", 501, 2},
        {7,"62. Recinto de los Esclavos", 501, 3},
        {7,"63. La Sotiénaga", 501, 4},        
        {7,"64. Tumbas de Maná", 501, 5},
        {7,"65. Criptas Auchenai", 501, 6},
        {7,"66. Antiguas Laderas de Trabalomas", 501, 7},
        {7,"67. Salas Sethekk", 501, 8}, 
        {7,"68. La Cámara de Vapor", 501, 9},
        {7,"69. El Laberinto de las Sombras", 501, 10},
        {7,"69. Las Salas Arrasadas", 501, 11},
        {7,"70. La Ciénaga Negra", 501, 12},
        {7,"70. El Invernáculo", 501, 13},
        {7,"70. El Mechanar", 501, 14},
        {7,"70. El Arcatraz", 501, 15},
        {7,"70. Bancal del Magister", 501, 16},
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
        {4, "Orgrimmar", 6, 1},
        {4, "Cima del Trueno", 6, 2},
        {4, "Entrañas", 6, 3},
        {4, "Lunargenta", 6, 4},
        {4, "Gadgetzan - Tanaris", 6, 5},
        {4, "Bahía del Botín - Vega de Tuercespina", 6, 6},
        {4, "Claro de la Luna", 6, 7},
        {0, "...Atrás", 2, 0},},
    ----Terrallende------------------------------------------------------------------
    [4] = {
        {4, "Portal Oscuro - Las Tierras Devastadas", 7, 1},
        {4, "Ciudad de Shattrath", 7, 2},
        {4, "Thrallmar - Península", 7, 3},
        {4, "Rata del Pantano - Marisma de Zangar", 7, 4},
        {4, "Bastión Rompepedras - Terokkar", 7, 5},
        {4, "Bastión Señor del Trueno - Filospada", 7, 6},
        {4, "Garadar - Nagrand", 7, 7},
        {4, "Flecha de la Tormenta - Tormenta Abisal", 7, 8},
        {4, "Área 52 - Tormanta Abisal", 7, 9}, 
        {4, "Aldea Sombraluna - Valle Sombraluna", 7, 10},
        {0, "...Atrás", 2, 0},},
    --------Rasganorte---------------------------------------------------------------
    [5] = {
        {4, "Ciudad de Dalaran", 8, 1},
        {4, "Bastión Grito de Guerra - Tundra Boreal", 8, 2},
        {4, "Campo Venganza - Fiordo Aquilonal", 8, 3},
        {4, "Bastión de la Conquista - Colinas Pardas", 8, 4},
        {4, "Rencor Venenoso - Cementerio Dragones", 8, 5}, 
        {4, "Dominio Atracasol - Bosque Canto de C.", 8, 6},
        {4, "El Confín Argenta - Zul'Drak", 8, 7},
        {4, "Camp. Nesingwary - Cuenca de Sholazar", 8, 8},
        {4, "K3 - Cumbres Tormentosas", 8, 9},
        {4, "La Vanguardia Argenta - Corona de Hielo", 8, 10},
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
        {571, 3259.9372, -2263.2512, 114.2295, 4.3967},  --4 Bastión de la Conquista
        {571, 3246.1154, -661.8128, 166.7912, 4.6748},   --5 Rencor Venenoso
        {571, 5589.6142, -694.5081, 206.627, 1.9345},    --6 Dominio de los Atracasol
        {571, 5523.2167, -2672.7221, 303.9543, 3.1215},  --7 Confín Argenta
        {571, 5591.436, 5831.2285, -67.885, 4.6298},     --8 Campamento Nesingwary
        {571, 6188.939, -1054.0264, 409.91, 2.544},      --9 K3
        {571, 6164.8413, -61.4718, 388.1809, 2.1418},    --10 Vanguardia Argenta
    },}

local function clickpiedra(e,j,o)       local A,H = j:IsAlliance(),j:IsHorde() 	

    if j:IsInCombat() then j:Say("Estoy en combate.", 0) return end 

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
             j:SendUnitSay("Solo puedo cargar con 80 raciones de comida.", 0)
             clickmenu(e, j, o, 0, 0)
         else
             j:AddItem(43523, 20)
             clickmenu(e, j, o, 0, 0) end
         end
---------------------------------------------------------------------------------------------------------------------------
    if A then
    	if s == 6 and intid == 5 and L <= 41 then j:Say("Para viajar a Gadgetzan debo ser al menos nivel 42.", 0) 		 			clickmenu(e,j,o,3,0) return     
    elseif s == 6 and intid == 6 and L <= 34 then j:Say("Para viajar a Bahía del Botín debo ser al menos nivel 35.", 0) 			clickmenu(e,j,o,3,0) return
    elseif s == 6 and intid == 7 and L <= 9  then j:Say("Para viajar a Claro de la Luna debo ser al menos nivel 10.", 0) 			clickmenu(e,j,o,3,0) return
    elseif s == 7 and intid == 1 and L <= 57 then j:Say("Para viajar al Portal Oscuro debo ser al menos nivel 58.", 0)  			clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 2 and L <= 61 then j:Say("Para viajar a Shattrath debo ser al menos nivel 62.", 0) 		 			clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 3 and L <= 57 then j:Say("Para viajar al Bastión del Honor debo ser al menos nivel 58.", 0) 		    clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 4 and L <= 59 then j:Say("Para viajar a Telredor debo ser al menos nivel 60.", 0) 					clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 5 and L <= 62 then j:Say("Para viajar al Bastión Allerian debo ser al menos nivel 63.", 0) 			clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 6 and L <= 63 then j:Say("Para viajar a Sylvanaar debo ser al menos nivel 64.", 0) 					clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 7 and L <= 64 then j:Say("Para viajar a Telaar debo ser al menos nivel 65.", 0) 					    clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 8 and L <= 66 then j:Say("Para viajar a Flecha de la Tormenta debo ser al menos nivel 67.", 0) 		clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 9 and L <= 66 then j:Say("Para viajar a Área 52 debo ser al menos nivel 67.", 0) 					clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 10 and L <= 67 then j:Say("Para viajar al Bastión Martillo Salvaje debo ser al menos nivel 68.", 0)  clickmenu(e,j,o,4,0) return
    elseif s == 8 and intid == 1 and L <= 73 then j:Say("Para viajar a Dalaran debo ser al menos nivel 74.", 0) 					clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 2 and L <= 67 then j:Say("Para viajar a la Fortaleza Denuedo debo ser al menos nivel 68.", 0) 		clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 3 and L <= 67 then j:Say("Para viajar a Valgarde debo ser al menos nivel 68.", 0) 			        clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 4 and L <= 72 then j:Say("Para viajar al Campamento de la Brigada debo ser al menos nivel 73.", 0)   clickmenu(e,j,o,5,0) return 
    elseif s == 8 and intid == 5 and L <= 70 then j:Say("Para viajar a la Fortaleza de Hibergarde debo ser al menos nivel 71.", 0)  clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 6 and L <= 73 then j:Say("Para viajar al Mirador Brisaveloz debo ser al menos nivel 74.", 0)         clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 7 and L <= 73 then j:Say("Para viajar al Confín Argenta debo ser al menos nivel 74.", 0)             clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 8 and L <= 75 then j:Say("Para viajar al Campamento Base de Nesingwary debo ser al menos nivel 76.", 0) clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 9 and L <= 76 then j:Say("Para viajar a K3 debo ser al menos nivel 77.", 0)                          clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 10 and L <= 76 then j:Say("Para viajar a La Vanguardia Argenta debo ser al menos nivel 77.", 0)      clickmenu(e,j,o,5,0) return
    elseif s == 500 and intid == 1 and L <= 14 then j:Say("Para viajar a Cuevas de los Lamentos debo ser al menos nivel 15.", 0)    clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 2 and L <= 17 then j:Say("Para viajar a Las Minas de la Muerte debo ser al menos nivel 18.", 0)    clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 3 and L <= 21 then j:Say("Para viajar al Castillo de Colmillo Oscuro debo ser al menos nivel 22.", 0) clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 4 and L <= 21 then j:Say("Para viajar a Las Mazmorras debo ser al menos nivel 22.", 0)              clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 5 and L <= 23 then j:Say("Para viajar a Cavernas de Brazanegra debo ser al menos nivel 24.", 0)     clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 6 and L <= 28 then j:Say("Para viajar a Gnomeregan debo ser al menos nivel 29.", 0)                 clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 7 and L <= 29 then j:Say("Para viajar a Horado Rajaciento debo ser al menos nivel 30.", 0)          clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 8 and L <= 25 then j:Say("Para viajar a Monasterio Escarlata debo ser al menos nivel 26.", 0)       clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 9 and L <= 39 then j:Say("Para viajar a Zahúrda Rajaciento debo ser al menos nivel 40.", 0)         clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 10 and L <= 41 then j:Say("Para viajar a Uldaman debo ser al menos nivel 42.", 0)                   clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 11 and L <= 43 then j:Say("Para viajar a Zul'Farrak debo ser al menos nivel 44.", 0)                clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 12 and L <= 45 then j:Say("Para viajar a Maraudon debo ser al menos nivel 46.", 0)                  clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 13 and L <= 49 then j:Say("Para viajar al Templo de Atal'Hakkar debo ser al menos nivel 50.", 0)    clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 14 and L <= 51 then j:Say("Para viajar a Profundidades de Roca Negra debo ser al menos nivel 52.", 0) clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 15 and L <= 54 then j:Say("Para viajar a Cumbre de Roca Negra debo ser al menos nivel 55.", 0)      clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 16 and L <= 57 then j:Say("Para viajar a Scholomance debo ser al menos nivel 58.", 0)               clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 17 and L <= 57 then j:Say("Para viajar a Stratholme debo ser al menos nivel 58.", 0)                clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 18 and L <= 57 then j:Say("Para viajar a La Masacre debo ser al menos nivel 58.", 0)                clickmenu(e,j,o,400,0) return
    elseif s == 501 and intid == 1 and L <= 59 then j:Say("Para viajar a Murallas del Fuego Infernal debo ser al menos nivel 60.", 0) clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 2 and L <= 60 then j:Say("Para viajar al Horno de Sangre debo ser al menos nivel 61.", 0)            clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 3 and L <= 61 then j:Say("Para viajar al Recinto de los Esclavos debo ser al menos nivel 62.", 0)    clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 4 and L <= 62 then j:Say("Para viajar a La Sotiénaga debo ser al menos nivel 63.", 0)                clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 5 and L <= 63 then j:Say("Para viajar a Tumbas de Maná debo ser al menos nivel 64.", 0)              clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 6 and L <= 64 then j:Say("Para viajar a Criptas Auchenai debo ser al menos nivel 65.", 0)            clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 7 and L <= 65 then j:Say("Para viajar a Antiguas Laderas de Trabalomas debo ser al menos nivel 66.", 0) clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 8 and L <= 66 then j:Say("Para viajar a Salas Sethekk debo ser al menos nivel 67.", 0)               clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 9 and L <= 67 then j:Say("Para viajar a La Cámara de Vapor debo ser al menos nivel 68.", 0)          clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 10 and L <= 68 then j:Say("Para viajar al Laberinto de las Sombras debo ser al menos nivel 69.", 0)  clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 11 and L <= 68 then j:Say("Para viajar a Las Salas Arrasadas debo ser al menos nivel 69.", 0)        clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 12 and L <= 69 then j:Say("Para viajar a La Ciénaga Negra debo ser al menos nivel 70.", 0)           clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 13 and L <= 69 then j:Say("Para viajar al Invernáculo debo ser al menos nivel 70.", 0)               clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 14 and L <= 69 then j:Say("Para viajar al Mechanar debo ser al menos nivel 70.", 0)                  clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 15 and L <= 69 then j:Say("Para viajar al Arcatraz debo ser al menos nivel 70.", 0)                  clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 16 and L <= 69 then j:Say("Para viajar a Bancal del Magister debo ser al menos nivel 70.", 0)       clickmenu(e,j,o,401,0) return
    elseif s == 502 and intid == 1 and L <= 67 then j:Say("Para viajar a Fortaleza de Utgarde debo ser al menos nivel 68.", 0)      clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 2 and L <= 68 then j:Say("Para viajar a El Nexo debo ser al menos nivel 69.", 0)                   clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 3 and L <= 69 then j:Say("Para viajar a Azjol Nerub debo ser al menos nivel 70.", 0)               clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 4 and L <= 70 then j:Say("Para viajar a Ahn'kahet debo ser al menos nivel 71.", 0)                 clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 5 and L <= 71 then j:Say("Para viajar a la Fortaleza de Drak'Tharon debo ser al menos nivel 72.", 0) clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 6 and L <= 73 then j:Say("Para viajar a Bastión Violeta debo ser al menos nivel 74.", 0)           clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 7 and L <= 73 then j:Say("Para viajar a Gundrak debo ser al menos nivel 74.", 0)                   clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 8 and L <= 74 then j:Say("Para viajar a Cámaras de Piedra debo ser al menos nivel 75.", 0)         clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 9 and L <= 76 then j:Say("Para viajar a Cámaras de Relámpagos debo ser al menos nivel 77.", 0)     clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 10 and L <= 76 then j:Say("Para viajar a El Oculus debo ser al menos nivel 77.", 0)                clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 11 and L <= 77 then j:Say("Para viajar a La Matanza de Stratholme debo ser al menos nivel 78.", 0) clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 12 and L <= 77 then j:Say("Para viajar al Pináculo de Utgarde debo ser al menos nivel 78.", 0)     clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 13 and L <= 77 then j:Say("Para viajar a La Forja de Almas debo ser al menos nivel 78.", 0)        clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 14 and L <= 78 then j:Say("Para viajar al Foso de Saron debo ser al menos nivel 79.", 0)           clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 15 and L <= 78 then j:Say("Para viajar a Cámaras de Reflexión debo ser al menos nivel 79.", 0)     clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 16 and L <= 78 then j:Say("Para viajar a Prueba del Campeón debo ser al menos nivel 79.", 0)       clickmenu(e,j,o,402,0) return
    elseif s == 503 and L <= 59 then j:Say("Para viajar a cualquier banda clásica debo ser al menos nivel 60.", 0)                  clickmenu(e,j,o,403,0) return
    elseif s == 504 and L <= 69 then j:Say("Para viajar a cualquier banda de The Burning Crusade debo ser al menos nivel 70.", 0)   clickmenu(e,j,o,404,0) return
    elseif s == 505 and L <= 79 then j:Say("Para viajar a cualquier banda de Wrath of The Lich King debo ser nivel 80.", 0)         clickmenu(e,j,o,405,0) return
        end
    else
        if s == 6 and intid == 5 and L <= 41 then j:Say("Para viajar a Gadgetzan debo ser al menos nivel 42.", 0)                   clickmenu(e,j,o,3,0) return     
    elseif s == 6 and intid == 6 and L <= 34 then j:Say("Para viajar a Bahía del Botín debo ser al menos nivel 35.", 0)             clickmenu(e,j,o,3,0) return
    elseif s == 6 and intid == 7 and L <= 9  then j:Say("Para viajar a Claro de la Luna debo ser al menos nivel 10.", 0)            clickmenu(e,j,o,3,0) return
    elseif s == 7 and intid == 1 and L <= 57 then j:Say("Para viajar al Portal Oscuro debo ser al menos nivel 58.", 0)              clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 2 and L <= 61 then j:Say("Para viajar a Shattrath debo ser al menos nivel 62.", 0)                   clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 3 and L <= 57 then j:Say("Para viajar al Thrallmar debo ser al menos nivel 58.", 0)                  clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 4 and L <= 59 then j:Say("Para viajar a Rata del Pantano debo ser al menos nivel 60.", 0)            clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 5 and L <= 62 then j:Say("Para viajar al Bastión Rompepedras debo ser al menos nivel 63.", 0)        clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 6 and L <= 63 then j:Say("Para viajar a Bastión Señor del Trueno debo ser al menos nivel 64.", 0)    clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 7 and L <= 63 then j:Say("Para viajar a Garadar debo ser al menos nivel 64.", 0)                     clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 8 and L <= 66 then j:Say("Para viajar a La Flecha de la Tormenta debo ser al menos nivel 67.", 0)    clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 9 and L <= 66 then j:Say("Para viajar a Área 52 debo ser al menos nivel 67.", 0)                     clickmenu(e,j,o,4,0) return
    elseif s == 7 and intid == 10 and L <= 67 then j:Say("Para viajar a Aldea Sombraluna debo ser al menos nivel 68.", 0)           clickmenu(e,j,o,4,0) return
    elseif s == 8 and intid == 1 and L <= 73 then j:Say("Para viajar a Dalaran debo ser al menos nivel 74.", 0)                     clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 2 and L <= 67 then j:Say("Para viajar a Bastión Grito de Guerra debo ser al menos nivel 68.", 0)     clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 3 and L <= 67 then j:Say("Para viajar a Campo Venganza debo ser al menos nivel 68.", 0)              clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 4 and L <= 72 then j:Say("Para viajar a Bastión de la Conquista debo ser al menos nivel 73.", 0)     clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 5 and L <= 71 then j:Say("Para viajar a Rencor Venenoso debo ser al menos nivel 72.", 0)             clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 6 and L <= 73 then j:Say("Para viajar a Dominio Atracasol debo ser al menos nivel 74.", 0)           clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 7 and L <= 73 then j:Say("Para viajar al Confín Argenta debo ser al menos nivel 74.", 0)             clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 8 and L <= 75 then j:Say("Para viajar al Campamento Base de Nesingwary debo ser al menos nivel 76.", 0) clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 9 and L <= 76 then j:Say("Para viajar a K3 debo ser al menos nivel 77.", 0)                          clickmenu(e,j,o,5,0) return
    elseif s == 8 and intid == 10 and L <= 76 then j:Say("Para viajar a La Vanguardia Argenta debo ser al menos nivel 77.", 0)      clickmenu(e,j,o,5,0) return
    elseif s == 500 and intid == 1 and L <= 9 then j:Say("Para viajar a Cima Ígnea debo ser al menos nivel 10.", 0)                clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 2 and L <= 14 then j:Say("Para viajar a Cueva de los Lamentos debo ser al menos nivel 15.", 0)    clickmenu(e,j,o,400,0) return  
    elseif s == 500 and intid == 3 and L <= 17 then j:Say("Para viajar a Las Minas de la Muerte debo ser al menos nivel 18.", 0)    clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 4 and L <= 21 then j:Say("Para viajar al Castillo de Colmillo Oscuro debo ser al menos nivel 22.", 0) clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 5 and L <= 23 then j:Say("Para viajar a Cavernas de Brazanegra debo ser al menos nivel 24.", 0)     clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 6 and L <= 28 then j:Say("Para viajar a Gnomeregan debo ser al menos nivel 29.", 0)                 clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 7 and L <= 29 then j:Say("Para viajar a Horado Rajaciento debo ser al menos nivel 30.", 0)          clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 8 and L <= 25 then j:Say("Para viajar a Monasterio Escarlata debo ser al menos nivel 26.", 0)       clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 9 and L <= 39 then j:Say("Para viajar a Zahúrda Rajaciento debo ser al menos nivel 40.", 0)         clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 10 and L <= 41 then j:Say("Para viajar a Uldaman debo ser al menos nivel 42.", 0)                   clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 11 and L <= 43 then j:Say("Para viajar a Zul'Farrak debo ser al menos nivel 44.", 0)                clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 12 and L <= 45 then j:Say("Para viajar a Maraudon debo ser al menos nivel 46.", 0)                  clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 13 and L <= 49 then j:Say("Para viajar al Templo de Atal'Hakkar debo ser al menos nivel 50.", 0)    clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 14 and L <= 51 then j:Say("Para viajar a Profundidades de Roca Negra debo ser al menos nivel 52.", 0) clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 15 and L <= 54 then j:Say("Para viajar a Cumbre de Roca Negra debo ser al menos nivel 55.", 0)      clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 16 and L <= 57 then j:Say("Para viajar a Scholomance debo ser al menos nivel 58.", 0)               clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 17 and L <= 57 then j:Say("Para viajar a Stratholme debo ser al menos nivel 58.", 0)                clickmenu(e,j,o,400,0) return
    elseif s == 500 and intid == 18 and L <= 57 then j:Say("Para viajar a La Masacre debo ser al menos nivel 58.", 0)                clickmenu(e,j,o,400,0) return
    elseif s == 501 and intid == 1 and L <= 59 then j:Say("Para viajar a Murallas del Fuego Infernal debo ser al menos nivel 60.", 0) clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 2 and L <= 60 then j:Say("Para viajar al Horno de Sangre debo ser al menos nivel 61.", 0)            clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 3 and L <= 61 then j:Say("Para viajar al Recinto de los Esclavos debo ser al menos nivel 62.", 0)    clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 4 and L <= 62 then j:Say("Para viajar a La Sotiénaga debo ser al menos nivel 63.", 0)                clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 5 and L <= 63 then j:Say("Para viajar a Tumbas de Maná debo ser al menos nivel 64.", 0)              clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 6 and L <= 64 then j:Say("Para viajar a Criptas Auchenai debo ser al menos nivel 65.", 0)            clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 7 and L <= 65 then j:Say("Para viajar a Antiguas Laderas de Trabalomas debo ser al menos nivel 66.", 0) clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 8 and L <= 66 then j:Say("Para viajar a Salas Sethekk debo ser al menos nivel 67.", 0)               clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 9 and L <= 67 then j:Say("Para viajar a La Cámara de Vapor debo ser al menos nivel 68.", 0)          clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 10 and L <= 68 then j:Say("Para viajar al Laberinto de las Sombras debo ser al menos nivel 69.", 0)  clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 11 and L <= 68 then j:Say("Para viajar a Las Salas Arrasadas debo ser al menos nivel 69.", 0)        clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 12 and L <= 69 then j:Say("Para viajar a La Ciénaga Negra debo ser al menos nivel 70.", 0)           clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 13 and L <= 69 then j:Say("Para viajar al Invernáculo debo ser al menos nivel 70.", 0)               clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 14 and L <= 69 then j:Say("Para viajar al Mechanar debo ser al menos nivel 70.", 0)                  clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 15 and L <= 69 then j:Say("Para viajar al Arcatraz debo ser al menos nivel 70.", 0)                  clickmenu(e,j,o,401,0) return
    elseif s == 501 and intid == 16 and L <= 69 then j:Say("Para viajar a Bancal del Magister debo ser al menos nivel 70.", 0)       clickmenu(e,j,o,401,0) return
    elseif s == 502 and intid == 1 and L <= 67 then j:Say("Para viajar a Fortaleza de Utgarde debo ser al menos nivel 68.", 0)      clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 2 and L <= 68 then j:Say("Para viajar a El Nexo debo ser al menos nivel 69.", 0)                   clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 3 and L <= 69 then j:Say("Para viajar a Azjol Nerub debo ser al menos nivel 70.", 0)               clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 4 and L <= 70 then j:Say("Para viajar a Ahn'kahet debo ser al menos nivel 71.", 0)                 clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 5 and L <= 71 then j:Say("Para viajar a la Fortaleza de Drak'Tharon debo ser al menos nivel 72.", 0) clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 6 and L <= 73 then j:Say("Para viajar a Bastión Violeta debo ser al menos nivel 74.", 0)           clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 7 and L <= 73 then j:Say("Para viajar a Gundrak debo ser al menos nivel 74.", 0)                   clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 8 and L <= 74 then j:Say("Para viajar a Cámaras de Piedra debo ser al menos nivel 75.", 0)         clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 9 and L <= 76 then j:Say("Para viajar a Cámaras de Relámpagos debo ser al menos nivel 77.", 0)     clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 10 and L <= 76 then j:Say("Para viajar a El Oculus debo ser al menos nivel 77.", 0)                clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 11 and L <= 77 then j:Say("Para viajar a La Matanza de Stratholme debo ser al menos nivel 78.", 0) clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 12 and L <= 77 then j:Say("Para viajar al Pináculo de Utgarde debo ser al menos nivel 78.", 0)     clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 13 and L <= 77 then j:Say("Para viajar a La Forja de Almas debo ser al menos nivel 78.", 0)        clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 14 and L <= 78 then j:Say("Para viajar al Foso de Saron debo ser al menos nivel 79.", 0)           clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 15 and L <= 78 then j:Say("Para viajar a Cámaras de Reflexión debo ser al menos nivel 79.", 0)     clickmenu(e,j,o,402,0) return
    elseif s == 502 and intid == 16 and L <= 78 then j:Say("Para viajar a Prueba del Campeón debo ser al menos nivel 79.", 0)       clickmenu(e,j,o,402,0) return
    elseif s == 503 and L <= 59 then j:Say("Para viajar a cualquier banda clásica debo ser al menos nivel 60.", 0)                  clickmenu(e,j,o,403,0) return
    elseif s == 504 and L <= 69 then j:Say("Para viajar a cualquier banda de The Burning Crusade debo ser al menos nivel 70.", 0)   clickmenu(e,j,o,404,0) return
    elseif s == 505 and L <= 79 then j:Say("Para viajar a cualquier banda de Wrath of The Lich King debo ser nivel 80.", 0)         clickmenu(e,j,o,405,0) return
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
            if j:HasAura(1243) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
                else 
                    j:CastSpell(j, 1243, true) 
                    j:SendAreaTriggerMessage(buf)
                    clickmenu(e,j,o,1,0) end

    elseif
        L >= 2 and L <= 13 then 
        if j:HasAura(1244) then j:Say(ya,0)
        clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 1244, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end 

    elseif
        L >= 14 and L <= 26 then 
        if j:HasAura(1245) then j:Say(ya,0)
        clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 1245, true) 
                j:SendAreaTriggerMessage(buf)
                clickmenu(e,j,o,1,0) end 

    elseif
        L >= 27 and L <= 38 then 
        if j:HasAura(2791) then j:Say(ya,0)
        clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 2791, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end 

    elseif
        L >= 39 and L <= 50 then 
        if j:HasAura(10937) then j:Say(ya,0)
        clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 10937, true) 
                j:SendAreaTriggerMessage(buf)
                clickmenu(e,j,o,1,0) end 

    elseif
        L >= 51 and L <= 59 then 
        if j:HasAura(10938) then j:Say(ya,0)
        clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 10938, true) 
                j:SendAreaTriggerMessage(buf)
                clickmenu(e,j,o,1,0) end 

    elseif
        L >= 60 and L <= 69 then 
        if j:HasAura(25389) then j:Say(ya,0)
        clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 25389, true) 
                j:SendAreaTriggerMessage(buf)
                clickmenu(e,j,o,1,0) end             
    elseif
        L >= 70 then 
        if j:HasAura(48161) then j:Say(ya,0)
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
        then j:Say("Necesito ser al menos nivel 20.", 0)
        clickmenu(e,j,o,1,0) end

    if s == 101 and intid == 2 and L >= 20 and L <= 29 
        then if j:HasAura(14752) then j:Say(ya,0)
                clickmenu(e,j,o,1,0)             
            else 
                j:CastSpell(j, 14752, true) 
                j:SendAreaTriggerMessage(buf)
                clickmenu(e,j,o,1,0) end

    elseif L >= 30 and L <= 39 then 
        if j:HasAura(14818) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 14818, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 40 and L <= 49 then 
        if j:HasAura(14819) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 14819, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 50 and L <= 59 then 
        if j:HasAura(27841) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 27841, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 60 and L <= 69 then 
        if j:HasAura(25312) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 25312, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif
        L >= 70 then 
        if j:HasAura(48073) then j:Say(ya,0)
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
            if j:HasAura(5232) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
                else 
                    j:CastSpell(j, 5232, true) 
                    j:SendAreaTriggerMessage(buf)
                    clickmenu(e,j,o,1,0) end

    elseif L >= 10 and L <= 19 then 
        if j:HasAura(6756) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 6756, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 20 and L <= 29 then 
        if j:HasAura(5234) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 5234, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 30 and L <= 39 then 
        if j:HasAura(8907) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 8907, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 40 and L <= 49 then 
        if j:HasAura(9884) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 9884, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 50 and L <= 59 then 
        if j:HasAura(9885) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 9885, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 60 and L <= 69 then 
        if j:HasAura(26990) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 26990, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 70 then 
        if j:HasAura(48469) then j:Say(ya,0)
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
            if j:HasAura(1459) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
                else 
                    j:CastSpell(j, 1459, true) 
                    j:SendAreaTriggerMessage(buf)
                    clickmenu(e,j,o,1,0) end

    elseif L >= 4 and L <= 17 then 
        if j:HasAura(1460) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 1460, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 18 and L <= 31 then 
        if j:HasAura(1461) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 1461, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 32 and L <= 45 then 
        if j:HasAura(10156) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 10156, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 46 and L <= 59 then 
        if j:HasAura(10157) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 10157, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 60 and L <= 69 then 
        if j:HasAura(27126) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 27126, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 70 then 
        if j:HasAura(42995) then j:Say(ya,0)
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
        then j:Say("Necesito ser al menos nivel 12.", 0)
        clickmenu(e,j,o,1,0) end

    if s == 104 and intid == 5 then
        if L >= 12 and L <= 49 then  
            if j:HasAura(20217) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
                else                    
                    j:CastSpell(j, 20217, true) 
                    j:SendAreaTriggerMessage(buf)
                    clickmenu(e,j,o,1,0) end

    elseif s == 104 and intid == 5 then
        if L >= 50 then  
            if j:HasAura(25898) then j:Say(ya,0)
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
           if j:HasAura(19740) then j:Say(ya,0)
                clickmenu(e,j,o,1,0) 
               else 
                    j:CastSpell(j, 19740, true) 
                    j:SendAreaTriggerMessage(buf)
                    clickmenu(e,j,o,1,0) end

    elseif L >= 2 and L <= 11 then 
        if j:HasAura(19834) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 19834, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 12 and L <= 21 then 
        if j:HasAura(19835) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 19835, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 22 and L <= 31 then 
        if j:HasAura(19836) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 19836, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 32 and L <= 41 then 
        if j:HasAura(19837) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 19837, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 42 and L <= 49 then 
        if j:HasAura(25782) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 25782, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 50 and L <= 59 then 
        if j:HasAura(25916) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 25916, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 60 and L <= 62 then 
        if j:HasAura(27141) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 27141, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 63 and L <= 68 then 
        if j:HasAura(48933) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 48933, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 69 then 
        if j:HasAura(48934) then j:Say(ya,0)
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
            then j:Say("Necesito ser al menos nivel 4.", 0)
                 clickmenu(e,j,o,1,0) end

    if s == 106 and intid == 7 then
        if L >= 4 and L <= 13 then  
            if j:HasAura(19742) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
                else 
                    j:CastSpell(j, 19742, true) 
                    j:SendAreaTriggerMessage(buf)
                    clickmenu(e,j,o,1,0) end

    elseif L >= 14 and L <= 23 then 
        if j:HasAura(19850) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 19850, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 24 and L <= 33 then 
        if j:HasAura(19852) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 19852, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 34 and L <= 43 then 
        if j:HasAura(19853) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 19853, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 44 and L <= 49 then 
        if j:HasAura(25894) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 25894, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 50 and L <= 54 then 
        if j:HasAura(25918) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 25918, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 55 and L <= 60 then 
        if j:HasAura(27143) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 27143, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 61 and L <= 66 then 
        if j:HasAura(48937) then j:Say(ya,0)
            clickmenu(e,j,o,1,0) 
            else 
                j:CastSpell(j, 48937, true) 
                j:SendAreaTriggerMessage(buf) 
                clickmenu(e,j,o,1,0) end

    elseif L >= 67 then 
        if j:HasAura(48938) then j:Say(ya,0)
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
            j:Say("Necesito ser al menos nivel 20.", 0)
            clickmenu(e,j,o,1,0) end

    if s == 107 and intid == 8 then
        if L >= 20 and L <= 50 then  
            if j:HasAura(20911) then j:Say(ya,0)
                clickmenu(e,j,o,1,0) 
            else 
                    j:CastSpell(j, 20911, true) 
                    j:SendAreaTriggerMessage(buf)
                    clickmenu(e,j,o,1,0) end

    elseif s == 107 and intid == 8 then
        if L >= 51 then  
            if j:HasAura(25899) then j:Say(ya,0)
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