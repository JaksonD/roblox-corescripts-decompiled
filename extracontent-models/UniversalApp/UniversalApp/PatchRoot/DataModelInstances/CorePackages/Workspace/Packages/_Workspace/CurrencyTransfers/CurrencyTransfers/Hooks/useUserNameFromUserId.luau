local l_Parent_0 = script:FindFirstAncestor("CurrencyTransfers").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_Parent_0.SignalsReact);
local v4 = require(l_Parent_0.UserProfiles);
return function(v5) --[[ Line: 18 ]] --[[ Name: useUserNameFromUserId ]]
    -- upvalues: v1 (copy), v4 (copy), v2 (copy), v3 (copy)
    local v6 = v5 and v5 ~= 0;
    local v7 = v1.useMemo(function() --[[ Line: 21 ]]
        -- upvalues: v6 (copy), v5 (copy), v4 (ref)
        if not v6 or not v5 then
            return nil;
        else
            return v4.Stores.UserProfileStore.get().fetchNamesByUserIds({
                (tostring(v5))
            });
        end;
    end, {
        v6, 
        v5
    });
    local v13 = v1.useMemo(function() --[[ Line: 30 ]]
        -- upvalues: v7 (copy), v2 (ref)
        if not v7 then
            return function(_) --[[ Line: 32 ]]
                return nil;
            end;
        else
            return (v2.createComputed(function(v9) --[[ Line: 36 ]]
                -- upvalues: v7 (ref)
                local v10 = v7(v9);
                if not v10 or v10.status ~= "success" or not v10.data or #v10.data == 0 then
                    return nil;
                else
                    local v11 = v10.data[1];
                    local v12 = v11 and v11.names;
                    if not v12 then
                        return nil;
                    else
                        return v12.getDisplayName(false) or v12.getUsername(false) or "";
                    end;
                end;
            end));
        end;
    end, {
        v7
    });
    return v3.useSignalState(v13);
end;