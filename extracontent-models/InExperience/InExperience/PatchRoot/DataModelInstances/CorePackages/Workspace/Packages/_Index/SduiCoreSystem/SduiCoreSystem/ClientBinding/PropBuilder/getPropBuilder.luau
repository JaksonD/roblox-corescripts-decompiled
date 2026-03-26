local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildDefaultProp);
local v3 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildStringProp);
local v4 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildTableProp);
local v5 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildRepeatedProp);
local v6 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildNestedComponentProp);
local v7 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildLazyNestedComponentListProp);
local v8 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildActionProp);
local v9 = require(l_script_FirstAncestor_0.SduiParsers);
local _ = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes);
local v11 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.SduiClientBindingParsers);
local v12 = require(l_script_FirstAncestor_0.ClientBinding.ProtoVariableMapper);
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents;
local l_FFlagSduiOverflowMenuComponent_0 = require(l_Parent_0.SharedFlags).FFlagSduiOverflowMenuComponent;
local l_FFlagSduiStructPropParsers_0 = require(l_Parent_0.SharedFlags).FFlagSduiStructPropParsers;
local function _(v16, v17) --[[ Line: 54 ]] --[[ Name: applyParser ]]
    return function(v18, v19, v20, v21, v22, v23) --[[ Line: 58 ]]
        -- upvalues: v16 (copy), v17 (copy)
        local v24, v25 = v16(v18, v19, v20, v21, v22, v23, v17);
        return v24, v25;
    end;
end;
local function _(v27, v28) --[[ Line: 79 ]] --[[ Name: createEngineEnumProtoBuilder ]]
    -- upvalues: v2 (copy), v9 (copy), v12 (copy)
    local l_v2_0 = v2;
    local function v32(v30) --[[ Line: 80 ]]
        -- upvalues: v9 (ref), v27 (copy), v12 (ref), v28 (copy)
        local v31 = v9.getEngineEnumParser(v27);
        return v12.mapProtoEngineEnumToLua(v30, v28, v31);
    end;
    return function(v33, v34, v35, v36, v37, v38) --[[ Line: 58 ]]
        -- upvalues: l_v2_0 (copy), v32 (copy)
        local v39, v40 = l_v2_0(v33, v34, v35, v36, v37, v38, v32);
        return v39, v40;
    end;
end;
local v42 = {
    StringProp = v3, 
    BoolProp = v2, 
    FloatProp = v2, 
    DoubleProp = v2, 
    Int32Prop = v2, 
    Int64Prop = v2
};
local v43;
if l_FFlagSduiStructPropParsers_0 then
    local l_parseStruct_0 = v11.parseStruct;
    local l_l_parseStruct_0_0 = l_parseStruct_0 --[[ copy: 20 -> 56 ]];
    v43 = function(v46, v47, v48, v49, v50, v51) --[[ Line: 58 ]]
        -- upvalues: v2 (copy), l_l_parseStruct_0_0 (copy)
        local v52, v53 = v2(v46, v47, v48, v49, v50, v51, l_l_parseStruct_0_0);
        return v52, v53;
    end;
else
    v43 = v2;
end;
v42.StructProp = v43;
local l_parseImageStringProp__0 = v9.parseImageStringProp_;
local l_l_parseImageStringProp__0_0 = l_parseImageStringProp__0 --[[ copy: 20 -> 23 ]];
v42.ImageStringProp = function(v56, v57, v58, v59, v60, v61) --[[ Line: 58 ]]
    -- upvalues: v3 (copy), l_l_parseImageStringProp__0_0 (copy)
    local v62, v63 = v3(v56, v57, v58, v59, v60, v61, l_l_parseImageStringProp__0_0);
    return v62, v63;
