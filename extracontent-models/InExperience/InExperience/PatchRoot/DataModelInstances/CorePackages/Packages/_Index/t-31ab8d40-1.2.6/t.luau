local v0 = typeof or type;
local function _(v1) --[[ Line: 6 ]] --[[ Name: primitive ]]
    -- upvalues: v0 (copy)
    return function(v2) --[[ Line: 7 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v3 = v0(v2);
        if v3 == v1 then
            return true;
        else
            return false, string.format("%s expected, got %s", v1, v3);
        end;
    end;
end;
local v6 = {
    any = function(v5) --[[ Line: 26 ]] --[[ Name: any ]]
        if v5 ~= nil then
            return true;
        else
            return false, "any expected, got nil";
        end;
    end
};
local v7 = "boolean";
local l_v7_0 = v7 --[[ copy: 4 -> 5 ]];
v6.boolean = function(v9) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_0 (copy)
    local v10 = v0(v9);
    if v10 == l_v7_0 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_0, v10);
    end;
end;
v7 = "thread";
local l_v7_1 = v7 --[[ copy: 4 -> 6 ]];
v6.thread = function(v12) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_1 (copy)
    local v13 = v0(v12);
    if v13 == l_v7_1 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_1, v13);
    end;
end;
v7 = "function";
local l_v7_2 = v7 --[[ copy: 4 -> 7 ]];
v6.callback = function(v15) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_2 (copy)
    local v16 = v0(v15);
    if v16 == l_v7_2 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_2, v16);
    end;
end;
v7 = "nil";
local l_v7_3 = v7 --[[ copy: 4 -> 8 ]];
v6.none = function(v18) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_3 (copy)
    local v19 = v0(v18);
    if v19 == l_v7_3 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_3, v19);
    end;
end;
v7 = "string";
local l_v7_4 = v7 --[[ copy: 4 -> 9 ]];
v6.string = function(v21) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_4 (copy)
    local v22 = v0(v21);
    if v22 == l_v7_4 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_4, v22);
    end;
end;
v7 = "table";
local l_v7_5 = v7 --[[ copy: 4 -> 10 ]];
v6.table = function(v24) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_5 (copy)
    local v25 = v0(v24);
    if v25 == l_v7_5 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_5, v25);
    end;
end;
v7 = "userdata";
local l_v7_6 = v7 --[[ copy: 4 -> 11 ]];
v6.userdata = function(v27) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_6 (copy)
    local v28 = v0(v27);
    if v28 == l_v7_6 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_6, v28);
    end;
end;
v6.number = function(v29) --[[ Line: 106 ]] --[[ Name: number ]]
    -- upvalues: v0 (copy)
    local v30 = v0(v29);
    if v30 == "number" then
        if v29 == v29 then
            return true;
        else
            return false, "unexpected NaN value";
        end;
    else
        return false, string.format("number expected, got %s", v30);
    end;
end;
v6.nan = function(v31) --[[ Line: 126 ]] --[[ Name: nan ]]
    if v31 ~= v31 then
        return true;
    else
        return false, "unexpected non-NaN value";
    end;
end;
v7 = "Axes";
local l_v7_7 = v7 --[[ copy: 4 -> 12 ]];
v6.Axes = function(v33) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_7 (copy)
    local v34 = v0(v33);
    if v34 == l_v7_7 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_7, v34);
    end;
end;
v7 = "BrickColor";
local l_v7_8 = v7 --[[ copy: 4 -> 13 ]];
v6.BrickColor = function(v36) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_8 (copy)
    local v37 = v0(v36);
    if v37 == l_v7_8 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_8, v37);
    end;
end;
v7 = "CFrame";
local l_v7_9 = v7 --[[ copy: 4 -> 14 ]];
v6.CFrame = function(v39) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_9 (copy)
    local v40 = v0(v39);
    if v40 == l_v7_9 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_9, v40);
    end;
