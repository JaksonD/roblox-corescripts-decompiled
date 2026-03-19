local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.Foundation);
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local l_useScreenSize_0 = require(l_script_FirstAncestor_0.Parent.RobloxAppHooks).useScreenSize;
local v5 = require(l_script_FirstAncestor_0.Components.EventDetailsBody);
local v6 = require(l_script_FirstAncestor_0.Components.EventActionBar);
local _ = require(l_script_FirstAncestor_0.Parent.VirtualEventsState);
local v8 = require(l_script_FirstAncestor_0.constants);
local l_useTokens_0 = v2.Hooks.useTokens;
return function(v10) --[[ Line: 31 ]] --[[ Name: EventDetailsContainer ]]
    -- upvalues: l_useTokens_0 (copy), l_useScreenSize_0 (copy), v1 (copy), v5 (copy), v8 (copy), v6 (copy)
    local v11 = l_useTokens_0();
    local v12 = l_useScreenSize_0();
    local l_experienceDetails_0 = v10.virtualEvent.experienceDetails;
    local v14, v15 = v1.useState(false);
    local v16, v17 = v1.useState(0.99);
    local v18 = v1.useRef(0);
    local v19 = v1.useCallback(function() --[[ Line: 40 ]]
        -- upvalues: v18 (copy), v10 (copy), v17 (copy)
        if not v18.current or not v10.bottomHeight then
            return;
        else
            if v10.bottomHeight > 0 and v10.bottomHeight < v18.current then
                v17(1 - v10.bottomHeight / v18.current);
            end;
            return;
        end;
    end, {
        v10.bottomHeight
    });
    local v21 = v1.useCallback(function(v20) --[[ Line: 49 ]]
        -- upvalues: v18 (copy), v19 (copy)
        if v18.current and v18.current ~= v20.AbsoluteSize.Y then
            v18.current = v20.AbsoluteSize.Y;
            v19();
        end;
    end, {
        v19
    });
    v1.useEffect(function() --[[ Line: 56 ]]
        -- upvalues: v19 (copy)
        v19();
    end, {
        v10.bottomHeight, 
        v19
    });
    return v1.createElement("TextButton", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Text = "", 
        AutoButtonColor = false, 
        [v1.Event.TouchTap] = function() --[[ Line: 66 ]]
            -- upvalues: v15 (copy)
            v15(false);
        end, 
        [v1.Event.Activated] = function() --[[ Line: 69 ]]
            -- upvalues: v15 (copy)
            v15(false);
        end
    }, {
        Scrim = v1.createElement("Frame", {
            ZIndex = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = if v14 then v11.Color.Extended.Black.Black_50.Transparency else 1, 
            BackgroundColor3 = v11.Color.Extended.Black.Black_50.Color3, 
            BorderSizePixel = 0
        }), 
        EventsWithGradientContainer = v1.createElement("Frame", {
            ZIndex = 2, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, 0), 
            BackgroundTransparency = v11.Color.Extended.White.White_100.Transparency, 
            BackgroundColor3 = v11.Color.Extended.White.White_100.Color3, 
            BorderSizePixel = 0, 
            [v1.Change.AbsoluteSize] = v21
        }, {
            Gradient = v1.createElement("UIGradient", {
                Rotation = 90, 
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, v11.Color.Surface.Surface_100.Color3), 
                    ColorSequenceKeypoint.new(1, v11.Color.Surface.Surface_100.Color3)
                }), 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(v16, 0), 
                    NumberSequenceKeypoint.new(1, 0)
                })
            }), 
            ContentContainer = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                [v1.Change.AbsoluteSize] = v21
            }, {
                Padding = v1.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 80), 
                    PaddingLeft = UDim.new(0, 20), 
                    PaddingRight = UDim.new(0, 20), 
                    PaddingBottom = UDim.new(0, 20)
                }), 
                Layout = v1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 16)
                }), 
                EventDetailsBody = v1.createElement(v5, {
                    virtualEvent = v10.virtualEvent, 
                    eventStatus = v10.eventStatus, 
                    containerSize = Vector2.new((v10.isWideMode and v8.CONTAINER_WIDTH or v12.X) - 40, v12.Y), 
                    isExpanded = v14, 
                    setIsExpanded = v15
                }), 
                Divider = v1.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    BackgroundColor3 = v11.Color.Common.Shimmer.Color3, 
                    BackgroundTransparency = v11.Color.Common.Shimmer.Transparency, 
                    BorderSizePixel = 0
                }), 
                EventActionBar = v1.createElement(v6, {
                    universeId = v10.virtualEvent.universeId, 
                    experienceName = if l_experienceDetails_0 then l_experienceDetails_0.name else "", 
                    onExperienceTileActivated = v10.onExperienceTileActivated, 
                    ctaProps = v10.ctaProps
                })
            })
        })
    });
end;