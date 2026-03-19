local v7 = {
    type = function(v0) --[[ Line: 5 ]] --[[ Name: type ]]
        return function(v1) --[[ Line: 6 ]]
            -- upvalues: v0 (copy)
            local v2 = type(v1);
            if v2 == v0 then
                return true;
            else
                return false, string.format("%s expected, got %s", v0, v2);
            end;
        end;
    end, 
    typeof = function(v3) --[[ Line: 16 ]] --[[ Name: typeof ]]
        return function(v4) --[[ Line: 17 ]]
            -- upvalues: v3 (copy)
            local v5 = typeof(v4);
            if v5 == v3 then
                return true;
            else
                return false, string.format("%s expected, got %s", v3, v5);
            end;
        end;
    end, 
    any = function(v6) --[[ Line: 34 ]] --[[ Name: any ]]
        if v6 ~= nil then
            return true;
        else
            return false, "any expected, got nil";
        end;
    end
};
v7.boolean = v7.typeof("boolean");
v7.thread = v7.typeof("thread");
v7.callback = v7.typeof("function");
v7["function"] = v7.callback;
v7.none = v7.typeof("nil");
v7["nil"] = v7.none;
v7.string = v7.typeof("string");
v7.table = v7.typeof("table");
v7.userdata = v7.type("userdata");
v7.number = function(v8) --[[ Line: 116 ]] --[[ Name: number ]]
    local v9 = typeof(v8);
    if v9 == "number" then
        if v8 == v8 then
            return true;
        else
            return false, "unexpected NaN value";
        end;
    else
        return false, string.format("number expected, got %s", v9);
    end;
end;
v7.nan = function(v10) --[[ Line: 136 ]] --[[ Name: nan ]]
    local v11 = typeof(v10);
    if v11 == "number" then
        if v10 ~= v10 then
            return true;
        else
            return false, "unexpected non-NaN value";
        end;
    else
        return false, string.format("number expected, got %s", v11);
    end;
end;
v7.Axes = v7.typeof("Axes");
v7.BrickColor = v7.typeof("BrickColor");
v7.CatalogSearchParams = v7.typeof("CatalogSearchParams");
v7.CFrame = v7.typeof("CFrame");
v7.Color3 = v7.typeof("Color3");
v7.ColorSequence = v7.typeof("ColorSequence");
v7.ColorSequenceKeypoint = v7.typeof("ColorSequenceKeypoint");
v7.DateTime = v7.typeof("DateTime");
v7.DockWidgetPluginGuiInfo = v7.typeof("DockWidgetPluginGuiInfo");
v7.Enum = v7.typeof("Enum");
v7.EnumItem = v7.typeof("EnumItem");
v7.Enums = v7.typeof("Enums");
v7.Faces = v7.typeof("Faces");
v7.Instance = v7.typeof("Instance");
v7.NumberRange = v7.typeof("NumberRange");
v7.NumberSequence = v7.typeof("NumberSequence");
v7.NumberSequenceKeypoint = v7.typeof("NumberSequenceKeypoint");
v7.PathWaypoint = v7.typeof("PathWaypoint");
v7.PhysicalProperties = v7.typeof("PhysicalProperties");
v7.Random = v7.typeof("Random");
v7.Ray = v7.typeof("Ray");
v7.RaycastParams = v7.typeof("RaycastParams");
v7.RaycastResult = v7.typeof("RaycastResult");
v7.RBXScriptConnection = v7.typeof("RBXScriptConnection");
v7.RBXScriptSignal = v7.typeof("RBXScriptSignal");
v7.Rect = v7.typeof("Rect");
v7.Region3 = v7.typeof("Region3");
v7.Region3int16 = v7.typeof("Region3int16");
v7.TweenInfo = v7.typeof("TweenInfo");
v7.UDim = v7.typeof("UDim");
v7.UDim2 = v7.typeof("UDim2");
v7.Vector2 = v7.typeof("Vector2");
v7.Vector2int16 = v7.typeof("Vector2int16");
v7.Vector3 = v7.typeof("Vector3");
v7.Vector3int16 = v7.typeof("Vector3int16");
v7.literal = function(...) --[[ Line: 473 ]] --[[ Name: literal ]]
    -- upvalues: v7 (copy)
    local v12 = select("#", ...);
    if v12 == 1 then
        local v13 = ...;
        return function(v14) --[[ Line: 477 ]]
            -- upvalues: v13 (copy)
            if v14 ~= v13 then
                return false, string.format("expected %s, got %s", tostring(v13), (tostring(v14)));
            else
                return true;
            end;
        end;
    else
        local v15 = {};
        for v16 = 1, v12 do
            local v17 = select(v16, ...);
            v15[v16] = v7.literal(v17);
        end;
        return v7.union(table.unpack(v15, 1, v12));
    end;
