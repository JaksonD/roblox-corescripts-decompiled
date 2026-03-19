local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildDefaultProp);
local v3 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildStringProp);
local v4 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildTableProp);
local v5 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildRepeatedProp);
local v6 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildTokenOnlyProp);
local v7 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildNestedComponentProp);
local v8 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildLazyNestedComponentListProp);
local v9 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildIconProp);
local v10 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildGradientProp);
local v11 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildActionProp);
local v12 = require(l_script_FirstAncestor_0.SduiParsers);
local _ = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes);
local v14 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.SduiClientBindingParsers);
local v15 = require(l_script_FirstAncestor_0.ClientBinding.ProtoVariableMapper);
local l_FFlagSduiV2ConditionalSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiV2ConditionalSupport;
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents;
local l_FFlagSduiOverflowMenuComponent_0 = require(l_Parent_0.SharedFlags).FFlagSduiOverflowMenuComponent;
local function _(v19, v20) --[[ Line: 57 ]] --[[ Name: applyParser ]]
    return function(v21, v22, v23, v24, v25, v26) --[[ Line: 61 ]]
        -- upvalues: v19 (copy), v20 (copy)
        local v27, v28 = v19(v21, v22, v23, v24, v25, v26, v20);
        return v27, v28;
    end;
end;
local function _(v30, v31) --[[ Line: 82 ]] --[[ Name: createEngineEnumProtoBuilder ]]
    -- upvalues: v2 (copy), v12 (copy), v15 (copy)
    local l_v2_0 = v2;
    local function v35(v33) --[[ Line: 83 ]]
        -- upvalues: v12 (ref), v30 (copy), v15 (ref), v31 (copy)
        local v34 = v12.getEngineEnumParser(v30);
        return v15.mapProtoEngineEnumToLua(v33, v31, v34);
    end;
    return function(v36, v37, v38, v39, v40, v41) --[[ Line: 61 ]]
        -- upvalues: l_v2_0 (copy), v35 (copy)
        local v42, v43 = l_v2_0(v36, v37, v38, v39, v40, v41, v35);
        return v42, v43;
    end;
end;
local v45 = {
    StringProp = v3, 
    BoolProp = v2, 
    FloatProp = v2, 
    DoubleProp = v2, 
    Int32Prop = v2, 
    Int64Prop = v2, 
    StructProp = v2
};
local l_parseImageStringProp__0 = v12.parseImageStringProp_;
local l_l_parseImageStringProp__0_0 = l_parseImageStringProp__0 --[[ copy: 23 -> 26 ]];
v45.ImageStringProp = function(v48, v49, v50, v51, v52, v53) --[[ Line: 61 ]]
    -- upvalues: v3 (copy), l_l_parseImageStringProp__0_0 (copy)
    local v54, v55 = v3(v48, v49, v50, v51, v52, v53, l_l_parseImageStringProp__0_0);
    return v54, v55;
end;
l_parseImageStringProp__0 = v12.parseImageSetOrImageProp_;
local l_l_parseImageStringProp__0_1 = l_parseImageStringProp__0 --[[ copy: 23 -> 27 ]];
v45.ImageSetProp = function(v57, v58, v59, v60, v61, v62) --[[ Line: 61 ]]
    -- upvalues: v3 (copy), l_l_parseImageStringProp__0_1 (copy)
    local v63, v64 = v3(v57, v58, v59, v60, v61, v62, l_l_parseImageStringProp__0_1);
    return v63, v64;
end;
l_parseImageStringProp__0 = Color3.fromHex;
local l_l_parseImageStringProp__0_2 = l_parseImageStringProp__0 --[[ copy: 23 -> 28 ]];
v45.ColorProp = function(v66, v67, v68, v69, v70, v71) --[[ Line: 61 ]]
    -- upvalues: v2 (copy), l_l_parseImageStringProp__0_2 (copy)
    local v72, v73 = v2(v66, v67, v68, v69, v70, v71, l_l_parseImageStringProp__0_2);
    return v72, v73;
end;
v45.TypographyProp = if l_FFlagSduiV2ConditionalSupport_0 then v2 else v6;
v45.TypographyFontProp = if l_FFlagSduiV2ConditionalSupport_0 then v2 else v6;
l_parseImageStringProp__0 = v12.parseUDimProp_;
local l_l_parseImageStringProp__0_3 = l_parseImageStringProp__0 --[[ copy: 23 -> 29 ]];
v45.UDimProp = function(v75, v76, v77, v78, v79, v80) --[[ Line: 61 ]]
    -- upvalues: v2 (copy), l_l_parseImageStringProp__0_3 (copy)
    local v81, v82 = v2(v75, v76, v77, v78, v79, v80, l_l_parseImageStringProp__0_3);
    return v81, v82;