end;
v7 = "Color3";
local l_v7_10 = v7 --[[ copy: 4 -> 15 ]];
v6.Color3 = function(v42) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_10 (copy)
    local v43 = v0(v42);
    if v43 == l_v7_10 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_10, v43);
    end;
end;
v7 = "ColorSequence";
local l_v7_11 = v7 --[[ copy: 4 -> 16 ]];
v6.ColorSequence = function(v45) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_11 (copy)
    local v46 = v0(v45);
    if v46 == l_v7_11 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_11, v46);
    end;
end;
v7 = "ColorSequenceKeypoint";
local l_v7_12 = v7 --[[ copy: 4 -> 17 ]];
v6.ColorSequenceKeypoint = function(v48) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_12 (copy)
    local v49 = v0(v48);
    if v49 == l_v7_12 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_12, v49);
    end;
end;
v7 = "DockWidgetPluginGuiInfo";
local l_v7_13 = v7 --[[ copy: 4 -> 18 ]];
v6.DockWidgetPluginGuiInfo = function(v51) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_13 (copy)
    local v52 = v0(v51);
    if v52 == l_v7_13 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_13, v52);
    end;
end;
v7 = "Faces";
local l_v7_14 = v7 --[[ copy: 4 -> 19 ]];
v6.Faces = function(v54) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_14 (copy)
    local v55 = v0(v54);
    if v55 == l_v7_14 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_14, v55);
    end;
end;
v7 = "Instance";
local l_v7_15 = v7 --[[ copy: 4 -> 20 ]];
v6.Instance = function(v57) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_15 (copy)
    local v58 = v0(v57);
    if v58 == l_v7_15 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_15, v58);
    end;
end;
v7 = "NumberRange";
local l_v7_16 = v7 --[[ copy: 4 -> 21 ]];
v6.NumberRange = function(v60) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_16 (copy)
    local v61 = v0(v60);
    if v61 == l_v7_16 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_16, v61);
    end;
end;
v7 = "NumberSequence";
local l_v7_17 = v7 --[[ copy: 4 -> 22 ]];
v6.NumberSequence = function(v63) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_17 (copy)
    local v64 = v0(v63);
    if v64 == l_v7_17 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_17, v64);
    end;
end;
v7 = "NumberSequenceKeypoint";
local l_v7_18 = v7 --[[ copy: 4 -> 23 ]];
v6.NumberSequenceKeypoint = function(v66) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_18 (copy)
    local v67 = v0(v66);
    if v67 == l_v7_18 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_18, v67);
    end;
end;
v7 = "PathWaypoint";
local l_v7_19 = v7 --[[ copy: 4 -> 24 ]];
v6.PathWaypoint = function(v69) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_19 (copy)
    local v70 = v0(v69);
    if v70 == l_v7_19 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_19, v70);
    end;
end;
v7 = "PhysicalProperties";
local l_v7_20 = v7 --[[ copy: 4 -> 25 ]];
v6.PhysicalProperties = function(v72) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_20 (copy)
    local v73 = v0(v72);
    if v73 == l_v7_20 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_20, v73);
    end;
end;
v7 = "Random";
local l_v7_21 = v7 --[[ copy: 4 -> 26 ]];
v6.Random = function(v75) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_21 (copy)
    local v76 = v0(v75);
    if v76 == l_v7_21 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_21, v76);
    end;
end;
v7 = "Ray";
local l_v7_22 = v7 --[[ copy: 4 -> 27 ]];
v6.Ray = function(v78) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_22 (copy)
    local v79 = v0(v78);
    if v79 == l_v7_22 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_22, v79);
    end;
end;
v7 = "Rect";
local l_v7_23 = v7 --[[ copy: 4 -> 28 ]];
v6.Rect = function(v81) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_23 (copy)
    local v82 = v0(v81);
    if v82 == l_v7_23 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_23, v82);
    end;
end;
v7 = "Region3";
local l_v7_24 = v7 --[[ copy: 4 -> 29 ]];
v6.Region3 = function(v84) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_24 (copy)
    local v85 = v0(v84);
    if v85 == l_v7_24 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_24, v85);
    end;
