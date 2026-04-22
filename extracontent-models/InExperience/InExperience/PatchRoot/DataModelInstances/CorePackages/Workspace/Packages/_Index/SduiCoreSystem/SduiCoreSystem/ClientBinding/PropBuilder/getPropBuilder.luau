local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildDefaultProp);
local v3 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildStringProp);
local v4 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildTableProp);
local v5 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildRepeatedProp);
local v6 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildNestedComponentProp);
local v7 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildLazyNestedComponentListProp);
local v8 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildNestedComponentListProp);
local v9 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildActionProp);
local v10 = require(l_script_FirstAncestor_0.SduiParsers);
local _ = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes);
local v12 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.SduiClientBindingParsers);
local v13 = require(l_script_FirstAncestor_0.ClientBinding.ProtoVariableMapper);
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents;
local l_FFlagSduiOverflowMenuComponent_0 = require(l_Parent_0.SharedFlags).FFlagSduiOverflowMenuComponent;
local l_FFlagSduiStructPropParsers_0 = require(l_Parent_0.SharedFlags).FFlagSduiStructPropParsers;
local l_FFlagSduiExperienceDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiExperienceDetailsSupport;
local l_FFlagSduiEventDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiEventDetailsSupport;
local l_FFlagSduiNestedComponentListProp_0 = require(l_Parent_0.SharedFlags).FFlagSduiNestedComponentListProp;
local l_FFlagSduiChartsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiChartsSupport;
local function _(v21, v22) --[[ Line: 59 ]] --[[ Name: applyParser ]]
    return function(v23, v24, v25, v26, v27, v28) --[[ Line: 63 ]]
        -- upvalues: v21 (copy), v22 (copy)
        local v29, v30 = v21(v23, v24, v25, v26, v27, v28, v22);
        return v29, v30;
    end;
end;
local function _(v32, v33) --[[ Line: 84 ]] --[[ Name: createEngineEnumProtoBuilder ]]
    -- upvalues: v2 (copy), v10 (copy), v13 (copy)
    local l_v2_0 = v2;
    local function v37(v35) --[[ Line: 85 ]]
        -- upvalues: v10 (ref), v32 (copy), v13 (ref), v33 (copy)
        local v36 = v10.getEngineEnumParser(v32);
        return v13.mapProtoEngineEnumToLua(v35, v33, v36);
    end;
    return function(v38, v39, v40, v41, v42, v43) --[[ Line: 63 ]]
        -- upvalues: l_v2_0 (copy), v37 (copy)
        local v44, v45 = l_v2_0(v38, v39, v40, v41, v42, v43, v37);
        return v44, v45;
    end;
end;
local v47 = {
    StringProp = v3, 
    BoolProp = v2, 
    FloatProp = v2, 
    DoubleProp = v2, 
    Int32Prop = v2, 
    Int64Prop = v2
};
local v48;
if l_FFlagSduiStructPropParsers_0 then
    local l_parseStruct_0 = v12.parseStruct;
    local l_l_parseStruct_0_0 = l_parseStruct_0 --[[ copy: 25 -> 64 ]];
    v48 = function(v51, v52, v53, v54, v55, v56) --[[ Line: 63 ]]
        -- upvalues: v2 (copy), l_l_parseStruct_0_0 (copy)
        local v57, v58 = v2(v51, v52, v53, v54, v55, v56, l_l_parseStruct_0_0);
        return v57, v58;
    end;
else
    v48 = v2;
end;
v47.StructProp = v48;
local l_parseImageStringProp__0 = v10.parseImageStringProp_;
local l_l_parseImageStringProp__0_0 = l_parseImageStringProp__0 --[[ copy: 25 -> 28 ]];
v47.ImageStringProp = function(v61, v62, v63, v64, v65, v66) --[[ Line: 63 ]]
    -- upvalues: v3 (copy), l_l_parseImageStringProp__0_0 (copy)
    local v67, v68 = v3(v61, v62, v63, v64, v65, v66, l_l_parseImageStringProp__0_0);
    return v67, v68;
end;
l_parseImageStringProp__0 = v10.parseImageSetOrImageProp_;
local l_l_parseImageStringProp__0_1 = l_parseImageStringProp__0 --[[ copy: 25 -> 29 ]];
v47.ImageSetProp = function(v70, v71, v72, v73, v74, v75) --[[ Line: 63 ]]
    -- upvalues: v3 (copy), l_l_parseImageStringProp__0_1 (copy)
    local v76, v77 = v3(v70, v71, v72, v73, v74, v75, l_l_parseImageStringProp__0_1);
    return v76, v77;