end;
l_parseImageStringProp__0 = v12.parseUDim2Prop_;
local l_l_parseImageStringProp__0_4 = l_parseImageStringProp__0 --[[ copy: 23 -> 30 ]];
v45.UDim2Prop = function(v84, v85, v86, v87, v88, v89) --[[ Line: 61 ]]
    -- upvalues: v2 (copy), l_l_parseImageStringProp__0_4 (copy)
    local v90, v91 = v2(v84, v85, v86, v87, v88, v89, l_l_parseImageStringProp__0_4);
    return v90, v91;
end;
l_parseImageStringProp__0 = v12.parseVector2Prop_;
local l_l_parseImageStringProp__0_5 = l_parseImageStringProp__0 --[[ copy: 23 -> 31 ]];
v45.Vector2Prop = function(v93, v94, v95, v96, v97, v98) --[[ Line: 61 ]]
    -- upvalues: v2 (copy), l_l_parseImageStringProp__0_5 (copy)
    local v99, v100 = v2(v93, v94, v95, v96, v97, v98, l_l_parseImageStringProp__0_5);
    return v99, v100;
end;
v45.NestedComponentProp = v7;
v45.LazyNestedComponentListProp = v8;
local v101;
if l_FFlagSduiV2ConditionalSupport_0 then
    l_parseImageStringProp__0 = v12.parseIconProp_;
    local l_l_parseImageStringProp__0_6 = l_parseImageStringProp__0 --[[ copy: 23 -> 57 ]];
    v101 = function(v103, v104, v105, v106, v107, v108) --[[ Line: 61 ]]
        -- upvalues: v2 (copy), l_l_parseImageStringProp__0_6 (copy)
        local v109, v110 = v2(v103, v104, v105, v106, v107, v108, l_l_parseImageStringProp__0_6);
        return v109, v110;
    end;
else
    v101 = v9;
end;
v45.IconProp = v101;
if l_FFlagSduiV2ConditionalSupport_0 then
    l_parseImageStringProp__0 = v12.parseGradientProp_;
    local l_l_parseImageStringProp__0_7 = l_parseImageStringProp__0 --[[ copy: 23 -> 56 ]];
    v101 = function(v112, v113, v114, v115, v116, v117) --[[ Line: 61 ]]
        -- upvalues: v2 (copy), l_l_parseImageStringProp__0_7 (copy)
        local v118, v119 = v2(v112, v113, v114, v115, v116, v117, l_l_parseImageStringProp__0_7);
        return v118, v119;
    end;
else
    v101 = v10;
end;
v45.GradientProp = v101;
v45.ArrayOfStructProp = v2;
v45.ActionProp = v11;
v45.TableProp = if l_FFlagSduiV2ConditionalSupport_0 then v4 else nil;
v45.ArrayOfMenuItemProp = if l_FFlagSduiOverflowMenuComponent_0 then v5 else nil;
v45.MenuItemProp = if l_FFlagSduiOverflowMenuComponent_0 then v4 else nil;
v45.MenuItem = if l_FFlagSduiOverflowMenuComponent_0 then v4 else nil;
v45.GenericShareLinkData = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v4 else nil;
v45.AnalyticsDataField = v2;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.AutomaticSize;
    local v120 = "AUTOMATIC_SIZE_";
    local l_l_parseImageStringProp__0_8 = l_parseImageStringProp__0 --[[ copy: 23 -> 53 ]];
    local l_v120_0 = v120 --[[ copy: 25 -> 54 ]];
    local function v125(v123) --[[ Line: 83 ]]
        -- upvalues: v12 (copy), l_l_parseImageStringProp__0_8 (copy), v15 (copy), l_v120_0 (copy)
        local v124 = v12.getEngineEnumParser(l_l_parseImageStringProp__0_8);
        return v15.mapProtoEngineEnumToLua(v123, l_v120_0, v124);
    end;
    local l_v125_0 = v125 --[[ copy: 24 -> 55 ]];
    v101 = function(v127, v128, v129, v130, v131, v132) --[[ Line: 61 ]]
        -- upvalues: v2 (copy), l_v125_0 (copy)
        local v133, v134 = v2(v127, v128, v129, v130, v131, v132, l_v125_0);
        return v133, v134;
    end;
else
    v101 = nil;
