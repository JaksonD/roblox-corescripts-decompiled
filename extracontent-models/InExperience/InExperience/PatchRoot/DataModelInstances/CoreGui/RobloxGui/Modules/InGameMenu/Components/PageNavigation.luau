local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Otter_0 = v1.Otter;
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_UIBlox_0 = v1.UIBlox;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_Parent_0 = script.Parent.Parent;
local v11 = require(l_Parent_0.Actions.SetCurrentPage);
local v12 = require(script.Parent.Pages);
local v13 = require(script.Parent.ThemedTextLabel);
local v14 = require(script.Parent.Divider);
local v15 = require(l_Parent_0.Localization.withLocalization);
local v16 = require(l_Parent_0.Utility.divideTransparency);
local v17 = require(l_Parent_0.Utility.SendAnalytics);
local v18 = require(l_Parent_0.Resources.Constants);
local v19 = l_Roact_0.PureComponent:extend("NavigationButton");
v19.init = function(v20, v21) --[[ Line: 45 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy), l_Otter_0 (copy)
    local v22 = v21.selected and 1 or 0;
    local v23, v24 = l_Roact_0.createBinding(v22);
    v20.fillSize = v23:map(function(v25) --[[ Line: 49 ]]
        return UDim2.new(v25, 0, 1, 0);
    end);
    local v26, v27 = l_Roact_0.createBinding(0);
    v20.hoverTransparency = v26;
    v20.setHoverTransparency = v27;
    v20.motor = l_Otter_0.createGroupMotor({
        fillProgress = v22, 
        hoverTransparency = 0
    });
    v20.motor:onStep(function(v28) --[[ Line: 61 ]]
        -- upvalues: v24 (copy), v20 (copy)
        v24(v28.fillProgress);
        v20.setHoverTransparency(v28.hoverTransparency);
    end);
    v20:setState({
        hovering = false, 
        pressing = false
    });
end;
v19.renderWithSelectionCursor = function(v29, v30) --[[ Line: 72 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: v15 (copy), l_withStyle_0 (copy), l_Roact_0 (copy), l_CursorKind_0 (copy), l_ImageSetLabel_0 (copy), v16 (copy), v13 (copy)
    local l_props_0 = v29.props;
    return v15({
        text = l_props_0.text
    })(function(v32) --[[ Line: 77 ]]
        -- upvalues: l_withStyle_0 (ref), v29 (copy), l_props_0 (copy), l_Roact_0 (ref), v30 (copy), l_CursorKind_0 (ref), l_ImageSetLabel_0 (ref), v16 (ref), v13 (ref)
        return l_withStyle_0(function(v33) --[[ Line: 78 ]]
            -- upvalues: v29 (ref), l_props_0 (ref), l_Roact_0 (ref), v30 (ref), l_CursorKind_0 (ref), l_ImageSetLabel_0 (ref), v16 (ref), v13 (ref), v32 (copy)
            local v34 = v29.state.pressing and not l_props_0.selected;
            local v35 = {
                Transparency = 1, 
                Color = Color3.new(1, 1, 1)
            };
            if v29.state.pressing then
                v35 = v33.Theme.BackgroundOnPress;
            elseif v29.state.hovering then
                v35 = v33.Theme.BackgroundOnHover;
            end;
            return l_Roact_0.createElement("TextButton", {
                AutoButtonColor = false, 
                BackgroundTransparency = v35.Transparency, 
                BackgroundColor3 = v35.Color, 
                BorderSizePixel = 0, 
                LayoutOrder = l_props_0.LayoutOrder, 
                Size = UDim2.new(1, 0, 0, 70), 
                Text = "", 
                SelectionImageObject = v30(l_CursorKind_0.Square), 
                [l_Roact_0.Event.Activated] = l_props_0.onActivated, 
                [l_Roact_0.Ref] = l_props_0.LayoutOrder == 1 and l_props_0.mainPageFirstButtonRef or nil, 
                [l_Roact_0.Event.MouseEnter] = function() --[[ Line: 102 ]]
                    -- upvalues: v29 (ref)
                    v29:setState({
                        hovering = true
                    });
                end, 
                [l_Roact_0.Event.MouseLeave] = function() --[[ Line: 107 ]]
                    -- upvalues: v29 (ref)
                    v29:setState({
                        hovering = false, 
                        pressing = false
                    });
                end, 
                [l_Roact_0.Event.InputBegan] = function(_, v37) --[[ Line: 113 ]]
                    -- upvalues: v29 (ref)
                    if v37.UserInputType == Enum.UserInputType.MouseButton1 or v37.UserInputType == Enum.UserInputType.Touch then
                        v29:setState({
                            pressing = true
                        });
                    end;
                end, 
                [l_Roact_0.Event.InputEnded] = function(_, v39) --[[ Line: 123 ]]
                    -- upvalues: v29 (ref)
                    if v39.UserInputType == Enum.UserInputType.MouseButton1 or v39.UserInputType == Enum.UserInputType.Touch then
                        v29:setState({
                            pressing = false
                        });
                    end;
                end
            }, {
                ContentContainer = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    ZIndex = 3, 
                    BackgroundTransparency = 1
                }, {
                    Icon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0, 0.5), 
                        BackgroundTransparency = 1, 
                        Image = l_props_0.image, 
                        ImageColor3 = v33.Theme.IconEmphasis.Color, 
                        ImageTransparency = v16(v33.Theme.IconEmphasis.Transparency, v34 and 2 or 1), 
                        Position = UDim2.new(0, 28, 0.5, 0), 
                        Size = UDim2.new(0, 36, 0, 36), 
                        ZIndex = 3
                    }), 
                    Text = l_Roact_0.createElement(v13, {
                        fontKey = "Header1", 
                        themeKey = "TextEmphasis", 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Position = UDim2.new(0, 80, 0.5, 0), 
                        Size = UDim2.new(1, -104, 1, 0), 
                        Text = v32.text, 
                        TextTransparency = v16(v33.Theme.TextEmphasis.Transparency, v34 and 2 or 1), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        ZIndex = 3
                    })
                }), 
                SelectedFill = l_Roact_0.createElement("Frame", {
                    BorderSizePixel = 0, 
                    Size = v29.fillSize, 
                    BackgroundColor3 = v33.Theme.BackgroundMuted.Color, 
                    ZIndex = 2
                })
            });
        end);
    end);
