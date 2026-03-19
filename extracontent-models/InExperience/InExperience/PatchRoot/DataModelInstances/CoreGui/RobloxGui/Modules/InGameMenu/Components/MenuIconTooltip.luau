local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Signals);
local v3 = require(l_CorePackages_0.Workspace.Packages.Display);
local v4 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v4.Roact;
local l_RoactRodux_0 = v4.RoactRodux;
local l_t_0 = v4.t;
local l_UIBlox_0 = v4.UIBlox;
local l_Parent_0 = script.Parent.Parent;
local v10 = require(l_Parent_0.Localization.withLocalization);
local v11 = require(l_Parent_0.Actions.SetMenuIconTooltipOpen);
local v12 = require(l_Parent_0.Parent.TopBar.Constants);
local l_Tooltip_0 = l_UIBlox_0.App.Dialog.Tooltip;
local v14 = l_Roact_0.PureComponent:extend("MenuIconTooltip");
v14.validateProps = l_t_0.strictInterface({
    isTooltipOpen = l_t_0.boolean, 
    onDismiss = l_t_0.callback
});
v14.init = function(v15) --[[ Line: 28 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v3 (copy)
    v15.disposeUiScaleEffect = v2.createEffect(function(v16) --[[ Line: 29 ]]
        -- upvalues: v3 (ref), v15 (copy)
        local v17 = v3.GetDisplayStore(v16);
        v15:setState({
            UiScale = v17.getUIScale(v16)
        });
    end);
end;
v14.render = function(v18) --[[ Line: 37 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), v12 (copy), l_Roact_0 (copy), l_CoreGui_0 (copy), l_Tooltip_0 (copy)
    return v10({
        bodyText = "CoreScripts.InGameMenu.EducationalPopup.MenuIconTooltip"
    })(function(v19) --[[ Line: 40 ]]
        -- upvalues: v12 (ref), v18 (copy), l_Roact_0 (ref), l_CoreGui_0 (ref), l_Tooltip_0 (ref)
        local v20 = v12.TopBarHeight * v18.state.UiScale;
        local v21 = v12.ScreenSideOffset * v18.state.UiScale;
        local v22 = Vector2.new(v21, v20 - 32);
        return v18.props.isTooltipOpen and l_Roact_0.createElement(l_Roact_0.Portal, {
            target = l_CoreGui_0
        }, {
            TooltipScreenGui = l_Roact_0.createElement("ScreenGui", {
                IgnoreGuiInset = true, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            }, {
                Tooltip = l_Roact_0.createElement(l_Tooltip_0, {
                    triggerPosition = v22, 
                    triggerSize = Vector2.new(32, 32), 
                    bodyText = v19.bodyText, 
                    onDismiss = v18.props.onDismiss, 
                    forceClickTriggerPoint = true
                })
            })
        });
    end);
end;
v14.willUnmount = function(v23) --[[ Line: 65 ]] --[[ Name: willUnmount ]]
    if v23.disposeUiScaleEffect then
        v23.disposeUiScaleEffect();
    end;
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v24, _) --[[ Line: 72 ]]
    return {
        isTooltipOpen = v24.nativeClosePrompt.menuIconTooltipOpen
    };
end, function(v26) --[[ Line: 76 ]]
    -- upvalues: v11 (copy)
    return {
        onDismiss = function() --[[ Line: 78 ]] --[[ Name: onDismiss ]]
            -- upvalues: v26 (copy), v11 (ref)
            v26(v11(false));
        end
    };
end)(v14);