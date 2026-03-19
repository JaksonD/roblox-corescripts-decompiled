local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Enums.MediaType);
local _ = require(l_script_FirstAncestor_0.Enums.ThumbnailType);
local _ = require(l_script_FirstAncestor_0.Enums.ThumbnailSize);
local v6 = require(l_script_FirstAncestor_0.Enums.MediaShape);
local v7 = require(l_script_FirstAncestor_0.Components.Gradient);
local v8 = require(l_script_FirstAncestor_0.Utility.getRbxThumb);
local v9 = require(l_script_FirstAncestor_0.Components.Tile.useTile);
local v10 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v11 = require(l_script_FirstAncestor_0.Components.Image);
local v12 = require(l_script_FirstAncestor_0.Components.View);
local v13 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v15 = {
    [v6.Circle] = 1, 
    [v6.Square] = 1, 
    [v6.Landscape] = 1.7777777777777777, 
    [v6.Portrait] = 0.5625
};
local v16 = {
    shape = v6.Square, 
    LayoutOrder = 1
};
return function(v17) --[[ Line: 56 ]] --[[ Name: TileMedia ]]
    -- upvalues: v10 (copy), v16 (copy), v9 (copy), v13 (copy), v2 (copy), v8 (copy), v6 (copy), v11 (copy), v12 (copy), v15 (copy), v7 (copy)
    local v18 = v10(v17, v16);
    local v19 = v9();
    local v20 = v13();
    local v21 = if v18.background then v18.background.style else nil;
    local v22 = if v18.background then v18.background.image else nil;
    local v23 = v2.useMemo(function() --[[ Line: 65 ]]
        -- upvalues: v18 (copy), v8 (ref)
        if v18.id == nil or v18.type == nil then
            return nil;
        else
            return v8(v18.type, v18.id);
        end;
    end, {
        v18.type, 
        v18.id
    });
    local v24 = if v18.shape == v6.Circle then UDim.new(0, v20.Radius.Circle) else UDim.new(0, v20.Radius.Medium);
    local v25 = v19.isContained and v24;
    return v2.createElement(if v22 then v11 else v12, {
        Image = v22, 
        imageStyle = if v22 then v21 else nil, 
        backgroundStyle = if v22 then nil else v21, 
        Size = if v19.fillDirection == Enum.FillDirection.Vertical then UDim2.fromScale(1, 0) else UDim2.fromScale(0, 1), 
        ZIndex = 0, 
        LayoutOrder = v18.LayoutOrder, 
        aspectRatio = {
            AspectRatio = v15[v18.shape], 
            AspectType = Enum.AspectType.ScaleWithParentSize, 
            DominantAxis = if v19.fillDirection == Enum.FillDirection.Vertical then Enum.DominantAxis.Width else Enum.DominantAxis.Height
        }, 
        cornerRadius = v24, 
        onStateChanged = v18.onStateChanged, 
        testId = ("%*--media"):format(v19.testId)
    }, {
        TransparencyGradient = if v25 then v2.createElement(v7, {
            fillDirection = v19.fillDirection, 
            top = true
        }) else nil, 
        MiddleCorners = if v25 then v2.createElement(v11, {
            Image = v22, 
            imageStyle = if v22 then v21 else nil, 
            backgroundStyle = if v22 then nil else v21, 
            ZIndex = 0, 
            tag = "size-full"
        }, {
            TransparencyGradient = v2.createElement(v7, {
                fillDirection = v19.fillDirection, 
                top = false
            })
        }) else nil, 
        Image = v2.createElement(v11, {
            Image = v23, 
            cornerRadius = v24, 
            imageStyle = v18.style, 
            tag = {
                ["size-full"] = true, 
                ["padding-medium"] = v18.children ~= nil
            }, 
            testId = ("%*--media-image"):format(v19.testId)
        }, v18.children)
    });
end;