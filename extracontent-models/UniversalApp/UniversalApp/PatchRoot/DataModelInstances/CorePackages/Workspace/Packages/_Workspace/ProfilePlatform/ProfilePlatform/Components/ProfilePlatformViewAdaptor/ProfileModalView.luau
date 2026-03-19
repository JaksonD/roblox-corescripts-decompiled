local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v4 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceWrapper_0 = v4.FocusNavigableSurfaceWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v4.FocusNavigableSurfaceIdentifierEnum;
local v7 = require(l_script_FirstAncestor_0.Flags.FFlagPPVBackgroundEnabled);
local l_FocusNavigationEventNameEnum_0 = v4.FocusNavigationEventNameEnum;
local v9 = require(l_Parent_0.InputHandlers);
local l_View_0 = require(l_Parent_0.Foundation).View;
return function(v11) --[[ Line: 29 ]]
    -- upvalues: l_useStyle_0 (copy), v7 (copy), v2 (copy), v9 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), l_View_0 (copy)
    local v12 = l_useStyle_0();
    local v13 = {
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.fromScale(1, 0), 
        Size = UDim2.new(0, v11.viewWidth, 1, 0), 
        BackgroundTransparency = v12.Theme.BackgroundDefault.Transparency, 
        BackgroundColor3 = v12.Theme.BackgroundDefault.Color, 
        BorderSizePixel = 0
    };
    local v14 = v7 and 0 or v11.topBarHeight;
    local v15 = v7 and 0 or -v11.topBarHeight;
    local v17 = v2.useCallback(function(v16) --[[ Line: 45 ]]
        -- upvalues: v2 (ref)
        return v2.createElement("TextButton", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0, 0), 
            Text = "", 
            Selectable = false
        }, {
            v16
        });
    end);
    local v19 = v2.useMemo(function() --[[ Line: 55 ]]
        -- upvalues: v9 (ref), v11 (copy)
        return v9.onRelease(function(v18) --[[ Line: 56 ]]
            -- upvalues: v11 (ref)
            v18:cancel();
            v11.navigateBack();
        end);
    end, {
        v11.navigateBack
    });
    return v2.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = v12.Theme.Overlay.Transparency, 
        BackgroundColor3 = v12.Theme.Overlay.Color, 
        Active = true, 
        AutoButtonColor = false, 
        [v2.Event.Activated] = v11.navigateBack
    }, {
        ProfileWindow = v2.createElement(l_FocusNavigableSurfaceWrapper_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
            isIsolated = true, 
            frameProps = v13, 
            customEventHandlers = {
                [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                    handler = v19
                }
            }
        }, {
            v17({
                ProfileTopBar = if not v7 then v11.renderTopBar() else nil, 
                ProfileTopBarContainer = if v7 then v2.createElement(l_View_0, {
                    tag = "position-top-left", 
                    Size = UDim2.new(1, 0, 0, 56), 
                    ZIndex = 100
                }, {
                    ProfileTopBar = v11.renderTopBar()
                }) else nil, 
                PeekViewContainer = v2.createElement("ScrollingFrame", {
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 1, 1, v15), 
                    Position = UDim2.new(0, 0, 0, v14), 
                    ScrollBarThickness = 0, 
                    CanvasSize = UDim2.new(1, 0, 0, 0), 
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    Selectable = false
                }, {
                    Content = v11.renderContent()
                })
            })
        })
    });
end;