local v0 = require(script.Parent.EnumNetworkStatus);
local v1 = require(script.Parent.buildActionName);
local v2 = require(script.Parent.Promise);
return function(v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy), v0 (copy), v2 (copy)
    local v4 = require(script.Parent.getStatus)(v3);
    local function _(v5, v6, v7) --[[ Line: 8 ]] --[[ Name: actionCreator ]]
        -- upvalues: v1 (ref), v3 (copy)
        return {
            ids = v5, 
            keymapper = v6, 
            status = v7, 
            type = v1(v3)
        };
    end;
    local function v15(v9, v10, v11) --[[ Line: 17 ]] --[[ Name: filter ]]
        -- upvalues: v4 (copy), v0 (ref)
        local v12 = {};
        for _, v14 in ipairs(v10) do
            if v4(v9, v11(v14)) ~= v0.Fetching then
                table.insert(v12, v14);
            end;
        end;
        return v12;
    end;
    return function(v16, v17, v18, v19) --[[ Line: 28 ]]
        -- upvalues: v15 (copy), v3 (copy), v2 (ref), v0 (ref), v1 (ref)
        local v20 = v15(v16:getState(), v17, v18);
        if v3.killRequestWithFilteredIds and #v17 > 0 and #v20 == 0 then
            return v2.reject("Request with provided IDs already fetching.");
        else
            local l_Fetching_0 = v0.Fetching;
            v16:dispatch({
                ids = v20, 
                keymapper = v18, 
                status = l_Fetching_0, 
                type = v1(v3)
            });
            return v19(v16, v20):andThen(function(v22) --[[ Line: 38 ]]
                -- upvalues: v16 (copy), v20 (copy), v18 (copy), v0 (ref), v1 (ref), v3 (ref)
                local l_v16_0 = v16;
                local l_v20_0 = v20;
                local l_v18_0 = v18;
                local l_Done_0 = v0.Done;
                l_v16_0:dispatch({
                    ids = l_v20_0, 
                    keymapper = l_v18_0, 
                    status = l_Done_0, 
                    type = v1(v3)
                });
                return v22;
            end, function(v27) --[[ Line: 41 ]]
                -- upvalues: v16 (copy), v20 (copy), v18 (copy), v0 (ref), v1 (ref), v3 (ref), v2 (ref)
                local l_v16_1 = v16;
                local l_v20_1 = v20;
                local l_v18_1 = v18;
                local l_Failed_0 = v0.Failed;
                l_v16_1:dispatch({
                    ids = l_v20_1, 
                    keymapper = l_v18_1, 
                    status = l_Failed_0, 
                    type = v1(v3)
                });
                return v2.reject(v27);
            end);
        end;
    end;
end;