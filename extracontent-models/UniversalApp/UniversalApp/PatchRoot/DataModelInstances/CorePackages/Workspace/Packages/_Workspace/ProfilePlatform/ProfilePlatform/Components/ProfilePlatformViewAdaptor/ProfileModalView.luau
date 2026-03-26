local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(l_Parent_0.React);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v3 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceWrapper_0 = v3.FocusNavigableSurfaceWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v3.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigationEventNameEnum_0 = v3.FocusNavigationEventNameEnum;
local v7 = require(l_Parent_0.InputHandlers);
local l_View_0 = require(l_Parent_0.Foundation).View;
return function(v9) --[[ Line: 27 ]]
    -- upvalues: l_useStyle_0 (copy), v1 (copy), v7 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), l_View_0 (copy)
    local v10 = l_useStyle_0();
    local v11 = {
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.fromScale(1, 0), 
        Size = UDim2.new(0, v9.viewWidth, 1, 0), 
        BackgroundTransparency = v10.Theme.BackgroundDefault.Transparency, 
        BackgroundColor3 = v10.Theme.BackgroundDefault.Color, 
        BorderSizePixel = 0
    };
    local v13 = v1.useCallback(function(v12) --[[ Line: 42 ]]
        -- upvalues: v1 (ref)
        return v1.createElement("TextButton", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0, 0), 
            Text = "", 
            Selectable = false
        }, {
            v12
        });
    end);
    local v15 = v1.useMemo(function() --[[ Line: 52 ]]
        -- upvalues: v7 (ref), v9 (copy)
        return v7.onRelease(function(v14) --[[ Line: 53 ]]
            -- upvalues: v9 (ref)
            v14:cancel();
            v9.navigateBack();
        end);
    end, {
        v9.navigateBack
    });
    return v1.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = v10.Theme.Overlay.Transparency, 
        BackgroundColor3 = v10.Theme.Overlay.Color, 
        Active = true, 
        AutoButtonColor = false, 
        [v1.Event.Activated] = v9.navigateBack
    }, {
        ProfileWindow = v1.createElement(l_FocusNavigableSurfaceWrapper_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
            isIsolated = true, 
            frameProps = v11, 
            customEventHandlers = {
                [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                    handler = v15
                }
            }
        }, {
            v13({
                ProfileTopBarContainer = v1.createElement(l_View_0, {
                    tag = "position-top-left", 
                    Size = UDim2.new(1, 0, 0, 56), 
                    ZIndex = 100
                }, {
                    ProfileTopBar = v9.renderTopBar()
                }), 
                PeekViewContainer = v1.createElement("ScrollingFrame", {
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 1, 1, 0), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    ScrollBarThickness = 0, 
                    CanvasSize = UDim2.new(1, 0, 0, 0), 
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    Selectable = false
                }, {
                    Content = v9.renderContent()
                })
            })
        })
    });
end;