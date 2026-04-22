local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent;
local v1 = require(l_Parent_0.Signals);
local _ = require(l_Parent_0.AXCommon);
return function() --[[ Line: 38 ]] --[[ Name: createItemSelectionStore ]]
    -- upvalues: v1 (copy)
    local v3, v4 = v1.createSignal({});
    local v5 = {};
    local function v8(v6) --[[ Line: 44 ]] --[[ Name: getItemData ]]
        -- upvalues: v5 (copy), v1 (ref), v3 (copy)
        if v5[v6] == nil then
            v5[v6] = v1.createComputed(function(v7) --[[ Line: 46 ]]
                -- upvalues: v3 (ref), v6 (copy)
                return v3(v7)[v6];
            end);
        end;
        return v5[v6];
    end;
    return {
        getItemDataMap = v3, 
        getItemData = v8, 
        setItemData = function(v9, v10) --[[ Line: 54 ]] --[[ Name: setItemData ]]
            -- upvalues: v3 (copy), v4 (copy)
            local v11 = table.clone(v3(false));
            v11[v9] = v10;
            v4(v11);
        end, 
        clearItemData = function(v12) --[[ Line: 60 ]] --[[ Name: clearItemData ]]
            -- upvalues: v3 (copy), v4 (copy)
            local v13 = table.clone(v3(false));
            v13[v12] = nil;
            v4(v13);
        end, 
        clearAll = function() --[[ Line: 66 ]] --[[ Name: clearAll ]]
            -- upvalues: v4 (copy)
            v4({});
        end
    };
end;