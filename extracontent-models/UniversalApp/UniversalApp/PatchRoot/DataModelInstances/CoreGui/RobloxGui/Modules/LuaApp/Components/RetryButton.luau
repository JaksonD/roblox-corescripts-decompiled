local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v4 = require(l_Modules_0.Common.Roact);
local v5 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v6 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v7 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v8 = require(l_Modules_0.LuaApp.Components.ShimmerAnimation);
local v9 = {
    Image = "LuaApp/buttons/buttonFill", 
    SliceCenter = Rect.new(8, 8, 9, 9)
};
local v10 = {
    Image = "LuaApp/buttons/buttonStroke", 
    SliceCenter = Rect.new(8, 8, 9, 9)
};
local v11 = v4.PureComponent:extend("RetryButton");
v11.init = function(v12) --[[ Line: 42 ]] --[[ Name: init ]]
    v12.state = {
        isRetrying = false, 
        isInCooldown = false
    };
    v12._isMounted = false;
    v12.cooldownTimer = 0;
    v12.safeSetState = function(v13) --[[ Line: 51 ]]
        -- upvalues: v12 (copy)
        if v12._isMounted then
            v12:setState(v13);
        end;
    end;
    v12.onActivated = function() --[[ Line: 57 ]]
        -- upvalues: v12 (copy)
        local l_onRetry_0 = v12.props.onRetry;
        local l_isRetrying_0 = v12.state.isRetrying;
        local l_isInCooldown_0 = v12.state.isInCooldown;
        if not (l_isRetrying_0 or l_isInCooldown_0) and l_onRetry_0 then
            v12.cooldownTimer = 0;
            v12.safeSetState({
                isRetrying = true, 
                isInCooldown = true
            });
            l_onRetry_0():andThen(function() --[[ Line: 70 ]]
                -- upvalues: v12 (ref)
                v12.safeSetState({
                    isRetrying = false
                });
            end, function() --[[ Line: 74 ]]
                -- upvalues: v12 (ref)
                v12.safeSetState({
                    isRetrying = false
                });
            end);
        end;
    end;
    v12.renderSteppedCallback = function(v17) --[[ Line: 82 ]]
        -- upvalues: v12 (copy)
        if v12.state.isInCooldown then
            v12.cooldownTimer = v12.cooldownTimer + v17;
            if v12.cooldownTimer >= 1.5 then
                v12.safeSetState({
                    isInCooldown = false
                });
            end;
        end;
    end;
end;
v11.didMount = function(v18) --[[ Line: 96 ]] --[[ Name: didMount ]]
    v18._isMounted = true;
end;
v11.willUnmount = function(v19) --[[ Line: 100 ]] --[[ Name: willUnmount ]]
    v19._isMounted = false;
end;
v11.isDisabled = function(v20) --[[ Line: 104 ]] --[[ Name: isDisabled ]]
    local l_isRetrying_1 = v20.state.isRetrying;
    local l_isInCooldown_1 = v20.state.isInCooldown;
    return l_isRetrying_1 or l_isInCooldown_1;
end;
local function _(v23, v24) --[[ Line: 111 ]] --[[ Name: getCombinedTransparency ]]
    return 1 - (1 - v23) * (1 - v24);
end;
v11.render = function(v26) --[[ Line: 115 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v4 (copy), v6 (copy), v9 (copy), v7 (copy), v10 (copy), v8 (copy), v5 (copy), l_RunService_0 (copy)
    local l_Position_0 = v26.props.Position;
    local l_AnchorPoint_0 = v26.props.AnchorPoint;
    local l_LayoutOrder_0 = v26.props.LayoutOrder;
    local v30 = v26:isDisabled();
    return l_withStyle_0(function(v31) --[[ Line: 122 ]]
        -- upvalues: v4 (ref), v6 (ref), l_Position_0 (copy), l_AnchorPoint_0 (copy), l_LayoutOrder_0 (copy), v9 (ref), v30 (copy), v26 (copy), v7 (ref), v10 (ref), v8 (ref), v5 (ref), l_RunService_0 (ref)
        local l_createElement_0 = v4.createElement;
        local l_v6_0 = v6;
        local v34 = {
            Size = UDim2.new(0, 44, 0, 44), 
            Position = l_Position_0, 
            AnchorPoint = l_AnchorPoint_0, 
            LayoutOrder = l_LayoutOrder_0, 
            BackgroundTransparency = 1, 
            Image = v9.Image, 
            ImageColor3 = v31.Theme.UIEmphasis.Color
        };
        local l_Transparency_0 = v31.Theme.UIEmphasis.Transparency;
        local v36 = v30 and 0.5 or 0;
        v34.ImageTransparency = 1 - (1 - l_Transparency_0) * (1 - v36);
        v34.ScaleType = Enum.ScaleType.Slice;
        v34.SliceCenter = v9.SliceCenter;
        v34[v4.Event.Activated] = v26.onActivated;
        local v37 = {};
        l_Transparency_0 = v4.createElement;
        v36 = v7;
        local v38 = {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Image = v10.Image, 
            ImageColor3 = v31.Theme.SecondaryDefault.Color
        };
        local l_Transparency_1 = v31.Theme.SecondaryDefault.Transparency;
        local v40 = v30 and 0.5 or 0;
        v38.ImageTransparency = 1 - (1 - l_Transparency_1) * (1 - v40);
        v38.BorderSizePixel = 0;
        v38.ScaleType = Enum.ScaleType.Slice;
        v38.SliceCenter = v10.SliceCenter;
        v37.Border = l_Transparency_0(v36, v38);
        l_Transparency_0 = v4.createElement;
        v36 = v7;
        v38 = {
            Size = UDim2.new(0, 36, 0, 36), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundTransparency = 1, 
            Image = "LuaApp/icons/common_refresh", 
            ImageColor3 = v31.Theme.IconEmphasis.Color
        };
        l_Transparency_1 = v31.Theme.IconEmphasis.Transparency;
        v40 = v30 and 0.5 or 0;
        v38.ImageTransparency = 1 - (1 - l_Transparency_1) * (1 - v40);
        v37.Spinner = l_Transparency_0(v36, v38);
        v37.Shimmer = v30 and v4.createElement(v8, {
            Size = UDim2.new(1, -2, 1, -2), 
            Position = UDim2.new(0, 1, 0, 1)
        });
        v37.renderStepped = v4.createElement(v5, {
            event = l_RunService_0.renderStepped, 
            callback = v26.renderSteppedCallback
        });
        return l_createElement_0(l_v6_0, v34, v37);
    end);
end;
return v11;