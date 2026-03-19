local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_Modules_0.LuaApp.Actions.Economy.SetShowBuyRobuxButtonBadge);
local v7 = require(l_Modules_0.LuaApp.Actions.Economy.SetBuyRobuxButtonClicked);
local v8 = require(l_Modules_0.LuaApp.Actions.Economy.SetHasFetchedRobuxBadge);
local v9 = require(l_Modules_0.LuaApp.Thunks.Economy.ApiFetchRobuxBadge);
local v10 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local function _(v12) --[[ Line: 23 ]] --[[ Name: setLocalVirtualItemRobuxBadgeAcknowledgeTime ]]
    -- upvalues: l_AppStorageService_0 (copy)
    l_AppStorageService_0:SetItem("VirtualItemRobuxBadgeAcknowledgeTime", (tostring(v12)));
    l_AppStorageService_0:Flush();
end;
local function _() --[[ Line: 28 ]] --[[ Name: getLocalVirtualItemRobuxBadgeAcknowledgeTime ]]
    -- upvalues: l_AppStorageService_0 (copy)
    return l_AppStorageService_0:GetItem("VirtualItemRobuxBadgeAcknowledgeTime") or -1;
end;
return function() --[[ Line: 32 ]] --[[ Name: useRobuxBadge ]]
    -- upvalues: l_useRoactService_0 (copy), v10 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), v3 (copy), v9 (copy), l_AppStorageService_0 (copy), v6 (copy), v8 (copy), v7 (copy)
    local v15 = l_useRoactService_0(v10);
    local v16 = l_useDispatch_0();
    local v18 = l_useSelector_0(function(v17) --[[ Line: 35 ]]
        return v17.RobuxVirtualItem.buyRobuxButtonClicked;
    end);
    local v20 = l_useSelector_0(function(v19) --[[ Line: 38 ]]
        return v19.RobuxVirtualItem.hasFetchedRobuxBadge;
    end);
    local v21, v22 = v3.useState({
        isVirtualItemAvailable = false, 
        activeVirtualItemStartTimeSecondsUtc = -1
    });
    v3.useEffect(function() --[[ Line: 47 ]]
        -- upvalues: v20 (copy), v16 (copy), v9 (ref), v15 (copy), l_AppStorageService_0 (ref), v6 (ref), v8 (ref), v22 (copy)
        if v20 then
            return;
        else
            v16(v9(v15)):andThen(function(v23) --[[ Line: 53 ]]
                -- upvalues: l_AppStorageService_0 (ref), v16 (ref), v6 (ref), v8 (ref), v22 (ref)
                if v23.is_virtual_item_available == nil or v23.active_virtual_item_start_time_seconds_utc == nil then
                    return;
                else
                    local v24 = tonumber(l_AppStorageService_0:GetItem("VirtualItemRobuxBadgeAcknowledgeTime") or -1);
                    if v23.is_virtual_item_available and v24 < v23.active_virtual_item_start_time_seconds_utc then
                        v16(v6(true));
                    end;
                    v16(v8());
                    v22({
                        isVirtualItemAvailable = v23.is_virtual_item_available, 
                        activeVirtualItemStartTimeSecondsUtc = v23.active_virtual_item_start_time_seconds_utc
                    });
                    return;
                end;
            end):catch(function() --[[ Line: 75 ]]

            end);
            return;
        end;
    end, {
        v16, 
        v15, 
        v20
    });
    v3.useEffect(function() --[[ Line: 80 ]]
        -- upvalues: v18 (copy), v16 (copy), v7 (ref), v21 (copy), l_AppStorageService_0 (ref), v6 (ref)
        if v18 then
            v16(v7(false));
            if not v21 then
                return;
            elseif not v21.isVirtualItemAvailable or not v21.activeVirtualItemStartTimeSecondsUtc then
                return;
            else
                if tonumber(l_AppStorageService_0:GetItem("VirtualItemRobuxBadgeAcknowledgeTime") or -1) < v21.activeVirtualItemStartTimeSecondsUtc then
                    local v25 = os.time(os.date("!*t"));
                    l_AppStorageService_0:SetItem("VirtualItemRobuxBadgeAcknowledgeTime", (tostring(v25)));
                    l_AppStorageService_0:Flush();
                end;
                v16(v6(false));
            end;
        end;
    end, {
        v18, 
        v21
    });
    return nil;
end;