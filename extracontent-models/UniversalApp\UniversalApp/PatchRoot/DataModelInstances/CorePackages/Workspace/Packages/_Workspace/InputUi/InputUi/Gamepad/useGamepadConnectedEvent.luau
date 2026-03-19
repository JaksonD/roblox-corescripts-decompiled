local l_Parent_0 = script:FindFirstAncestor("InputUi").Parent;
local v1 = require(l_Parent_0.React);
local l_MemStorageService_0 = game:GetService("MemStorageService");
return function(v3, v4) --[[ Line: 12 ]] --[[ Name: useGamepadConnectedEvent ]]
    -- upvalues: v1 (copy), l_MemStorageService_0 (copy)
    v1.useEffect(function() --[[ Line: 13 ]]
        -- upvalues: l_MemStorageService_0 (ref), v4 (copy), v3 (copy)
        local v6 = l_MemStorageService_0:BindAndFire("ActiveGamepadConnected", function(v5) --[[ Line: 14 ]]
            -- upvalues: v4 (ref), v3 (ref)
            if v5 == "false" then
                v4();
                return;
            else
                v3();
                return;
            end;
        end);
        return function() --[[ Line: 22 ]]
            -- upvalues: v6 (copy)
            v6:Disconnect();
        end;
    end, {
        v3, 
        v4
    });
end;