local l_Parent_0 = script:FindFirstAncestor("SduiCoreSystem").Parent;
local v1 = require(l_Parent_0.tutils);
local function v2(v3, v4) --[[ Line: 5 ]] --[[ Name: hasCycle ]]
    -- upvalues: v2 (copy)
    if v4 == nil then
        v4 = {};
    end;
    assert(v4, "seenNodes must exist");
    for _, v6 in v3 do
        if typeof(v6) == "table" then
            if v4[v6] then
                return true;
            else
                v4[v6] = true;
                if v2(v6, v4) then
                    return true;
                end;
            end;
        end;
    end;
    return false;
end;
return {
    hasCycle = v2, 
    stringifyValue = function(v7) --[[ Line: 26 ]] --[[ Name: stringifyValue ]]
        -- upvalues: v2 (copy), v1 (copy)
        if typeof(v7) == "table" then
            if v2(v7) then
                return "table-with-cycle";
            else
                return v1.toString(v7);
            end;
        else
            return v1.toString(v7);
        end;
    end
};