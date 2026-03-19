local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Foundation);
local v4 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_useTokens_0 = v3.Hooks.useTokens;
local v6 = require(script.Parent.Parent.SlotNavigation);
local v7 = require(script.Parent.Parent.SlotSubNavigation);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterButtonLayout);
local l_FFlagAXSlotsScrollAway_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsScrollAway;
local l_FFlagAXSlotsDesktopRedesign_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsDesktopRedesign;
local l_FFlagAXMoveCatalogFilterToL1Navigation_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMoveCatalogFilterToL1Navigation;
return (v2.forwardRef(function(v12, v13) --[[ Line: 30 ]]
    -- upvalues: l_useTokens_0 (copy), v4 (copy), l_FFlagAXSlotsDesktopRedesign_0 (copy), v2 (copy), l_FFlagAXSlotsScrollAway_0 (copy), v8 (copy), l_FFlagAXMoveCatalogFilterToL1Navigation_0 (copy), v6 (copy), v7 (copy), v3 (copy)
    local v14 = l_useTokens_0();
    local v15 = v4.useOrientation();
    local v16 = if l_FFlagAXSlotsDesktopRedesign_0 then nil else v15 == v4.BreakpointConfig.Enum.Portrait;
    v2.useEffect(function() --[[ Line: 38 ]]
        -- upvalues: v12 (copy)
        if v12.absoluteSizeChanged then
            v12.absoluteSizeChanged(Vector2.new(0, v12.navigationFrameHeight - (1 - v12.slotSubNavigationFill) * v12.slotCardTotalHeight));
        end;
    end, {
        v12.absoluteSizeChanged, 
        v12.navigationFrameHeight, 
        v12.slotSubNavigationFill, 
        v12.slotCardTotalHeight
    });
    return v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = v14.Color.Surface.Surface_0.Color3, 
        ref = v13
    }, {
        Corner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, v14.Radius.Medium)
        }), 
        NavigationFrame = v2.createElement("Frame", {
            Size = if l_FFlagAXSlotsScrollAway_0 then UDim2.fromScale(1, 0) else UDim2.new(1, 0, 0, v12.navigationFrameHeight - v12.navigationFrameHeight * (1 - v12.slotSubNavigationFill)), 
            AutomaticSize = if l_FFlagAXSlotsScrollAway_0 then Enum.AutomaticSize.Y else nil, 
            BackgroundTransparency = 1
        }, {
            SlotNavigationFrame = v2.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 1, 
                ZIndex = 3, 
                ref = v13
            }, {
                Padding = if not not l_FFlagAXSlotsDesktopRedesign_0 or v16 then nil else v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v14.Size.Size_200), 
                    PaddingBottom = UDim.new(0, v14.Size.Size_500), 
                    PaddingLeft = UDim.new(0, v14.Size.Size_100)
                }), 
                Layout = if l_FFlagAXSlotsScrollAway_0 then nil else v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                SlotNavigation = if not not l_FFlagAXSlotsDesktopRedesign_0 or v16 then if l_FFlagAXSlotsScrollAway_0 then v2.createElement("Frame", {
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1
                }, {
                    v2.createElement(v8, {
                        height = v12.navHeight, 
                        layoutOrder = 0, 
                        showFilterButton = true, 
                        showFilterRight = not not l_FFlagAXSlotsDesktopRedesign_0 or l_FFlagAXMoveCatalogFilterToL1Navigation_0 and true or nil
                    }, {
                        v2.createElement(v6, v12.slotNavigationProps)
                    })
                }) else v2.createElement(v8, {
                    height = 40, 
                    layoutOrder = 0, 
                    showFilterButton = true, 
                    showFilterRight = l_FFlagAXSlotsDesktopRedesign_0 and true or nil
                }, {
                    v2.createElement(v6, v12.slotNavigationProps)
                }) else v2.createElement(v6, v12.slotNavigationProps), 
                SlotSubNavigation = if not not l_FFlagAXSlotsDesktopRedesign_0 or v16 then if #v12.slotSubNavigationProps.slots > 0 then if l_FFlagAXSlotsScrollAway_0 then v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v12.slotCardTotalHeight * v12.slotSubNavigationFill), 
                    Position = UDim2.new(0, 0, 0, v12.navigationFrameHeight - v12.slotCardTotalHeight), 
                    BackgroundTransparency = 1, 
                    ZIndex = 0, 
                    ClipsDescendants = true
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, v12.slotCardTotalHeight * v12.slotSubNavigationFill)
                    }), 
                    BackgroundFrame = v2.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0, 0, 0, -v12.slotCardTotalHeight)
                    }, {
                        SlotsFrame = v2.createElement("Frame", {
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            Size = UDim2.new(1, 0, 1, 0), 
                            BackgroundTransparency = 0, 
                            BackgroundColor3 = v14.Color.Surface.Surface_100.Color3
                        }, {
                            Slots = v2.createElement(v7, v12.slotSubNavigationProps)
                        })
                    })
                }) else v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, v12.slotSubNavigationFill, v14.Padding.Medium), 
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = v14.Color.Surface.Surface_100.Color3
                }, {
                    v2.createElement(v7, v12.slotSubNavigationProps)
                }) else nil else v2.createElement(v3.View, {
                    tag = "size-full-0 auto-y", 
                    Position = UDim2.new(0, 0, 0, v12.navigationFrameHeight - v12.slotCardTotalHeight)
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, v14.Size.Size_200)
                    }); 
                    v2.createElement(v7, v12.slotSubNavigationProps)
                })
            })
        })
    });
end));