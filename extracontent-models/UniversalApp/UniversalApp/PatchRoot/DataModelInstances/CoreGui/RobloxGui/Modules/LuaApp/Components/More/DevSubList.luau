local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_Modules_0.LuaApp.FitChildren);
local v5 = require(l_Modules_0.LuaApp.Enum.DevSubPlanStatus);
local v6 = require(l_Modules_0.LuaApp.withLocalization);
local l_withStyle_0 = v3.Style.withStyle;
local v8 = Vector2.new(375, 104);
local v9 = {
    LEFT = 20
};
local v10 = require(l_Modules_0.LuaApp.Components.More.DevSubListItem);
local v11 = require(l_Modules_0.LuaApp.Components.More.DevSubListHeader);
local v12 = v2.PureComponent:extend("DevSubList");
local function _(v13) --[[ Line: 30 ]] --[[ Name: willDevSubExpire ]]
    -- upvalues: v5 (copy)
    return not v13.isAutoRenewing or v13.planStatus ~= v5.Open;
end;
v12.render = function(v15) --[[ Line: 34 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), l_withStyle_0 (copy), v2 (copy), v8 (copy), v9 (copy), v5 (copy), v11 (copy), v10 (copy), v4 (copy)
    return v6({
        inactiveSubs = "Feature.DevSubs.Label.InactiveSubscriptions", 
        activeSubs = "Feature.DevSubs.Label.ActiveSubscriptions"
    })(function(v16) --[[ Line: 38 ]]
        -- upvalues: l_withStyle_0 (ref), v15 (copy), v2 (ref), v8 (ref), v9 (ref), v5 (ref), v11 (ref), v10 (ref), v4 (ref)
        return l_withStyle_0(function(v17) --[[ Line: 39 ]]
            -- upvalues: v15 (ref), v2 (ref), v8 (ref), v9 (ref), v5 (ref), v11 (ref), v16 (copy), v10 (ref), v4 (ref)
            local l_props_0 = v15.props;
            local l_devSubs_0 = l_props_0.devSubs;
            local l_game_0 = l_props_0.game;
            local l_onDevSubActivated_0 = l_props_0.onDevSubActivated;
            local v22 = {
                Layout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, 0)
                }), 
                Title = v2.createElement("Frame", {
                    LayoutOrder = 0, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 70)
                }, {
                    SizeConstraint = v2.createElement("UISizeConstraint", {
                        MaxSize = v8
                    }), 
                    Padding = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v9.LEFT)
                    }), 
                    Layout = v2.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, 10)
                    }), 
                    Icon = v2.createElement("ImageLabel", {
                        Size = UDim2.new(0, 44, 0, 44), 
                        LayoutOrder = 1, 
                        BackgroundTransparency = l_game_0.icon ~= nil and 1 or 0, 
                        Image = l_game_0.icon
                    }), 
                    Text = v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, -54, 0, 40), 
                        LayoutOrder = 2, 
                        Font = v17.Font.Title.Font, 
                        TextSize = v17.Font.BaseSize * v17.Font.Title.RelativeSize, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor3 = v17.Theme.TextDefault.Color, 
                        TextTransparency = v17.Theme.TextDefault.Transparency, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        Text = l_game_0.name
                    })
                })
            };
            local v23 = {};
            local v24 = {};
            for _, v26 in pairs(l_devSubs_0) do
                if v26.status == "Active" then
                    table.insert(v23, v26);
                else
                    table.insert(v24, v26);
                end;
            end;
            table.sort(v23, function(v27, v28) --[[ Line: 112 ]]
                -- upvalues: v5 (ref)
                local v29 = not v27.isAutoRenewing or v27.planStatus ~= v5.Open;
                local v30 = not v28.isAutoRenewing or v28.planStatus ~= v5.Open;
                if v29 and v30 then
                    return string.upper(v27.name) < string.upper(v28.name);
                else
                    return v29;
                end;
            end);
            local v31 = false;
            if #v23 > 0 then
                v31 = #v24 > 0;
            end;
            local v32 = 1;
            table.insert(v22, v31 and v2.createElement(v11, {
                layoutOrder = v32, 
                maxSize = v8, 
                text = v16.activeSubs
            }));
            v32 = v32 + 1;
            local function v35(v33, v34) --[[ Line: 138 ]] --[[ Name: addDevSub ]]
                -- upvalues: v22 (copy), v2 (ref), v10 (ref), v8 (ref), v32 (ref), v31 (copy), l_onDevSubActivated_0 (copy)
                table.insert(v22, v2.createElement(v10, {
                    devSub = v34, 
                    maxSize = v8, 
                    layoutOrder = v32, 
                    hasFullDivider = v31 and v33 == 1, 
                    onActivated = function(...) --[[ Line: 148 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_onDevSubActivated_0 (ref), v34 (copy)
                        l_onDevSubActivated_0(v34, ...);
                    end
                }));
                v32 = v32 + 1;
            end;
            for v36, v37 in pairs(v23) do
                v35(v36, v37);
            end;
            table.insert(v22, v31 and v2.createElement(v11, {
                layoutOrder = v32, 
                maxSize = v8, 
                text = v16.inactiveSubs
            }));
            v32 = v32 + 1;
            for v38, v39 in pairs(v24) do
                v35(v38, v39);
            end;
            return v2.createElement(v4.FitFrame, {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                fitFields = {
                    Size = v4.FitAxis.Height
                }
            }, v22);
        end);
    end);
end;
return v12;