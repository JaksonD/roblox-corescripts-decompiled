local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSearch").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Dash);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
return function(v4) --[[ Line: 22 ]] --[[ Name: FlexLayout ]]
    -- upvalues: l_useDesignTokens_0 (copy), v1 (copy), v2 (copy)
    local v5 = l_useDesignTokens_0();
    local v6 = if v4.flexSlot and v4.rigidSlot then v4.margin or v5.Global.Space_200 else 0;
    local v7 = v4.flexDirection or Enum.FillDirection.Horizontal;
    local v8 = v4.reverse or false;
    local v9, v10 = v1.useBinding(Vector2.new(0, 0));
    local v12 = v1.useCallback(function(v11) --[[ Line: 30 ]]
        -- upvalues: v7 (copy), v6 (copy)
        if v7 == Enum.FillDirection.Horizontal then
            return UDim2.new(1, -(v11.X + v6), 1, 0);
        else
            return UDim2.new(1, 0, 1, -(v11.Y + v6));
        end;
    end, {
        v7, 
        v6
    });
    local v13 = table.clone(v4);
    v13.flexDirection = nil;
    v13.reverse = nil;
    v13.rigidSlot = nil;
    v13.flexSlot = nil;
    v13.margin = nil;
    v13.padding = nil;
    return v1.createElement("Frame", v2.join({
        Size = if v7 == Enum.FillDirection.Horizontal then UDim2.fromScale(1, 0) else UDim2.fromScale(0, 1), 
        AutomaticSize = if v7 == Enum.FillDirection.Horizontal then Enum.AutomaticSize.Y else Enum.AutomaticSize.X, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, v13), {
        UILayout = v1.createElement("UIListLayout", {
            FillDirection = v7, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v6)
        }), 
        Padding = if v4.padding then v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v4.padding.top or 0), 
            PaddingRight = UDim.new(0, v4.padding.right or 0), 
            PaddingBottom = UDim.new(0, v4.padding.bottom or 0), 
            PaddingLeft = UDim.new(0, v4.padding.left or 0)
        }) else nil, 
        Flex = if v4.flexSlot then v1.createElement("Frame", {
            LayoutOrder = v8 and 1 or 0, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = v9:map(v12)
        }, v4.flexSlot) else nil, 
        Rigid = if v4.rigidSlot then v1.createElement("Frame", {
            LayoutOrder = v8 and 0 or 1, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = if v7 == Enum.FillDirection.Horizontal then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            [v1.Change.AbsoluteSize] = function(v14) --[[ Line: 89 ]]
                -- upvalues: v10 (copy)
                v10(v14.AbsoluteSize);
            end
        }, v4.rigidSlot) else nil
    });
end;