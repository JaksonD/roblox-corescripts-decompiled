local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserProfiles");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Signals);
local v4 = require(l_Parent_0.SignalsReact);
local l_createComputed_0 = v3.createComputed;
local l_useSignalState_0 = v4.useSignalState;
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheckDev;
local v8 = require(l_script_FirstAncestor_0.Stores.UserProfileStore);
return function(v9) --[[ Line: 15 ]] --[[ Name: useIsRobloxSubscriber ]]
    -- upvalues: l_FFlagEnableBlackbirdCheckDev_0 (copy), v2 (copy), l_createComputed_0 (copy), v8 (copy), l_useSignalState_0 (copy)
    local v10 = l_FFlagEnableBlackbirdCheckDev_0 and v9 ~= nil and v9 ~= "";
    local v16 = v2.useMemo(function() --[[ Line: 18 ]]
        -- upvalues: v10 (copy), l_createComputed_0 (ref), v8 (ref), v9 (copy)
        if not v10 then
            return l_createComputed_0(function() --[[ Line: 20 ]]
                return false;
            end);
        else
            local v11 = v8.get().fetchNamesByUserIds({
                v9
            });
            return l_createComputed_0(function(v12) --[[ Line: 28 ]]
                -- upvalues: v11 (copy)
                local l_status_0, l_result_0 = pcall(v11, v12);
                if l_status_0 and l_result_0.status == "success" and #l_result_0.data > 0 then
                    local v15 = l_result_0.data[1];
                    if v15.getHasRobloxSubscription ~= nil then
                        return (v15.getHasRobloxSubscription(v12));
                    end;
                end;
                return false;
            end);
        end;
    end, {
        v9
    });
    return (l_useSignalState_0(v16));
end;