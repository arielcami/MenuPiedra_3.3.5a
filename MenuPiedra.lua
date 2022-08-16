--[[ 
        Ariel Camilo // ariel.cami@gmail.com // 16 de Agosto 2022  

    No se puede usar en combate.

    Los buffos son personales y van variando de acuerdo al nivel.
    Si te bufeas con Bendición de poderío al nivel 40, recibes el buff de ese nivel. 
    
    La comida que se obtiene al solicitar comida y bebida, son las comidas mágicas del Mago, 
    y también van mejorando con el nivel del solicitante.

    Si no usas maná, no te da agua, por ej, si eres Pícaro o Guerrero, no tiene sentido darte agua para beber.

    En el caso de que seas Paladín, si te buffeas usando el Script con Poderío, Reyes, Salvaguardia o Sabiduría,
    este buff contará como propio, y no podrás acumularlo con otra bendición de tu libro de hechizos.

    La Alianza tiene un Menú diferente a la Horda, si deseas agregar más destinos, no olvides agregarlos también a la tabla de la Horda.
]]

local ic,ix,cc = {
    '|TInterface\\Icons\\Ability_Paladin_BeaconofLight.blp:35:35:-21|t',            -- 1 Buffs
    '|TInterface\\Icons\\Spell_Shadow_Teleport.blp:35:35:-21|t',                    -- 2 Teleportes
    '|TInterface\\Icons\\Ability_Mage_ConjureFoodRank10.blp:35:35:-21|t',           -- 3 Comida y bebida
    '|TInterface\\Icons\\Spell_Nature_FarSight.blp:45:45:-21|t',                    -- 4 Azeroth
    '|TInterface\\LFGFrame\\LFGICON-BLACKTEMPLE.BLP:45:45:-21|t',                   -- 5 Terrallende
    '|TInterface\\ICONS\\Achievement_Boss_LichKing.blp:45:45:-21|t',                -- 6 Rasganorte
    '|TInterface\\Icons\\Spell_Arcane_TeleportStormWind.blp:30:30:-21|t',           -- 7 Ventormenta
    '|TInterface\\Icons\\Spell_Arcane_TeleportExodar.blp:30:30:-21|t',              -- 8 El Exodar
    '|TInterface\\Icons\\Spell_Arcane_TeleportDarnassus.blp:30:30:-21|t',           -- 9 Darnassus
    '|TInterface\\Icons\\Spell_Arcane_TeleportIronForge.blp:30:30:-21|t',           -- 10 Forjaz
    '|TInterface\\Icons\\Spell_Arcane_TeleportOrgrimmar.blp:30:30:-21|t',           -- 11 Orgrimmar
    '|TInterface\\Icons\\Spell_Arcane_TeleportThunderBluff.blp:30:30:-21|t',        -- 12 Cima del Trueno
    '|TInterface\\Icons\\Spell_Arcane_TeleportUnderCity.blp:30:30:-21|t',           -- 13 Entrañas
    '|TInterface\\Icons\\Spell_Arcane_TeleportSilvermoon.blp:30:30:-21|t',          -- 14 Ciudad de Lunargenta
    '|TInterface\\Icons\\INV_Gizmo_02.blp:30:30:-21|t',                             -- 15 Gadgetzan
    '|TInterface\\Icons\\Ability_Spy.blp:30:30:-21|t',                              -- 16 Bahía del botín
    '|TInterface\\Icons\\SPELL_ARCANE_TELEPORTMOONGLADE.BLP:30:30:-21|t',           -- 17 Claro de luna
    '|TInterface\\Icons\\Spell_Holy_WordFortitude.blp:30:30:-21|t',                 -- 18 Palabra de poder: entereza
    '|TInterface\\Icons\\Spell_Holy_DivineSpirit.blp:30:30:-21|t',                  -- 19 Espíritu divino
    '|TInterface\\Icons\\Spell_Nature_Regeneration.blp:30:30:-21|t',                -- 20 Marca de lo salvaje
    '|TInterface\\Icons\\Spell_Holy_MagicalSentry.blp:30:30:-21|t',                 -- 21 Intelecto Arcano
    '|TInterface\\Icons\\Spell_Magic_GreaterBlessingofKings.blp:30:30:-21|t',       -- 22 Bendición de Reyes superior
    '|TInterface\\Icons\\Spell_Holy_GreaterBlessingofKings.blp:30:30:-21|t',        -- 23 Bendición de Poderío superior
    '|TInterface\\Icons\\Spell_Holy_GreaterBlessingofWisdom.blp:30:30:-21|t',       -- 24 Bendición de Sabiduría superior
    '|TInterface\\Icons\\Spell_Holy_GreaterBlessingofSanctuary.blp:30:30:-21|t'     -- 25 Bendición de Salvaguardia superior
    },'|TInterface\\Icons\\Spell_Shadow_Teleport.blp:15:15:-21|t', "¿Deseas viajar"