end;
v7 = "Region3int16";
local l_v7_25 = v7 --[[ copy: 4 -> 30 ]];
v6.Region3int16 = function(v87) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_25 (copy)
    local v88 = v0(v87);
    if v88 == l_v7_25 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_25, v88);
    end;
end;
v7 = "TweenInfo";
local l_v7_26 = v7 --[[ copy: 4 -> 31 ]];
v6.TweenInfo = function(v90) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_26 (copy)
    local v91 = v0(v90);
    if v91 == l_v7_26 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_26, v91);
    end;
end;
v7 = "UDim";
local l_v7_27 = v7 --[[ copy: 4 -> 32 ]];
v6.UDim = function(v93) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_27 (copy)
    local v94 = v0(v93);
    if v94 == l_v7_27 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_27, v94);
    end;
end;
v7 = "UDim2";
local l_v7_28 = v7 --[[ copy: 4 -> 33 ]];
v6.UDim2 = function(v96) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_28 (copy)
    local v97 = v0(v96);
    if v97 == l_v7_28 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_28, v97);
    end;
end;
v7 = "Vector2";
local l_v7_29 = v7 --[[ copy: 4 -> 34 ]];
v6.Vector2 = function(v99) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_29 (copy)
    local v100 = v0(v99);
    if v100 == l_v7_29 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_29, v100);
    end;
end;
v7 = "Vector3";
local l_v7_30 = v7 --[[ copy: 4 -> 35 ]];
v6.Vector3 = function(v102) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_30 (copy)
    local v103 = v0(v102);
    if v103 == l_v7_30 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_30, v103);
    end;
end;
v7 = "Vector3int16";
local l_v7_31 = v7 --[[ copy: 4 -> 36 ]];
v6.Vector3int16 = function(v105) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_31 (copy)
    local v106 = v0(v105);
    if v106 == l_v7_31 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_31, v106);
    end;
end;
v7 = "Enum";
local l_v7_32 = v7 --[[ copy: 4 -> 37 ]];
v6.Enum = function(v108) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_32 (copy)
    local v109 = v0(v108);
    if v109 == l_v7_32 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_32, v109);
    end;
end;
v7 = "EnumItem";
local l_v7_33 = v7 --[[ copy: 4 -> 38 ]];
v6.EnumItem = function(v111) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_33 (copy)
    local v112 = v0(v111);
    if v112 == l_v7_33 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_33, v112);
    end;
end;
v7 = "RBXScriptSignal";
local l_v7_34 = v7 --[[ copy: 4 -> 39 ]];
v6.RBXScriptSignal = function(v114) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v7_34 (copy)
    local v115 = v0(v114);
    if v115 == l_v7_34 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_34, v115);
    end;
end;
v7 = "RBXScriptConnection";
v6.RBXScriptConnection = function(v116) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), v7 (copy)
    local v117 = v0(v116);
    if v117 == v7 then
        return true;
    else
        return false, string.format("%s expected, got %s", v7, v117);
    end;
end;
v6.literal = function(...) --[[ Line: 406 ]] --[[ Name: literal ]]
    -- upvalues: v6 (copy)
    local v118 = select("#", ...);
    if v118 == 1 then
        local v119 = ...;
        return function(v120) --[[ Line: 410 ]]
            -- upvalues: v119 (copy)
            if v120 ~= v119 then
                return false, string.format("expected %s, got %s", tostring(v119), (tostring(v120)));
            else
                return true;
            end;
        end;
    else
        local v121 = {};
        for v122 = 1, v118 do
            local v123 = select(v122, ...);
            v121[v122] = v6.literal(v123);
        end;
        return v6.union(unpack(v121));
    end;
