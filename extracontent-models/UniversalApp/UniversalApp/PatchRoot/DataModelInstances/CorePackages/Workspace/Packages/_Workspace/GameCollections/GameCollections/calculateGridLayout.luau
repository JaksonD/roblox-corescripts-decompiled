local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local _ = require(l_Parent_0.DiscoveryTypes);
local l_reportWarning_0 = require(l_Parent_0.DiscoveryAnalytics).Points.reportWarning;
local v3 = require(l_Parent_0.LoggingProtocol);
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
local function v10(v5, v6, v7) --[[ Line: 14 ]] --[[ Name: removeFromAvailableCells ]]
    for v8 = 1, #v5 do
        local v9 = v5[v8];
        if v9.X == v6 and v9.Y == v7 then
            table.remove(v5, v8);
            return;
        end;
    end;
end;
local function _(v11, v12, v13, v14, v15, v16, v17) --[[ Line: 24 ]] --[[ Name: markOccupiedCell ]]
    -- upvalues: v10 (copy)
    v11[v13] = v11[v13] or {};
    v11[v13][v12] = v14;
    v15 = math.max(v15, v13);
    v16 = math.max(v16, v12);
    if v17 then
        v10(v17, v12, v13);
    end;
    return v15, v16;
end;
local function _(v19, v20, v21) --[[ Line: 49 ]] --[[ Name: isCellOccupied ]]
    if v19[v21] then
        return v19[v21][v20] ~= nil;
    else
        return false;
    end;
end;
local function v33(v23, v24, v25, v26, v27, v28) --[[ Line: 56 ]] --[[ Name: canInsertItem ]]
    if v28 < v24 + v26 - 1 then
        return false;
    else
        for v29 = 0, v27 - 1 do
            for v30 = 0, v26 - 1 do
                local v31 = v24 + v30;
                local v32 = v25 + v29;
                if if v23[v32] then v23[v32][v31] ~= nil else false then
                    return false;
                end;
            end;
        end;
        return true;
    end;
end;
local function v55(v34, v35, v36, v37, v38, v39, v40, v41, v42) --[[ Line: 81 ]] --[[ Name: markItemCells ]]
    -- upvalues: v10 (copy)
    local l_v40_0 = v40;
    local l_v41_0 = v41;
    v34[v36] = v34[v36] or {};
    v34[v36][v35] = v37;
    l_v40_0 = math.max(l_v40_0, v36);
    l_v41_0 = math.max(l_v41_0, v35);
    if v42 then
        v10(v42, v35, v36);
    end;
    local l_l_v40_0_0 = l_v40_0;
    local l_l_v41_0_0 = l_v41_0;
    v40 = l_l_v40_0_0;
    v41 = l_l_v41_0_0;
    for v47 = 0, v39 - 1 do
        for v48 = 0, v38 - 1 do
            if v48 ~= 0 or v47 ~= 0 then
                local v49 = v35 + v48;
                local v50 = v36 + v47;
                local l_v40_1 = v40;
                local l_v41_1 = v41;
                v34[v50] = v34[v50] or {};
                v34[v50][v49] = -1;
                l_v40_1 = math.max(l_v40_1, v50);
                l_v41_1 = math.max(l_v41_1, v49);
                if v42 then
                    v10(v42, v49, v50);
                end;
                local l_l_v40_1_0 = l_v40_1;
                local l_l_v41_1_0 = l_v41_1;
                v40 = l_l_v40_1_0;
                v41 = l_l_v41_1_0;
            end;
        end;
    end;
    return v40, v41;
