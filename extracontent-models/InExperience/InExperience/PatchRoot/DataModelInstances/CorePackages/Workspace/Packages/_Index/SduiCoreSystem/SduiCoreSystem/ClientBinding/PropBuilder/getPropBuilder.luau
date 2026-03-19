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
local function _(v15, v16) --[[ Line: 53 ]] --[[ Name: applyParser ]]
    return function(v17, v18, v19, v20, v21, v22) --[[ Line: 57 ]]
        -- upvalues: v15 (copy), v16 (copy)
        local v23, v24 = v15(v17, v18, v19, v20, v21, v22, v16);
        return v23, v24;
    end;
end;
local function _(v26, v27) --[[ Line: 78 ]] --[[ Name: createEngineEnumProtoBuilder ]]
    -- upvalues: v2 (copy), v9 (copy), v12 (copy)
    local l_v2_0 = v2;
    local function v31(v29) --[[ Line: 79 ]]
        -- upvalues: v9 (ref), v26 (copy), v12 (ref), v27 (copy)
        local v30 = v9.getEngineEnumParser(v26);
        return v12.mapProtoEngineEnumToLua(v29, v27, v30);
    end;
    return function(v32, v33, v34, v35, v36, v37) --[[ Line: 57 ]]
        -- upvalues: l_v2_0 (copy), v31 (copy)
        local v38, v39 = l_v2_0(v32, v33, v34, v35, v36, v37, v31);
        return v38, v39;
    end;
end;
local v41 = {
    StringProp = v3, 
    BoolProp = v2, 
    FloatProp = v2, 
    DoubleProp = v2, 
    Int32Prop = v2, 
    Int64Prop = v2, 
    StructProp = v2
};
local l_parseImageStringProp__0 = v9.parseImageStringProp_;
local l_l_parseImageStringProp__0_0 = l_parseImageStringProp__0 --[[ copy: 19 -> 22 ]];
v41.ImageStringProp = function(v44, v45, v46, v47, v48, v49) --[[ Line: 57 ]]
    -- upvalues: v3 (copy), l_l_parseImageStringProp__0_0 (copy)
    local v50, v51 = v3(v44, v45, v46, v47, v48, v49, l_l_parseImageStringProp__0_0);
    return v50, v51;
end;
l_parseImageStringProp__0 = v9.parseImageSetOrImageProp_;
local l_l_parseImageStringProp__0_1 = l_parseImageStringProp__0 --[[ copy: 19 -> 23 ]];
v41.ImageSetProp = function(v53, v54, v55, v56, v57, v58) --[[ Line: 57 ]]
    -- upvalues: v3 (copy), l_l_parseImageStringProp__0_1 (copy)
    local v59, v60 = v3(v53, v54, v55, v56, v57, v58, l_l_parseImageStringProp__0_1);
    return v59, v60;
end;
l_parseImageStringProp__0 = Color3.fromHex;
local l_l_parseImageStringProp__0_2 = l_parseImageStringProp__0 --[[ copy: 19 -> 24 ]];
v41.ColorProp = function(v62, v63, v64, v65, v66, v67) --[[ Line: 57 ]]
    -- upvalues: v2 (copy), l_l_parseImageStringProp__0_2 (copy)
    local v68, v69 = v2(v62, v63, v64, v65, v66, v67, l_l_parseImageStringProp__0_2);
    return v68, v69;
end;
v41.TypographyProp = v2;
v41.TypographyFontProp = v2;
l_parseImageStringProp__0 = v9.parseUDimProp_;
local l_l_parseImageStringProp__0_3 = l_parseImageStringProp__0 --[[ copy: 19 -> 25 ]];
v41.UDimProp = function(v71, v72, v73, v74, v75, v76) --[[ Line: 57 ]]
    -- upvalues: v2 (copy), l_l_parseImageStringProp__0_3 (copy)
    local v77, v78 = v2(v71, v72, v73, v74, v75, v76, l_l_parseImageStringProp__0_3);
    return v77, v78;
end;
l_parseImageStringProp__0 = v9.parseUDim2Prop_;
local l_l_parseImageStringProp__0_4 = l_parseImageStringProp__0 --[[ copy: 19 -> 26 ]];
v41.UDim2Prop = function(v80, v81, v82, v83, v84, v85) --[[ Line: 57 ]]
    -- upvalues: v2 (copy), l_l_parseImageStringProp__0_4 (copy)
    local v86, v87 = v2(v80, v81, v82, v83, v84, v85, l_l_parseImageStringProp__0_4);
    return v86, v87;
