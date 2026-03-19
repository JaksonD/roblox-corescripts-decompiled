local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Enums.ElevationLayer);
local v4 = require(script.Parent.ElevationProvider);
local _ = require(script.Parent.elevation);
local l_useElevationManager_0 = v4.useElevationManager;
local l_useOwnerToken_0 = v4.useOwnerToken;
return function(v8, v9) --[[ Line: 20 ]] --[[ Name: useElevation ]]
    -- upvalues: l_useElevationManager_0 (copy), l_useOwnerToken_0 (copy), v2 (copy)
    local v10 = l_useElevationManager_0();
    local v11 = l_useOwnerToken_0();
    local v14 = v2.useMemo(function() --[[ Line: 25 ]]
        -- upvalues: v11 (copy), v8 (copy), v9 (copy), v10 (copy)
        local v12 = false;
        if v11 ~= nil then
            v12 = v11.layer == v8;
        end;
        if v9.stackAboveOwner then
            if not v11 then
                return v10.acquire(v8, {
                    reserve = false
                });
            elseif v12 then
                return v10.acquire(v8, {
                    reserve = true, 
                    owner = v11
                });
            else
                local v13 = v11.zIndex + 1;
                return {
                    layer = v8, 
                    index = -1, 
                    zIndex = v13
                };
            end;
        else
            return v10.acquire(v8, {
                reserve = v12
            });
        end;
    end, {
        v8, 
        v11, 
        v10, 
        v9.stackAboveOwner
    });
    v2.useEffect(function() --[[ Line: 57 ]]
        -- upvalues: v14 (copy), v10 (copy), v8 (copy)
        return function() --[[ Line: 58 ]]
            -- upvalues: v14 (ref), v10 (ref), v8 (ref)
            if v14.index ~= nil and v14.index >= 0 then
                v10.releaseIfTop(v8, v14.index);
            end;
        end;
    end, {
        v8, 
        v14.index
    });
    return v14;
end;