local MENU_A = {
    [1000]={
        {8, ic[18].."Palabra de poder: entereza",   1, 1},
        {8, ic[19].."Espíritu divino",              1, 2},
        {8, ic[20].."Marca de lo salvaje",          1, 3},
        {8, ic[21].."Intelecto arcano",             1, 4},
        {8, ic[22].."Bendición de reyes",           1, 5},
        {8, ic[23].."Bendición de poderío",         1, 6},
        {8, ic[24].."Bendición de sabiduría",       1, 7},
        {8, ic[25].."Bendición de salvaguardia",    1, 8},
        {0, "...Atrás",                     0, 0}},
    [2000]={       
        {8, ic[4].."Azeroth",       2, 1},
        {8, ic[5].."Terrallende",   2, 2},
        {8, ic[6].."Rasganorte",    2, 3},
        {8, ix.."Mazmorras",        2, 4},
        {8, ix.."Bandas",           2, 5},
        {7, "...Atrás",     0, 0}},
    [2]={
        [1]={--Azeroth
            {8, ix.."5. Ventormenta",           3, 1, false, cc.." a Ventormenta?"},
            {8, ix.."5. El Exodar",             3, 2, false, cc.." a El Exodar?"},
            {8, ix.."5. Darnassus",             3, 3, false, cc.." a Darnassus?"},
            {8, ix.."5. Forjaz",                3, 4, false, cc.." a Forjaz?"},
            {8, ix.."40. Gadgetzan",            3, 5, false, cc.." a Gadgetzan?"},
            {8, ix.."35. Bahía del Botín",      3, 6, false, cc.." a Bahía del Botín?"},
            {8, ix.."10. Claro de la Luna",     3, 7, false, cc.." a Claro de la luna?"},
            {7, "...Atrás",      2000, 0}},
        [2]={--Terrallende
            {8, ix.."58. Portal Oscuro",                            3, 8, false,  cc.." al Portal Oscuro?"},
            {8, ix.."60. Ciudad de Shattrath",                      3, 9, false,  cc.." a Shattrath?"},
            {8, ix.."58. Península de Fuego Infernal",              3, 10, false, cc.." a Península de Fuego Infernal?"},
            {8, ix.."59. Marisma de Zangar",                        3, 11, false, cc.." a Marisma de Zangar?"},
            {8, ix.."61. Bosque de Terokkar",                       3, 12, false, cc.." a Bosque de Terokkar?"},
            {8, ix.."63. Montañas Filospada",                       3, 13, false, cc.." a Montañas Filospada?"},
            {8, ix.."64. Nagrand",                                  3, 14, false, cc.." a Nagrand?"},
            {8, ix.."66. Flecha de la Tormenta",                    3, 15, false, cc.." a Tormenta Abisal?"},
            {8, ix.."67. Área 52",                                  3, 16, false, cc.." a Área 52?"}, 
            {8, ix.."68. Valle Sombraluna",                         3, 17, false, cc.." al Valle Sombraluna?"},
            {7, "...Atrás", 2000, 0}},
        [3]={--Rasganorte
            {8, ix.."74. Ciudad de Dalaran",        3, 18, false, cc.." a Dalaran?"},
            {8, ix.."68. Tundra Boreal",            3, 19, false, cc.." a Tundra Boreal?"},
            {8, ix.."68. Fiordo Aquilonal",         3, 20, false, cc.." a Fiordo Aquilonal?"},
            {8, ix.."71. Cementerio de Dragones",   3, 21, false, cc.." a Cementerio de Dragones?"},
            {8, ix.."73. Colinas Pardas",           3, 22, false, cc.." a Colinas Pardas?"},             
            {8, ix.."74. Bosque Canto de Cristal",  3, 23, false, cc.." a Bosque Canto de Cristal?"},
            {8, ix.."75. Zul'Drak",                 3, 24, false, cc.." a Zul'Drak?"},
            {8, ix.."76. Cuenca de Sholazar",       3, 25, false, cc.." a Cuenca de Sholazar?"},
            {8, ix.."77. Cumbres Tormentosas",      3, 26, false, cc.." a Cumbres Tormentosas?"},
            {8, ix.."78. Corona de Hielo",          3, 27, false, cc.." a Corona de Hielo?"},
            {7, "...Atrás", 2000, 0}},
        [4]={--Mazmorras
            {8, ix.."Clásicas",                 6, 1},
            {8, ix.."The Burning Crusade",      6, 2},
            {8, ix.."Wrath of the Lich King",   6, 3},
            {7,"...Atrás", 2000, 0}},
        [5]={--Bandas
            {8, ix.."Clásicas",                 6, 4},
            {8, ix.."The Burning Crusade",      6, 5},
            {8, ix.."Wrath of the Lich King",   6, 6},
            {7,"...Atrás", 2000, 0}},    
    },

    [6]={--Mazmorras
            [1]={--Clásicas
                {8, ix.."15. Las Cuevas de los Lamentos",   3, 29, false,  cc.." a Las Cuevas de los Lamentos"},
                {8, ix.."18. Las Minas de la Muerte",       3, 30, false,  cc.." a Las Minas de la Muerte?"},
                {8, ix.."22. Castillo de Colmillo Oscuro",  3, 31, false,  cc.." al Castillo de Colmillo Oscuro?"},
                {8, ix.."22. Las Mazmorras de Ventormenta", 3, 28, false,  cc.." a Las Mazmorras de Ventormenta?"},
                {8, ix.."24. Cavernas de Brazanegra",       3, 32, false,  cc.." a Cavernas de Brazanegra?"},
                {8, ix.."29. Gnomeregan",                   3, 33, false,  cc.." a Gnomeregan?"},
                {8, ix.."30. Horado Rajaciento",            3, 34, false,  cc.." a Horado Rajaciento?"},
                {8, ix.."26-35. Monasterio Escarlata",      3, 35, false,  cc.." al Monasterio Escarlata?"}, 
                {8, ix.."40. Zahúrda Rajaciento",           3, 36, false,  cc.." a Zahúrda Rajaciento?"},
                {8, ix.."42. Uldaman",                      3, 37, false, cc.." a Uldaman?"},
                {8, ix.."44. Zul'Farrak",                   3, 38, false, cc.." a Zul'Farrak?"},
                {8, ix.."46-48. Maraudon",                  3, 39, false, cc.." a Maraudon?"},
                {8, ix.."50. El Templo de Atal'Hakkar",     3, 40, false, cc.." al Templo de Atal'Hakkar?"},
                {8, ix.."52. Profundidades de Roca Negra",  3, 41, false, cc.." a Profundidades de Roca Negra?"},
                {8, ix.."55-58. Cumbre de Roca Negra",      3, 42, false, cc.." a Cumbre de Roca Negra?"},
                {8, ix.."58. Scholomance",                  3, 43, false, cc.." a Scholomance?"},
                {8, ix.."58. Stratholme",                   3, 44, false, cc.." a Stratholme?"},
                {8, ix.."58. La Masacre",                   3, 45, false, cc.." a La Masacre?"},
                {7,"...Atrás", 2, 4}},
            [2]={--The Burning Crusade 
                {8, ix.."60. Murallas del Fuego Infernal",      3, 46, false, cc.." a Murallas del Fuego Infernal?"},    
                {8, ix.."61. El Horno de Sangre",               3, 47, false, cc.." al Horno de Sangre?"},
                {8, ix.."62. Recinto de los Esclavos",          3, 48, false, cc.." al Recinto de los Esclavos?"},
                {8, ix.."63. La Sotiénaga",                     3, 49, false, cc.." a La Sotiénaga?"},        
                {8, ix.."64. Tumbas de Maná",                   3, 50, false, cc.." a Tumbas de Maná?"},
                {8, ix.."65. Criptas Auchenai",                 3, 51, false, cc.." a Criptas Auchenai?"},
                {8, ix.."66. Antiguas Laderas de Trabalomas",   3, 52, false, cc.." a Antiguas Laderas de Trabalomas?"},
                {8, ix.."67. Salas Sethekk",                    3, 53, false, cc.." a Salas Sethekk?"}, 
                {8, ix.."68. La Cámara de Vapor",               3, 54, false, cc.." a La Cámara de Vapor?"},
                {8, ix.."69. El Laberinto de las Sombras",      3, 55, false, cc.." al Laberinto de las Sombras?"},
                {8, ix.."69. Las Salas Arrasadas",              3, 56, false, cc.." a Las Salas Arrasadas?"},
                {8, ix.."70. La Ciénaga Negra",                 3, 57, false, cc.." a La Ciénaga Negra?"},
                {8, ix.."70. El Invernáculo",                   3, 58, false, cc.." al Invernáculo?"},
                {8, ix.."70. El Mechanar",                      3, 59, false, cc.." al Mechanar?"},
                {8, ix.."70. El Arcatraz",                      3, 60, false, cc.." al Arcatraz?"},
                {8, ix.."70. Bancal del Magister",              3, 61, false, cc.." a Bancal del Magister?"},
                {7,"...Atrás", 2, 4}},
            [3]={
                {8, ix.."68. Fortaleza de Utgarde",             3, 62, false, cc.." a Fortaleza de Utgarde?"},
                {8, ix.."69. El Nexo",                          3, 63, false, cc.." al Nexo?"},
                {8, ix.."70. Azjol-Nerub",                      3, 64, false, cc.." a Azjol-Nerub?"},
                {8, ix.."71. Ahn'kahet: El Antiguo Reino",      3, 65, false, cc.." a Ahn'kahet: El Antiguo Reino?"},
                {8, ix.."72. Fortaleza de Drak'Tharon",         3, 66, false, cc.." a la Fortaleza de Drak'Tharon?"},
                {8, ix.."74. El Bastión Violeta",               3, 67, false, cc.." al Bastión Violeta?"},
                {8, ix.."74. Gundrak",                          3, 68, false, cc.." a Gundrak?"},
                {8, ix.."75. Cámaras de Piedra",                3, 69, false, cc.." a Cámaras de Piedra?"},
                {8, ix.."77. Cámaras de Relámpagos",            3, 70, false, cc.." a Cámaras de Relámpagos?"},
                {8, ix.."77. El Oculus",                        3, 71, false, cc.." al Oculus?"},
                {8, ix.."78. La Matanza de Stratholme",         3, 72, false, cc.." a La Matanza de Stratholme?"},
                {8, ix.."78. Pináculo de Utgarde",              3, 73, false, cc.." a Pináculo de Utgarde?"},
                {8, ix.."78. La Forja de Almas",                3, 74, false, cc.." a La Forja de Almas?"},
                {8, ix.."79. Foso de Saron",                    3, 75, false, cc.." al Foso de Saron?"},
                {8, ix.."79. Cámaras de Reflexión",             3, 76, false, cc.." a las Cámaras de Reflexión?"},
                {8, ix.."79. Prueba del Campeón",               3, 77, false, cc.." a la Prueba del Campeón?"},
                {7,"...Atrás", 2, 4}},
            [4]={--Bandas Clásicas
                {8, ix.."60. Zul'Gurub",                        3, 78, false, cc.." a Zul'Gurub?"},
                {8, ix.."60. Ruinas de Ahn'Qiraj (20 Man)",     3, 79, false, cc.." a Ruinas de Ahn'Qiraj (20 Man)?"},
                {8, ix.."60. Ahn'Qiraj (40 Man)",               3, 80, false, cc.." a Ahn'Qiraj (40 Man)?"},
                {8, ix.."60. T1: Núcleo de Magma",              3, 81, false, cc.." al Núcleo de Magma?"},
                {8, ix.."60. T2: Guarida de Alanegra",          3, 82, false, cc.." a Guarida de Alanegra?"},        
                {7,"...Atrás", 2, 5}}, 
            [5]={--Bandas TBC
                {8, ix.."70. Zul'Aman",                         3, 83, false, cc.." a Zul'Aman?"},
                {8, ix.."70. T4: Karazhan",                     3, 84, false, cc.." a Karazhan?"},
                {8, ix.."70. T4: Guarida de Gruul",             3, 85, false, cc.." a la Guarida de Gruul?"},
                {8, ix.."70. T4: Guarida de Magtheridon",       3, 86, false, cc.." a la Guarida de Magtheridon?"},
                {8, ix.."70. T5: Caverna Santuario Serpiente",  3, 87, false, cc.." a Caverna Santuario Serpiente?"},
                {8, ix.."70. T5: El Castillo de la Tempestad",  3, 88, false, cc.." al Castillo de la Tempestad?"},
                {8, ix.."70. T6: La Cima Hyjal",                3, 89, false, cc.." a La Cima Hyjal?"},
                {8, ix.."70. T6: El Templo Oscuro",             3, 90, false, cc.." al Templo Oscuro?"},
                {8, ix.."70. T6: Meseta de La Fuente del Sol",  3, 91, false, cc.." a Meseta de La Fuente del Sol?"},        
                {7,"...Atrás", 2, 5}},
            [6]={--Bandas WOTLK
                {8, ix.."80. El Ojo de la Eternidad",                   3, 92, false, cc.." al Ojo de la Eternidad?"},
                {8, ix.."80. T7: Naxxramas",                            3, 93, false, cc.." a Naxxramas?"},
                {8, ix.."80. T7: El Sagrario Obsidiana",                3, 94, false, cc.." al Sagrario Obsidiana?"},
                {8, ix.."80. T8: Ulduar",                               3, 95, false, cc.." a Ulduar?"},
                {8, ix.."80. T9: Prueba del Cruzado",                   3, 96, false, cc.." a la Prueba del Cruzado?"},
                {8, ix.."80. T9/10: La Cámara de Archavon",             3, 97, false, cc.." a la Cámara de Archavon?"},
                {8, ix.."80. T10: I.C.C.",                              3, 98, false, cc.." a Ciudadela de la Corona de Hielo?"},
                {8, ix.."80. El Sagrario Rubí",                         3, 99, false, cc.." a El Sagrario Rubí?"},
                {7,"...Atrás", 2, 5}},            
        },

    [3000]={
        {5349,   5350}, 
        {1113,   2288},
        {1114,   2136},
        {1487,   3772},
        {8075,   8077},
        {8076,   8078},
        {22895,  8079},
        {22895, 30703},
        {34062,   nil},
        {43518,   nil},
        {43523,   nil},},
}