end;
local function v72(v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66) --[[ Line: 110 ]] --[[ Name: findPinnedInsertionPointAndMarkOccupiedItem ]]
    -- upvalues: l_reportWarning_0 (copy), v3 (copy), v33 (copy), v55 (copy)
    local v67 = v65 or 1;
    if v60 < v58 then
        l_reportWarning_0(v3.default, "InvalidGrid", (("Item %* has colSpan %* greater than itemsPerRow %*"):format(v57, v58, v60)));
        return v61, v62, nil;
    elseif v64 < 1 or v60 < v64 + v58 - 1 then
        l_reportWarning_0(v3.default, "InvalidGrid", (("Item %* cannot be pinned at column %* with colSpan %* in grid with %* columns"):format(v57, v64, v58, v60)));
        return v61, v62, nil;
    else
        while true do
            if v67 <= v66 then
                if v63.lastRow < v67 then
                    local l_lastRow_0 = v63.lastRow;
                    v63.lastRow = v67;
                    for v69 = l_lastRow_0 * v60 + 1, v67 * v60 do
                        table.insert(v63.availableCells, Vector2.new((v69 - 1) % v60 + 1, math.floor((v69 - 1) / v60) + 1));
                    end;
                end;
                if v33(v56, v64, v67, v58, v59, v60) then
                    local v70, v71 = v55(v56, v64, v67, v57, v58, v59, v61, v62, v63.availableCells);
                    return v70, v71, v67;
                else
                    v67 = v67 + 1;
                end;
            else
                l_reportWarning_0(v3.default, "InvalidGrid", (("Item %* at column %* with colSpan %* could not be placed within allowed rows"):format(v57, v64, v58)));
                return v61, v62, nil;
            end;
        end;
    end;
end;
local function v104(v73, v74, v75, v76, v77, v78, v79, v80) --[[ Line: 183 ]] --[[ Name: findInsertionPointAndMarkOccupiedItem ]]
    -- upvalues: l_reportWarning_0 (copy), v3 (copy), v33 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), v55 (copy), v10 (copy)
    if v77 < v75 then
        l_reportWarning_0(v3.default, "InvalidGrid", (("Item %* has colSpan %* greater than itemsPerRow %*"):format(v74, v75, v77)));
        return v78, v79;
    else
        if v78 + 1 > v80.lastRow then
            local l_lastRow_1 = v80.lastRow;
            local v82 = v78 + 1;
            v80.lastRow = v82;
            for v83 = l_lastRow_1 * v77 + 1, v82 * v77 do
                table.insert(v80.availableCells, Vector2.new((v83 - 1) % v77 + 1, math.floor((v83 - 1) / v77) + 1));
            end;
        end;
        local v84 = 1;
        while true do
            if v84 <= #v80.availableCells then
                local v85 = v80.availableCells[v84];
                local l_X_0 = v85.X;
                local l_Y_0 = v85.Y;
                if v33(v73, l_X_0, l_Y_0, v75, v76, v77) then
                    if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then
                        local v88, v89 = v55(v73, l_X_0, l_Y_0, v74, v75, v76, v78, v79, v80.availableCells);
                        return v88, v89;
                    else
                        local l_v78_0 = v78;
                        local l_v79_0 = v79;
                        local l_availableCells_0 = v80.availableCells;
                        v73[l_Y_0] = v73[l_Y_0] or {};
                        v73[l_Y_0][l_X_0] = v74;
                        l_v78_0 = math.max(l_v78_0, l_Y_0);
                        l_v79_0 = math.max(l_v79_0, l_X_0);
                        if l_availableCells_0 then
                            v10(l_availableCells_0, l_X_0, l_Y_0);
                        end;
                        local l_l_v78_0_0 = l_v78_0;
                        local l_l_v79_0_0 = l_v79_0;
                        v78 = l_l_v78_0_0;
                        v79 = l_l_v79_0_0;
                        for v95 = 0, v76 - 1 do
                            for v96 = 0, v75 - 1 do
                                if v96 ~= 0 or v95 ~= 0 then
                                    local v97 = l_X_0 + v96;
                                    local v98 = l_Y_0 + v95;
                                    local l_v78_1 = v78;
                                    local l_v79_1 = v79;
                                    local l_availableCells_1 = v80.availableCells;
                                    v73[v98] = v73[v98] or {};
                                    v73[v98][v97] = -1;
                                    l_v78_1 = math.max(l_v78_1, v98);
                                    l_v79_1 = math.max(l_v79_1, v97);
                                    if l_availableCells_1 then
                                        v10(l_availableCells_1, v97, v98);
                                    end;
                                    local l_l_v78_1_0 = l_v78_1;
                                    local l_l_v79_1_0 = l_v79_1;
                                    v78 = l_l_v78_1_0;
                                    v79 = l_l_v79_1_0;
                                end;
                            end;
                        end;
                        return v78, v79;
                    end;
                else
                    v84 = v84 + 1;
                end;
            else
                return v78, v79;
            end;
        end;
    end;
