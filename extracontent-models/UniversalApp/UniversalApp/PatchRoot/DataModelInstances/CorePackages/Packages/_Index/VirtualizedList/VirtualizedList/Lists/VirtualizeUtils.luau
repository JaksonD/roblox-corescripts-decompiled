local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Error_0 = require(l_Parent_1.LuauPolyfill).Error;
local l_HttpService_0 = game:GetService("HttpService");
local v4 = {};
local v5 = require(l_Parent_0.jsUtils.invariant);
local function v15(v6, v7, v8) --[[ Line: 26 ]] --[[ Name: elementsThatOverlapOffsets ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy)
    local v9 = {};
    local v10 = 0;
    for v11 = 1, v7 do
        local v12 = v8(v11);
        local v13 = v12.offset + v12.length;
        for v14 = 1, #v6 do
            if v9[v14] == nil and v6[v14] <= v13 then
                v9[v14] = v11;
                v10 = v10 + 1;
                if v14 == #v6 then
                    if v10 ~= #v6 then
                        v5(v10 == #v6, "bad offsets input, should be in increasing order: %s", l_HttpService_0:JSONEncode(v6));
                    end;
                    return v9;
                end;
            end;
        end;
    end;
    return v9;
end;
v4.elementsThatOverlapOffsets = v15;
v4.newRangeCount = function(v16, v17) --[[ Line: 65 ]] --[[ Name: newRangeCount ]]
    return v17.last - v17.first + 1 - math.max(0, math.min(v17.last, v16.last) + 1 - math.max(v17.first, v16.first));
end;
v4.computeWindowedRenderLimits = function(v18, v19, v20, v21, v22, v23, v24) --[[ Line: 82 ]] --[[ Name: computeWindowedRenderLimits ]]
    -- upvalues: v15 (copy), l_Error_0 (copy), l_HttpService_0 (copy)
    local v25 = v19(v18);
    if v25 == 0 then
        return v22;
    else
        local l_offset_0 = v24.offset;
        local l_velocity_0 = v24.velocity;
        local l_visibleLength_0 = v24.visibleLength;
        local v29 = math.max(0, l_offset_0);
        local v30 = v29 + l_visibleLength_0;
        local v31 = (v21 - 1) * l_visibleLength_0;
        local v32 = l_velocity_0 > 1 and "after" or l_velocity_0 < -1 and "before" or "none";
        local v33 = math.max(0, v29 - 0.5 * v31);
        local v34 = math.max(0, v30 + 0.5 * v31);
        if v23(v25).offset < v33 then
            return {
                first = math.max(1, v25 - v20), 
                last = v25
            };
        else
            local v35, v36, v37, v38 = table.unpack(v15({
                v33, 
                v29, 
                v30, 
                v34
            }, v25, v23), 1, 4);
            if v35 == nil then
                v35 = 1;
            end;
            if v36 == nil then
                v36 = math.max(1, v35);
            end;
            if v38 == nil then
                v38 = v25;
            end;
            if v37 == nil then
                v37 = math.min(v38, v36 + v20 - 1);
            end;
            local v39 = {
                first = v36, 
                last = v37
            };
            local v40 = v39.last - v39.first + 1 - math.max(0, math.min(v39.last, v22.last) + 1 - math.max(v39.first, v22.first));
            while v36 > v35 or v38 > v37 do
                local v41 = v20 <= v40;
                local v42 = true;
                if v36 > v22.first then
                    v42 = v22.last < v36;
                end;
                local v43 = false;
                if v35 < v36 then
                    v43 = not v41 or not v42;
                end;
                local v44 = true;
                if v22.last > v37 then
                    v44 = v37 < v22.first;
                end;
                local v45 = false;
                if v37 < v38 then
                    v45 = not v41 or not v44;
                end;
                if not v41 or v43 or v45 then
                    if v43 and (v32 ~= "after" or not v45 or not v44) then
                        if v42 then
                            v40 = v40 + 1;
                        end;
                        v36 = v36 - 1;
                    end;
                    if v45 and (v32 ~= "before" or not v43 or not v42) then
                        if v44 then
                            v40 = v40 + 1;
                        end;
                        v37 = v37 + 1;
                    end;
                else
                    break;
                end;
            end;
            if v36 > v37 or v36 < 1 or v37 > v25 or v35 > v36 or v37 > v38 or v36 > v39.first or v39.last > v37 then
                error(l_Error_0.new("Bad window calculation " .. l_HttpService_0:JSONEncode({
                    first = v36, 
                    last = v37, 
                    itemCount = v25, 
                    overscanFirst = v35, 
                    overscanLast = v38, 
                    visible = v39
                })));
            end;
            return {
                first = v36, 
                last = v37
            };
        end;
    end;
end;
v4.keyExtractor = function(v46, v47) --[[ Line: 204 ]] --[[ Name: keyExtractor ]]
    if typeof(v46) == "table" and v46.key ~= nil then
        return v46.key;
    elseif typeof(v46) == "table" and v46.id ~= nil then
        return v46.id;
    else
        return (tostring(v47));
    end;
end;
return v4;