end;
v45.AutomaticSizeProp = v101;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.TextTruncate;
    local v135 = "TEXT_TRUNCATE_";
    local l_l_parseImageStringProp__0_9 = l_parseImageStringProp__0 --[[ copy: 23 -> 50 ]];
    local l_v135_0 = v135 --[[ copy: 25 -> 51 ]];
    local function v140(v138) --[[ Line: 83 ]]
        -- upvalues: v12 (copy), l_l_parseImageStringProp__0_9 (copy), v15 (copy), l_v135_0 (copy)
        local v139 = v12.getEngineEnumParser(l_l_parseImageStringProp__0_9);
        return v15.mapProtoEngineEnumToLua(v138, l_v135_0, v139);
    end;
    local l_v140_0 = v140 --[[ copy: 24 -> 52 ]];
    v101 = function(v142, v143, v144, v145, v146, v147) --[[ Line: 61 ]]
        -- upvalues: v2 (copy), l_v140_0 (copy)
        local v148, v149 = v2(v142, v143, v144, v145, v146, v147, l_v140_0);
        return v148, v149;
    end;
else
    v101 = nil;
end;
v45.TextTruncateProp = v101;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.TextXAlignment;
    local v150 = "TEXT_X_ALIGNMENT_";
    local l_l_parseImageStringProp__0_10 = l_parseImageStringProp__0 --[[ copy: 23 -> 47 ]];
    local l_v150_0 = v150 --[[ copy: 25 -> 48 ]];
    local function v155(v153) --[[ Line: 83 ]]
        -- upvalues: v12 (copy), l_l_parseImageStringProp__0_10 (copy), v15 (copy), l_v150_0 (copy)
        local v154 = v12.getEngineEnumParser(l_l_parseImageStringProp__0_10);
        return v15.mapProtoEngineEnumToLua(v153, l_v150_0, v154);
    end;
    local l_v155_0 = v155 --[[ copy: 24 -> 49 ]];
    v101 = function(v157, v158, v159, v160, v161, v162) --[[ Line: 61 ]]
        -- upvalues: v2 (copy), l_v155_0 (copy)
        local v163, v164 = v2(v157, v158, v159, v160, v161, v162, l_v155_0);
        return v163, v164;
    end;
else
    v101 = nil;
end;
v45.TextXAlignmentProp = v101;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.TextYAlignment;
    local v165 = "TEXT_Y_ALIGNMENT_";
    local l_l_parseImageStringProp__0_11 = l_parseImageStringProp__0 --[[ copy: 23 -> 44 ]];
    local l_v165_0 = v165 --[[ copy: 25 -> 45 ]];
    local function v170(v168) --[[ Line: 83 ]]
        -- upvalues: v12 (copy), l_l_parseImageStringProp__0_11 (copy), v15 (copy), l_v165_0 (copy)
        local v169 = v12.getEngineEnumParser(l_l_parseImageStringProp__0_11);
        return v15.mapProtoEngineEnumToLua(v168, l_v165_0, v169);
    end;
    local l_v170_0 = v170 --[[ copy: 24 -> 46 ]];
    v101 = function(v172, v173, v174, v175, v176, v177) --[[ Line: 61 ]]
        -- upvalues: v2 (copy), l_v170_0 (copy)
        local v178, v179 = v2(v172, v173, v174, v175, v176, v177, l_v170_0);
        return v178, v179;
    end;
else
    v101 = nil;
end;
v45.TextYAlignmentProp = v101;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.UIFlexMode;
    local v180 = "UI_FLEX_MODE_";
    local l_l_parseImageStringProp__0_12 = l_parseImageStringProp__0 --[[ copy: 23 -> 41 ]];
    local l_v180_0 = v180 --[[ copy: 25 -> 42 ]];
    local function v185(v183) --[[ Line: 83 ]]
        -- upvalues: v12 (copy), l_l_parseImageStringProp__0_12 (copy), v15 (copy), l_v180_0 (copy)
        local v184 = v12.getEngineEnumParser(l_l_parseImageStringProp__0_12);
        return v15.mapProtoEngineEnumToLua(v183, l_v180_0, v184);
    end;
    local l_v185_0 = v185 --[[ copy: 24 -> 43 ]];
    v101 = function(v187, v188, v189, v190, v191, v192) --[[ Line: 61 ]]
        -- upvalues: v2 (copy), l_v185_0 (copy)
        local v193, v194 = v2(v187, v188, v189, v190, v191, v192, l_v185_0);
        return v193, v194;
    end;
else
    v101 = nil;
end;
v45.UIFlexModeProp = v101;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.ScaleType;
    local v195 = "SCALE_TYPE_";
    local l_l_parseImageStringProp__0_13 = l_parseImageStringProp__0 --[[ copy: 23 -> 38 ]];
    local l_v195_0 = v195 --[[ copy: 25 -> 39 ]];
    local function v200(v198) --[[ Line: 83 ]]
        -- upvalues: v12 (copy), l_l_parseImageStringProp__0_13 (copy), v15 (copy), l_v195_0 (copy)
        local v199 = v12.getEngineEnumParser(l_l_parseImageStringProp__0_13);
        return v15.mapProtoEngineEnumToLua(v198, l_v195_0, v199);
    end;
    local l_v200_0 = v200 --[[ copy: 24 -> 40 ]];
    v101 = function(v202, v203, v204, v205, v206, v207) --[[ Line: 61 ]]
        -- upvalues: v2 (copy), l_v200_0 (copy)
        local v208, v209 = v2(v202, v203, v204, v205, v206, v207, l_v200_0);
        return v208, v209;
    end;
