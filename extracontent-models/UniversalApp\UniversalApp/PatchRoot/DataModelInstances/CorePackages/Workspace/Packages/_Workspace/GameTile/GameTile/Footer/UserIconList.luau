local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local l_ImageSetLabel_0 = require(l_Parent_0.UIBlox).Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_Parent_0.RobloxAppAssets).GetImageData;
local v5 = require(l_script_FirstAncestor_0.Footer.FriendIcon);
local l_SourceSans_0 = Enum.Font.SourceSans;
local v7 = Color3.fromRGB(117, 117, 117);
local function v12(v8) --[[ Line: 22 ]] --[[ Name: NumberedIcon ]]
    -- upvalues: v2 (copy), l_ImageSetLabel_0 (copy), l_GetImageData_0 (copy), l_SourceSans_0 (copy), v7 (copy)
    local l_size_0 = v8.size;
    local l_layoutOrder_0 = v8.layoutOrder;
    local l_count_0 = v8.count;
    return v2.createElement(l_ImageSetLabel_0, {
        Size = UDim2.new(0, l_size_0, 0, l_size_0), 
        LayoutOrder = l_layoutOrder_0, 
        Image = l_GetImageData_0("LuaApp/graphic/gr-counter-slot-32x32") or "LuaApp/graphic/gr-counter-slot-32x32", 
        BackgroundTransparency = 1
    }, {
        Count = v2.createElement("TextLabel", {
            Size = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Font = l_SourceSans_0, 
            TextSize = 15, 
            Text = "+" .. l_count_0, 
            TextColor3 = v7, 
            BackgroundTransparency = 1
        })
    });
end;
local v13 = v2.PureComponent:extend("UserIconList");
v13.defaultProps = {
    users = {}
};
v13.render = function(v14) --[[ Line: 52 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v5 (copy), v12 (copy)
    local l_width_0 = v14.props.width;
    local l_height_0 = v14.props.height;
    local l_layoutOrder_1 = v14.props.layoutOrder;
    local l_users_0 = v14.props.users;
    local v19 = #l_users_0;
    local v20 = 0;
    local l_maskColor_0 = v14.props.maskColor;
    if v19 <= 0 then
        return nil;
    else
        local function _(v22, v23) --[[ Line: 65 ]] --[[ Name: GetMaxNumberOfIconsInWidth ]]
            return (math.floor((v23 + 3) / (v22 + 3)));
        end;
        local v25 = nil;
        v25 = l_height_0 >= 32 and math.floor((l_width_0 + 3) / 35) >= 3 and 32 or l_height_0 >= 24 and 24 or l_height_0;
        local v26 = {};
        local v27 = math.floor((l_width_0 + 3) / (v25 + 3));
        if v27 > 0 then
            if v27 < v19 then
                v20 = v19 - (v27 - 1);
            end;
            v26.ListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 3)
            });
            local v28 = v20 > 0 and v27 - 1 or math.min(v27, v19);
            for v29 = 1, v28 do
                local v30 = l_users_0[v29];
                v26["UserIcon" .. v29] = v2.createElement(v5, {
                    user = v30, 
                    itemSize = v25, 
                    layoutOrder = v29, 
                    maskColor = l_maskColor_0
                });
            end;
            local v31 = false;
            if v20 > 0 then
                v31 = v2.createElement(v12, {
                    size = v25, 
                    layoutOrder = v27, 
                    count = v20
                });
            end;
            v26.NumberedIcon = v31;
        end;
        return v2.createElement("Frame", {
            Size = UDim2.new(0, l_width_0, 0, l_height_0), 
            LayoutOrder = l_layoutOrder_1, 
            BackgroundTransparency = 1
        }, v26);
    end;
end;
return v13;