end;
v7.exactly = v7.literal;
v7.keyOf = function(v18) --[[ Line: 508 ]] --[[ Name: keyOf ]]
    -- upvalues: v7 (copy)
    local v19 = {};
    local v20 = 0;
    for v21 in pairs(v18) do
        v20 = v20 + 1;
        v19[v20] = v21;
    end;
    return v7.literal(table.unpack(v19, 1, v20));
end;
v7.valueOf = function(v22) --[[ Line: 526 ]] --[[ Name: valueOf ]]
    -- upvalues: v7 (copy)
    local v23 = {};
    local v24 = 0;
    for _, v26 in pairs(v22) do
        v24 = v24 + 1;
        v23[v24] = v26;
    end;
    return v7.literal(table.unpack(v23, 1, v24));
end;
v7.integer = function(v27) --[[ Line: 544 ]] --[[ Name: integer ]]
    -- upvalues: v7 (copy)
    local v28, v29 = v7.number(v27);
    if not v28 then
        return false, v29 or "";
    elseif v27 % 1 == 0 then
        return true;
    else
        return false, string.format("integer expected, got %s", v27);
    end;
end;
v7.numberMin = function(v30) --[[ Line: 564 ]] --[[ Name: numberMin ]]
    -- upvalues: v7 (copy)
    return function(v31) --[[ Line: 565 ]]
        -- upvalues: v7 (ref), v30 (copy)
        local v32, v33 = v7.number(v31);
        if not v32 then
            return false, v33 or "";
        elseif v30 <= v31 then
            return true;
        else
            return false, string.format("number >= %s expected, got %s", v30, v31);
        end;
    end;
end;
v7.numberMax = function(v34) --[[ Line: 586 ]] --[[ Name: numberMax ]]
    -- upvalues: v7 (copy)
    return function(v35) --[[ Line: 587 ]]
        -- upvalues: v7 (ref), v34 (copy)
        local v36, v37 = v7.number(v35);
        if not v36 then
            return false, v37;
        elseif v35 <= v34 then
            return true;
        else
            return false, string.format("number <= %s expected, got %s", v34, v35);
        end;
    end;
end;
v7.numberMinExclusive = function(v38) --[[ Line: 608 ]] --[[ Name: numberMinExclusive ]]
    -- upvalues: v7 (copy)
    return function(v39) --[[ Line: 609 ]]
        -- upvalues: v7 (ref), v38 (copy)
        local v40, v41 = v7.number(v39);
        if not v40 then
            return false, v41 or "";
        elseif v38 < v39 then
            return true;
        else
            return false, string.format("number > %s expected, got %s", v38, v39);
        end;
    end;
end;
v7.numberMaxExclusive = function(v42) --[[ Line: 630 ]] --[[ Name: numberMaxExclusive ]]
    -- upvalues: v7 (copy)
    return function(v43) --[[ Line: 631 ]]
        -- upvalues: v7 (ref), v42 (copy)
        local v44, v45 = v7.number(v43);
        if not v44 then
            return false, v45 or "";
        elseif v43 < v42 then
            return true;
        else
            return false, string.format("number < %s expected, got %s", v42, v43);
        end;
    end;
end;
v7.numberPositive = v7.numberMinExclusive(0);
v7.numberNegative = v7.numberMaxExclusive(0);
v7.numberConstrained = function(v46, v47) --[[ Line: 667 ]] --[[ Name: numberConstrained ]]
    -- upvalues: v7 (copy)
    assert(v7.number(v46));
    assert(v7.number(v47));
    local v48 = v7.numberMin(v46);
    local v49 = v7.numberMax(v47);
    return function(v50) --[[ Line: 673 ]]
        -- upvalues: v48 (copy), v49 (copy)
        local v51, v52 = v48(v50);
        if not v51 then
            return false, v52 or "";
        else
            local v53, v54 = v49(v50);
            if not v53 then
                return false, v54 or "";
            else
                return true;
            end;
        end;
    end;
