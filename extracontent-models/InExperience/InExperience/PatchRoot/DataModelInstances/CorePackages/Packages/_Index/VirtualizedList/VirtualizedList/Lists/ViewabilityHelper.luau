local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Map_0 = v2.Map;
local l_Set_0 = v2.Set;
local l_Object_0 = v2.Object;
local l_console_0 = v2.console;
local l_setTimeout_0 = v2.setTimeout;
local l_clearTimeout_0 = v2.clearTimeout;
local v10 = require(l_Parent_0.jsUtils.invariant);
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = {};
v14.__index = v14;
v14.new = function(v15) --[[ Line: 146 ]] --[[ Name: new ]]
    -- upvalues: v14 (copy), l_Set_0 (copy), l_Map_0 (copy)
    local v16 = setmetatable({}, v14);
    if v15 == nil then
        v15 = {
            viewAreaCoveragePercentThreshold = 0
        };
    end;
    v16._hasInteracted = false;
    v16._timers = l_Set_0.new();
    v16._viewableIndices = {};
    v16._viewableItems = l_Map_0.new();
    v16._config = v15;
    return v16;
end;
v14.dispose = function(v17) --[[ Line: 159 ]] --[[ Name: dispose ]]
    -- upvalues: l_clearTimeout_0 (copy)
    v17._timers:forEach(function(v18) --[[ Line: 163 ]]
        -- upvalues: l_clearTimeout_0 (ref)
        l_clearTimeout_0(v18);
    end);
end;
v14.computeViewableItems = function(v19, v20, v21, v22, v23, v24) --[[ Line: 168 ]] --[[ Name: computeViewableItems ]]
    -- upvalues: v10 (copy), l_console_0 (copy), v13 (ref)
    local l_itemVisiblePercentThreshold_0 = v19._config.itemVisiblePercentThreshold;
    local l_viewAreaCoveragePercentThreshold_0 = v19._config.viewAreaCoveragePercentThreshold;
    local v27 = l_viewAreaCoveragePercentThreshold_0 ~= nil;
    local v28 = if v27 then l_viewAreaCoveragePercentThreshold_0 else l_itemVisiblePercentThreshold_0;
    local l_v10_0 = v10;
    local v30 = false;
    if v28 ~= nil then
        v30 = l_itemVisiblePercentThreshold_0 ~= nil ~= (l_viewAreaCoveragePercentThreshold_0 ~= nil);
    end;
    l_v10_0(v30, "Must set exactly one of itemVisiblePercentThreshold or viewAreaCoveragePercentThreshold");
    l_v10_0 = {};
    if v20 == 0 then
        return l_v10_0;
    else
        v30 = 0;
        local v31 = nil;
        local v32 = nil;
        local v33 = v24 or {
            first = 1, 
            last = v20
        };
        v31 = v33.first;
        v32 = v33.last;
        if v20 < v32 then
            l_console_0.warn("Invalid render range computing viewability { renderRange = " .. tostring(v24) .. ", itemCount = " .. tostring(v20) .. " }");
            return {};
        else
            v33 = v31;
            while v33 <= v32 do
                local l_v33_0 = v33;
                local v35 = v23(l_v33_0);
                if not v35 then
                    v33 = v33 + 1;
                else
                    local v36 = v35.offset - v21;
                    local v37 = v36 + v35.length;
                    if v36 < v22 and v37 > 0 then
                        v30 = l_v33_0;
                        if v13(v27, v28, v36, v37, v22, v35.length) then
                            table.insert(l_v10_0, l_v33_0);
                        end;
                    elseif v30 >= 1 then
                        break;
                    end;
                    v33 = v33 + 1;
                end;
            end;
            return l_v10_0;
        end;
    end;
