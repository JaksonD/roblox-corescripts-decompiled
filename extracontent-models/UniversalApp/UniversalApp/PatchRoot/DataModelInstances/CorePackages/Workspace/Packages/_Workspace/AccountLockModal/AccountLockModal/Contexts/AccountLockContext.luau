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
local v10 = v1.createContext({});
return {
    Context = v10, 
    Provider = function(v11) --[[ Line: 32 ]] --[[ Name: AccountLockProvider ]]
        -- upvalues: l_useState_0 (copy), v7 (copy), l_useCallback_0 (copy), v9 (copy), l_dependencyArray_0 (copy), l_useMemo_0 (copy), v1 (copy), v10 (copy)
        local v12, v13 = l_useState_0({
            status = v7.AccountLockStatusEnum.Locked, 
            timeUntilRetry = nil
        });
        local v14 = nil;
        v14 = l_useCallback_0(function(v15) --[[ Line: 39 ]]
            -- upvalues: v13 (copy), v7 (ref), v9 (ref), v14 (ref)
            local l_UnixTimestamp_0 = DateTime.now().UnixTimestamp;
            local v17 = v15.UnixTimestamp - l_UnixTimestamp_0;
            if v17 > 0 then
                v13({
                    status = v7.AccountLockStatusEnum.RateLimited, 
                    timeUntilRetry = v17
                });
                task.spawn(function() --[[ Line: 45 ]]
                    -- upvalues: v9 (ref), v14 (ref), v15 (copy)
                    task.wait(v9());
                    v14(v15);
                end);
                return;
            else
                v13({
                    status = v7.AccountLockStatusEnum.Locked, 
                    timeUntilRetry = nil
                });
                return;
            end;
        end, l_dependencyArray_0(v13));
        local v20 = l_useCallback_0(function(v18) --[[ Line: 54 ]]
            -- upvalues: v7 (ref), v14 (ref), v13 (copy)
            local v19 = v18.retryTime and DateTime.fromIsoDate(v18.retryTime);
            if v18.status == v7.AccountLockStatusEnum.RateLimited and v19 then
                v14(v19);
                return;
            elseif v18.status ~= v7.AccountLockStatusEnum.RateLimited then
                v13({
                    status = v18.status, 
                    timeUntilRetry = nil
                });
                return;
            else
                v13({
                    status = v7.AccountLockStatusEnum.Error, 
                    timeUntilRetry = nil
                });
                return;
            end;
        end, l_dependencyArray_0(v12, v13));
        local v21 = l_useMemo_0(function() --[[ Line: 66 ]]
            -- upvalues: v12 (copy), v20 (copy)
            return {
                state = v12, 
                reducer = v20
            };
        end, l_dependencyArray_0(v12, v20));
        return v1.createElement(v10.Provider, {
            value = v21
        }, v11.children);
    end, 
    useAccountLockContext = function() --[[ Line: 80 ]] --[[ Name: useAccountLockContext ]]
        -- upvalues: l_useContext_0 (copy), v10 (copy)
        local v22 = l_useContext_0(v10);
        return {
            state = v22.state, 
            reducer = v22.reducer
        };
    end
};