end;
v7.numberConstrainedExclusive = function(v55, v56) --[[ Line: 696 ]] --[[ Name: numberConstrainedExclusive ]]
    -- upvalues: v7 (copy)
    assert(v7.number(v55));
    assert(v7.number(v56));
    local v57 = v7.numberMinExclusive(v55);
    local v58 = v7.numberMaxExclusive(v56);
    return function(v59) --[[ Line: 702 ]]
        -- upvalues: v57 (copy), v58 (copy)
        local v60, v61 = v57(v59);
        if not v60 then
            return false, v61 or "";
        else
            local v62, v63 = v58(v59);
            if not v62 then
                return false, v63 or "";
            else
                return true;
            end;
        end;
    end;
end;
v7.match = function(v64) --[[ Line: 724 ]] --[[ Name: match ]]
    -- upvalues: v7 (copy)
    assert(v7.string(v64));
    return function(v65) --[[ Line: 726 ]]
        -- upvalues: v7 (ref), v64 (copy)
        local v66, v67 = v7.string(v65);
        if not v66 then
            return false, v67;
        elseif string.match(v65, v64) == nil then
            return false, string.format("%q failed to match pattern %q", v65, v64);
        else
            return true;
        end;
    end;
end;
v7.optional = function(v68) --[[ Line: 747 ]] --[[ Name: optional ]]
    -- upvalues: v7 (copy)
    assert(v7.callback(v68));
    return function(v69) --[[ Line: 749 ]]
        -- upvalues: v68 (copy)
        if v69 == nil then
            return true;
        else
            local v70, v71 = v68(v69);
            if v70 then
                return true;
            else
                return false, string.format("(optional) %s", v71 or "");
            end;
        end;
    end;
end;
v7.tuple = function(...) --[[ Line: 770 ]] --[[ Name: tuple ]]
    local v72 = {
        ...
    };
    return function(...) --[[ Line: 772 ]]
        -- upvalues: v72 (copy)
        local v73 = {
            ...
        };
        for v74, v75 in ipairs(v72) do
            local v76, v77 = v75(v73[v74]);
            if v76 == false then
                return false, string.format("Bad tuple index #%s:\n\t%s", v74, v77 or "");
            end;
        end;
        return true;
    end;
end;
v7.keys = function(v78) --[[ Line: 792 ]] --[[ Name: keys ]]
    -- upvalues: v7 (copy)
    assert(v7.callback(v78));
    return function(v79) --[[ Line: 794 ]]
        -- upvalues: v7 (ref), v78 (copy)
        local v80, v81 = v7.table(v79);
        if v80 == false then
            return false, v81 or "";
        else
            for v82 in pairs(v79) do
                local v83, v84 = v78(v82);
                if v83 == false then
                    return false, string.format("bad key %s:\n\t%s", tostring(v82), v84 or "");
                end;
            end;
            return true;
        end;
    end;
end;
v7.values = function(v85) --[[ Line: 818 ]] --[[ Name: values ]]
    -- upvalues: v7 (copy)
    assert(v7.callback(v85));
    return function(v86) --[[ Line: 820 ]]
        -- upvalues: v7 (ref), v85 (copy)
        local v87, v88 = v7.table(v86);
        if v87 == false then
            return false, v88 or "";
        else
            for v89, v90 in pairs(v86) do
                local v91, v92 = v85(v90);
                if v91 == false then
                    return false, string.format("bad value for key %s:\n\t%s", tostring(v89), v92 or "");
                end;
            end;
            return true;
        end;
    end;
end;
v7.map = function(v93, v94) --[[ Line: 845 ]] --[[ Name: map ]]
    -- upvalues: v7 (copy)
    assert(v7.callback(v93));
    assert(v7.callback(v94));
    local v95 = v7.keys(v93);
    local v96 = v7.values(v94);
    return function(v97) --[[ Line: 851 ]]
        -- upvalues: v95 (copy), v96 (copy)
        local v98, v99 = v95(v97);
        if not v98 then
            return false, v99 or "";
        else
            local v100, v101 = v96(v97);
            if not v100 then
                return false, v101 or "";
            else
                return true;
            end;
        end;
    end;
end;
v7.set = function(v102) --[[ Line: 873 ]] --[[ Name: set ]]
    -- upvalues: v7 (copy)
    return v7.map(v102, v7.literal(true));