end;
l_parseImageStringProp__0 = Color3.fromHex;
local l_l_parseImageStringProp__0_2 = l_parseImageStringProp__0 --[[ copy: 25 -> 30 ]];
v47.ColorProp = function(v79, v80, v81, v82, v83, v84) --[[ Line: 63 ]]
    -- upvalues: v2 (copy), l_l_parseImageStringProp__0_2 (copy)
    local v85, v86 = v2(v79, v80, v81, v82, v83, v84, l_l_parseImageStringProp__0_2);
    return v85, v86;
end;
v47.TypographyProp = v2;
v47.TypographyFontProp = v2;
l_parseImageStringProp__0 = v10.parseUDimProp_;
local l_l_parseImageStringProp__0_3 = l_parseImageStringProp__0 --[[ copy: 25 -> 31 ]];
v47.UDimProp = function(v88, v89, v90, v91, v92, v93) --[[ Line: 63 ]]
    -- upvalues: v2 (copy), l_l_parseImageStringProp__0_3 (copy)
    local v94, v95 = v2(v88, v89, v90, v91, v92, v93, l_l_parseImageStringProp__0_3);
    return v94, v95;
end;
l_parseImageStringProp__0 = v10.parseUDim2Prop_;
local l_l_parseImageStringProp__0_4 = l_parseImageStringProp__0 --[[ copy: 25 -> 32 ]];
v47.UDim2Prop = function(v97, v98, v99, v100, v101, v102) --[[ Line: 63 ]]
    -- upvalues: v2 (copy), l_l_parseImageStringProp__0_4 (copy)
    local v103, v104 = v2(v97, v98, v99, v100, v101, v102, l_l_parseImageStringProp__0_4);
    return v103, v104;
end;
l_parseImageStringProp__0 = v10.parseVector2Prop_;
local l_l_parseImageStringProp__0_5 = l_parseImageStringProp__0 --[[ copy: 25 -> 33 ]];
v47.Vector2Prop = function(v106, v107, v108, v109, v110, v111) --[[ Line: 63 ]]
    -- upvalues: v2 (copy), l_l_parseImageStringProp__0_5 (copy)
    local v112, v113 = v2(v106, v107, v108, v109, v110, v111, l_l_parseImageStringProp__0_5);
    return v112, v113;
end;
v47.NestedComponentProp = v6;
v47.NestedComponentListProp = if l_FFlagSduiNestedComponentListProp_0 then v8 else nil;
v47.LazyNestedComponentListProp = v7;
l_parseImageStringProp__0 = v10.parseIconProp_;
local l_l_parseImageStringProp__0_6 = l_parseImageStringProp__0 --[[ copy: 25 -> 34 ]];
v47.IconProp = function(v115, v116, v117, v118, v119, v120) --[[ Line: 63 ]]
    -- upvalues: v2 (copy), l_l_parseImageStringProp__0_6 (copy)
    local v121, v122 = v2(v115, v116, v117, v118, v119, v120, l_l_parseImageStringProp__0_6);
    return v121, v122;
end;
l_parseImageStringProp__0 = v10.parseGradientProp_;
local l_l_parseImageStringProp__0_7 = l_parseImageStringProp__0 --[[ copy: 25 -> 35 ]];
v47.GradientProp = function(v124, v125, v126, v127, v128, v129) --[[ Line: 63 ]]
    -- upvalues: v2 (copy), l_l_parseImageStringProp__0_7 (copy)
    local v130, v131 = v2(v124, v125, v126, v127, v128, v129, l_l_parseImageStringProp__0_7);
    return v130, v131;
end;
if l_FFlagSduiStructPropParsers_0 then
    l_parseImageStringProp__0 = v12.parseArrayOfStruct;
    local l_l_parseImageStringProp__0_8 = l_parseImageStringProp__0 --[[ copy: 25 -> 63 ]];
    v48 = function(v133, v134, v135, v136, v137, v138) --[[ Line: 63 ]]
        -- upvalues: v2 (copy), l_l_parseImageStringProp__0_8 (copy)
        local v139, v140 = v2(v133, v134, v135, v136, v137, v138, l_l_parseImageStringProp__0_8);
        return v139, v140;
    end;
