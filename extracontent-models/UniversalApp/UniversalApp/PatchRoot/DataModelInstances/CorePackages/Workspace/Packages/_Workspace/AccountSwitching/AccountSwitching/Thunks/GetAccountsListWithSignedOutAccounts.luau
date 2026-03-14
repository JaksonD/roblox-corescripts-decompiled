local l_Parent_0 = script:FindFirstAncestor("AccountSwitching").Parent;
local v1 = require(l_Parent_0.AuthCommon);
local l_AppStorageUtilities_0 = v1.Utils.AppStorageUtilities;
local l_getSignedOutAccounts_0 = v1.Utils.getSignedOutAccounts;
local v4 = require(script.Parent.GetAccountsList);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.AuthAnalytics);
local l_EventStreamConstants_0 = v6.EventStreamConstants;
local l_authAccountPickerAccountsFetched_0 = v6.Events.authAccountPickerAccountsFetched;
local l_GetFFlagEnableAccountCarouselEvents_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAccountCarouselEvents;
local v10 = game:DefineFastInt("MaxTotalAccountListSize", 10);
local function v15(v11) --[[ Line: 25 ]] --[[ Name: ensureAccountsNotSignedOut ]]
    -- upvalues: l_AppStorageUtilities_0 (copy)
    local v12 = l_AppStorageUtilities_0.getPreviousAccountsList();
    if v11 and #v11 > 0 then
        for _, v14 in ipairs(v11) do
            if v12 and v12[v14.user_id] and v12[v14.user_id].signOutTimestamp then
                v12[v14.user_id].signOutTimestamp = nil;
            end;
        end;
    end;
    l_AppStorageUtilities_0.setPreviousAccountsList(v12);
end;
local function v24(v16, v17) --[[ Line: 41 ]]
    -- upvalues: l_AppStorageUtilities_0 (copy), v5 (copy), l_authAccountPickerAccountsFetched_0 (copy), l_EventStreamConstants_0 (copy)
    local v18 = l_AppStorageUtilities_0.getPreviousAccountsList();
    local v19 = v5.Dictionary.keys(v18);
    if #v17 == 0 and #v19 == 0 then
        return;
    else
        local v21 = v5.List.map(v16, function(v20) --[[ Line: 52 ]]
            return v20 and v20.user_id;
        end);
        local v23 = v5.List.map(v17, function(v22) --[[ Line: 55 ]]
            return v22 and v22.user_id;
        end);
        l_authAccountPickerAccountsFetched_0(l_EventStreamConstants_0.Context.AccountPickerAccountsFetched, v21, v23, v19);
        return;
    end;
end;
return function(v25, v26) --[[ Line: 66 ]]
    -- upvalues: v4 (copy), v15 (copy), v5 (copy), l_getSignedOutAccounts_0 (copy), v10 (copy), l_GetFFlagEnableAccountCarouselEvents_0 (copy), v24 (copy)
    return v4(v25, v26.isAuthenticated):andThen(function(v27) --[[ Line: 74 ]]
        -- upvalues: v15 (ref), v5 (ref), l_getSignedOutAccounts_0 (ref), v10 (ref), v26 (copy), l_GetFFlagEnableAccountCarouselEvents_0 (ref), v24 (ref)
        local v28 = v27.logged_in_users_metadata or {};
        v15(v28);
        v28 = v5.List.map(v28, function(v29) --[[ Line: 77 ]]
            return {
                user_id = v29.user_id, 
                username = v29.username, 
                display_name = v29.display_name or v29.username, 
                has_valid_session = true
            };
        end);
        local v30 = 0;
        if v28 then
            v30 = #v28;
        end;
        local v31 = l_getSignedOutAccounts_0((math.max(v10 - v30, 0)));
        if v26.filterUnauthenticatedSessionsForAccountPicker then
            v31 = v5.List.filter(v31, function(v32) --[[ Line: 92 ]]
                return v32 and v32.showInAccountPicker;
            end);
        end;
        v31 = v5.List.map(v31, function(v33) --[[ Line: 96 ]]
            return {
                user_id = v33.userId, 
                username = v33.username, 
                display_name = v33.displayName, 
                has_valid_session = false
            };
        end);
        local v34 = v5.List.join(v28, v31);
        if l_GetFFlagEnableAccountCarouselEvents_0() then
            pcall(function() --[[ Line: 107 ]]
                -- upvalues: v24 (ref), v28 (ref), v34 (copy)
                v24(v28, v34);
            end);
        end;
        return v34;
    end):catch(function(v35) --[[ Line: 113 ]]
        warn(v35);
        return {};
    end);
end;