local MENU_H = {
    [1000]={
        {8, ic[18].."Palabra de poder: entereza",   1, 1},
        {8, ic[19].."Espíritu divino",              1, 2},
        {8, ic[20].."Marca de lo salvaje",          1, 3},
        {8, ic[21].."Intelecto arcano",             1, 4},
        {8, ic[22].."Bendición de reyes",           1, 5},
        {8, ic[23].."Bendición de poderío",         1, 6},
        {8, ic[24].."Bendición de sabiduría",       1, 7},
        {8, ic[25].."Bendición de salvaguardia",    1, 8},
        {0, "...Atrás",                     0, 0}},
    [2000]={       
        {8, ic[4].."Azeroth",       2, 1},
        {8, ic[5].."Terrallende",   2, 2},
        {8, ic[6].."Rasganorte",    2, 3},
        {8, ix.."Mazmorras",        2, 4},
        {8, ix.."Bandas",           2, 5},
        {7, "...Atrás",     0, 0}},
    [2]={
        [1]={--Azeroth
            {8, ix.."5. Orgrimmar",             3, 1, false, cc.." a Orgrimmar?"},
            {8, ix.."5. Cima del Trueno",       3, 2, false, cc.." a Cima del Trueno?"},
            {8, ix.."5. Entrañas",              3, 3, false, cc.." a Entrañas?"},
            {8, ix.."5. Ciudad de Lunargenta",  3, 4, false, cc.." a la Ciudad de Lunargenta?"},
            {8, ix.."40. Gadgetzan",            3, 5, false, cc.." a Gadgetzan?"},
            {8, ix.."35. Bahía del Botín",      3, 6, false, cc.." a Bahía del Botín?"},
            {8, ix.."10. Claro de la Luna",     3, 7, false, cc.." a Claro de la luna?"},
            {7, "...Atrás",      2000, 0}},
        [2]={--Terrallende
            {8, ix.."58. Portal Oscuro",                            3, 8, false,  cc.." al Portal Oscuro?"},
            {8, ix.."60. Ciudad de Shattrath",                      3, 9, false,  cc.." a Shattrath?"},
            {8, ix.."58. Península de Fuego Infernal",              3, 10, false, cc.." a Península de Fuego Infernal?"},
            {8, ix.."59. Marisma de Zangar",                        3, 11, false, cc.." a Marisma de Zangar?"},
            {8, ix.."61. Bosque de Terokkar",                       3, 12, false, cc.." a Bosque de Terokkar?"},
            {8, ix.."63. Montañas Filospada",                       3, 13, false, cc.." a Montañas Filospada?"},
            {8, ix.."64. Nagrand",                                  3, 14, false, cc.." a Nagrand?"},
            {8, ix.."66. Flecha de la Tormenta",                    3, 15, false, cc.." a Tormenta Abisal?"},
            {8, ix.."67. Área 52",                                  3, 16, false, cc.." a Área 52?"}, 
            {8, ix.."68. Valle Sombraluna",                         3, 17, false, cc.." al Valle Sombraluna?"},
            {7, "...Atrás", 2000, 0}},
        [3]={--Rasganorte
            {8, ix.."74. Ciudad de Dalaran",        3, 18, false, cc.." a Dalaran?"},
            {8, ix.."68. Tundra Boreal",            3, 19, false, cc.." a Tundra Boreal?"},
            {8, ix.."68. Fiordo Aquilonal",         3, 20, false, cc.." a Fiordo Aquilonal?"},
            {8, ix.."71. Cementerio de Dragones",   3, 21, false, cc.." a Cementerio de Dragones?"},
            {8, ix.."73. Colinas Pardas",           3, 22, false, cc.." a Colinas Pardas?"},             
            {8, ix.."74. Bosque Canto de Cristal",  3, 23, false, cc.." a Bosque Canto de Cristal?"},
            {8, ix.."75. Zul'Drak",                 3, 24, false, cc.." a Zul'Drak?"},
            {8, ix.."76. Cuenca de Sholazar",       3, 25, false, cc.." a Cuenca de Sholazar?"},
            {8, ix.."77. Cumbres Tormentosas",      3, 26, false, cc.." a Cumbres Tormentosas?"},
            {8, ix.."78. Corona de Hielo",          3, 27, false, cc.." a Corona de Hielo?"},
            {7, "...Atrás", 2000, 0}},
        [4]={--Mazmorras
            {8, ix.."Clásicas",                 6, 1},
            {8, ix.."The Burning Crusade",      6, 2},
            {8, ix.."Wrath of the Lich King",   6, 3},
            {7,"...Atrás", 2000, 0}},
        [5]={--Bandas
            {8, ix.."Clásicas",                 6, 4},
            {8, ix.."The Burning Crusade",      6, 5},
            {8, ix.."Wrath of the Lich King",   6, 6},
            {7,"...Atrás", 2000, 0}},    
    },

    [6]={--Mazmorras
            [1]={--Clásicas
                {8, ix.."10. Cima ígnea",                   3, 28, false,  cc.." a Cima ígnea?"},               
                {8, ix.."15. Las Cuevas de los Lamentos",   3, 29, false,  cc.." a Las Cuevas de los Lamentos"},
                {8, ix.."18. Las Minas de la Muerte",       3, 30, false,  cc.." a Las Minas de la Muerte?"},
                {8, ix.."22. Castillo de Colmillo Oscuro",  3, 31, false,  cc.." al Castillo de Colmillo Oscuro?"},                
                {8, ix.."24. Cavernas de Brazanegra",       3, 32, false,  cc.." a Cavernas de Brazanegra?"},
                {8, ix.."29. Gnomeregan",                   3, 33, false,  cc.." a Gnomeregan?"},
                {8, ix.."30. Horado Rajaciento",            3, 34, false,  cc.." a Horado Rajaciento?"},
                {8, ix.."26-35. Monasterio Escarlata",      3, 35, false,  cc.." al Monasterio Escarlata?"}, 
                {8, ix.."40. Zahúrda Rajaciento",           3, 36, false,  cc.." a Zahúrda Rajaciento?"},
                {8, ix.."42. Uldaman",                      3, 37, false, cc.." a Uldaman?"},
                {8, ix.."44. Zul'Farrak",                   3, 38, false, cc.." a Zul'Farrak?"},
                {8, ix.."46-48. Maraudon",                  3, 39, false, cc.." a Maraudon?"},
                {8, ix.."50. El Templo de Atal'Hakkar",     3, 40, false, cc.." al Templo de Atal'Hakkar?"},
                {8, ix.."52. Profundidades de Roca Negra",  3, 41, false, cc.." a Profundidades de Roca Negra?"},
                {8, ix.."55-58. Cumbre de Roca Negra",      3, 42, false, cc.." a Cumbre de Roca Negra?"},
                {8, ix.."58. Scholomance",                  3, 43, false, cc.." a Scholomance?"},
                {8, ix.."58. Stratholme",                   3, 44, false, cc.." a Stratholme?"},
                {8, ix.."58. La Masacre",                   3, 45, false, cc.." a La Masacre?"},
                {7,"...Atrás", 2, 4}},
            [2]={--Mazmorras The Burning Crusade 
                {8, ix.."60. Murallas del Fuego Infernal",      3, 46, false, cc.." a Murallas del Fuego Infernal?"},    
                {8, ix.."61. El Horno de Sangre",               3, 47, false, cc.." al Horno de Sangre?"},
                {8, ix.."62. Recinto de los Esclavos",          3, 48, false, cc.." al Recinto de los Esclavos?"},
                {8, ix.."63. La Sotiénaga",                     3, 49, false, cc.." a La Sotiénaga?"},        
                {8, ix.."64. Tumbas de Maná",                   3, 50, false, cc.." a Tumbas de Maná?"},
                {8, ix.."65. Criptas Auchenai",                 3, 51, false, cc.." a Criptas Auchenai?"},
                {8, ix.."66. Antiguas Laderas de Trabalomas",   3, 52, false, cc.." a Antiguas Laderas de Trabalomas?"},
                {8, ix.."67. Salas Sethekk",                    3, 53, false, cc.." a Salas Sethekk?"}, 
                {8, ix.."68. La Cámara de Vapor",               3, 54, false, cc.." a La Cámara de Vapor?"},
                {8, ix.."69. El Laberinto de las Sombras",      3, 55, false, cc.." al Laberinto de las Sombras?"},
                {8, ix.."69. Las Salas Arrasadas",              3, 56, false, cc.." a Las Salas Arrasadas?"},
                {8, ix.."70. La Ciénaga Negra",                 3, 57, false, cc.." a La Ciénaga Negra?"},
                {8, ix.."70. El Invernáculo",                   3, 58, false, cc.." al Invernáculo?"},
                {8, ix.."70. El Mechanar",                      3, 59, false, cc.." al Mechanar?"},
                {8, ix.."70. El Arcatraz",                      3, 60, false, cc.." al Arcatraz?"},
                {8, ix.."70. Bancal del Magister",              3, 61, false, cc.." a Bancal del Magister?"},
                {7,"...Atrás", 2, 4}},
            [3]={--Mazmorras Wrath of The Lich King
                {8, ix.."68. Fortaleza de Utgarde",             3, 62, false, cc.." a Fortaleza de Utgarde?"},
                {8, ix.."69. El Nexo",                          3, 63, false, cc.." al Nexo?"},
                {8, ix.."70. Azjol-Nerub",                      3, 64, false, cc.." a Azjol-Nerub?"},
                {8, ix.."71. Ahn'kahet: El Antiguo Reino",      3, 65, false, cc.." a Ahn'kahet: El Antiguo Reino?"},
                {8, ix.."72. Fortaleza de Drak'Tharon",         3, 66, false, cc.." a la Fortaleza de Drak'Tharon?"},
                {8, ix.."74. El Bastión Violeta",               3, 67, false, cc.." al Bastión Violeta?"},
                {8, ix.."74. Gundrak",                          3, 68, false, cc.." a Gundrak?"},
                {8, ix.."75. Cámaras de Piedra",                3, 69, false, cc.." a Cámaras de Piedra?"},
                {8, ix.."77. Cámaras de Relámpagos",            3, 70, false, cc.." a Cámaras de Relámpagos?"},
                {8, ix.."77. El Oculus",                        3, 71, false, cc.." al Oculus?"},
                {8, ix.."78. La Matanza de Stratholme",         3, 72, false, cc.." a La Matanza de Stratholme?"},
                {8, ix.."78. Pináculo de Utgarde",              3, 73, false, cc.." a Pináculo de Utgarde?"},
                {8, ix.."78. La Forja de Almas",                3, 74, false, cc.." a La Forja de Almas?"},
                {8, ix.."79. Foso de Saron",                    3, 75, false, cc.." al Foso de Saron?"},
                {8, ix.."79. Cámaras de Reflexión",             3, 76, false, cc.." a las Cámaras de Reflexión?"},
                {8, ix.."79. Prueba del Campeón",               3, 77, false, cc.." a la Prueba del Campeón?"},
                {7,"...Atrás", 2, 4}},
            [4]={--Bandas Clásicas
                {8, ix.."60. Zul'Gurub",                        3, 78, false, cc.." a Zul'Gurub?"},
                {8, ix.."60. Ruinas de Ahn'Qiraj (20 Man)",     3, 79, false, cc.." a Ruinas de Ahn'Qiraj (20 Man)?"},
                {8, ix.."60. Ahn'Qiraj (40 Man)",               3, 80, false, cc.." a Ahn'Qiraj (40 Man)?"},
                {8, ix.."60. T1: Núcleo de Magma",              3, 81, false, cc.." al Núcleo de Magma?"},
                {8, ix.."60. T2: Guarida de Alanegra",          3, 82, false, cc.." a Guarida de Alanegra?"},        
                {7,"...Atrás", 2, 5}}, 
            [5]={--Bandas TBC
                {8, ix.."70. Zul'Aman",                         3, 83, false, cc.." a Zul'Aman?"},
                {8, ix.."70. T4: Karazhan",                     3, 84, false, cc.." a Karazhan?"},
                {8, ix.."70. T4: Guarida de Gruul",             3, 85, false, cc.." a la Guarida de Gruul?"},
                {8, ix.."70. T4: Guarida de Magtheridon",       3, 86, false, cc.." a la Guarida de Magtheridon?"},
                {8, ix.."70. T5: Caverna Santuario Serpiente",  3, 87, false, cc.." a Caverna Santuario Serpiente?"},
                {8, ix.."70. T5: El Castillo de la Tempestad",  3, 88, false, cc.." al Castillo de la Tempestad?"},
                {8, ix.."70. T6: La Cima Hyjal",                3, 89, false, cc.." a La Cima Hyjal?"},
                {8, ix.."70. T6: El Templo Oscuro",             3, 90, false, cc.." al Templo Oscuro?"},
                {8, ix.."70. T6: Meseta de La Fuente del Sol",  3, 91, false, cc.." a Meseta de La Fuente del Sol?"},        
                {7,"...Atrás", 2, 5}},
            [6]={--Bandas WOTLK
                {8, ix.."80. El Ojo de la Eternidad",                   3, 92, false, cc.." al Ojo de la Eternidad?"},
                {8, ix.."80. T7: Naxxramas",                            3, 93, false, cc.." a Naxxramas?"},
                {8, ix.."80. T7: El Sagrario Obsidiana",                3, 94, false, cc.." al Sagrario Obsidiana?"},
                {8, ix.."80. T8: Ulduar",                               3, 95, false, cc.." a Ulduar?"},
                {8, ix.."80. T9: Prueba del Cruzado",                   3, 96, false, cc.." a la Prueba del Cruzado?"},
                {8, ix.."80. T9/10: La Cámara de Archavon",             3, 97, false, cc.." a la Cámara de Archavon?"},
                {8, ix.."80. T10: I.C.C.",                              3, 98, false, cc.." a Ciudadela de la Corona de Hielo?"},
                {8, ix.."80. El Sagrario Rubí",                         3, 99, false, cc.." a El Sagrario Rubí?"},
                {7,"...Atrás", 2, 5}},            
        },
    [3000]={
        {5349,   5350}, 
        {1113,   2288},
        {1114,   2136},
        {1487,   3772},
        {8075,   8077},
        {8076,   8078},
        {22895,  8079},
        {22895, 30703},
        {34062,   nil},
        {43518,   nil},
        {43523,   nil}}}

    local function buff1(n) --Palabra de poder: entereza
        if n==1 then return 1 elseif n>= 2 and n<=13 then return 2 elseif n>=14 and n<=26 then return 3 elseif n>=27 and n<=38 then return 4
        elseif n>=39 and n<=50 then return 5 elseif n>=51 and n<=59 then return 6 elseif n>=60 and n<=69 then return 7 elseif n>=70 then return 8
        end
    end

    local function buff2(n) --Espíritu divino
        if n<=19 then return 0 elseif n>=20 and n<=29 then return 1 elseif n>=30 and n<=39 then return 2 elseif n>=40 and n<=49 then return 3
        elseif n>=50 and n<=59 then return 4 elseif n>=60 and n<=69 then return 5 elseif n>=70 and n<=80 then return 6
        end
    end

    local function buff3(n) --Marca de lo salvaje
        if n<=9 then return 1 elseif n>=10 and n<=19 then return 2 elseif n>=20 and n<=29 then return 3 elseif n>=30 and n<=39 then return 4 
        elseif n>=40 and n<=49 then return 5 elseif n>=50 and n<=59 then return 6 elseif n>=60 and n<=69 then return 7 elseif n>=70 then return 8 end
    end

    local function buff4(n) --Intelecto arcano
        if n<=3 then return 1 elseif n>=4 and n<=17 then return 2 elseif n>=18 and n<=31 then return 3 elseif n>=32 and n<=45 then return 4
        elseif n>=46 and n<=59 then return 5 elseif n>=60 and n<=69 then return 6 elseif n>=70 then return 7 end
    end

    local function buff5(n) --Bendición de reyes
        if n<=11 then return 0 elseif n>=12 and n<=49 then return 1 elseif n>=50 then return 2 end
    end

    local function buff6(n) --Bendición de poderío
        if n==1 then return 1 elseif n>=2 and n<=11 then return 2 elseif n>=12 and n<=21 then return 3 elseif n>=22 and n<=31 then return 4
        elseif n>=32 and n<=41 then return 5 elseif n>=42 and n<=49 then return 6 elseif n>=50 and n<=59 then return 7 elseif n>=60 and n<=62 then return 8
        elseif n>=63 and n<=68 then return 9 elseif n>=69 then return 10 end
    end

    local function buff7(n) --Bendición de sabiduría
        if n<=3 then return 0 elseif n>=4 and n<=13 then return 1 elseif n>=14 and n<=23 then return 2 elseif n>=24 and n<=33 then return 3
        elseif n>=34 and n<=43 then return 4 elseif n>=44 and n<=49 then return 5 elseif n>=50 and n<=54 then return 6 elseif n>=55 and n<=60 then return 7
        elseif n>=61 and n<=66 then return 8 elseif n>=67 then return 9 end
    end

    local function buff8(n) --Bendición de sabiduría
        if n<=19 then return 0 elseif n>=20 and n<=50 then return 1 elseif n>=51 then return 2 end
    end

