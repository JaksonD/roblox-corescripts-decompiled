local l_Parent_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent;
local l_Players_0 = game:GetService("Players");
local v2 = require(l_Parent_0.Signals);
local v3 = nil;
local function v9() --[[ Line: 15 ]]
    -- upvalues: l_Players_0 (copy), v2 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local v5 = l_LocalPlayer_0.HasRobloxSubscription == true;
    local v6, v7 = v2.createSignal(v5);
    local v8 = l_LocalPlayer_0:GetPropertyChangedSignal("HasRobloxSubscription"):Connect(function() --[[ Line: 22 ]]
        -- upvalues: v7 (copy), l_LocalPlayer_0 (copy)
        v7(l_LocalPlayer_0.HasRobloxSubscription == true);
    end);
    return {
        getHasRobloxSubscription = v6, 
        cleanup = function() --[[ Line: 28 ]] --[[ Name: cleanup ]]
            -- upvalues: v8 (copy)
            if v8 then
                v8:Disconnect();
            end;
        end
    };
end;
return {
    get = function() --[[ Line: 38 ]]
        -- upvalues: v3 (ref), v2 (copy), v9 (copy)
        if v3 == nil then
            v3 = v2.createComputed(v9)(false);
        end;
        return v3;
    end, 
    cleanup = function() --[[ Line: 45 ]]
        -- upvalues: v3 (ref)
        v3 = nil;
    end
};