end;
v14.onUpdate = function(v38, v39, v40, v41, v42, v43, v44, v45) --[[ Line: 245 ]] --[[ Name: onUpdate ]]
    -- upvalues: l_Array_0 (copy), l_setTimeout_0 (copy)
    if v38._config.waitForInteraction and not v38._hasInteracted or v39 == 0 or not v42(1) then
        return;
    else
        local v46 = {};
        if v39 then
            v46 = v38:computeViewableItems(v39, v40, v41, v42, v45);
        end;
        if #v38._viewableIndices == #v46 and l_Array_0.every(v38._viewableIndices, function(v47, v48) --[[ Line: 278 ]]
            -- upvalues: v46 (ref)
            return v47 == v46[v48];
        end) then
            return;
        else
            v38._viewableIndices = v46;
            if v38._config.minimumViewTime then
                local v49 = nil;
                do
                    local l_v49_0 = v49;
                    l_v49_0 = l_setTimeout_0(function() --[[ Line: 289 ]]
                        -- upvalues: v38 (copy), l_v49_0 (ref), v46 (ref), v44 (copy), v43 (copy)
                        v38._timers:delete(l_v49_0);
                        v38:_onUpdateSync(v46, v44, v43);
                    end, v38._config.minimumViewTime);
                    v38._timers:add(l_v49_0);
                end;
            else
                v38:_onUpdateSync(v46, v44, v43);
            end;
            return;
        end;
    end;
end;
v14.resetViewableIndices = function(v51) --[[ Line: 305 ]] --[[ Name: resetViewableIndices ]]
    v51._viewableIndices = {};
end;
v14.recordInteraction = function(v52) --[[ Line: 309 ]] --[[ Name: recordInteraction ]]
    v52._hasInteracted = true;
end;
v14._onUpdateSync = function(v53, v54, v55, v56) --[[ Line: 313 ]] --[[ Name: _onUpdateSync ]]
    -- upvalues: l_Array_0 (copy), l_Map_0 (copy), l_Object_0 (copy)
    v54 = l_Array_0.filter(v54, function(v57) --[[ Line: 315 ]]
        -- upvalues: l_Array_0 (ref), v53 (copy)
        return l_Array_0.includes(v53._viewableIndices, v57);
    end);
    local l__viewableItems_0 = v53._viewableItems;
    local v61 = l_Map_0.new(l_Array_0.map(v54, function(v59) --[[ Line: 319 ]]
        -- upvalues: v56 (copy)
        local v60 = v56(v59, true);
        return {
            v60.key, 
            v60
        };
    end));
    local v62 = {};
    for _, v64 in ipairs(v61:keys()) do
        if not l__viewableItems_0:has(v64) then
            table.insert(v62, v61:get(v64));
        end;
    end;
    for _, v66 in ipairs(l__viewableItems_0:keys()) do
        if not v61:has(v66) then
            local v67 = l__viewableItems_0:get(v66);
            table.insert(v62, l_Object_0.assign({}, v67, {
                isViewable = false
            }));
        end;
    end;
    if #v62 > 0 then
        v53._viewableItems = v61;
        v55({
            viewableItems = l_Array_0.from(v61:values()), 
            changed = v62, 
            viewabilityConfig = v53._config
        });
    end;
end;
v13 = function(v68, v69, v70, v71, v72, v73) --[[ Line: 345 ]] --[[ Name: _isViewable ]]
    -- upvalues: v11 (ref), v12 (ref)
    if v11(v70, v71, v72) then
        return true;
    else
        local v74 = v12(v70, v71, v72);
        return v69 <= 100 * if v68 then v74 / v72 else v74 / v73;
    end;
end;
v12 = function(v75, v76, v77) --[[ Line: 362 ]] --[[ Name: _getPixelsVisible ]]
    return (math.max(0, math.min(v76, v77) - math.max(v75, 0)));
end;
v11 = function(v78, v79, v80) --[[ Line: 367 ]] --[[ Name: _isEntirelyVisible ]]
    local v81 = false;
    if v78 >= 0 then
        v81 = false;
        if v79 <= v80 then
            v81 = v78 < v79;
        end;
    end;
    return v81;
end;
return v14;