end;
l_parseImageStringProp__0 = v9.parseImageSetOrImageProp_;
local l_l_parseImageStringProp__0_1 = l_parseImageStringProp__0 --[[ copy: 20 -> 24 ]];
v42.ImageSetProp = function(v65, v66, v67, v68, v69, v70) --[[ Line: 58 ]]
    -- upvalues: v3 (copy), l_l_parseImageStringProp__0_1 (copy)
    local v71, v72 = v3(v65, v66, v67, v68, v69, v70, l_l_parseImageStringProp__0_1);
    return v71, v72;
end;
l_parseImageStringProp__0 = Color3.fromHex;
local l_l_parseImageStringProp__0_2 = l_parseImageStringProp__0 --[[ copy: 20 -> 25 ]];
v42.ColorProp = function(v74, v75, v76, v77, v78, v79) --[[ Line: 58 ]]
    -- upvalues: v2 (copy), l_l_parseImageStringProp__0_2 (copy)
    local v80, v81 = v2(v74, v75, v76, v77, v78, v79, l_l_parseImageStringProp__0_2);
    return v80, v81;
end;
v42.TypographyProp = v2;
v42.TypographyFontProp = v2;
l_parseImageStringProp__0 = v9.parseUDimProp_;
local l_l_parseImageStringProp__0_3 = l_parseImageStringProp__0 --[[ copy: 20 -> 26 ]];
v42.UDimProp = function(v83, v84, v85, v86, v87, v88) --[[ Line: 58 ]]
    -- upvalues: v2 (copy), l_l_parseImageStringProp__0_3 (copy)
    local v89, v90 = v2(v83, v84, v85, v86, v87, v88, l_l_parseImageStringProp__0_3);
    return v89, v90;
end;
l_parseImageStringProp__0 = v9.parseUDim2Prop_;
local l_l_parseImageStringProp__0_4 = l_parseImageStringProp__0 --[[ copy: 20 -> 27 ]];
v42.UDim2Prop = function(v92, v93, v94, v95, v96, v97) --[[ Line: 58 ]]
    -- upvalues: v2 (copy), l_l_parseImageStringProp__0_4 (copy)
    local v98, v99 = v2(v92, v93, v94, v95, v96, v97, l_l_parseImageStringProp__0_4);
    return v98, v99;
end;
l_parseImageStringProp__0 = v9.parseVector2Prop_;
local l_l_parseImageStringProp__0_5 = l_parseImageStringProp__0 --[[ copy: 20 -> 28 ]];
v42.Vector2Prop = function(v101, v102, v103, v104, v105, v106) --[[ Line: 58 ]]
    -- upvalues: v2 (copy), l_l_parseImageStringProp__0_5 (copy)
    local v107, v108 = v2(v101, v102, v103, v104, v105, v106, l_l_parseImageStringProp__0_5);
    return v107, v108;
end;
v42.NestedComponentProp = v6;
v42.LazyNestedComponentListProp = v7;
l_parseImageStringProp__0 = v9.parseIconProp_;
local l_l_parseImageStringProp__0_6 = l_parseImageStringProp__0 --[[ copy: 20 -> 29 ]];
v42.IconProp = function(v110, v111, v112, v113, v114, v115) --[[ Line: 58 ]]
    -- upvalues: v2 (copy), l_l_parseImageStringProp__0_6 (copy)
    local v116, v117 = v2(v110, v111, v112, v113, v114, v115, l_l_parseImageStringProp__0_6);
    return v116, v117;
end;
l_parseImageStringProp__0 = v9.parseGradientProp_;
local l_l_parseImageStringProp__0_7 = l_parseImageStringProp__0 --[[ copy: 20 -> 30 ]];
v42.GradientProp = function(v119, v120, v121, v122, v123, v124) --[[ Line: 58 ]]
    -- upvalues: v2 (copy), l_l_parseImageStringProp__0_7 (copy)
    local v125, v126 = v2(v119, v120, v121, v122, v123, v124, l_l_parseImageStringProp__0_7);
    return v125, v126;