else
    v48 = v2;
end;
v47.ArrayOfStructProp = v48;
v47.ActionProp = v9;
v47.TableProp = v4;
v47.ArrayOfMenuItemProp = if l_FFlagSduiOverflowMenuComponent_0 then v5 else nil;
v47.MenuItemProp = if l_FFlagSduiOverflowMenuComponent_0 then v4 else nil;
v47.MenuItem = if l_FFlagSduiOverflowMenuComponent_0 then v4 else nil;
v47.GenericShareLinkData = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v4 else nil;
v47.ShareLinkFetchData = if not not l_FFlagSduiExperienceDetailsSupport_0 or l_FFlagSduiEventDetailsSupport_0 then v4 else nil;
v47.MediaGallerySchema_MediaItemArrayProp = if l_FFlagSduiExperienceDetailsSupport_0 then v5 else nil;
v47.AnalyticsDataField = v2;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.AutomaticSize;
    local v141 = "AUTOMATIC_SIZE_";
    local l_l_parseImageStringProp__0_9 = l_parseImageStringProp__0 --[[ copy: 25 -> 60 ]];
    local l_v141_0 = v141 --[[ copy: 27 -> 61 ]];
    local function v146(v144) --[[ Line: 85 ]]
        -- upvalues: v10 (copy), l_l_parseImageStringProp__0_9 (copy), v13 (copy), l_v141_0 (copy)
        local v145 = v10.getEngineEnumParser(l_l_parseImageStringProp__0_9);
        return v13.mapProtoEngineEnumToLua(v144, l_v141_0, v145);
    end;
    local l_v146_0 = v146 --[[ copy: 26 -> 62 ]];
    v48 = function(v148, v149, v150, v151, v152, v153) --[[ Line: 63 ]]
        -- upvalues: v2 (copy), l_v146_0 (copy)
        local v154, v155 = v2(v148, v149, v150, v151, v152, v153, l_v146_0);
        return v154, v155;
    end;
else
    v48 = nil;
end;
v47.AutomaticSizeProp = v48;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.TextTruncate;
    local v156 = "TEXT_TRUNCATE_";
    local l_l_parseImageStringProp__0_10 = l_parseImageStringProp__0 --[[ copy: 25 -> 57 ]];
    local l_v156_0 = v156 --[[ copy: 27 -> 58 ]];
    local function v161(v159) --[[ Line: 85 ]]
        -- upvalues: v10 (copy), l_l_parseImageStringProp__0_10 (copy), v13 (copy), l_v156_0 (copy)
        local v160 = v10.getEngineEnumParser(l_l_parseImageStringProp__0_10);
        return v13.mapProtoEngineEnumToLua(v159, l_v156_0, v160);
    end;
    local l_v161_0 = v161 --[[ copy: 26 -> 59 ]];
    v48 = function(v163, v164, v165, v166, v167, v168) --[[ Line: 63 ]]
        -- upvalues: v2 (copy), l_v161_0 (copy)
        local v169, v170 = v2(v163, v164, v165, v166, v167, v168, l_v161_0);
        return v169, v170;
    end;
else
    v48 = nil;
end;
v47.TextTruncateProp = v48;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.TextXAlignment;
    local v171 = "TEXT_X_ALIGNMENT_";
    local l_l_parseImageStringProp__0_11 = l_parseImageStringProp__0 --[[ copy: 25 -> 54 ]];
    local l_v171_0 = v171 --[[ copy: 27 -> 55 ]];
    local function v176(v174) --[[ Line: 85 ]]
        -- upvalues: v10 (copy), l_l_parseImageStringProp__0_11 (copy), v13 (copy), l_v171_0 (copy)
        local v175 = v10.getEngineEnumParser(l_l_parseImageStringProp__0_11);
        return v13.mapProtoEngineEnumToLua(v174, l_v171_0, v175);
    end;
    local l_v176_0 = v176 --[[ copy: 26 -> 56 ]];
    v48 = function(v178, v179, v180, v181, v182, v183) --[[ Line: 63 ]]
        -- upvalues: v2 (copy), l_v176_0 (copy)
        local v184, v185 = v2(v178, v179, v180, v181, v182, v183, l_v176_0);
        return v184, v185;
    end;
else
    v48 = nil;