local BUFF = {
    [1]={1243,1244,1245,2791,10937,10938,25389,48161},
    [2]={14752,14818,14819,27841,25312,48073},
    [3]={5232,6756,5234,8907,9884,9885,26990,48469},
    [4]={1459,1460,1461,10156,10157,27126,42995},
    [5]={20217,25898},
    [6]={19740,19834,19835,19836,19837,25782,25916,27141,48933,48934},
    [7]={19742,19850,19852,19853,25894,25918,27143,48937,48938},
    [8]={20911,25899},
}

local function Click(e,p,u)
    if p:IsInCombat() then p:SendBroadcastMessage('|cffd90f0fEstás en combate.') return end    
    p:GossipMenuAddItem(8, ic[1].."Buffs",                     1000,0)
    p:GossipMenuAddItem(8, ic[2].."Teleportarse",              2000,0)
    p:GossipMenuAddItem(8, ic[3].."Solicitar Comida y Bebida", 3000,0)
    p:GossipSendMenu(1,u)
end

local teleA = {
    
    [3]={
    --Azeroth
        {0,-8833.38,628.628,94,1.06,                    5},     --1 Ventormenta
        {530,-3967.7,-11653.6,-138.844,0.852,           5},     --2 El Exodar
        {1, 9950.302, 2347.186, 1330.758, 1.562,        5},     --3 Darnassus
        {0, -4937.502, -935.658, 503.151, 5.401,        5},     --4 Forjaz
        {1, -7222.7397, -3736.8894, 8.3836, 0.9018,     40},    --5 Gadgetzan
        {0, -14475.6376, 462.5531, 36.3775, 0.898,      35},    --6 Bahía del Botín
        {1, 7875.3525, -2565.9921, 486.9467, 6.2592,    10},    --7 Claro de la Luna  
    --Terrallende--
        {0, -11811.5859, -3195.6413, -30.5, 3.2373,     58},    --8 Portal Oscuro
        {530, -1863.8846, 5418.687, -10.1, 1.4935,      60},    --9 Ciudad de Shattrath
        {530, -666.8308, 2713.445, 94.5, 2.8229,        58},    --10 Bastión del Honor
        {530, 208.3183, 6065.6098, 148.3188, 6.0117,    59},    --11 Telredor 
        {530, -2994.1147, 3872.2087, 9.5007, 0.7809,    61},    --12 Bastión Allerian
        {530, 2187.2998, 6792.2219, 183.2901, 2.7105,   63},    --13 Sylvanaar
        {530, -2722.6108, 7304.0097, 88.6018, 2.6908,   64},    --14 Telaar
        {530, 4160.7592, 2958.5676, 352.1988, 2.8302,   66},    --15 Flecha de la Tormenta
        {530, 3085.2336, 3598.4738, 144.0105, 4.0848,   67},    --16 Área 52
        {530, -3984.8073, 2153.5505, 104.4943, 1.7364,  68},    --17 Aldea Sombraluna
    --Rasganorte--
        {571,5804.79, 624.37, 647.78, 1.636,            74},    --18 Ciudad de Dalaran
        {571, 2272.3935, 5174.6562 ,11.128, 2.767,      68},    --19 Fortaleza Denuedo
        {571, 566.8421, -5010.5874, 11.5657, 2.82,      68},    --20 Valgarde
        {571, 3712.3371, -697.2811, 215.2738, 3.9024,   72},    --21 Fortaleza de Hibergarde       
        {571, 4584.27, -4253.8657, 182.209, 1.2803,     73},    --22 Campamento de la Brigada       
        {571, 5035.1401, -522.1364, 225.6336, 1.6129,   74},    --23 Mirador Brisaveloz
        {571, 5520.187, -2673.2902, 303.9527, 0.3268,   75},    --24 Confín Argenta
        {571, 5591.5327, 5831.0336, -67.9011, 3.1988,   76},    --25 Campamento Nesingwary
        {571, 6188.939, -1054.0264, 409.91, 2.544,      77},    --26 K3
        {571, 6164.8413, -61.4718, 388.1809, 2.1418,    78},    --27 Vanguardia Argenta   
    --Mazmorras Clásicas
        {0, -8771.42, 840.8729, 90.6448, 0.6613,        22},    --28 Mazmorras de Ventormenta
        {1, -738.7518, -2217.6589, 16.64, 2.6705,       15},    --29 Las Cuevas de los Lamentos
        {36, -12.8273, -382.9282, 61.7997, 4.6076,      18},    --30 Las Minas de la Muerte
        {0, -234.8294, 1561.6988, 76.8923, 1.1964,      22},    --31 Castillo de Colmillo Oscuro        
        {1, 4247.5478, 742.5911, -25.0591, 1.4309,      24},    --32 Cavernas de Brazanegra
        {0, -5163.208, 925.1033, 257.1794, 1.5467,      29},    --33 Gnomeregan 29
        {1, -4463.1386, -1664.3995, 82.2596, 0.8572,    30},    --34 Horado Rajaciento - 30
        {0, 2866.2202, -747.716, 160.39, 5.1039,        26},    --35 Monasterio Escarlata - 26/35
        {1, -4658.6367, -2526.319, 81.4823, 4.1396,     40},    --36 Zahúrda Rajaciento - 40
        {0, -6068.6269, -2955.2868, 209.7744, 0.04712,  42},    --37 Uldaman 42
        {1, -6797.7915, -2890.8813, 8.8807, 6.2768,     44},    --38 Zul'Farrak 44 
        {1, -1185.0281, 2880.1237, 85.9017, 4.8536,     46},    --39 Maraudon
        {0, -10183.958, -3993.06, -109.1948, 6.063,     50},    --40 El Templo de Atal'Hakkar - 50
        {0, -7180.2675, -920.1867, 165.5279, 4.9664,    52},    --41 Profundidades de Roca Negra - 52
        {0, -7525.7128, -1227.5332, 285.7322, 5.2606,   55},    --42 Cumbre de Roca Negra - 55/58
        {0, 1271.5802, -2571.2517, 92.73, 2.046,        58},    --43 Scholomance - 58
        {0, 3392.9897, -3354.2304, 142.2502, 4.722,     58},    --44 Stratholme - 58
        {1, -3981.2221, 781.7203, 161.0041, 4.7084,     58},    --45 La Masacre - 58
    --Mazmorras The Burning Crusade
        {530, -361.548035, 3073.503174, -15.080264, 1.889927,   60},    --46 Murallas del Fuego Infernal - 60
        {530, -299.520111, 3158.717285, 31.671602, 2.173269,    61},    --47 El Horno de Sangre - 61
        {530, 727.9693, 7012.945312, -71.612144, 0.247424,      62},    --48 Recinto de los Esclavos - 62
        {530, 781.808899, 6754.566406, -72.537735, 4.713941,    63},    --49 La Sotiénaga - 63     
        {530, -3083.557617, 4943.227539, -101.047203, 6.280574, 64},    --50 Tumbas de Maná - 64
        {530, -3361.888672, 5218.911621, -101.048576, 1.551475, 65},    --51 Criptas Auchenai - 65
        {1, -8342.879883, -4060.647461, -207.963837, 0.631444,  66},    --52 Antiguas Laderas de Trabalomas - 66
        {530, -3361.955322, 4665.541504, -101.048347, 4.742997, 67},    --53 Salas Sethekk - 67
        {530, 818.348267, 6937.358887, -80.568016, 1.61006,     68},    --54 La Cámara de Vapor - 68
        {530, -3548.392334, 4943.180664, -101.395599, 3.147267, 69},    --55 El Laberinto de las Sombras - 69
        {530, -308.585907, 3073.683594, -3.64883, 1.806413,     69},    --56 Las Salas Arrasadas - 69
        {1, -8761.708, -4184.260742, -209.497147, 2.023536,     70},    --57 La Ciénaga Negra - 70
        {530, 3405.032715, 1489.535156, 182.837845, 5.629376,   70},    --58 El Invernáculo - 70
        {530, 2871.153076, 1553.972534, 252.159058, 3.867718,   70},    --59 El Mechanar - 70
        {530, 3308.134277, 1341.579224, 505.559998, 5.084305,   70},    --60 El Arcatraz - 70
        {530, 12886.279297, -7333.544922, 65.488266, 4.249288,  70},    --61 Bancal del Magister - 70 
    --Mazmorras Wrath of The Lich King
        {571, 1226.941772, -4862.43457, 41.249203, 0.279299,    68},    --62 Fortaleza de Utgarde - 65
        {571, 3891.410156, 6985.147949, 69.488228, 0.051485,    68},    --63 El Nexo - 66
        {571, 3677.109863, 2166.946533, 35.818439, 2.34244,     70},    --64 Azjol Nerub - 70
        {571, 3643.209961, 2036.400146, 1.787595, 4.323483,     71},    --65 Ahn'kahet: El Antiguo Reino - 71
        {571, 4774.38916, -2030.158081, 229.379471, 1.556607,   72},    --66 Fortaleza de Drak'Tharon - 72
        {571, 5692.8388, 502.1281, 652.72, 4.0178,              74},    --67 El Bastión Violeta - 74
        {571, 6708.150879, -4654.854492, 445.224213, 3.915368,  74},    --68 Gundrak - 74
        {571, 8921.771484, -988.377136, 1039.367065, 1.5824,    75},    --69 Cámaras de Piedra - 75
        {571, 9182.655273, -1384.757324, 1110.216064, 5.546371, 77},    --70 Cámaras de Relámpagos - 77
        {571, 3879.161865, 6984.595703, 106.311996, 3.173132,   77},    --71 El Oculus - 77
        {1, -8756.251953, -4453.818359, -200.144745, 4.612549,  78},    --72 La Matanza de Stratholme - 78
        {571, 1243.812256, -4857.187012, 217.417511, 3.418464,  78},    --73 Pináculo de Utgarde - 78
        {571, 5666.226074, 2009.228027, 798.041016, 5.412203,   78},    --74 La Forja de Almas - 78
        {571, 5598.151367, 2015.506592, 798.041748, 3.822912,   79},    --75 Foso de Saron - 79
        {571, 5628.901367, 1975.456177, 803.020874, 4.601211,   79},    --76 Cámaras de Reflexión - 79
        {571, 8575.023438, 792.300903, 558.514709, 3.125964,    79},    --77 Prueba del Campeón - 79
    --Bandas Clásicas
        {0, -11916.269531, -1213.478638, 92.287277, 4.722716,   60},    --78 Zul'Gurub
        {1, -8412.428711, 1500.856445, 29.160902, 2.636490,     60},    --79 Ruinas de Ahn'Qiraj (20 Man)
        {1, -8237.888672, 1993.095337, 129.072006, 0.957310,    60},    --80 Ahn'Qiraj 40-Man (40 Man)
        {230, 1118.786133, -457.697784, -102.475357, 3.547354,  60},    --81 Núcleo de Magma
        {229, 169.053238, -474.726532, 116.839996, 0.002223,    60},    --82 Guarida de Alanegra
    --Bandas The Burning Crusade
        {530, 6851.42627, -7992.63623, 191.598633, 4.697959,    70},    --83 Zul'Aman
        {0, -11122.070312, -2013.668823, 47.087719, 0.767705,   70},    --84 Karazhan
        {530, 3543.207520, 5090.147949, 3.410233, 5.742854,     70},    --85 Guarida de Gruul
        {530, -316.478241, 3092.51416, -116.430534, 5.269278,   70},    --86 Guarida de Magtheridon
        {530, 793.940735, 6865.628906, -64.655159, 0,           70},    --87 Caverna Santuario Serpiente
        {530, 3088.531982, 1388.140381, 185.089264, 4.628061,   70},    --88 El Castillo de la Tempestad
        {1, -8175.373047, -4177.965332, -166.555313, 1.003659,  70},    --89 La Cima Hyjal
        {530, -3645.186523, 316.402466, 35.146271, 2.958558,    70},    --90 El Templo Oscuro
        {530, 12560.412109, -6774.756836, 15.06293, 3.13788,    70},    --91 Meseta de La Fuente del Sol
    --Bandas Wrath of The Lich King
        {571, 3862.236328, 6988.39502, 152.041, 5.812057,       80},    --92 El Ojo de la Eternidad
        {571, 3661.906494, -1270.057617, 243.885742, 0.096168,  80},    --93 Naxxramas
        {571, 3448.450439, 261.582184, -110.164024, 3.235456,   80},    --94 El Sagrario Obsidiana
        {571, 9337.295898, -1114.767334, 1245.146851, 6.282593, 80},    --95 Ulduar
        {571, 8515.162109, 731.646057, 558.248108, 1.565064,    80},    --96 Prueba del Cruzado
        {571, 5474.043945, 2840.551514, 418.675629, 6.279259,   80},    --97 La Cámara de Archavon
        {571, 5790.092285, 2071.157959, 636.064392, 3.566044,   80},    --98 Ciudadela de la Corona de Hielo
        {571, 3599.480713, 198.515198, -113.758232, 5.336594,   80}}}   --99 El Sagrario Rubí         