end;
if l_FFlagSduiStructPropParsers_0 then
    l_parseImageStringProp__0 = v11.parseArrayOfStruct;
    local l_l_parseImageStringProp__0_8 = l_parseImageStringProp__0 --[[ copy: 20 -> 55 ]];
    v43 = function(v128, v129, v130, v131, v132, v133) --[[ Line: 58 ]]
        -- upvalues: v2 (copy), l_l_parseImageStringProp__0_8 (copy)
        local v134, v135 = v2(v128, v129, v130, v131, v132, v133, l_l_parseImageStringProp__0_8);
        return v134, v135;
    end;
else
    v43 = v2;
end;
v42.ArrayOfStructProp = v43;
v42.ActionProp = v8;
v42.TableProp = v4;
v42.ArrayOfMenuItemProp = if l_FFlagSduiOverflowMenuComponent_0 then v5 else nil;
v42.MenuItemProp = if l_FFlagSduiOverflowMenuComponent_0 then v4 else nil;
v42.MenuItem = if l_FFlagSduiOverflowMenuComponent_0 then v4 else nil;
v42.GenericShareLinkData = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v4 else nil;
v42.AnalyticsDataField = v2;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.AutomaticSize;
    local v136 = "AUTOMATIC_SIZE_";
    local l_l_parseImageStringProp__0_9 = l_parseImageStringProp__0 --[[ copy: 20 -> 52 ]];
    local l_v136_0 = v136 --[[ copy: 22 -> 53 ]];
    local function v141(v139) --[[ Line: 80 ]]
        -- upvalues: v9 (copy), l_l_parseImageStringProp__0_9 (copy), v12 (copy), l_v136_0 (copy)
        local v140 = v9.getEngineEnumParser(l_l_parseImageStringProp__0_9);
        return v12.mapProtoEngineEnumToLua(v139, l_v136_0, v140);
    end;
    local l_v141_0 = v141 --[[ copy: 21 -> 54 ]];
    v43 = function(v143, v144, v145, v146, v147, v148) --[[ Line: 58 ]]
        -- upvalues: v2 (copy), l_v141_0 (copy)
        local v149, v150 = v2(v143, v144, v145, v146, v147, v148, l_v141_0);
        return v149, v150;
    end;
else
    v43 = nil;
end;
v42.AutomaticSizeProp = v43;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.TextTruncate;
    local v151 = "TEXT_TRUNCATE_";
    local l_l_parseImageStringProp__0_10 = l_parseImageStringProp__0 --[[ copy: 20 -> 49 ]];
    local l_v151_0 = v151 --[[ copy: 22 -> 50 ]];
    local function v156(v154) --[[ Line: 80 ]]
        -- upvalues: v9 (copy), l_l_parseImageStringProp__0_10 (copy), v12 (copy), l_v151_0 (copy)
        local v155 = v9.getEngineEnumParser(l_l_parseImageStringProp__0_10);
        return v12.mapProtoEngineEnumToLua(v154, l_v151_0, v155);
    end;
    local l_v156_0 = v156 --[[ copy: 21 -> 51 ]];
    v43 = function(v158, v159, v160, v161, v162, v163) --[[ Line: 58 ]]
        -- upvalues: v2 (copy), l_v156_0 (copy)
        local v164, v165 = v2(v158, v159, v160, v161, v162, v163, l_v156_0);
        return v164, v165;
    end;
else
    v43 = nil;
end;
v42.TextTruncateProp = v43;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.TextXAlignment;
    local v166 = "TEXT_X_ALIGNMENT_";
    local l_l_parseImageStringProp__0_11 = l_parseImageStringProp__0 --[[ copy: 20 -> 46 ]];
    local l_v166_0 = v166 --[[ copy: 22 -> 47 ]];
    local function v171(v169) --[[ Line: 80 ]]
        -- upvalues: v9 (copy), l_l_parseImageStringProp__0_11 (copy), v12 (copy), l_v166_0 (copy)
        local v170 = v9.getEngineEnumParser(l_l_parseImageStringProp__0_11);
        return v12.mapProtoEngineEnumToLua(v169, l_v166_0, v170);
    end;
    local l_v171_0 = v171 --[[ copy: 21 -> 48 ]];
    v43 = function(v173, v174, v175, v176, v177, v178) --[[ Line: 58 ]]
        -- upvalues: v2 (copy), l_v171_0 (copy)
        local v179, v180 = v2(v173, v174, v175, v176, v177, v178, l_v171_0);
        return v179, v180;
    end;