end;
v47.TextXAlignmentProp = v48;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.TextYAlignment;
    local v186 = "TEXT_Y_ALIGNMENT_";
    local l_l_parseImageStringProp__0_12 = l_parseImageStringProp__0 --[[ copy: 25 -> 51 ]];
    local l_v186_0 = v186 --[[ copy: 27 -> 52 ]];
    local function v191(v189) --[[ Line: 85 ]]
        -- upvalues: v10 (copy), l_l_parseImageStringProp__0_12 (copy), v13 (copy), l_v186_0 (copy)
        local v190 = v10.getEngineEnumParser(l_l_parseImageStringProp__0_12);
        return v13.mapProtoEngineEnumToLua(v189, l_v186_0, v190);
    end;
    local l_v191_0 = v191 --[[ copy: 26 -> 53 ]];
    v48 = function(v193, v194, v195, v196, v197, v198) --[[ Line: 63 ]]
        -- upvalues: v2 (copy), l_v191_0 (copy)
        local v199, v200 = v2(v193, v194, v195, v196, v197, v198, l_v191_0);
        return v199, v200;
    end;
else
    v48 = nil;
end;
v47.TextYAlignmentProp = v48;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.UIFlexMode;
    local v201 = "UI_FLEX_MODE_";
    local l_l_parseImageStringProp__0_13 = l_parseImageStringProp__0 --[[ copy: 25 -> 48 ]];
    local l_v201_0 = v201 --[[ copy: 27 -> 49 ]];
    local function v206(v204) --[[ Line: 85 ]]
        -- upvalues: v10 (copy), l_l_parseImageStringProp__0_13 (copy), v13 (copy), l_v201_0 (copy)
        local v205 = v10.getEngineEnumParser(l_l_parseImageStringProp__0_13);
        return v13.mapProtoEngineEnumToLua(v204, l_v201_0, v205);
    end;
    local l_v206_0 = v206 --[[ copy: 26 -> 50 ]];
    v48 = function(v208, v209, v210, v211, v212, v213) --[[ Line: 63 ]]
        -- upvalues: v2 (copy), l_v206_0 (copy)
        local v214, v215 = v2(v208, v209, v210, v211, v212, v213, l_v206_0);
        return v214, v215;
    end;
else
    v48 = nil;
end;
v47.UIFlexModeProp = v48;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.ScaleType;
    local v216 = "SCALE_TYPE_";
    local l_l_parseImageStringProp__0_14 = l_parseImageStringProp__0 --[[ copy: 25 -> 45 ]];
    local l_v216_0 = v216 --[[ copy: 27 -> 46 ]];
    local function v221(v219) --[[ Line: 85 ]]
        -- upvalues: v10 (copy), l_l_parseImageStringProp__0_14 (copy), v13 (copy), l_v216_0 (copy)
        local v220 = v10.getEngineEnumParser(l_l_parseImageStringProp__0_14);
        return v13.mapProtoEngineEnumToLua(v219, l_v216_0, v220);
    end;
    local l_v221_0 = v221 --[[ copy: 26 -> 47 ]];
    v48 = function(v223, v224, v225, v226, v227, v228) --[[ Line: 63 ]]
        -- upvalues: v2 (copy), l_v221_0 (copy)
        local v229, v230 = v2(v223, v224, v225, v226, v227, v228, l_v221_0);
        return v229, v230;
    end;
else
    v48 = nil;
end;
v47.ScaleTypeProp = v48;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.ResamplerMode;
    local v231 = "RESAMPLER_MODE_";
    local l_l_parseImageStringProp__0_15 = l_parseImageStringProp__0 --[[ copy: 25 -> 42 ]];
    local l_v231_0 = v231 --[[ copy: 27 -> 43 ]];
    local function v236(v234) --[[ Line: 85 ]]
        -- upvalues: v10 (copy), l_l_parseImageStringProp__0_15 (copy), v13 (copy), l_v231_0 (copy)
        local v235 = v10.getEngineEnumParser(l_l_parseImageStringProp__0_15);
        return v13.mapProtoEngineEnumToLua(v234, l_v231_0, v235);
    end;
    local l_v236_0 = v236 --[[ copy: 26 -> 44 ]];
    v48 = function(v238, v239, v240, v241, v242, v243) --[[ Line: 63 ]]
        -- upvalues: v2 (copy), l_v236_0 (copy)
        local v244, v245 = v2(v238, v239, v240, v241, v242, v243, l_v236_0);
        return v244, v245;
    end;
else
    v48 = nil;