local teleH = {    
    [3]={
    --Azeroth
        {1, 1678.1777, -4314.0532, 61.5, 4.0726,        5},     --1 Orgrimmar      
        {1, -1195.7438, 28.1298, 176.949, 2.883,        5},     --2 Cima del Trueno
        {0, 1569.0684, 267.1815, -43.1026, 4.3999,      5},     --3 Entrañas
        {530, 9687.3154, -7448.7885, 13.69, 1.6101,     5},     --4 Ciudad de Lunargenta
        {1, -7046.5083, -3781.51, 10.1995, 3.5105,      40},    --5 Gadgetzan
        {0, -14446.7705, 507.9165, 26.2381, 5.0253,     35},    --6 Bahía del Botín
        {1, 7962.2602, -2492.0476, 487.8567, 5.1322,    10},    --7 Claro de la Luna
    --Terrallende--
        {0, -11813.5185, -3184.0468, -30.5426, 3.7243,  58},    --8 Portal Oscuro
        {530, -1868.3526, 5439.7558, -10.4633, 5.13,    60},    --9 Ciudad de Shattrath
        {530, 228.7059, 2632.2966, 87.6851, 2.6173,     58},    --10 Thrallmar
        {530, 89.3989, 5215.7871, 23.1932, 5.574,       59},    --11 Avanzada Rata del Pantano 
        {530, -2565.5456, 4427.2973, 39.3059, 3.6135,   61},    --12 Bastión Rompepedras
        {530, 2447.3496, 6021.4487, 154.4485, 3.7063,   63},    --13 Bastión Señor del Trueno
        {530, -1259.1961, 7133.8242, 57.2756, 2.214,    64},    --14 Garadar
        {530, 4090.6562, 2980.1093, 355.33807, 0.3559,  66},    --15 La Flecha de la Tormenta
        {530, 3083.4995, 3598.7421, 144.0121, 4.3284,   67},    --16 Área 52
        {530, -3015.6428, 2556.4323, 78.7539, 1.5801,   68},    --17 Aldea Sombraluna
    --Rasganorte--
        {571,5804.79, 624.37, 647.78, 1.636,            74},    --18 Ciudad de Dalaran
        {571, 3258.9782, -2264.1857, 114.3, 5.7554,     68},    --19 Bastión Grito de Guerra
        {571, 1919.606, -6174.5732, 24.2786, 2.5821,    68},    --20 Campo Venganza
        {571, 3246.1154, -661.8128, 166.7912, 4.6748,   72},    --21 Rencor Venenoso        
        {571, 3259.6257, -2262.55, 114.44, 5.2881,      73},    --22 Bastión de la Conquista        
        {571, 5589.6142, -694.5081, 206.627, 1.9345,    74},    --23 Dominio de los Atracasol
        {571, 5523.2167, -2672.7221, 303.9543, 3.1215,  75},    --24 Confín Argenta
        {571, 5591.436, 5831.2285, -67.885, 4.6298,     76},    --25 Campamento Nesingwary
        {571, 6188.939, -1054.0264, 409.91, 2.544,      77},    --26 K3
        {571, 6164.8413, -61.4718, 388.1809, 2.1418,    78},    --27 Vanguardia Argenta   
    --Mazmorras Clásicas
        {1, 1812.8153, -4414.6191, -18.246, 5.1707,     10},    --28 Cima Ígnea
        {1, -738.7518, -2217.6589, 16.64, 2.6705,       15},    --29 Las Cuevas de los Lamentos
        {36, -12.8273, -382.9282, 61.7997, 4.6076,      18},    --30 Las Minas de la Muerte
        {0, -234.8294, 1561.6988, 76.8923, 1.1964,      22},    --31 Castillo de Colmillo Oscuro        
        {1, 4247.5478, 742.5911, -25.0591, 1.4309,      24},    --32 Cavernas de Brazanegra
        {0, -5163.208, 925.1033, 257.1794, 1.5467,      29},    --33 Gnomeregan 29
        {1, -4463.1386, -1664.3995, 82.2596, 0.8572,    30},    --34 Horado Rajaciento - 30
        {0, 2866.2202, -747.716, 160.39, 5.1039,        26},    --35 Monasterio Escarlata - 26/35
        {1, -4658.6367, -2526.319, 81.4823, 4.1396,     40},    --36 Zahúrda Rajaciento - 40
        {0, -6068.6269, -2955.2868, 209.7744, 0.04712,  42},    --37 Uldaman 42
        {1, -6797.7915, -2890.8813, 8.8807, 6.2768,     44},    --38 Zul'Farrak 44 
        {1, -1185.0281, 2880.1237, 85.9017, 4.8536,     46},    --39 Maraudon
        {0, -10183.958, -3993.06, -109.1948, 6.063,     50},    --40 El Templo de Atal'Hakkar - 50
        {0, -7180.2675, -920.1867, 165.5279, 4.9664,    52},    --41 Profundidades de Roca Negra - 52
        {0, -7525.7128, -1227.5332, 285.7322, 5.2606,   55},    --42 Cumbre de Roca Negra - 55/58
        {0, 1271.5802, -2571.2517, 92.73, 2.046,        58},    --43 Scholomance - 58
        {0, 3392.9897, -3354.2304, 142.2502, 4.722,     58},    --44 Stratholme - 58
        {1, -3981.2221, 781.7203, 161.0041, 4.7084,     58},    --45 La Masacre - 58
    --Mazmorras The Burning Crusade
        {530, -361.548035, 3073.503174, -15.080264, 1.889927,   60},    --46 Murallas del Fuego Infernal - 60
        {530, -299.520111, 3158.717285, 31.671602, 2.173269,    61},    --47 El Horno de Sangre - 61
        {530, 727.9693, 7012.945312, -71.612144, 0.247424,      62},    --48 Recinto de los Esclavos - 62
        {530, 781.808899, 6754.566406, -72.537735, 4.713941,    63},    --49 La Sotiénaga - 63     
        {530, -3083.557617, 4943.227539, -101.047203, 6.280574, 64},    --50 Tumbas de Maná - 64
        {530, -3361.888672, 5218.911621, -101.048576, 1.551475, 65},    --51 Criptas Auchenai - 65
        {1, -8342.879883, -4060.647461, -207.963837, 0.631444,  66},    --52 Antiguas Laderas de Trabalomas - 66
        {530, -3361.955322, 4665.541504, -101.048347, 4.742997, 67},    --53 Salas Sethekk - 67
        {530, 818.348267, 6937.358887, -80.568016, 1.61006,     68},    --54 La Cámara de Vapor - 68
        {530, -3548.392334, 4943.180664, -101.395599, 3.147267, 69},    --55 El Laberinto de las Sombras - 69
        {530, -308.585907, 3073.683594, -3.64883, 1.806413,     69},    --56 Las Salas Arrasadas - 69
        {1, -8761.708, -4184.260742, -209.497147, 2.023536,     70},    --57 La Ciénaga Negra - 70
        {530, 3405.032715, 1489.535156, 182.837845, 5.629376,   70},    --58 El Invernáculo - 70
        {530, 2871.153076, 1553.972534, 252.159058, 3.867718,   70},    --59 El Mechanar - 70
        {530, 3308.134277, 1341.579224, 505.559998, 5.084305,   70},    --60 El Arcatraz - 70
        {530, 12886.279297, -7333.544922, 65.488266, 4.249288,  70},    --61 Bancal del Magister - 70 
    --Mazmorras Wrath of The Lich King
        {571, 1226.941772, -4862.43457, 41.249203, 0.279299,    68},    --62 Fortaleza de Utgarde - 65
        {571, 3891.410156, 6985.147949, 69.488228, 0.051485,    68},    --63 El Nexo - 66
        {571, 3677.109863, 2166.946533, 35.818439, 2.34244,     70},    --64 Azjol Nerub - 70
        {571, 3643.209961, 2036.400146, 1.787595, 4.323483,     71},    --65 Ahn'kahet: El Antiguo Reino - 71
        {571, 4774.38916, -2030.158081, 229.379471, 1.556607,   72},    --66 Fortaleza de Drak'Tharon - 72
        {571, 5692.8388, 502.1281, 652.72, 4.0178,              74},    --67 El Bastión Violeta - 74
        {571, 6708.150879, -4654.854492, 445.224213, 3.915368,  74},    --68 Gundrak - 74
        {571, 8921.771484, -988.377136, 1039.367065, 1.5824,    75},    --69 Cámaras de Piedra - 75
        {571, 9182.655273, -1384.757324, 1110.216064, 5.546371, 77},    --70 Cámaras de Relámpagos - 77
        {571, 3879.161865, 6984.595703, 106.311996, 3.173132,   77},    --71 El Oculus - 77
        {1, -8756.251953, -4453.818359, -200.144745, 4.612549,  78},    --72 La Matanza de Stratholme - 78
        {571, 1243.812256, -4857.187012, 217.417511, 3.418464,  78},    --73 Pináculo de Utgarde - 78
        {571, 5666.226074, 2009.228027, 798.041016, 5.412203,   78},    --74 La Forja de Almas - 78
        {571, 5598.151367, 2015.506592, 798.041748, 3.822912,   79},    --75 Foso de Saron - 79
        {571, 5628.901367, 1975.456177, 803.020874, 4.601211,   79},    --76 Cámaras de Reflexión - 79
        {571, 8575.023438, 792.300903, 558.514709, 3.125964,    79},    --77 Prueba del Campeón - 79
    --Bandas Clásicas
        {0, -11916.269531, -1213.478638, 92.287277, 4.722716,   60},    --78 Zul'Gurub
        {1, -8412.428711, 1500.856445, 29.160902, 2.636490,     60},    --79 Ruinas de Ahn'Qiraj (20 Man)
        {1, -8237.888672, 1993.095337, 129.072006, 0.957310,    60},    --80 Ahn'Qiraj 40-Man (40 Man)
        {230, 1118.786133, -457.697784, -102.475357, 3.547354,  60},    --81 Núcleo de Magma
        {229, 169.053238, -474.726532, 116.839996, 0.002223,    60},    --82 Guarida de Alanegra
    --Bandas The Burning Crusade
        {530, 6851.42627, -7992.63623, 191.598633, 4.697959,    70},    --83 Zul'Aman
        {0, -11122.070312, -2013.668823, 47.087719, 0.767705,   70},    --84 Karazhan
        {530, 3543.207520, 5090.147949, 3.410233, 5.742854,     70},    --85 Guarida de Gruul
        {530, -316.478241, 3092.51416, -116.430534, 5.269278,   70},    --86 Guarida de Magtheridon
        {530, 793.940735, 6865.628906, -64.655159, 0,           70},    --87 Caverna Santuario Serpiente
        {530, 3088.531982, 1388.140381, 185.089264, 4.628061,   70},    --88 El Castillo de la Tempestad
        {1, -8175.373047, -4177.965332, -166.555313, 1.003659,  70},    --89 La Cima Hyjal
        {530, -3645.186523, 316.402466, 35.146271, 2.958558,    70},    --90 El Templo Oscuro
        {530, 12560.412109, -6774.756836, 15.06293, 3.13788,    70},    --91 Meseta de La Fuente del Sol
    --Bandas Wrath of The Lich King
        {571, 3862.236328, 6988.39502, 152.041, 5.812057,       80},    --92 El Ojo de la Eternidad
        {571, 3661.906494, -1270.057617, 243.885742, 0.096168,  80},    --93 Naxxramas
        {571, 3448.450439, 261.582184, -110.164024, 3.235456,   80},    --94 El Sagrario Obsidiana
        {571, 9337.295898, -1114.767334, 1245.146851, 6.282593, 80},    --95 Ulduar
        {571, 8515.162109, 731.646057, 558.248108, 1.565064,    80},    --96 Prueba del Cruzado
        {571, 5474.043945, 2840.551514, 418.675629, 6.279259,   80},    --97 La Cámara de Archavon
        {571, 5790.092285, 2071.157959, 636.064392, 3.566044,   80},    --98 Ciudadela de la Corona de Hielo
        {571, 3599.480713, 198.515198, -113.758232, 5.336594,   80}}}   --99 El Sagrario Rubí            