else
    v43 = nil;
end;
v42.TextXAlignmentProp = v43;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.TextYAlignment;
    local v181 = "TEXT_Y_ALIGNMENT_";
    local l_l_parseImageStringProp__0_12 = l_parseImageStringProp__0 --[[ copy: 20 -> 43 ]];
    local l_v181_0 = v181 --[[ copy: 22 -> 44 ]];
    local function v186(v184) --[[ Line: 80 ]]
        -- upvalues: v9 (copy), l_l_parseImageStringProp__0_12 (copy), v12 (copy), l_v181_0 (copy)
        local v185 = v9.getEngineEnumParser(l_l_parseImageStringProp__0_12);
        return v12.mapProtoEngineEnumToLua(v184, l_v181_0, v185);
    end;
    local l_v186_0 = v186 --[[ copy: 21 -> 45 ]];
    v43 = function(v188, v189, v190, v191, v192, v193) --[[ Line: 58 ]]
        -- upvalues: v2 (copy), l_v186_0 (copy)
        local v194, v195 = v2(v188, v189, v190, v191, v192, v193, l_v186_0);
        return v194, v195;
    end;
else
    v43 = nil;
end;
v42.TextYAlignmentProp = v43;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.UIFlexMode;
    local v196 = "UI_FLEX_MODE_";
    local l_l_parseImageStringProp__0_13 = l_parseImageStringProp__0 --[[ copy: 20 -> 40 ]];
    local l_v196_0 = v196 --[[ copy: 22 -> 41 ]];
    local function v201(v199) --[[ Line: 80 ]]
        -- upvalues: v9 (copy), l_l_parseImageStringProp__0_13 (copy), v12 (copy), l_v196_0 (copy)
        local v200 = v9.getEngineEnumParser(l_l_parseImageStringProp__0_13);
        return v12.mapProtoEngineEnumToLua(v199, l_v196_0, v200);
    end;
    local l_v201_0 = v201 --[[ copy: 21 -> 42 ]];
    v43 = function(v203, v204, v205, v206, v207, v208) --[[ Line: 58 ]]
        -- upvalues: v2 (copy), l_v201_0 (copy)
        local v209, v210 = v2(v203, v204, v205, v206, v207, v208, l_v201_0);
        return v209, v210;
    end;
else
    v43 = nil;
end;
v42.UIFlexModeProp = v43;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.ScaleType;
    local v211 = "SCALE_TYPE_";
    local l_l_parseImageStringProp__0_14 = l_parseImageStringProp__0 --[[ copy: 20 -> 37 ]];
    local l_v211_0 = v211 --[[ copy: 22 -> 38 ]];
    local function v216(v214) --[[ Line: 80 ]]
        -- upvalues: v9 (copy), l_l_parseImageStringProp__0_14 (copy), v12 (copy), l_v211_0 (copy)
        local v215 = v9.getEngineEnumParser(l_l_parseImageStringProp__0_14);
        return v12.mapProtoEngineEnumToLua(v214, l_v211_0, v215);
    end;
    local l_v216_0 = v216 --[[ copy: 21 -> 39 ]];
    v43 = function(v218, v219, v220, v221, v222, v223) --[[ Line: 58 ]]
        -- upvalues: v2 (copy), l_v216_0 (copy)
        local v224, v225 = v2(v218, v219, v220, v221, v222, v223, l_v216_0);
        return v224, v225;
    end;
else
    v43 = nil;