end;
l_parseImageStringProp__0 = v9.parseVector2Prop_;
local l_l_parseImageStringProp__0_5 = l_parseImageStringProp__0 --[[ copy: 19 -> 27 ]];
v41.Vector2Prop = function(v89, v90, v91, v92, v93, v94) --[[ Line: 57 ]]
    -- upvalues: v2 (copy), l_l_parseImageStringProp__0_5 (copy)
    local v95, v96 = v2(v89, v90, v91, v92, v93, v94, l_l_parseImageStringProp__0_5);
    return v95, v96;
end;
v41.NestedComponentProp = v6;
v41.LazyNestedComponentListProp = v7;
l_parseImageStringProp__0 = v9.parseIconProp_;
local l_l_parseImageStringProp__0_6 = l_parseImageStringProp__0 --[[ copy: 19 -> 28 ]];
v41.IconProp = function(v98, v99, v100, v101, v102, v103) --[[ Line: 57 ]]
    -- upvalues: v2 (copy), l_l_parseImageStringProp__0_6 (copy)
    local v104, v105 = v2(v98, v99, v100, v101, v102, v103, l_l_parseImageStringProp__0_6);
    return v104, v105;
end;
l_parseImageStringProp__0 = v9.parseGradientProp_;
local l_l_parseImageStringProp__0_7 = l_parseImageStringProp__0 --[[ copy: 19 -> 29 ]];
v41.GradientProp = function(v107, v108, v109, v110, v111, v112) --[[ Line: 57 ]]
    -- upvalues: v2 (copy), l_l_parseImageStringProp__0_7 (copy)
    local v113, v114 = v2(v107, v108, v109, v110, v111, v112, l_l_parseImageStringProp__0_7);
    return v113, v114;
end;
v41.ArrayOfStructProp = v2;
v41.ActionProp = v8;
v41.TableProp = v4;
v41.ArrayOfMenuItemProp = if l_FFlagSduiOverflowMenuComponent_0 then v5 else nil;
v41.MenuItemProp = if l_FFlagSduiOverflowMenuComponent_0 then v4 else nil;
v41.MenuItem = if l_FFlagSduiOverflowMenuComponent_0 then v4 else nil;
v41.GenericShareLinkData = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v4 else nil;
v41.AnalyticsDataField = v2;
local v115;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.AutomaticSize;
    local v116 = "AUTOMATIC_SIZE_";
    local l_l_parseImageStringProp__0_8 = l_parseImageStringProp__0 --[[ copy: 19 -> 51 ]];
    local l_v116_0 = v116 --[[ copy: 21 -> 52 ]];
    local function v121(v119) --[[ Line: 79 ]]
        -- upvalues: v9 (copy), l_l_parseImageStringProp__0_8 (copy), v12 (copy), l_v116_0 (copy)
        local v120 = v9.getEngineEnumParser(l_l_parseImageStringProp__0_8);
        return v12.mapProtoEngineEnumToLua(v119, l_v116_0, v120);
    end;
    local l_v121_0 = v121 --[[ copy: 20 -> 53 ]];
    v115 = function(v123, v124, v125, v126, v127, v128) --[[ Line: 57 ]]
        -- upvalues: v2 (copy), l_v121_0 (copy)
        local v129, v130 = v2(v123, v124, v125, v126, v127, v128, l_v121_0);
        return v129, v130;
    end;
else
    v115 = nil;
end;
v41.AutomaticSizeProp = v115;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.TextTruncate;
    local v131 = "TEXT_TRUNCATE_";
    local l_l_parseImageStringProp__0_9 = l_parseImageStringProp__0 --[[ copy: 19 -> 48 ]];
    local l_v131_0 = v131 --[[ copy: 21 -> 49 ]];
    local function v136(v134) --[[ Line: 79 ]]
        -- upvalues: v9 (copy), l_l_parseImageStringProp__0_9 (copy), v12 (copy), l_v131_0 (copy)
        local v135 = v9.getEngineEnumParser(l_l_parseImageStringProp__0_9);
        return v12.mapProtoEngineEnumToLua(v134, l_v131_0, v135);
    end;
    local l_v136_0 = v136 --[[ copy: 20 -> 50 ]];
    v115 = function(v138, v139, v140, v141, v142, v143) --[[ Line: 57 ]]
        -- upvalues: v2 (copy), l_v136_0 (copy)
        local v144, v145 = v2(v138, v139, v140, v141, v142, v143, l_v136_0);
        return v144, v145;
    end;
