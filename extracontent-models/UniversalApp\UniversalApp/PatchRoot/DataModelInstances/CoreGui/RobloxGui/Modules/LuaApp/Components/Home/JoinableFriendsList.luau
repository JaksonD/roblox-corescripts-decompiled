local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Common.RoactRodux);
local v3 = require(l_Modules_0.Common.memoize);
local v4 = require(l_Modules_0.LuaApp.sortFriendsByPresenceAndRecency);
local v5 = require(l_Modules_0.LuaApp.Constants);
local v6 = require(l_Modules_0.LuaApp.Components.Home.JoinableFriendEntry);
local v7 = v5.PlacesList.ContextualMenu.HorizontalOuterPadding + v5.PlacesList.ContextualMenu.AvatarSize + v5.PlacesList.ContextualMenu.HorizontalInnerPadding;
local v8 = v1.PureComponent:extend("JoinableFriendsList");
local function v11(v9) --[[ Line: 19 ]] --[[ Name: CreateDivider ]]
    -- upvalues: v1 (copy), v7 (copy), v5 (copy)
    local l_layoutOrder_0 = v9.layoutOrder;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = l_layoutOrder_0
    }, {
        BottomDivider = v1.createElement("Frame", {
            Size = UDim2.new(1, -v7, 1, 0), 
            AnchorPoint = Vector2.new(1, 1), 
            Position = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v5.Color.GRAY4, 
            BorderSizePixel = 0
        })
    });
end;
v8.defaultProps = {
    layoutOrder = 0
};
v8.init = function(v12) --[[ Line: 42 ]] --[[ Name: init ]]
    v12.state = {
        friends = v12.props.friends
    };
end;
v8.render = function(v13) --[[ Line: 52 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v6 (copy), v11 (copy), v5 (copy)
    local l_LayoutOrder_0 = v13.props.LayoutOrder;
    local l_maxHeight_0 = v13.props.maxHeight;
    local l_width_0 = v13.props.width;
    local l_universeId_0 = v13.props.universeId;
    local v18 = v13.state.friends or {};
    local v19 = {
        ListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    for v20, v21 in ipairs(v18) do
        local v22 = v20 * 2;
        local v23 = v20 < #v18;
        v19["Entry_" .. v21.id] = v1.createElement(v6, {
            user = v21, 
            layoutOrder = v22, 
            entryHeight = 67, 
            entryWidth = l_width_0, 
            universeId = l_universeId_0
        });
        v19["Divider_" .. v21.id] = v23 and v1.createElement(v11, {
            layoutOrder = v22 + 1
        });
    end;
    local v24 = #v18 * 67 + (#v18 - 1) * 1;
    local v25 = math.min(l_maxHeight_0, v24);
    return v1.createElement("ScrollingFrame", {
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, 0, 0, v25), 
        CanvasSize = UDim2.new(1, 0, 0, v24), 
        BackgroundColor3 = v5.Color.WHITE, 
        BorderSizePixel = 0, 
        ScrollBarThickness = 0
    }, v19);
end;
local v32 = v3(function(v26, v27) --[[ Line: 98 ]]
    -- upvalues: v4 (copy)
    if not v26 or not v27 then
        return {};
    else
        local v28 = {};
        for _, v30 in pairs(v27) do
            local v31 = v26[v30];
            if v31 and v31.isFriend then
                table.insert(v28, v31);
            end;
        end;
        table.sort(v28, v4);
        return v28;
    end;
end);
return (v2.connect(function(v33, v34) --[[ Line: 115 ]]
    -- upvalues: v32 (copy)
    return {
        friends = v32(v33.Users, v33.InGameUsersByGame[v34.universeId])
    };
end)(v8));