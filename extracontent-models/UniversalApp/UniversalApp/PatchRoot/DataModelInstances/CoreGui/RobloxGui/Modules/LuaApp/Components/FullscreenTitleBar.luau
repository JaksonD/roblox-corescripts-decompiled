local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.Promise);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Packages.Cryo);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_useIsInFullScreen_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).useIsInFullScreen;
local v10 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v11 = require(l_Modules_0.LuaApp.Components.ScreenGuiWithBlurControl);
local l_FullscreenTitleBar_0 = require(l_CorePackages_0.Packages.UIBlox).App.Bar.FullscreenTitleBar;
local v13 = require(l_Modules_0.LuaApp.Flags.GetFIntFullscreenTitleBarTriggerDelayMillis);
local v14 = require(l_Modules_0.LuaApp.Flags.GetFFlagFixFullscreenTitleBarPromiseCancel);
local v15 = v3.PureComponent:extend("FullscreenTitleBar");
v15.validateProps = v5.strictInterface({
    titleText = v5.optional(v5.string), 
    displayOrder = v5.integer, 
    isInFullScreen = v5.boolean, 
    guiService = v5.optional(v5.union(v5.Instance, v5.table))
});
v15.defaultProps = {
    titleText = "Roblox", 
    displayOrder = 1
};
v15.init = function(v16) --[[ Line: 45 ]] --[[ Name: init ]]
    -- upvalues: v13 (copy), v4 (copy), v14 (copy), v10 (copy)
    v16:setState({
        isTriggered = false
    });
    v16.triggerTitleBar = function() --[[ Line: 50 ]]
        -- upvalues: v13 (ref), v16 (copy), v4 (ref)
        local v17 = v13() / 1000;
        if v17 > 0 then
            v16.triggerTitleBarPromise = v4.delay(v17):andThenCall(function() --[[ Line: 53 ]]
                -- upvalues: v16 (ref)
                v16.triggerTitleBarPromise = nil;
                if not v16.state.isTriggered then
                    v16:setState({
                        isTriggered = true
                    });
                end;
            end);
            return;
        else
            if not v16.state.isTriggered then
                v16:setState({
                    isTriggered = true
                });
            end;
            return;
        end;
    end;
    v16.cancelTriggerTitleBar = function() --[[ Line: 70 ]]
        -- upvalues: v16 (copy)
        if v16.triggerTitleBarPromise then
            v16.triggerTitleBarPromise:cancel();
            v16.triggerTitleBarPromise = nil;
        end;
    end;
    v16.onDisappear = function() --[[ Line: 77 ]]
        -- upvalues: v16 (copy), v14 (ref), v4 (ref)
        if v16.hideTitleBarPromise then
            if v14() then
                v16.hideTitleBarPromise:cancel();
            else
                v16.hideTitleBarPromise.cancel();
            end;
            v16.hideTitleBarPromise = nil;
        end;
        v16.hideTitleBarPromise = v4.delay(0.5):andThenCall(function() --[[ Line: 87 ]]
            -- upvalues: v16 (ref)
            v16.hideTitleBarPromise = nil;
            if v16.state.isTriggered then
                v16:setState({
                    isTriggered = false
                });
            end;
        end);
    end;
    v16.exitFullscreen = function() --[[ Line: 97 ]]
        -- upvalues: v16 (copy)
        if v16.state.isTriggered then
            v16:setState({
                isTriggered = false
            });
        end;
        v16.props.guiService:ToggleFullscreen();
    end;
    v16.closeRoblox = function() --[[ Line: 106 ]]
        -- upvalues: v16 (copy), v10 (ref)
        v16.props.guiService:BroadcastNotification("", v10.NATIVE_EXIT);
    end;
    v16.mouseReenter = function() --[[ Line: 110 ]]
        -- upvalues: v16 (copy)
        if v16.state.isTriggered and v16.hideTitleBarPromise then
            v16.hideTitleBarPromise:cancel();
            v16.hideTitleBarPromise = nil;
        end;
    end;
end;
v15.render = function(v18) --[[ Line: 118 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_CoreGui_0 (copy), v11 (copy), l_FullscreenTitleBar_0 (copy)
    if not v18.props.isInFullScreen then
        return nil;
    else
        return v3.createElement(v3.Portal, {
            target = l_CoreGui_0
        }, {
            FullscreenTitleBarScreen = v3.createElement(v11, {
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                DisplayOrder = v18.props.displayOrder
            }, {
                TriggerArea = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 1), 
                    [v3.Event.MouseEnter] = v18.triggerTitleBar, 
                    [v3.Event.MouseLeave] = v18.cancelTriggerTitleBar
                }), 
                Bar = v3.createElement(l_FullscreenTitleBar_0, {
                    title = v18.props.titleText, 
                    isTriggered = v18.state.isTriggered, 
                    onDisappear = v18.onDisappear, 
                    onHover = v18.mouseReenter, 
                    exitFullscreen = v18.exitFullscreen, 
                    closeRoblox = v18.closeRoblox
                })
            })
        });
    end;
end;
v15.willUnmount = function(v19) --[[ Line: 149 ]] --[[ Name: willUnmount ]]
    if v19.hideTitleBarPromise then
        v19.hideTitleBarPromise:cancel();
    end;
    if v19.triggerTitleBarPromise then
        v19.triggerTitleBarPromise:cancel();
    end;
end;
return function(v20) --[[ Line: 159 ]] --[[ Name: FullscreenTitleBarWrapper ]]
    -- upvalues: l_useRoactService_0 (copy), l_AppGuiService_0 (copy), l_useIsInFullScreen_0 (copy), v6 (copy), v3 (copy), v15 (copy)
    local v21 = l_useRoactService_0(l_AppGuiService_0);
    local v22 = l_useIsInFullScreen_0();
    local v23 = v6.Dictionary.join(v20, {
        guiService = v21, 
        isInFullScreen = v22
    });
    return v3.createElement(v15, v23);
end;