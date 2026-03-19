local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local _ = require(l_script_FirstAncestor_0.BeduiV2.Types);
local function v2(v3, v4) --[[ Line: 12 ]] --[[ Name: transformJsonLeafFirst ]]
    -- upvalues: v2 (copy)
    if type(v3) == "table" then
        local v5 = false;
        local v6 = 0;
        for v7, _ in pairs(v3) do
            if type(v7) == "number" then
                v5 = true;
                v6 = math.max(v6, v7);
            else
                v5 = false;
                break;
            end;
        end;
        if v5 then
            local v9 = {};
            for v10, v11 in ipairs(v3) do
                v9[v10] = v2(v11, v4);
            end;
            return v4(v9);
        else
            local v12 = {};
            for v13, v14 in pairs(v3) do
                v12[v13] = v2(v14, v4);
            end;
            return v4(v12);
        end;
    else
        return v4(v3);
    end;
end;
return v2;