end;
v6.exactly = v6.literal;
v6.keyOf = function(v124) --[[ Line: 439 ]] --[[ Name: keyOf ]]
    -- upvalues: v6 (copy)
    local v125 = {};
    for v126 in pairs(v124) do
        v125[#v125 + 1] = v126;
    end;
    return v6.literal(unpack(v125));
end;
v6.valueOf = function(v127) --[[ Line: 454 ]] --[[ Name: valueOf ]]
    -- upvalues: v6 (copy)
    local v128 = {};
    for _, v130 in pairs(v127) do
        v128[#v128 + 1] = v130;
    end;
    return v6.literal(unpack(v128));
end;
v6.integer = function(v131) --[[ Line: 469 ]] --[[ Name: integer ]]
    -- upvalues: v6 (copy)
    local v132, v133 = v6.number(v131);
    if not v132 then
        return false, v133 or "";
    elseif v131 % 1 == 0 then
        return true;
    else
        return false, string.format("integer expected, got %s", v131);
    end;
end;
v6.numberMin = function(v134) --[[ Line: 488 ]] --[[ Name: numberMin ]]
    -- upvalues: v6 (copy)
    return function(v135) --[[ Line: 489 ]]
        -- upvalues: v6 (ref), v134 (copy)
        local v136, v137 = v6.number(v135);
        if not v136 then
            return false, v137 or "";
        elseif v134 <= v135 then
            return true;
        else
            return false, string.format("number >= %s expected, got %s", v134, v135);
        end;
    end;
end;
v6.numberMax = function(v138) --[[ Line: 509 ]] --[[ Name: numberMax ]]
    -- upvalues: v6 (copy)
    return function(v139) --[[ Line: 510 ]]
        -- upvalues: v6 (ref), v138 (copy)
        local v140, v141 = v6.number(v139);
        if not v140 then
            return false, v141;
        elseif v139 <= v138 then
            return true;
        else
            return false, string.format("number <= %s expected, got %s", v138, v139);
        end;
    end;
end;
v6.numberMinExclusive = function(v142) --[[ Line: 530 ]] --[[ Name: numberMinExclusive ]]
    -- upvalues: v6 (copy)
    return function(v143) --[[ Line: 531 ]]
        -- upvalues: v6 (ref), v142 (copy)
        local v144, v145 = v6.number(v143);
        if not v144 then
            return false, v145 or "";
        elseif v142 < v143 then
            return true;
        else
            return false, string.format("number > %s expected, got %s", v142, v143);
        end;
    end;
end;
v6.numberMaxExclusive = function(v146) --[[ Line: 551 ]] --[[ Name: numberMaxExclusive ]]
    -- upvalues: v6 (copy)
    return function(v147) --[[ Line: 552 ]]
        -- upvalues: v6 (ref), v146 (copy)
        local v148, v149 = v6.number(v147);
        if not v148 then
            return false, v149 or "";
        elseif v147 < v146 then
            return true;
        else
            return false, string.format("number < %s expected, got %s", v146, v147);
        end;
    end;
end;
v6.numberPositive = v6.numberMinExclusive(0);
v6.numberNegative = v6.numberMaxExclusive(0);
v6.numberConstrained = function(v150, v151) --[[ Line: 587 ]] --[[ Name: numberConstrained ]]
    -- upvalues: v6 (copy)
    assert(v6.number(v150) and v6.number(v151));
    local v152 = v6.numberMin(v150);
    local v153 = v6.numberMax(v151);
    return function(v154) --[[ Line: 591 ]]
        -- upvalues: v152 (copy), v153 (copy)
        local v155, v156 = v152(v154);
        if not v155 then
            return false, v156 or "";
        else
            local v157, v158 = v153(v154);
            if not v157 then
                return false, v158 or "";
            else
                return true;
            end;
        end;
    end;
end;
v6.numberConstrainedExclusive = function(v159, v160) --[[ Line: 614 ]] --[[ Name: numberConstrainedExclusive ]]
    -- upvalues: v6 (copy)
    assert(v6.number(v159) and v6.number(v160));
    local v161 = v6.numberMinExclusive(v159);
    local v162 = v6.numberMaxExclusive(v160);
    return function(v163) --[[ Line: 618 ]]
        -- upvalues: v161 (copy), v162 (copy)
        local v164, v165 = v161(v163);
        if not v164 then
            return false, v165 or "";
        else
            local v166, v167 = v162(v163);
            if not v166 then
                return false, v167 or "";
            else
                return true;
            end;
        end;
    end;
end;
v6.match = function(v168) --[[ Line: 640 ]] --[[ Name: match ]]
    -- upvalues: v6 (copy)
    assert(v6.string(v168));
    return function(v169) --[[ Line: 642 ]]
        -- upvalues: v6 (ref), v168 (copy)
        local v170, v171 = v6.string(v169);
        if not v170 then
            return false, v171;
        elseif string.match(v169, v168) == nil then
            return false, string.format("\"%s\" failed to match pattern \"%s\"", v169, v168);
        else
            return true;
        end;
    end;
end;
v6.optional = function(v172) --[[ Line: 663 ]] --[[ Name: optional ]]
    -- upvalues: v6 (copy)
    assert(v6.callback(v172));
    return function(v173) --[[ Line: 665 ]]
        -- upvalues: v172 (copy)
        if v173 == nil then
            return true;
        else
            local v174, v175 = v172(v173);
            if v174 then
                return true;
            else
                return false, string.format("(optional) %s", v175 or "");
            end;
        end;
    end;
end;
v6.tuple = function(...) --[[ Line: 685 ]] --[[ Name: tuple ]]
    local v176 = {
        ...
    };
    return function(...) --[[ Line: 687 ]]
        -- upvalues: v176 (copy)
        local v177 = {
            ...
        };
        for v178 = 1, #v176 do
            local v179, v180 = v176[v178](v177[v178]);
            if v179 == false then
                return false, string.format("Bad tuple index #%s:\n\t%s", v178, v180 or "");
            end;
        end;
        return true;
    end;
end;
v6.keys = function(v181) --[[ Line: 706 ]] --[[ Name: keys ]]
    -- upvalues: v6 (copy)
    assert(v6.callback(v181));
    return function(v182) --[[ Line: 708 ]]
        -- upvalues: v6 (ref), v181 (copy)
        local v183, v184 = v6.table(v182);
        if v183 == false then
            return false, v184 or "";
        else
            for v185 in pairs(v182) do
                local v186, v187 = v181(v185);
                if v186 == false then
                    return false, string.format("bad key %s:\n\t%s", tostring(v185), v187 or "");
                end;
            end;
            return true;
        end;
    end;
end;
v6.values = function(v188) --[[ Line: 732 ]] --[[ Name: values ]]
    -- upvalues: v6 (copy)
    assert(v6.callback(v188));
    return function(v189) --[[ Line: 734 ]]
        -- upvalues: v6 (ref), v188 (copy)
        local v190, v191 = v6.table(v189);
        if v190 == false then
            return false, v191 or "";
        else
            for v192, v193 in pairs(v189) do
                local v194, v195 = v188(v193);
                if v194 == false then
                    return false, string.format("bad value for key %s:\n\t%s", tostring(v192), v195 or "");
                end;
            end;
            return true;
        end;
    end;
end;
v6.map = function(v196, v197) --[[ Line: 759 ]] --[[ Name: map ]]
    -- upvalues: v6 (copy)
    assert(v6.callback(v196), v6.callback(v197));
    local v198 = v6.keys(v196);
    local v199 = v6.values(v197);
    return function(v200) --[[ Line: 763 ]]
        -- upvalues: v198 (copy), v199 (copy)
        local v201, v202 = v198(v200);
        if not v201 then
            return false, v202 or "";
        else
            local v203, v204 = v199(v200);
            if not v203 then
                return false, v204 or "";
            else
                return true;
            end;
        end;
    end;
end;
local v205 = v6.keys(v6.integer);
local l_v205_0 = v205 --[[ copy: 3 -> 40 ]];
v6.array = function(v207) --[[ Line: 787 ]] --[[ Name: array ]]
    -- upvalues: v6 (copy), l_v205_0 (copy)
    assert(v6.callback(v207));
    local v208 = v6.values(v207);
    return function(v209) --[[ Line: 790 ]]
        -- upvalues: l_v205_0 (ref), v208 (copy)
        local v210, v211 = l_v205_0(v209);
        if v210 == false then
            return false, string.format("[array] %s", v211 or "");
        else
            local v212 = 0;
            for _, _ in ipairs(v209) do
                v212 = v212 + 1;
            end;
            for v215 in pairs(v209) do
                if v215 < 1 or v212 < v215 then
                    return false, string.format("[array] key %s must be sequential", (tostring(v215)));
                end;
            end;
            local v216, v217 = v208(v209);
            if not v216 then
                return false, string.format("[array] %s", v217 or "");
            else
                return true;
            end;
        end;
    end;
end;
v205 = v6.array(v6.callback);
local l_v205_1 = v205 --[[ copy: 3 -> 41 ]];
v6.union = function(...) --[[ Line: 829 ]] --[[ Name: union ]]
    -- upvalues: l_v205_1 (copy)
    local v219 = {
        ...
    };
    assert(l_v205_1(v219));
    return function(v220) --[[ Line: 832 ]]
        -- upvalues: v219 (copy)
        for _, v222 in pairs(v219) do
            if v222(v220) then
                return true;
            end;
        end;
        return false, "bad type for union";
    end;
end;
v6.some = v6.union;
v6.intersection = function(...) --[[ Line: 854 ]] --[[ Name: intersection ]]
    -- upvalues: l_v205_1 (copy)
    local v223 = {
        ...
    };
    assert(l_v205_1(v223));
    return function(v224) --[[ Line: 857 ]]
        -- upvalues: v223 (copy)
        for _, v226 in pairs(v223) do
            local v227, v228 = v226(v224);
            if not v227 then
                return false, v228 or "";
            end;
        end;
        return true;
    end;
end;
v6.every = v6.intersection;
v205 = v6.map(v6.any, v6.callback);
local l_v205_2 = v205 --[[ copy: 3 -> 42 ]];
v6.interface = function(v230) --[[ Line: 883 ]] --[[ Name: interface ]]
    -- upvalues: l_v205_2 (copy), v6 (copy)
    assert(l_v205_2(v230));
    return function(v231) --[[ Line: 885 ]]
        -- upvalues: v6 (ref), v230 (copy)
        local v232, v233 = v6.table(v231);
        if v232 == false then
            return false, v233 or "";
        else
            for v234, v235 in pairs(v230) do
                local v236, v237 = v235(v231[v234]);
                if v236 == false then
                    return false, string.format("[interface] bad value for %s:\n\t%s", tostring(v234), v237 or "");
                end;
            end;
            return true;
        end;
    end;
end;
v6.strictInterface = function(v238) --[[ Line: 908 ]] --[[ Name: strictInterface ]]
    -- upvalues: l_v205_2 (copy), v6 (copy)
    assert(l_v205_2(v238));
    return function(v239) --[[ Line: 910 ]]
        -- upvalues: v6 (ref), v238 (copy)
        local v240, v241 = v6.table(v239);
        if v240 == false then
            return false, v241 or "";
        else
            for v242, v243 in pairs(v238) do
                local v244, v245 = v243(v239[v242]);
                if v244 == false then
                    return false, string.format("[interface] bad value for %s:\n\t%s", tostring(v242), v245 or "");
                end;
            end;
            for v246 in pairs(v239) do
                if not v238[v246] then
                    return false, string.format("[interface] unexpected field '%s'", (tostring(v246)));
                end;
            end;
            return true;
        end;
    end;
end;
v6.instanceOf = function(v247, v248) --[[ Line: 941 ]] --[[ Name: instanceOf ]]
    -- upvalues: v6 (copy)
    assert(v6.string(v247));
    local v249 = nil;
    if v248 ~= nil then
        v249 = v6.children(v248);
    end;
    return function(v250) --[[ Line: 949 ]]
        -- upvalues: v6 (ref), v247 (copy), v249 (ref)
        local v251, v252 = v6.Instance(v250);
        if not v251 then
            return false, v252 or "";
        elseif v250.ClassName ~= v247 then
            return false, string.format("%s expected, got %s", v247, v250.ClassName);
        else
            if v249 then
                local v253, v254 = v249(v250);
                if not v253 then
                    return false, v254;
                end;
            end;
            return true;
        end;
    end;
end;
v6.instance = v6.instanceOf;
v6.instanceIsA = function(v255, v256) --[[ Line: 978 ]] --[[ Name: instanceIsA ]]
    -- upvalues: v6 (copy)
    assert(v6.string(v255));
    local v257 = nil;
    if v256 ~= nil then
        v257 = v6.children(v256);
    end;
    return function(v258) --[[ Line: 986 ]]
        -- upvalues: v6 (ref), v255 (copy), v257 (ref)
        local v259, v260 = v6.Instance(v258);
        if not v259 then
            return false, v260 or "";
        elseif not v258:IsA(v255) then
            return false, string.format("%s expected, got %s", v255, v258.ClassName);
        else
            if v257 then
                local v261, v262 = v257(v258);
                if not v261 then
                    return false, v262;
                end;
            end;
            return true;
        end;
    end;
end;
v6.enum = function(v263) --[[ Line: 1014 ]] --[[ Name: enum ]]
    -- upvalues: v6 (copy)
    assert(v6.Enum(v263));
    return function(v264) --[[ Line: 1016 ]]
        -- upvalues: v6 (ref), v263 (copy)
        local v265, v266 = v6.EnumItem(v264);
        if not v265 then
            return false, v266;
        elseif v264.EnumType == v263 then
            return true;
        else
            return false, string.format("enum of %s expected, got enum of %s", tostring(v263), (tostring(v264.EnumType)));
        end;
    end;
end;
v205 = v6.tuple(v6.callback, v6.callback);
local l_v205_3 = v205 --[[ copy: 3 -> 43 ]];
v6.wrap = function(v268, v269) --[[ Line: 1041 ]] --[[ Name: wrap ]]
    -- upvalues: l_v205_3 (copy)
    assert(l_v205_3(v268, v269));
    return function(...) --[[ Line: 1043 ]]
        -- upvalues: v269 (copy), v268 (copy)
        assert(v269(...));
        return v268(...);
    end;
end;
v6.strict = function(v270) --[[ Line: 1057 ]] --[[ Name: strict ]]
    return function(...) --[[ Line: 1058 ]]
        -- upvalues: v270 (copy)
        assert(v270(...));
    end;
end;
v205 = v6.map(v6.string, v6.callback);
v6.children = function(v271) --[[ Line: 1077 ]] --[[ Name: children ]]
    -- upvalues: v205 (copy), v6 (copy)
    assert(v205(v271));
    return function(v272) --[[ Line: 1080 ]]
        -- upvalues: v6 (ref), v271 (copy)
        local v273, v274 = v6.Instance(v272);
        if not v273 then
            return false, v274 or "";
        else
            local v275 = {};
            for _, v277 in pairs(v272:GetChildren()) do
                local l_Name_0 = v277.Name;
                if v271[l_Name_0] then
                    if v275[l_Name_0] then
                        return false, string.format("Cannot process multiple children with the same name \"%s\"", l_Name_0);
                    else
                        v275[l_Name_0] = v277;
                    end;
                end;
            end;
            for v279, v280 in pairs(v271) do
                local v281, v282 = v280(v275[v279]);
                if not v281 then
                    return false, string.format("[%s.%s] %s", v272:GetFullName(), v279, v282 or "");
                end;
            end;
            return true;
        end;
    end;
end;
return v6;