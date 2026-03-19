local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_CorePackages_0.Packages.React);
local l_useEventConnection_0 = require(l_CorePackages_0.Packages.ReactUtils).useEventConnection;
local v7 = require(l_CorePackages_0.Packages.Foundation);
local v8 = require(l_script_FirstAncestor_0.Service);
local v9 = require(l_script_FirstAncestor_0.ChromeShared.Service.ViewportUtil);
local _ = require(l_script_FirstAncestor_0.ChromeShared.Service.WindowSizeSignal);
local v11 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
local l_AvatarSwitcherContainer_0 = require(l_CorePackages_0.Workspace.Packages.AvatarSwitcher).Components.AvatarSwitcherContainer;
local function _(v13) --[[ Line: 27 ]] --[[ Name: shouldUseVerticalLayout ]]
    return v13.X.Offset / v13.Y.Offset < 1.2;
end;
return function(v15) --[[ Line: 37 ]] --[[ Name: AvatarSwitcherChromeWrapper ]]
    -- upvalues: v5 (copy), l_RobloxGui_0 (copy), l_GuiService_0 (copy), l_useEventConnection_0 (copy), v9 (copy), v7 (copy), l_AvatarSwitcherContainer_0 (copy), v8 (copy), v11 (copy)
    local l_windowSize_0 = v15.windowSize;
    local l_useState_0 = v5.useState;
    local v18 = l_windowSize_0:get();
    local v19;
    l_useState_0, v19 = l_useState_0(v18.X.Offset / v18.Y.Offset < 1.2);
    local v20;
    v18, v20 = v5.useState(false);
    local v21 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
    local v25 = v5.useCallback(function(v22) --[[ Line: 45 ]]
        -- upvalues: l_GuiService_0 (ref), v15 (copy), l_windowSize_0 (copy), v20 (copy)
        local l_Y_0 = l_GuiService_0.TopbarInset.Max.Y;
        local v24 = true;
        if v22.X >= v15.maxWindowWidth then
            v24 = v22.Y - l_Y_0 < v15.maxWindowHeight;
        end;
        if v24 then
            l_windowSize_0:requestSize(v22.X, v22.Y - l_Y_0);
        else
            l_windowSize_0:requestSize(math.min(v15.maxWindowWidth, v22.X), (math.min(v15.maxWindowHeight, v22.Y - l_Y_0)));
        end;
        v20(v24);
    end, {
        l_windowSize_0, 
        v15.maxWindowWidth, 
        v15.maxWindowHeight, 
        v18
    });
    l_useEventConnection_0(l_GuiService_0:GetPropertyChangedSignal("TopbarInset"), function() --[[ Line: 60 ]]
        -- upvalues: v25 (copy), v9 (ref)
        v25(v9.screenSize:get());
    end);
    v5.useEffect(function() --[[ Line: 64 ]]
        -- upvalues: v9 (ref), v25 (copy), l_windowSize_0 (copy), v19 (copy)
        local v26 = v9.screenSize:connect(v25);
        local v28 = l_windowSize_0:connect(function(v27) --[[ Line: 66 ]]
            -- upvalues: v19 (ref)
            v19(v27.X.Offset / v27.Y.Offset < 1.2);
        end);
        v25(v9.screenSize:get());
        return function() --[[ Line: 70 ]]
            -- upvalues: v26 (copy), v28 (copy)
            v26:disconnect();
            v28:disconnect();
        end;
    end, {
        v25
    });
    return v5.createElement(v7.View, {
        tag = ("size-full %*"):format(v18 and "padding-x-large padding-top-medium padding-bottom-xlarge" or "")
    }, {
        AvatarSwitcherContainer = v5.createElement(l_AvatarSwitcherContainer_0, {
            getRespawnBehaviour = v21.GetRespawnBehaviour, 
            respawnBehaviorChangedEvent = v21.RespawnBehaviourChangedEvent, 
            toggleWindow = function() --[[ Line: 82 ]] --[[ Name: toggleWindow ]]
                -- upvalues: v8 (ref), v11 (ref)
                v8:toggleWindow(v11.AVATAR_SWITCHER_ID);
            end, 
            verticalLayout = l_useState_0
        })
    });
end;