end;
v19.render = function(v40) --[[ Line: 181 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v41) --[[ Line: 182 ]]
        -- upvalues: v40 (copy)
        return v40:renderWithSelectionCursor(v41);
    end);
end;
v19.didUpdate = function(v42) --[[ Line: 187 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_Otter_0 (copy)
    v42.motor:setGoal({
        fillProgress = l_Otter_0.spring(v42.props.selected and 1 or 0, {
            frequency = 2.5
        }), 
        hoverTransparency = l_Otter_0.spring(v42.state.hovering and 1 or 0, {
            frequency = 5
        })
    });
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v43, _) --[[ Line: 243 ]]
    return {
        currentPage = v43.menuPage
    };
end, function(v45) --[[ Line: 247 ]]
    -- upvalues: v11 (copy), v17 (copy), v18 (copy)
    return {
        setCurrentPage = function(v46) --[[ Line: 249 ]] --[[ Name: setCurrentPage ]]
            -- upvalues: v45 (copy), v11 (ref), v17 (ref), v18 (ref)
            v45(v11(v46));
            v17("open_" .. v46 .. "_tab", v18.AnalyticsMenuActionName, {});
        end
    };
end)(function(v47) --[[ Line: 198 ]] --[[ Name: PageNavigation ]]
    -- upvalues: l_Roact_0 (copy), v12 (copy), v18 (copy), v19 (copy), v14 (copy)
    local v48 = {
        Layout = l_Roact_0.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right
        })
    };
    local v49 = #v12.pagesByIndex;
    local v50 = 1;
    for v51, v52 in ipairs(v12.pagesByIndex) do
        if v52.parentPage == v18.MainPagePageKey then
            v48["Page" .. v52.key] = l_Roact_0.createElement(v19, {
                image = v52.icon, 
                LayoutOrder = v50, 
                selected = v47.currentPage == v52.key, 
                text = v52.title, 
                onActivated = function() --[[ Line: 216 ]] --[[ Name: onActivated ]]
                    -- upvalues: v47 (copy), v52 (copy)
                    v47.setCurrentPage(v52.key);
                end, 
                mainPageFirstButtonRef = v50 == 1 and v47.mainPageFirstButtonRef or nil
            });
            v50 = v50 + 1;
            if v51 < v49 then
                v48["Divider" .. v50] = l_Roact_0.createElement(v14, {
                    LayoutOrder = v50, 
                    Size = UDim2.new(1, -24, 0, 1)
                });
                v50 = v50 + 1;
            end;
        end;
    end;
    return l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = v47.Position, 
        Size = UDim2.new(1, -v18.Zone.ContentOffset, 0, v49 * 70 + (v49 - 1))
    }, v48);
end);