end;
v47.ResamplerModeProp = v48;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = Enum.SizeConstraint;
    local v246 = "SIZE_CONSTRAINT_";
    local l_l_parseImageStringProp__0_16 = l_parseImageStringProp__0 --[[ copy: 25 -> 39 ]];
    local l_v246_0 = v246 --[[ copy: 27 -> 40 ]];
    local function v251(v249) --[[ Line: 85 ]]
        -- upvalues: v10 (copy), l_l_parseImageStringProp__0_16 (copy), v13 (copy), l_v246_0 (copy)
        local v250 = v10.getEngineEnumParser(l_l_parseImageStringProp__0_16);
        return v13.mapProtoEngineEnumToLua(v249, l_v246_0, v250);
    end;
    local l_v251_0 = v251 --[[ copy: 26 -> 41 ]];
    v48 = function(v253, v254, v255, v256, v257, v258) --[[ Line: 63 ]]
        -- upvalues: v2 (copy), l_v251_0 (copy)
        local v259, v260 = v2(v253, v254, v255, v256, v257, v258, l_v251_0);
        return v259, v260;
    end;
else
    v48 = nil;
end;
v47.SizeConstraintProp = v48;
if l_FFlagSduiChartsSupport_0 then
    l_parseImageStringProp__0 = Enum.SelectionBehavior;
    local v261 = "SELECTION_BEHAVIOR_";
    local l_l_parseImageStringProp__0_17 = l_parseImageStringProp__0 --[[ copy: 25 -> 38 ]];
    local function v265(v263) --[[ Line: 85 ]]
        -- upvalues: v10 (copy), l_l_parseImageStringProp__0_17 (copy), v13 (copy), v261 (copy)
        local v264 = v10.getEngineEnumParser(l_l_parseImageStringProp__0_17);
        return v13.mapProtoEngineEnumToLua(v263, v261, v264);
    end;
    v48 = function(v266, v267, v268, v269, v270, v271) --[[ Line: 63 ]]
        -- upvalues: v2 (copy), v265 (copy)
        local v272, v273 = v2(v266, v267, v268, v269, v270, v271, v265);
        return v272, v273;
    end;
else
    v48 = nil;
end;
v47.SelectionBehaviorProp = v48;
v47.ColorStyleProp = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v2 else nil;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = v12.parseUiScaledUDim2;
    local l_l_parseImageStringProp__0_18 = l_parseImageStringProp__0 --[[ copy: 25 -> 37 ]];
    v48 = function(v275, v276, v277, v278, v279, v280) --[[ Line: 63 ]]
        -- upvalues: v2 (copy), l_l_parseImageStringProp__0_18 (copy)
        local v281, v282 = v2(v275, v276, v277, v278, v279, v280, l_l_parseImageStringProp__0_18);
        return v281, v282;
    end;
else
    v48 = nil;
end;
v47.UiScaledUDim2Prop = v48;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = v12.parseUiScaledUDim;
    local l_l_parseImageStringProp__0_19 = l_parseImageStringProp__0 --[[ copy: 25 -> 36 ]];
    v48 = function(v284, v285, v286, v287, v288, v289) --[[ Line: 63 ]]
        -- upvalues: v2 (copy), l_l_parseImageStringProp__0_19 (copy)
        local v290, v291 = v2(v284, v285, v286, v287, v288, v289, l_l_parseImageStringProp__0_19);
        return v290, v291;
    end;
else
    v48 = nil;
end;
v47.UiScaledUDimProp = v48;
if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
    l_parseImageStringProp__0 = v12.parseUiScaledNumber;
    v48 = function(v292, v293, v294, v295, v296, v297) --[[ Line: 63 ]]
        -- upvalues: v2 (copy), l_parseImageStringProp__0 (copy)
        local v298, v299 = v2(v292, v293, v294, v295, v296, v297, l_parseImageStringProp__0);
        return v298, v299;
    end;
else
    v48 = nil;
end;
v47.UiScaledFloatProp = v48;
return function(v300) --[[ Line: 185 ]] --[[ Name: getPropBuilder ]]
    -- upvalues: v47 (copy), v2 (copy)
    if not v300 then
        error("Failed to find prop builder -- missing propDescriptorName");
    end;
    local v301 = v47[v300];
    if not v301 then
        warn((("Could not find propBuilder for propDescriptorName %*. Using default."):format(v300)));
        v301 = v2;
    end;
    return v301;
end;