else
    v115 = nil;
end;
v41.TextTruncateProp = v115;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.TextXAlignment;
    local v146 = "TEXT_X_ALIGNMENT_";
    local l_l_parseImageStringProp__0_10 = l_parseImageStringProp__0 --[[ copy: 19 -> 45 ]];
    local l_v146_0 = v146 --[[ copy: 21 -> 46 ]];
    local function v151(v149) --[[ Line: 79 ]]
        -- upvalues: v9 (copy), l_l_parseImageStringProp__0_10 (copy), v12 (copy), l_v146_0 (copy)
        local v150 = v9.getEngineEnumParser(l_l_parseImageStringProp__0_10);
        return v12.mapProtoEngineEnumToLua(v149, l_v146_0, v150);
    end;
    local l_v151_0 = v151 --[[ copy: 20 -> 47 ]];
    v115 = function(v153, v154, v155, v156, v157, v158) --[[ Line: 57 ]]
        -- upvalues: v2 (copy), l_v151_0 (copy)
        local v159, v160 = v2(v153, v154, v155, v156, v157, v158, l_v151_0);
        return v159, v160;
    end;
else
    v115 = nil;
end;
v41.TextXAlignmentProp = v115;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.TextYAlignment;
    local v161 = "TEXT_Y_ALIGNMENT_";
    local l_l_parseImageStringProp__0_11 = l_parseImageStringProp__0 --[[ copy: 19 -> 42 ]];
    local l_v161_0 = v161 --[[ copy: 21 -> 43 ]];
    local function v166(v164) --[[ Line: 79 ]]
        -- upvalues: v9 (copy), l_l_parseImageStringProp__0_11 (copy), v12 (copy), l_v161_0 (copy)
        local v165 = v9.getEngineEnumParser(l_l_parseImageStringProp__0_11);
        return v12.mapProtoEngineEnumToLua(v164, l_v161_0, v165);
    end;
    local l_v166_0 = v166 --[[ copy: 20 -> 44 ]];
    v115 = function(v168, v169, v170, v171, v172, v173) --[[ Line: 57 ]]
        -- upvalues: v2 (copy), l_v166_0 (copy)
        local v174, v175 = v2(v168, v169, v170, v171, v172, v173, l_v166_0);
        return v174, v175;
    end;
else
    v115 = nil;
end;
v41.TextYAlignmentProp = v115;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.UIFlexMode;
    local v176 = "UI_FLEX_MODE_";
    local l_l_parseImageStringProp__0_12 = l_parseImageStringProp__0 --[[ copy: 19 -> 39 ]];
    local l_v176_0 = v176 --[[ copy: 21 -> 40 ]];
    local function v181(v179) --[[ Line: 79 ]]
        -- upvalues: v9 (copy), l_l_parseImageStringProp__0_12 (copy), v12 (copy), l_v176_0 (copy)
        local v180 = v9.getEngineEnumParser(l_l_parseImageStringProp__0_12);
        return v12.mapProtoEngineEnumToLua(v179, l_v176_0, v180);
    end;
    local l_v181_0 = v181 --[[ copy: 20 -> 41 ]];
    v115 = function(v183, v184, v185, v186, v187, v188) --[[ Line: 57 ]]
        -- upvalues: v2 (copy), l_v181_0 (copy)
        local v189, v190 = v2(v183, v184, v185, v186, v187, v188, l_v181_0);
        return v189, v190;
    end;
else
    v115 = nil;
end;
v41.UIFlexModeProp = v115;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.ScaleType;
    local v191 = "SCALE_TYPE_";
    local l_l_parseImageStringProp__0_13 = l_parseImageStringProp__0 --[[ copy: 19 -> 36 ]];
    local l_v191_0 = v191 --[[ copy: 21 -> 37 ]];
    local function v196(v194) --[[ Line: 79 ]]
        -- upvalues: v9 (copy), l_l_parseImageStringProp__0_13 (copy), v12 (copy), l_v191_0 (copy)
        local v195 = v9.getEngineEnumParser(l_l_parseImageStringProp__0_13);
        return v12.mapProtoEngineEnumToLua(v194, l_v191_0, v195);
    end;
    local l_v196_0 = v196 --[[ copy: 20 -> 38 ]];
    v115 = function(v198, v199, v200, v201, v202, v203) --[[ Line: 57 ]]
        -- upvalues: v2 (copy), l_v196_0 (copy)
        local v204, v205 = v2(v198, v199, v200, v201, v202, v203, l_v196_0);
        return v204, v205;
    end;
