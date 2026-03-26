local l_Parent_0 = script:FindFirstAncestor("AccountLockModal").Parent;
local v1 = require(l_Parent_0.React);
local l_useState_0 = v1.useState;
local l_useMemo_0 = v1.useMemo;
local l_useContext_0 = v1.useContext;
local l_useCallback_0 = v1.useCallback;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v7 = require(script.Parent.Parent.Common.Enums);
local _ = require(script.Parent.Parent.Common.Types);
local v9 = require(script.Parent.Parent.Flags.GetFIntRateLimitedRefreshSec);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v11 = v1.createContext({});
return {
    Context = v11, 
    Provider = function(v12) --[[ Line: 34 ]] --[[ Name: AccountLockProvider ]]
        -- upvalues: l_useState_0 (copy), v7 (copy), l_useCallback_0 (copy), v9 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_useMemo_0 (copy), v1 (copy), v11 (copy)
        local v13, v14 = l_useState_0({
            status = v7.AccountLockStatusEnum.Locked, 
            timeUntilRetry = nil
        });
        local v15 = nil;
        v15 = l_useCallback_0(function(v16) --[[ Line: 42 ]]
            -- upvalues: v14 (copy), v7 (ref), v9 (ref), v15 (ref)
            local l_UnixTimestamp_0 = DateTime.now().UnixTimestamp;
            local v18 = v16.UnixTimestamp - l_UnixTimestamp_0;
            if v18 > 0 then
                v14({
                    status = v7.AccountLockStatusEnum.RateLimited, 
                    timeUntilRetry = v18
                });
                task.spawn(function() --[[ Line: 51 ]]
                    -- upvalues: v9 (ref), v15 (ref), v16 (copy)
                    task.wait(v9());
                    v15(v16);
                end);
                return;
            else
                v14({
                    status = v7.AccountLockStatusEnum.Locked, 
                    timeUntilRetry = nil
                });
                return;
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v14
        } else l_dependencyArray_0(v14));
        local v21 = l_useCallback_0(function(v19) --[[ Line: 63 ]]
            -- upvalues: v7 (ref), v15 (ref), v14 (copy)
            local v20 = v19.retryTime and DateTime.fromIsoDate(v19.retryTime);
            if v19.status == v7.AccountLockStatusEnum.RateLimited and v20 then
                v15(v20);
                return;
            elseif v19.status ~= v7.AccountLockStatusEnum.RateLimited then
                v14({
                    status = v19.status, 
                    timeUntilRetry = nil
                });
                return;
            else
                v14({
                    status = v7.AccountLockStatusEnum.Error, 
                    timeUntilRetry = nil
                });
                return;
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v13, 
            v14
        } else l_dependencyArray_0(v13, v14));
        local v22 = l_useMemo_0(function() --[[ Line: 80 ]]
            -- upvalues: v13 (copy), v21 (copy)
            return {
                state = v13, 
                reducer = v21
            };
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v13, 
            v21
        } else l_dependencyArray_0(v13, v21));
        return v1.createElement(v11.Provider, {
            value = v22
        }, v12.children);
    end, 
    useAccountLockContext = function() --[[ Line: 98 ]] --[[ Name: useAccountLockContext ]]
        -- upvalues: l_useContext_0 (copy), v11 (copy)
        local v23 = l_useContext_0(v11);
        return {
            state = v23.state, 
            reducer = v23.reducer
        };
    end
};