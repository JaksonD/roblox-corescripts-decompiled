local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_GuiService_0 = game:GetService("GuiService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v5 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v5.Roact;
local l_RoactRodux_0 = v5.RoactRodux;
local l_t_0 = v5.t;
local l_UIBlox_0 = v5.UIBlox;
local l_Promise_0 = v5.Promise;
local l_FullscreenTitleBar_0 = l_UIBlox_0.App.Bar.FullscreenTitleBar;
local l_Parent_0 = script.Parent.Parent;
local v13 = require(l_Parent_0.InGameMenuPolicy);
local v14 = require(l_Parent_0.Thunks.OpenEducationalPopup);
local v15 = require(l_Parent_0.Actions.StartLeavingGame);
local v16 = require(l_Parent_0.Utility.ExternalEventConnection);
local v17 = require(l_Parent_0.Utility.UserLocalStore);
local v18 = require(l_Parent_0.Flags.GetFIntFullscreenTitleBarTriggerDelayMillis);
local v19 = require(l_Parent_0.Flags.GetFFlagCleanUpFullscreenTitleBarPromiseOnUnmount);
local v20 = require(l_Parent_0.Flags.GetFFlagFullscreenTitleBarInjectGameServices);
local v21 = require(l_Parent_0.Flags.GetFFlagFixFullscreenTitleBarPromiseCancel);
local v22 = l_Roact_0.PureComponent:extend("FullscreenTitleBar");
v22.validateProps = l_t_0.strictInterface({
    titleText = l_t_0.optional(l_t_0.string), 
    displayOrder = l_t_0.integer, 
    isMenuOpen = l_t_0.boolean, 
    isEducationalPopupEnabled = l_t_0.boolean, 
    maxDisplayCount = l_t_0.integer, 
    openEducationalPopup = l_t_0.callback, 
    startLeavingGame = l_t_0.callback, 
    userGameSettings = l_t_0.optional(l_t_0.union(l_t_0.Instance, l_t_0.table)), 
    guiService = l_t_0.optional(l_t_0.union(l_t_0.Instance, l_t_0.table)), 
    appStorageService = l_t_0.optional(l_t_0.union(l_t_0.Instance, l_t_0.table))
});
v22.defaultProps = {
    titleText = "Roblox", 
    userGameSettings = l_UserGameSettings_0, 
    guiService = l_GuiService_0, 
    appStorageService = l_AppStorageService_0
};
v22.init = function(v23) --[[ Line: 57 ]] --[[ Name: init ]]
    -- upvalues: v20 (copy), l_UserGameSettings_0 (copy), l_GuiService_0 (copy), l_AppStorageService_0 (copy), v18 (copy), l_Promise_0 (copy), v17 (copy), v21 (copy)
    v23.userGameSettings = v20() and v23.props.userGameSettings or l_UserGameSettings_0;
    v23.guiService = v20() and v23.props.guiService or l_GuiService_0;
    v23.appStorageService = v20() and v23.props.appStorageService or l_AppStorageService_0;
    v23:setState({
        isTriggered = false, 
        fullscreenEnabled = v23.userGameSettings:InFullScreen()
    });
    v23.onFullscreenChanged = function(v24) --[[ Line: 69 ]]
        -- upvalues: v23 (copy)
        v23:setState({
            fullscreenEnabled = v24, 
            isTriggered = false
        });
    end;
    v23.triggerTitleBar = function() --[[ Line: 76 ]]
        -- upvalues: v18 (ref), v23 (copy), l_Promise_0 (ref)
        local v25 = v18() / 1000;
        if v25 > 0 then
            v23.triggerTitleBarPromise = l_Promise_0.delay(v25):andThenCall(function() --[[ Line: 79 ]]
                -- upvalues: v23 (ref)
                v23.triggerTitleBarPromise = nil;
                if not v23.state.isTriggered then
                    v23:setState({
                        isTriggered = true
                    });
                end;
            end);
            return;
        else
            if not v23.state.isTriggered then
                v23:setState({
                    isTriggered = true
                });
            end;
            return;
        end;
    end;
    v23.cancelTriggerTitleBar = function() --[[ Line: 96 ]]
        -- upvalues: v23 (copy)
        if v23.triggerTitleBarPromise then
            v23.triggerTitleBarPromise:cancel();
            v23.triggerTitleBarPromise = nil;
        end;
    end;
    v23.hideTitleBar = function() --[[ Line: 103 ]]
        -- upvalues: v23 (copy)
        if v23.state.isTriggered then
            v23:setState({
                isTriggered = false
            });
        end;
    end;
    v23.exitFullscreen = function() --[[ Line: 111 ]]
        -- upvalues: v23 (copy)
        v23.hideTitleBar();
        v23.guiService:ToggleFullscreen();
    end;
    v23.closeRoblox = function() --[[ Line: 116 ]]
        -- upvalues: v23 (copy), v17 (ref)
        v23.hideTitleBar();
        if v23.props.isEducationalPopupEnabled then
            local v26 = v17.new();
            v23.props.openEducationalPopup(v23.guiService, v26, v23.props.maxDisplayCount);
            return;
        else
            v23.props.startLeavingGame();
            return;
        end;
    end;
    v23.onDisappear = function() --[[ Line: 127 ]]
        -- upvalues: v23 (copy), v21 (ref), l_Promise_0 (ref)
        if v23.hideTitleBarPromise then
            if v21() then
                v23.hideTitleBarPromise:cancel();
            else
                v23.hideTitleBarPromise.cancel();
            end;
            v23.hideTitleBarPromise = nil;
        end;
        v23.hideTitleBarPromise = l_Promise_0.delay(0.5):andThenCall(function() --[[ Line: 137 ]]
            -- upvalues: v23 (ref)
            v23.hideTitleBarPromise = nil;
            v23.hideTitleBar();
        end);
    end;
    v23.mouseReenter = function() --[[ Line: 143 ]]
        -- upvalues: v23 (copy)
        if v23.state.isTriggered and v23.hideTitleBarPromise then
            v23.hideTitleBarPromise:cancel();
            v23.hideTitleBarPromise = nil;
        end;
    end;
end;
v22.render = function(v27) --[[ Line: 151 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v16 (copy), l_CoreGui_0 (copy), l_FullscreenTitleBar_0 (copy)
    return l_Roact_0.createFragment({
        FullscreenChangedEvent = l_Roact_0.createElement(v16, {
            event = v27.userGameSettings.FullscreenChanged, 
            callback = v27.onFullscreenChanged
        }), 
        FullscreenTitleBar = l_Roact_0.createElement(l_Roact_0.Portal, {
            target = l_CoreGui_0
        }, {
            InGameFullscreenTitleBarScreen = l_Roact_0.createElement("ScreenGui", {
                Enabled = v27.state.fullscreenEnabled, 
                IgnoreGuiInset = true, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                DisplayOrder = v27.props.displayOrder
            }, {
                TriggerArea = l_Roact_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 1), 
                    [l_Roact_0.Event.MouseEnter] = v27.triggerTitleBar, 
                    [l_Roact_0.Event.MouseLeave] = v27.cancelTriggerTitleBar
                }), 
                Bar = l_Roact_0.createElement(l_FullscreenTitleBar_0, {
                    title = v27.props.titleText, 
                    isTriggered = v27.state.isTriggered, 
                    onDisappear = v27.onDisappear, 
                    onHover = v27.mouseReenter, 
                    exitFullscreen = v27.exitFullscreen, 
                    closeRoblox = v27.closeRoblox
                })
            })
        })
    });
