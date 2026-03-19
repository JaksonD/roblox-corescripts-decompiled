local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Resources.FTUXSlideshowData);
local v4 = require(l_Parent_0.Resources.FTUXConstants);
local _ = require(l_Parent_0.Enums.PlatformEnum);
local v6 = require(l_Parent_0.Components.Slideshow.Header);
local v7 = require(l_Parent_0.Components.Slideshow.Stepper);
local v8 = require(l_Parent_0.Components.Slideshow.Title);
local v9 = require(l_Parent_0.Components.Slideshow.Description);
local v10 = require(l_Parent_0.Components.Slideshow.EndItem);
local v11 = require(l_Parent_0.Events.EventHandler);
return function(v12) --[[ Line: 24 ]] --[[ Name: FTUXSlideshow ]]
    -- upvalues: v1 (copy), v3 (copy), v4 (copy), v11 (copy), v6 (copy), v8 (copy), v9 (copy), v7 (copy), v10 (copy)
    local v13, v14 = v1.useState(1);
    local l_platform_0 = v12.platform;
    local v16 = v3[l_platform_0];
    local l_PanelConstants_0 = v4[l_platform_0].PanelConstants;
    local v18 = v16[v13];
    local l_CONTENT_HEIGHT_RATIO_0 = l_PanelConstants_0.CONTENT_HEIGHT_RATIO;
    local l_FOOTER_HEIGHT_RATIO_0 = l_PanelConstants_0.FOOTER_HEIGHT_RATIO;
    local v21 = l_PanelConstants_0.CONTENT_PADDING / l_PanelConstants_0.SLIDESHOW_FRAME_WIDTH;
    local v22 = 1 - 2 * v21;
    local v23 = v1.useCallback(function() --[[ Line: 37 ]]
        -- upvalues: v14 (copy), v13 (copy)
        v14(v13 + 1);
    end, {
        v13
    });
    v1.useEffect(function() --[[ Line: 41 ]]
        -- upvalues: v11 (ref), l_platform_0 (copy), v13 (copy), v23 (copy)
        v11.StartEvents(l_platform_0, v13, v23);
        return function() --[[ Line: 44 ]]
            -- upvalues: v11 (ref), l_platform_0 (ref), v13 (ref)
            v11.StopEvents(l_platform_0, v13);
        end;
    end, {
        v13
    });
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0)
    }, {
        UICorner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0.05, 0)
        }), 
        SlideshowLayout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0.05, 0), 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Header = v1.createElement(v6, {
            platform = l_platform_0
        }), 
        ContentFrame = v1.createElement("Frame", {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, l_CONTENT_HEIGHT_RATIO_0, 0), 
            Position = UDim2.new(0, 0, 0, 0)
        }, {
            Content = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(v22, 0, 1, 0), 
                Position = UDim2.new(v21, 0, 0, 0)
            }, {
                ContentLayout = v1.createElement("UIListLayout", {
                    Padding = UDim.new(0.05, 0), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Title = v1.createElement(v8, {
                    platform = l_platform_0, 
                    currentIndex = v13
                }), 
                Description = v1.createElement(v9, {
                    platform = l_platform_0, 
                    currentIndex = v13
                }), 
                ImageFrame = v1.createElement("Frame", {
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1.2, 0, 0.4, 0), 
                    Position = UDim2.new(0, 0, 0, 0)
                }, {
                    Image = v1.createElement("ImageLabel", {
                        Image = v18.image, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        LayoutOrder = 3, 
                        ScaleType = Enum.ScaleType.Fit
                    })
                })
            })
        }), 
        FooterFrame = v1.createElement("Frame", {
            LayoutOrder = 3, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, l_FOOTER_HEIGHT_RATIO_0, 0), 
            Position = UDim2.new(0, 0, 0, 0)
        }, {
            Footer = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(v22, 0, 1, 0), 
                Position = UDim2.new(v21, 0, 0, 0)
            }, {
                ContentLayout = v1.createElement("UIListLayout", {
                    Padding = v13 ~= #v16 and UDim.new(0.2, 0) or UDim.new(0, 0), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Stepper = v1.createElement(v7, {
                    layoutOrder = 1, 
                    numberActivated = v13, 
                    numberOfSteps = #v16
                }, {}), 
                EndItem = v1.createElement(v10, {
                    platform = l_platform_0, 
                    currentIndex = v13, 
                    increaseCurrentIndex = v23
                })
            })
        })
    });
end;