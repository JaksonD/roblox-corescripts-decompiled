local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Foundation);
local v3 = require(l_Parent_1.React);
local l_Icon_0 = v2.Icon;
local l_View_0 = v2.View;
local l_useCallback_0 = v3.useCallback;
local v7 = require(l_Parent_0.Hooks.useScreenSize);
local l_useState_0 = v3.useState;
local l_useTokens_0 = v2.Hooks.useTokens;
local v10 = require(l_Parent_0.Components.CaptureItem);
local _ = require(l_Parent_0.Types);
local v12 = Vector2.new(700, 500);
return function(v13) --[[ Line: 31 ]]
    -- upvalues: l_useTokens_0 (copy), v7 (copy), l_useState_0 (copy), l_useCallback_0 (copy), v12 (copy), v3 (copy), l_View_0 (copy), v2 (copy), l_Icon_0 (copy), v10 (copy)
    local v14 = l_useTokens_0();
    local v15 = v7();
    local v16, v17 = l_useState_0(v15);
    local v19 = l_useCallback_0(function(v18) --[[ Line: 37 ]]
        -- upvalues: v17 (copy), v13 (copy)
        v17(v18.AbsoluteSize);
        v13.onAbsoluteSizeChangedCallback(v18);
    end, {
        v13.onAbsoluteSizeChangedCallback
    });
    local l_Y_0 = v15.Y;
    local l_X_0 = v15.X;
    local v22 = v13.enableLargeScreenMode and v16.X > v12.X and v16.Y > v12.Y;
    local v23 = l_Y_0 < l_X_0;
    local v24 = v13.children == nil and 1 or 0.6;
    return v3.createElement(l_View_0, {
        onAbsoluteSizeChanged = v19, 
        stateLayer = {
            affordance = v2.Enums.StateLayerAffordance.None
        }, 
        tag = "size-full-full bg-over-media-0"
    }, {
        ComposerScreenContainer = v3.createElement(l_View_0, {
            Size = if v22 then UDim2.fromOffset(math.min(v16.X, v12.X), (math.min(v16.Y, v12.Y))) else UDim2.fromScale(1, 1), 
            stateLayer = {
                affordance = v2.Enums.StateLayerAffordance.None
            }, 
            tag = {
                ["anchor-center-center bg-surface-200 position-center-center"] = true, 
                ["radius-large"] = v22
            }
        }, {
            ComposerContainer = v3.createElement(l_View_0, {
                tag = {
                    ["anchor-center-center bg-action-subtle position-center-center size-full-full"] = true, 
                    ["padding-right-large"] = v22
                }
            }, {
                BackButtonContainer = v3.createElement(l_View_0, {
                    tag = "auto-xy bg-action-subtle", 
                    ZIndex = 2
                }, {
                    Padding = v3.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, v14.Padding.Large), 
                        PaddingLeft = UDim.new(0, v14.Padding.XXLarge), 
                        PaddingRight = UDim.new(0, v14.Padding.Large), 
                        PaddingTop = UDim.new(0, v14.Padding.XXLarge)
                    }), 
                    BackButton = v3.createElement(l_View_0, {
                        onActivated = v13.onCloseCallback, 
                        tag = {
                            ["auto-xy bg-over-media-300 padding-medium radius-circle"] = true
                        }
                    }, {
                        BackIcon = v3.createElement(l_Icon_0, {
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            IconSize = v2.Enums.IconSize.Small, 
                            name = v22 and "icons/navigation/close" or "icons/actions/cycleLeft", 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            style = v14.Color.ActionEmphasis.Foreground, 
                            ZIndex = 2
                        })
                    })
                }), 
                CaptureContainer = v3.createElement(l_View_0, {
                    Size = if v23 then UDim2.new(v24, if v22 then v14.Padding.Large else 0, 1, 0) else UDim2.fromScale(1, v24), 
                    tag = {
                        ["bg-surface-100 clip"] = true, 
                        ["padding-right-large"] = v22 and v13.children ~= nil, 
                        ["radius-large"] = v22
                    }, 
                    ZIndex = 1
                }, {
                    CapturePreviewFrame = v3.createElement(l_View_0, {
                        LayoutOrder = 2, 
                        tag = "anchor-center-center bg-action-subtle position-center-center size-full-full"
                    }, {
                        CapturePreview = v3.createElement(v10, {
                            capture = v13.capture, 
                            isVideoPlaying = true, 
                            onActivated = function() --[[ Line: 120 ]] --[[ Name: onActivated ]]

                            end, 
                            scaleType = Enum.ScaleType.Fit
                        })
                    })
                }), 
                ComposerBody = v13.children
            })
        })
    });
end;