end;
return function(v105, v106, v107) --[[ Line: 283 ]] --[[ Name: calculateGridLayout ]]
    -- upvalues: l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), v72 (copy), v104 (copy)
    if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 and (not v106 or v106 <= 0) then
        return {
            layout = {}, 
            totalRows = 0, 
            totalCols = 0
        };
    else
        local v108 = {};
        local v109 = 0;
        local v110 = 0;
        local v111 = {
            lastRow = 0, 
            availableCells = {}
        };
        local v112 = false;
        local v113 = l_FFlagLuaAppEnableHomepageTwoByOneTile_0 and 1 or nil;
        local v114 = nil;
        local v115 = nil;
        if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then
            local v116 = 0;
            for v117 = 1, v105 do
                local v118 = v107 and v107[v117];
                v116 = v116 + (v118 and v118.colSpan or 1) * (v118 and v118.rowSpan or 1);
            end;
            local v119 = math.ceil(v116 / v106);
            v115 = v119;
            v114 = if v116 % v106 == 0 then v119 else math.max(1, v119 - 1);
        end;
        for v120 = 1, v105 do
            local v121 = v107 and v107[v120] and v107[v120].colSpan or 1;
            local v122 = v107 and v107[v120] and v107[v120].rowSpan or 1;
            local v123 = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v107 and v107[v120] and v107[v120].alignmentType or nil else nil;
            local v124 = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v107 and v107[v120] and v107[v120].minRowPadding or 0 else nil;
            if v121 ~= 1 or v122 ~= 1 or v123 then
                v112 = true;
            end;
            if v112 then
                if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 and v123 == "RightPin" then
                    local v125 = v106 - v121 + 1;
                    local v126 = nil;
                    local v127, v128, v129 = v72(v108, v120, v121, v122, v106, v109, v110, v111, v125, v113, v114);
                    v109 = v127;
                    v110 = v128;
                    v126 = v129;
                    if v126 and v124 and v124 > 0 then
                        v113 = v126 + v124;
                    end;
                elseif l_FFlagLuaAppEnableHomepageTwoByOneTile_0 and v123 == "LeftPin" then
                    local v130 = nil;
                    local v131, v132, v133 = v72(v108, v120, v121, v122, v106, v109, v110, v111, 1, v113, v115);
                    v109 = v131;
                    v110 = v132;
                    v130 = v133;
                    if v130 and v124 and v124 > 0 then
                        v113 = v130 + v124;
                    end;
                else
                    local v134, v135 = v104(v108, v120, v121, v122, v106, v109, v110, v111);
                    v109 = v134;
                    v110 = v135;
                end;
            else
                local v136 = (v120 - 1) % v106 + 1;
                local v137 = math.floor((v120 - 1) / v106) + 1;
                local l_v109_0 = v109;
                local l_v110_0 = v110;
                v108[v137] = v108[v137] or {};
                v108[v137][v136] = v120;
                l_v109_0 = math.max(l_v109_0, v137);
                l_v110_0 = math.max(l_v110_0, v136);
                local l_l_v109_0_0 = l_v109_0;
                local l_l_v110_0_0 = l_v110_0;
                v109 = l_l_v109_0_0;
                v110 = l_l_v110_0_0;
            end;
        end;
        return {
            layout = v108, 
            totalRows = v109, 
            totalCols = v110
        };
    end;
end;