end;
v42.ScaleTypeProp = v43;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.ResamplerMode;
    local v226 = "RESAMPLER_MODE_";
    local l_l_parseImageStringProp__0_15 = l_parseImageStringProp__0 --[[ copy: 20 -> 34 ]];
    local l_v226_0 = v226 --[[ copy: 22 -> 35 ]];
    local function v231(v229) --[[ Line: 80 ]]
        -- upvalues: v9 (copy), l_l_parseImageStringProp__0_15 (copy), v12 (copy), l_v226_0 (copy)
        local v230 = v9.getEngineEnumParser(l_l_parseImageStringProp__0_15);
        return v12.mapProtoEngineEnumToLua(v229, l_v226_0, v230);
    end;
    local l_v231_0 = v231 --[[ copy: 21 -> 36 ]];
    v43 = function(v233, v234, v235, v236, v237, v238) --[[ Line: 58 ]]
        -- upvalues: v2 (copy), l_v231_0 (copy)
        local v239, v240 = v2(v233, v234, v235, v236, v237, v238, l_v231_0);
        return v239, v240;
    end;
else
    v43 = nil;
end;
v42.ResamplerModeProp = v43;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.SizeConstraint;
    local v241 = "SIZE_CONSTRAINT_";
    local l_l_parseImageStringProp__0_16 = l_parseImageStringProp__0 --[[ copy: 20 -> 33 ]];
    local function v245(v243) --[[ Line: 80 ]]
        -- upvalues: v9 (copy), l_l_parseImageStringProp__0_16 (copy), v12 (copy), v241 (copy)
        local v244 = v9.getEngineEnumParser(l_l_parseImageStringProp__0_16);
        return v12.mapProtoEngineEnumToLua(v243, v241, v244);
    end;
    v43 = function(v246, v247, v248, v249, v250, v251) --[[ Line: 58 ]]
        -- upvalues: v2 (copy), v245 (copy)
        local v252, v253 = v2(v246, v247, v248, v249, v250, v251, v245);
        return v252, v253;
    end;
else
    v43 = nil;
end;
v42.SizeConstraintProp = v43;
v42.ColorStyleProp = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v2 else nil;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = v11.parseUiScaledUDim2;
    local l_l_parseImageStringProp__0_17 = l_parseImageStringProp__0 --[[ copy: 20 -> 32 ]];
    v43 = function(v255, v256, v257, v258, v259, v260) --[[ Line: 58 ]]
        -- upvalues: v2 (copy), l_l_parseImageStringProp__0_17 (copy)
        local v261, v262 = v2(v255, v256, v257, v258, v259, v260, l_l_parseImageStringProp__0_17);
        return v261, v262;
    end;
else
    v43 = nil;
end;
v42.UiScaledUDim2Prop = v43;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = v11.parseUiScaledUDim;
    local l_l_parseImageStringProp__0_18 = l_parseImageStringProp__0 --[[ copy: 20 -> 31 ]];
    v43 = function(v264, v265, v266, v267, v268, v269) --[[ Line: 58 ]]
        -- upvalues: v2 (copy), l_l_parseImageStringProp__0_18 (copy)
        local v270, v271 = v2(v264, v265, v266, v267, v268, v269, l_l_parseImageStringProp__0_18);
        return v270, v271;
    end;
else
    v43 = nil;
end;
v42.UiScaledUDimProp = v43;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = v11.parseUiScaledNumber;
    v43 = function(v272, v273, v274, v275, v276, v277) --[[ Line: 58 ]]
        -- upvalues: v2 (copy), l_parseImageStringProp__0 (copy)
        local v278, v279 = v2(v272, v273, v274, v275, v276, v277, l_parseImageStringProp__0);
        return v278, v279;
    end;
else
    v43 = nil;
end;
v42.UiScaledFloatProp = v43;
return function(v280) --[[ Line: 168 ]] --[[ Name: getPropBuilder ]]
    -- upvalues: v42 (copy), v2 (copy)
    if not v280 then
        error("Failed to find prop builder -- missing propDescriptorName");
    end;
    local v281 = v42[v280];
    if not v281 then
        warn((("Could not find propBuilder for propDescriptorName %*. Using default."):format(v280)));
        v281 = v2;
    end;
    return v281;
end;