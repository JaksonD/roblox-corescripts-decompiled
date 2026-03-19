local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v3.Style.withStyle;
local v5 = require(l_Modules_0.Common.Roact);
local v6 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local l_ControlState_0 = v3.Core.Control.Enum.ControlState;
local l_Interactable_0 = v3.Core.Control.Interactable;
local v11 = v5.PureComponent:extend("RefreshButton");
v11.init = function(v12) --[[ Line: 29 ]] --[[ Name: init ]]
    -- upvalues: l_ControlState_0 (copy)
    v12.state = {
        isRefreshing = false, 
        isInCooldown = false, 
        controlState = l_ControlState_0.Initialize
    };
    v12.loadSuggestions = v12.props.loadSuggestions;
    v12.finishSuggestions = v12.props.finishSuggestions;
    v12._isMounted = false;
    v12.cooldownTimer = 0;
    v12.safeSetState = function(v13) --[[ Line: 43 ]]
        -- upvalues: v12 (copy)
        if v12._isMounted then
            v12:setState(v13);
        end;
    end;
    v12.onStateChanged = function(_, v15) --[[ Line: 49 ]]
        -- upvalues: l_ControlState_0 (ref), v12 (copy)
        if v15 == l_ControlState_0.Pressed then
            local l_onRefresh_0 = v12.props.onRefresh;
            local l_isRefreshing_0 = v12.state.isRefreshing;
            local l_isInCooldown_0 = v12.state.isInCooldown;
            if not (l_isRefreshing_0 or l_isInCooldown_0) and l_onRefresh_0 then
                v12.loadSuggestions();
                v12.cooldownTimer = 0;
                v12.safeSetState({
                    isRefreshing = true, 
                    isInCooldown = true
                });
                l_onRefresh_0();
                v12.safeSetState({
                    isRefreshing = false
                });
            end;
        end;
        if v15 == l_ControlState_0.Default then
            v12.safeSetState({
                isRefreshing = false
            });
        end;
    end;
    v12.renderSteppedCallback = function(v19) --[[ Line: 78 ]]
        -- upvalues: v12 (copy)
        if v12.state.isInCooldown then
            v12.cooldownTimer = v12.cooldownTimer + v19;
            if v12.cooldownTimer >= 1.5 then
                v12.safeSetState({
                    isInCooldown = false
                });
                v12.finishSuggestions();
            end;
        end;
    end;
end;
v11.didMount = function(v20) --[[ Line: 92 ]] --[[ Name: didMount ]]
    v20._isMounted = true;
end;
v11.willUnmount = function(v21) --[[ Line: 96 ]] --[[ Name: willUnmount ]]
    v21._isMounted = false;
end;
v11.isDisabled = function(v22) --[[ Line: 100 ]] --[[ Name: isDisabled ]]
    local l_isRefreshing_1 = v22.state.isRefreshing;
    local l_isInCooldown_1 = v22.state.isInCooldown;
    return l_isRefreshing_1 or l_isInCooldown_1;
end;
local function _(v25, v26) --[[ Line: 108 ]] --[[ Name: getCombinedTransparency ]]
    return 1 - (1 - v25) * (1 - v26);
end;
v11.render = function(v28) --[[ Line: 112 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v5 (copy), l_Interactable_0 (copy), l_ImageSetLabel_0 (copy), l_GetImageData_0 (copy), v6 (copy), l_RunService_0 (copy)
    local l_Position_0 = v28.props.Position;
    local l_LayoutOrder_0 = v28.props.LayoutOrder;
    local v31 = v28:isDisabled();
    return l_withStyle_0(function(v32) --[[ Line: 118 ]]
        -- upvalues: v5 (ref), l_Interactable_0 (ref), l_Position_0 (copy), l_LayoutOrder_0 (copy), v28 (copy), l_ImageSetLabel_0 (ref), l_GetImageData_0 (ref), v31 (copy), v6 (ref), l_RunService_0 (ref)
        local l_createElement_0 = v5.createElement;
        local l_l_Interactable_0_0 = l_Interactable_0;
        local v35 = {
            Size = UDim2.new(0, 30, 0, 30), 
            Position = l_Position_0, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_LayoutOrder_0, 
            onStateChanged = v28.onStateChanged, 
            [v5.Event.Activated] = function() --[[ Line: 125 ]]

            end
        };
        local v36 = {};
        local l_createElement_1 = v5.createElement;
        local v38 = "Frame";
        local v39 = {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 30, 0, 30)
        };
        local v40 = {
            UIListLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            })
        };
        local l_createElement_2 = v5.createElement;
        local l_l_ImageSetLabel_0_0 = l_ImageSetLabel_0;
        local v43 = {
            Size = UDim2.new(0, 25, 0, 25), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundTransparency = 1, 
            Image = l_GetImageData_0("LuaApp/icons/common_refresh") or "LuaApp/icons/common_refresh", 
            ImageColor3 = v32.Theme.IconEmphasis.Color
        };
        local l_Transparency_0 = v32.Theme.IconEmphasis.Transparency;
        local v45 = v31 and 0.5 or 0;
        v43.ImageTransparency = 1 - (1 - l_Transparency_0) * (1 - v45);
        v40.Spinner = l_createElement_2(l_l_ImageSetLabel_0_0, v43);
        v40.renderStepped = v5.createElement(v6, {
            event = l_RunService_0.renderStepped, 
            callback = v28.renderSteppedCallback
        });
        v36.RefreshFrame = l_createElement_1(v38, v39, v40);
        return l_createElement_0(l_l_Interactable_0_0, v35, v36);
    end);
end;
return v11;