local function Menu(E,P,U,S,I)

    if S+I==0 then Click(E,P,U) end

    local L, C = P:GetLevel(), P:GetClassMask()     

    --Determinar si la clase Usa maná---------------------------------------------------------------------------------------------------------------------------------
    function UsaMana()
        if C==1 then return false  elseif C==2 then return true  elseif C==4 then return true  elseif C==8 then return false  elseif C==16 then return true
        elseif C==32 then return false  elseif C==64 then return true  elseif C==128 then return true  elseif C==256 then return true  elseif C==1024 then return true
        end
    end
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    function FOOD() 
            if L>=0  and L<=4  then rang = 1  elseif L>=5  and L<=14 then rang = 2  elseif L>=15 and L<=24 then rang = 3  elseif L>=25 and L<=34 then rang = 4
        elseif L>=35 and L<=44 then rang = 5  elseif L>=45 and L<=54 then rang = 6  elseif L>=55 and L<=59 then rang = 7  elseif L>=60 and L<=64 then rang = 8
        elseif L>=65 and L<=73 then rang = 9  elseif L>=74 and L<=79 then rang = 10 elseif L>=80 and L<=85 then rang = 11
        end

        local com,beb = MENU_A[3000][rang][1], MENU_A[3000][rang][2]

        if UsaMana()==true then 
            if P:HasItem(com,80)==true then
                if L <=64 then
                    if P:GetItemCount(beb) >= 61 then 
                        N=math.abs(P:GetItemCount(beb)-80)
                        P:AddItem(beb,N)
                    else 
                        P:AddItem(beb,20)
                    end 
                end
            else
                if P:GetItemCount(com) >= 61 then 
                    M=math.abs(P:GetItemCount(com)-80)
                    P:AddItem(com,M)
                else 
                    P:AddItem(com,20)
                end
            end
        if L <=64 then
            if P:HasItem(beb,80)==true then 
                 return
            else                
                if P:GetItemCount(beb) >= 61 then 
                    N=math.abs(P:GetItemCount(beb)-80)
                    P:AddItem(beb,N)
                else 
                    P:AddItem(beb,20)
                end
            end            
        end
        else 
            if P:HasItem(com,80)==true then 
            else
                if P:GetItemCount(com) >= 61 then 
                    O=math.abs(P:GetItemCount(com)-80)
                    P:AddItem(com,O)
                else 
                    P:AddItem(com,20)
                end
            end            
        end
    end
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    if P:IsAlliance() then menus=MENU_A  tele=teleA else menus=MENU_H  tele=teleH end

    if S==3 then
        if I>=1 and I<=99 then   local Lev = tele[S][I][6]
            if L >= Lev then
                local _M, _X, _Y, _Z ,_O = tele[S][I][1], tele[S][I][2], tele[S][I][3], tele[S][I][4], tele[S][I][5]
                P:Teleport(_M,_X,_Y,_Z,_O)             
                P:GossipComplete()
            return  
            else
                P:SendBroadcastMessage('Para ir allí necesito haber alcanzado el nivel '..Lev..'.') P:GossipComplete() return
            end
        end
    end
    
    if S>=1000 and S<=2999 then 
        P:GossipClearMenu()
        for a=1,#menus[S] do  local aa,ab,ac,ad=table.unpack(menus[S][a]) P:GossipMenuAddItem(aa,ab,ac,ad) end 
        P:GossipSendMenu(1,U)
    end

    if S==2000 then
        P:GossipClearMenu()
        for a=1,#menus[S] do  local aa,ab,ac,ad=table.unpack(menus[S][a]) P:GossipMenuAddItem(aa,ab,ac,ad) end 
        P:GossipSendMenu(1,U)
    end    

    if S+I==3000 then FOOD() Click(E,P,U) end

    if S>=2 and S<=999 then        
        P:GossipClearMenu()
        for a=1,#menus[S][I] do  local aa,ab,ac,ad,ae,af=table.unpack(menus[S][I][a]) P:GossipMenuAddItem(aa,ab,ac,ad,ae,af) end 
        P:GossipSendMenu(1,U)        
    end

    --BUFFS--------------------------------------------------------------------------------------------------------------------------------------
    if S==1 then   local buf='|cff00ff80¡Buff aplicado!'
        if I==1 then 
            --Palabra de poder: entereza
            P:CastSpell(P, BUFF[I][buff1(L)], true) P:SendAreaTriggerMessage(buf) Menu(E,P,U,1000,0)
        elseif I==2 then 
            -- Espíritu divino
            if buff2(L)==0 then P:SendBroadcastMessage('Debes alcanzar el nivel 20.') Menu(E,P,U,1000,0)
            else
                P:CastSpell(P, BUFF[I][buff2(L)], true) P:SendAreaTriggerMessage(buf) Menu(E,P,U,1000,0)
            end
        elseif I==3 then 
            --Marca de lo salvaje
            P:CastSpell(P, BUFF[I][buff3(L)], true) P:SendAreaTriggerMessage(buf) Menu(E,P,U,1000,0)
        elseif I==4 then
            --Intelecto arcano            
            P:CastSpell(P, BUFF[I][buff4(L)], true) P:SendAreaTriggerMessage(buf) Menu(E,P,U,1000,0)
        elseif I==5 then
            --Bendición de reyes
            if buff5(L)==0 then P:SendBroadcastMessage('Debes alcanzar el nivel 12.') Menu(E,P,U,1000,0)
            else
                P:CastSpell(P, BUFF[I][buff5(L)], true) P:SendAreaTriggerMessage(buf) Menu(E,P,U,1000,0)
            end
        elseif I==6 then
            --Bendición de poderío
            P:CastSpell(P, BUFF[I][buff6(L)], true) P:SendAreaTriggerMessage(buf) Menu(E,P,U,1000,0)
        elseif I==7 then
            --Bendición de sabiduría
            if buff7(L)==0 then P:SendBroadcastMessage('Debes alcanzar el nivel 4.') Menu(E,P,U,1000,0)
            else
                P:CastSpell(P, BUFF[I][buff7(L)], true) P:SendAreaTriggerMessage(buf) Menu(E,P,U,1000,0)
            end
        elseif I==8 then
            --Bendición de salvaguardia
            if buff8(L)==0 then P:SendBroadcastMessage('Debes alcanzar el nivel 20.') Menu(E,P,U,1000,0)
            else
                P:CastSpell(P, BUFF[I][buff8(L)], true) P:SendAreaTriggerMessage(buf) Menu(E,P,U,1000,0)
            end
        end    
    end
end
RegisterItemGossipEvent(6948, 1, Click)
RegisterItemGossipEvent(6948, 2,  Menu)
