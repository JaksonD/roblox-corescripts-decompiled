local l_script_FirstAncestor_0 = script:FindFirstAncestor("UiShellEvents");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_getCurrentRouteState_0 = require(l_Parent_0.Navigation).getCurrentRouteState;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_AppUserInputService_0 = require(l_Parent_0.RoactServiceTags).AppUserInputService;
local v8 = require(l_script_FirstAncestor_0.Analytics.uiStatusBarTappedEvent);
return function(v9) --[[ Line: 11 ]] --[[ Name: useLogStatusBarTapped ]]
    -- upvalues: l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_AppUserInputService_0 (copy), l_useNavigation_0 (copy), l_getCurrentRouteState_0 (copy), v2 (copy), v8 (copy)
    local v10 = l_useRoactService_0(l_AppEventIngestService_0);
    local v11 = l_useRoactService_0(l_AppUserInputService_0);
    local v12 = l_useNavigation_0();
    local v13 = l_getCurrentRouteState_0(v12) or {};
    local v14 = v9 or v13.name or "Unknown";
    v2.useEffect(function() --[[ Line: 19 ]]
        -- upvalues: v11 (copy), v8 (ref), v10 (copy), v14 (copy)
        local v15 = v11.StatusBarTapped:Connect(function() --[[ Line: 20 ]]
            -- upvalues: v8 (ref), v10 (ref), v14 (ref)
            v8(v10, "StatusBar", {
                page = v14
            });
        end);
        return function() --[[ Line: 26 ]]
            -- upvalues: v15 (copy)
            v15:Disconnect();
        end;
    end, {
        v10, 
        v11, 
        v14
    });
end;