end;
v22.didUpdate = function(v28, v29) --[[ Line: 186 ]] --[[ Name: didUpdate ]]
    if not v29.isMenuOpen and v28.props.isMenuOpen then
        v28.hideTitleBar();
    end;
end;
v22.willUnmount = function(v30) --[[ Line: 192 ]] --[[ Name: willUnmount ]]
    -- upvalues: v19 (copy)
    if v19() then
        if v30.hideTitleBarPromise then
            v30.hideTitleBarPromise:cancel();
        end;
        if v30.triggerTitleBarPromise then
            v30.triggerTitleBarPromise:cancel();
        end;
    end;
end;
v22 = v13.connect(function(v31, _) --[[ Line: 204 ]]
    return {
        isEducationalPopupEnabled = v31.enableEducationalPopup(), 
        maxDisplayCount = v31.educationalPopupMaxDisplayCount()
    };
end)(v22);
return l_RoactRodux_0.UNSTABLE_connect2(function(v33, _) --[[ Line: 211 ]]
    return {
        isMenuOpen = v33.isMenuOpen
    };
end, function(v35) --[[ Line: 215 ]]
    -- upvalues: v14 (copy), v15 (copy)
    return {
        openEducationalPopup = function(v36, v37, v38) --[[ Line: 217 ]] --[[ Name: openEducationalPopup ]]
            -- upvalues: v35 (copy), v14 (ref)
            return v35(v14(v36, v37, v38));
        end, 
        startLeavingGame = function() --[[ Line: 220 ]] --[[ Name: startLeavingGame ]]
            -- upvalues: v35 (copy), v15 (ref)
            v35(v15());
        end
    };
end)(v22);