end;
local v103 = v7.keys(v7.integer);
local l_v103_0 = v103 --[[ copy: 1 -> 2 ]];
v7.array = function(v105) --[[ Line: 886 ]] --[[ Name: array ]]
    -- upvalues: v7 (copy), l_v103_0 (copy)
    assert(v7.callback(v105));
    local v106 = v7.values(v105);
    return function(v107) --[[ Line: 890 ]]
        -- upvalues: l_v103_0 (ref), v106 (copy)
        local v108, v109 = l_v103_0(v107);
        if v108 == false then
            return false, string.format("[array] %s", v109 or "");
        else
            local v110 = 0;
            for _ in ipairs(v107) do
                v110 = v110 + 1;
            end;
            for v112 in pairs(v107) do
                if v112 < 1 or v110 < v112 then
                    return false, string.format("[array] key %s must be sequential", (tostring(v112)));
                end;
            end;
            local v113, v114 = v106(v107);
            if not v113 then
                return false, string.format("[array] %s", v114 or "");
            else
                return true;
            end;
        end;
    end;
end;
v7.strictArray = function(...) --[[ Line: 926 ]] --[[ Name: strictArray ]]
    -- upvalues: v7 (copy), l_v103_0 (copy)
    local v115 = {
        ...
    };
    assert(v7.array(v7.callback)(v115));
    return function(v116) --[[ Line: 930 ]]
        -- upvalues: l_v103_0 (ref), v115 (copy)
        local v117, v118 = l_v103_0(v116);
        if v117 == false then
            return false, string.format("[strictArray] %s", v118 or "");
        elseif #v115 < #v116 then
            return false, string.format("[strictArray] Array size exceeds limit of %d", #v115);
        else
            for v119, v120 in pairs(v115) do
                local v121, v122 = v120(v116[v119]);
                if not v121 then
                    return false, string.format("[strictArray] Array index #%d - %s", v119, v122);
                end;
            end;
            return true;
        end;
    end;
end;
v103 = v7.array(v7.callback);
local l_v103_1 = v103 --[[ copy: 1 -> 3 ]];
v7.union = function(...) --[[ Line: 962 ]] --[[ Name: union ]]
    -- upvalues: l_v103_1 (copy)
    local v124 = {
        ...
    };
    assert(l_v103_1(v124));
    return function(v125) --[[ Line: 966 ]]
        -- upvalues: v124 (copy)
        for _, v127 in ipairs(v124) do
            if v127(v125) then
                return true;
            end;
        end;
        return false, "bad type for union";
    end;
end;
v7.some = v7.union;
v7.intersection = function(...) --[[ Line: 989 ]] --[[ Name: intersection ]]
    -- upvalues: l_v103_1 (copy)
    local v128 = {
        ...
    };
    assert(l_v103_1(v128));
    return function(v129) --[[ Line: 993 ]]
        -- upvalues: v128 (copy)
        for _, v131 in ipairs(v128) do
            local v132, v133 = v131(v129);
            if not v132 then
                return false, v133 or "";
            end;
        end;
        return true;
    end;
end;
v7.every = v7.intersection;
v103 = v7.map(v7.any, v7.callback);
local l_v103_2 = v103 --[[ copy: 1 -> 4 ]];
v7.interface = function(v135) --[[ Line: 1020 ]] --[[ Name: interface ]]
    -- upvalues: l_v103_2 (copy), v7 (copy)
    assert(l_v103_2(v135));
    return function(v136) --[[ Line: 1022 ]]
        -- upvalues: v7 (ref), v135 (copy)
        local v137, v138 = v7.table(v136);
        if v137 == false then
            return false, v138 or "";
        else
            for v139, v140 in pairs(v135) do
                local v141, v142 = v140(v136[v139]);
                if v141 == false then
                    return false, string.format("[interface] bad value for %s:\n\t%s", tostring(v139), v142 or "");
                end;
            end;
            return true;
        end;
    end;
end;
v7.strictInterface = function(v143) --[[ Line: 1046 ]] --[[ Name: strictInterface ]]
    -- upvalues: l_v103_2 (copy), v7 (copy)
    assert(l_v103_2(v143));
    return function(v144) --[[ Line: 1048 ]]
        -- upvalues: v7 (ref), v143 (copy)
        local v145, v146 = v7.table(v144);
        if v145 == false then
            return false, v146 or "";
        else
            for v147, v148 in pairs(v143) do
                local v149, v150 = v148(v144[v147]);
                if v149 == false then
                    return false, string.format("[interface] bad value for %s:\n\t%s", tostring(v147), v150 or "");
                end;
            end;
            for v151 in pairs(v144) do
                if not v143[v151] then
                    return false, string.format("[interface] unexpected field %q", (tostring(v151)));
                end;
            end;
            return true;
        end;
    end;
end;
v7.instanceOf = function(v152, v153) --[[ Line: 1079 ]] --[[ Name: instanceOf ]]
    -- upvalues: v7 (copy)
    assert(v7.string(v152));
    local v154 = nil;
    if v153 ~= nil then
        v154 = v7.children(v153);
    end;
    return function(v155) --[[ Line: 1087 ]]
        -- upvalues: v7 (ref), v152 (copy), v154 (ref)
        local v156, v157 = v7.Instance(v155);
        if not v156 then
            return false, v157 or "";
        elseif v155.ClassName ~= v152 then
            return false, string.format("%s expected, got %s", v152, v155.ClassName);
        else
            if v154 then
                local v158, v159 = v154(v155);
                if not v158 then
                    return false, v159;
                end;
            end;
            return true;
        end;
    end;
end;
v7.instance = v7.instanceOf;
v7.instanceIsA = function(v160, v161) --[[ Line: 1117 ]] --[[ Name: instanceIsA ]]
    -- upvalues: v7 (copy)
    assert(v7.string(v160));
    local v162 = nil;
    if v161 ~= nil then
        v162 = v7.children(v161);
    end;
    return function(v163) --[[ Line: 1125 ]]
        -- upvalues: v7 (ref), v160 (copy), v162 (ref)
        local v164, v165 = v7.Instance(v163);
        if not v164 then
            return false, v165 or "";
        elseif not v163:IsA(v160) then
            return false, string.format("%s expected, got %s", v160, v163.ClassName);
        else
            if v162 then
                local v166, v167 = v162(v163);
                if not v166 then
                    return false, v167;
                end;
            end;
            return true;
        end;
    end;
end;
v7.enum = function(v168) --[[ Line: 1153 ]] --[[ Name: enum ]]
    -- upvalues: v7 (copy)
    assert(v7.Enum(v168));
    return function(v169) --[[ Line: 1155 ]]
        -- upvalues: v7 (ref), v168 (copy)
        local v170, v171 = v7.EnumItem(v169);
        if not v170 then
            return false, v171;
        elseif v169.EnumType == v168 then
            return true;
        else
            return false, string.format("enum of %s expected, got enum of %s", tostring(v168), (tostring(v169.EnumType)));
        end;
    end;
end;
v103 = v7.tuple(v7.callback, v7.callback);
local l_v103_3 = v103 --[[ copy: 1 -> 5 ]];
v7.wrap = function(v173, v174) --[[ Line: 1180 ]] --[[ Name: wrap ]]
    -- upvalues: l_v103_3 (copy)
    assert(l_v103_3(v173, v174));
    return function(...) --[[ Line: 1182 ]]
        -- upvalues: v174 (copy), v173 (copy)
        assert(v174(...));
        return v173(...);
    end;
end;
v7.strict = function(v175) --[[ Line: 1196 ]] --[[ Name: strict ]]
    return function(...) --[[ Line: 1197 ]]
        -- upvalues: v175 (copy)
        assert(v175(...));
    end;
end;
v103 = v7.map(v7.string, v7.callback);
v7.children = function(v176) --[[ Line: 1216 ]] --[[ Name: children ]]
    -- upvalues: v103 (copy), v7 (copy)
    assert(v103(v176));
    return function(v177) --[[ Line: 1219 ]]
        -- upvalues: v7 (ref), v176 (copy)
        local v178, v179 = v7.Instance(v177);
        if not v178 then
            return false, v179 or "";
        else
            local v180 = {};
            for _, v182 in ipairs(v177:GetChildren()) do
                local l_Name_0 = v182.Name;
                if v176[l_Name_0] then
                    if v180[l_Name_0] then
                        return false, string.format("Cannot process multiple children with the same name %q", l_Name_0);
                    else
                        v180[l_Name_0] = v182;
                    end;
                end;
            end;
            for v184, v185 in pairs(v176) do
                local v186, v187 = v185(v180[v184]);
                if not v186 then
                    return false, string.format("[%s.%s] %s", v177:GetFullName(), v184, v187 or "");
                end;
            end;
            return true;
        end;
    end;
end;
return v7;