else
    v101 = nil;
end;
v45.ScaleTypeProp = v101;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.ResamplerMode;
    local v210 = "RESAMPLER_MODE_";
    local l_l_parseImageStringProp__0_14 = l_parseImageStringProp__0 --[[ copy: 23 -> 35 ]];
    local l_v210_0 = v210 --[[ copy: 25 -> 36 ]];
    local function v215(v213) --[[ Line: 83 ]]
        -- upvalues: v12 (copy), l_l_parseImageStringProp__0_14 (copy), v15 (copy), l_v210_0 (copy)
        local v214 = v12.getEngineEnumParser(l_l_parseImageStringProp__0_14);
        return v15.mapProtoEngineEnumToLua(v213, l_v210_0, v214);
    end;
    local l_v215_0 = v215 --[[ copy: 24 -> 37 ]];
    v101 = function(v217, v218, v219, v220, v221, v222) --[[ Line: 61 ]]
        -- upvalues: v2 (copy), l_v215_0 (copy)
        local v223, v224 = v2(v217, v218, v219, v220, v221, v222, l_v215_0);
        return v223, v224;
    end;
else
    v101 = nil;
end;
v45.ResamplerModeProp = v101;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.SizeConstraint;
    local v225 = "SIZE_CONSTRAINT_";
    local l_l_parseImageStringProp__0_15 = l_parseImageStringProp__0 --[[ copy: 23 -> 34 ]];
    local function v229(v227) --[[ Line: 83 ]]
        -- upvalues: v12 (copy), l_l_parseImageStringProp__0_15 (copy), v15 (copy), v225 (copy)
        local v228 = v12.getEngineEnumParser(l_l_parseImageStringProp__0_15);
        return v15.mapProtoEngineEnumToLua(v227, v225, v228);
    end;
    v101 = function(v230, v231, v232, v233, v234, v235) --[[ Line: 61 ]]
        -- upvalues: v2 (copy), v229 (copy)
        local v236, v237 = v2(v230, v231, v232, v233, v234, v235, v229);
        return v236, v237;
    end;
else
    v101 = nil;
end;
v45.SizeConstraintProp = v101;
v45.ColorStyleProp = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v2 else nil;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = v14.parseUiScaledUDim2;
    local l_l_parseImageStringProp__0_16 = l_parseImageStringProp__0 --[[ copy: 23 -> 33 ]];
    v101 = function(v239, v240, v241, v242, v243, v244) --[[ Line: 61 ]]
        -- upvalues: v2 (copy), l_l_parseImageStringProp__0_16 (copy)
        local v245, v246 = v2(v239, v240, v241, v242, v243, v244, l_l_parseImageStringProp__0_16);
        return v245, v246;
    end;
else
    v101 = nil;
end;
v45.UiScaledUDim2Prop = v101;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = v14.parseUiScaledUDim;
    local l_l_parseImageStringProp__0_17 = l_parseImageStringProp__0 --[[ copy: 23 -> 32 ]];
    v101 = function(v248, v249, v250, v251, v252, v253) --[[ Line: 61 ]]
        -- upvalues: v2 (copy), l_l_parseImageStringProp__0_17 (copy)
        local v254, v255 = v2(v248, v249, v250, v251, v252, v253, l_l_parseImageStringProp__0_17);
        return v254, v255;
    end;
else
    v101 = nil;
end;
v45.UiScaledUDimProp = v101;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = v14.parseUiScaledNumber;
    v101 = function(v256, v257, v258, v259, v260, v261) --[[ Line: 61 ]]
        -- upvalues: v2 (copy), l_parseImageStringProp__0 (copy)
        local v262, v263 = v2(v256, v257, v258, v259, v260, v261, l_parseImageStringProp__0);
        return v262, v263;
    end;
else
    v101 = nil;
end;
v45.UiScaledFloatProp = v101;
return function(v264) --[[ Line: 171 ]] --[[ Name: getPropBuilder ]]
    -- upvalues: v45 (copy), v2 (copy)
    if not v264 then
        error("Failed to find prop builder -- missing propDescriptorName");
    end;
    local v265 = v45[v264];
    if not v265 then
        warn((("Could not find propBuilder for propDescriptorName %*. Using default."):format(v264)));
        v265 = v2;
    end;
    return v265;
end;