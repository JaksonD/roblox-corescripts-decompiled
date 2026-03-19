local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.t);
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(script.Parent.FriendCountLabelDeprecated);
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v6 = v2.PureComponent:extend("SelectedMembersBar");
v6.defaultProps = {
    barBackgroundColor3 = Color3.fromRGB(245, 245, 245), 
    barBackgroundTransparency = 1, 
    maxSize = 0, 
    selectedUsers = {}, 
    LayoutOrder = nil, 
    renderEntry = nil
};
local v7 = v1.interface({
    displayName = v1.string, 
    id = v1.string, 
    thumbnail = v1.string, 
    presenceImage = v1.optional(v1.union(v1.table, v1.string))
});
v6.populateBar = function(v8, v9) --[[ Line: 43 ]] --[[ Name: populateBar ]]
    -- upvalues: v2 (copy), v7 (copy)
    local v10 = {
        layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 16)
        })
    };
    for v11 = 1, v8.props.maxSize do
        local v12 = v8.props.selectedUsers[v11];
        if v12 then
            assert(v7(v12));
            table.insert(v10, (v2.createElement("Frame", {
                Size = UDim2.new(0, 48, 0, 48), 
                BackgroundTransparency = 1, 
                LayoutOrder = v11
            }, {
                avatarContainer = v8.props.renderEntry(v12), 
                removeImageContainer = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    layout = v2.createElement("UIListLayout", {
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        VerticalAlignment = Enum.VerticalAlignment.Top
                    }), 
                    removeImage = v2.createElement("ImageLabel", {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Size = UDim2.new(0, 16, 0, 16), 
                        Image = "rbxasset://textures/ui/LuaChat/icons/ic-remove.png"
                    })
                })
            })));
        else
            table.insert(v10, (v2.createElement("ImageLabel", {
                Size = UDim2.new(0, 48, 0, 48), 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/LuaChatV2/ic-friend-empty-border.png", 
                ImageColor3 = v9.Theme.IconDefault.Color, 
                ImageTransparency = v9.Theme.IconDefault.Transparency, 
                LayoutOrder = v11
            })));
        end;
    end;
    return v10;
end;
v6.render = function(v13) --[[ Line: 104 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy)
    return v3.Style.withStyle(function(v14) --[[ Line: 105 ]]
        -- upvalues: v13 (copy), v2 (ref), v4 (ref), l_FFlagEnableAppChatFocusableFixes_0 (ref)
        local v15 = 12 + 64 * v13.props.maxSize - 16;
        return v2.createElement("Frame", {
            BackgroundColor3 = v13.props.barBackgroundColor3, 
            BackgroundTransparency = v13.props.barBackgroundTransparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 63), 
            LayoutOrder = v13.props.LayoutOrder
        }, {
            layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            barContainer = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                friendCountLabel = v2.createElement(v4, {
                    currentSize = #v13.props.selectedUsers, 
                    maxSize = v13.props.maxSize, 
                    LayoutOrder = 1
                }), 
                userScrollingBar = v2.createElement("ScrollingFrame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, -60, 0, 63), 
                    ScrollBarThickness = 0, 
                    ScrollingDirection = Enum.ScrollingDirection.X, 
                    ElasticBehavior = Enum.ElasticBehavior.WhenScrollable, 
                    CanvasSize = UDim2.new(0, v15, 1, 0), 
                    LayoutOrder = 2, 
                    Selectable = not l_FFlagEnableAppChatFocusableFixes_0 and nil
                }, v13:populateBar(v14))
            })
        });
    end);
end;
return v6;