else
    v115 = nil;
end;
v41.ScaleTypeProp = v115;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.ResamplerMode;
    local v206 = "RESAMPLER_MODE_";
    local l_l_parseImageStringProp__0_14 = l_parseImageStringProp__0 --[[ copy: 19 -> 33 ]];
    local l_v206_0 = v206 --[[ copy: 21 -> 34 ]];
    local function v211(v209) --[[ Line: 79 ]]
        -- upvalues: v9 (copy), l_l_parseImageStringProp__0_14 (copy), v12 (copy), l_v206_0 (copy)
        local v210 = v9.getEngineEnumParser(l_l_parseImageStringProp__0_14);
        return v12.mapProtoEngineEnumToLua(v209, l_v206_0, v210);
    end;
    local l_v211_0 = v211 --[[ copy: 20 -> 35 ]];
    v115 = function(v213, v214, v215, v216, v217, v218) --[[ Line: 57 ]]
        -- upvalues: v2 (copy), l_v211_0 (copy)
        local v219, v220 = v2(v213, v214, v215, v216, v217, v218, l_v211_0);
        return v219, v220;
    end;
else
    v115 = nil;
end;
v41.ResamplerModeProp = v115;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.SizeConstraint;
    local v221 = "SIZE_CONSTRAINT_";
    local l_l_parseImageStringProp__0_15 = l_parseImageStringProp__0 --[[ copy: 19 -> 32 ]];
    local function v225(v223) --[[ Line: 79 ]]
        -- upvalues: v9 (copy), l_l_parseImageStringProp__0_15 (copy), v12 (copy), v221 (copy)
        local v224 = v9.getEngineEnumParser(l_l_parseImageStringProp__0_15);
        return v12.mapProtoEngineEnumToLua(v223, v221, v224);
    end;
    v115 = function(v226, v227, v228, v229, v230, v231) --[[ Line: 57 ]]
        -- upvalues: v2 (copy), v225 (copy)
        local v232, v233 = v2(v226, v227, v228, v229, v230, v231, v225);
        return v232, v233;
    end;
else
    v115 = nil;
end;
v41.SizeConstraintProp = v115;
v41.ColorStyleProp = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v2 else nil;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = v11.parseUiScaledUDim2;
    local l_l_parseImageStringProp__0_16 = l_parseImageStringProp__0 --[[ copy: 19 -> 31 ]];
    v115 = function(v235, v236, v237, v238, v239, v240) --[[ Line: 57 ]]
        -- upvalues: v2 (copy), l_l_parseImageStringProp__0_16 (copy)
        local v241, v242 = v2(v235, v236, v237, v238, v239, v240, l_l_parseImageStringProp__0_16);
        return v241, v242;
    end;
else
    v115 = nil;
end;
v41.UiScaledUDim2Prop = v115;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = v11.parseUiScaledUDim;
    local l_l_parseImageStringProp__0_17 = l_parseImageStringProp__0 --[[ copy: 19 -> 30 ]];
    v115 = function(v244, v245, v246, v247, v248, v249) --[[ Line: 57 ]]
        -- upvalues: v2 (copy), l_l_parseImageStringProp__0_17 (copy)
        local v250, v251 = v2(v244, v245, v246, v247, v248, v249, l_l_parseImageStringProp__0_17);
        return v250, v251;
    end;
else
    v115 = nil;
end;
v41.UiScaledUDimProp = v115;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = v11.parseUiScaledNumber;
    v115 = function(v252, v253, v254, v255, v256, v257) --[[ Line: 57 ]]
        -- upvalues: v2 (copy), l_parseImageStringProp__0 (copy)
        local v258, v259 = v2(v252, v253, v254, v255, v256, v257, l_parseImageStringProp__0);
        return v258, v259;
    end;
else
    v115 = nil;
end;
v41.UiScaledFloatProp = v115;
return function(v260) --[[ Line: 163 ]] --[[ Name: getPropBuilder ]]
    -- upvalues: v41 (copy), v2 (copy)
    if not v260 then
        error("Failed to find prop builder -- missing propDescriptorName");
    end;
    local v261 = v41[v260];
    if not v261 then
        warn((("Could not find propBuilder for propDescriptorName %*. Using default."):format(v260)));
        v261 = v2;
    end;
    return v261;
end;