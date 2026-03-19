local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.CapturesCommon);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local l_Checkbox_0 = v2.Checkbox;
local l_View_0 = v2.View;
local l_getCropSize_0 = v1.Utils.getCropSize;
return function(v7) --[[ Line: 20 ]]
    -- upvalues: v3 (copy), l_View_0 (copy), v2 (copy), l_Checkbox_0 (copy), l_getCropSize_0 (copy)
    local v8, v9 = v3.useState(Vector2.new(0, 0));
    local v10 = v3.useRef(nil);
    local v11, v12 = v3.useState(Vector2.new(0, 0));
    local v13 = v3.useCallback(function() --[[ Line: 25 ]]
        -- upvalues: v7 (copy)
        v7.updateSelected(not v7.isSelected);
    end, {
        v7.isSelected, 
        v7.updateSelected
    });
    local v15 = v3.useCallback(function(v14) --[[ Line: 29 ]]
        -- upvalues: v9 (copy)
        v9(v14.AbsoluteSize);
    end, {});
    local v17 = v3.useCallback(function(v16) --[[ Line: 33 ]]
        -- upvalues: v10 (copy), v12 (copy)
        v10.current = v16;
        v12(v16.Resolution);
    end, {});
    v3.useEffect(function() --[[ Line: 38 ]]
        -- upvalues: v10 (copy)
        return function() --[[ Line: 39 ]]
            -- upvalues: v10 (ref)
            if v10.current then
                v10.current.Video = "";
            end;
        end;
    end, {});
    local v18 = false;
    if typeof(v7.content) == "Content" then
        v18 = false;
        if v7.content.Object ~= nil then
            v18 = v7.content.Object:IsA("VideoCapture");
        end;
    end;
    return v3.createElement(l_View_0, {
        tag = "clip size-full", 
        onAbsoluteSizeChanged = v15
    }, {
        CheckboxOverlay = if v7.showCheckbox then v3.createElement(l_View_0, {
            tag = "size-full padding-small", 
            onActivated = v13, 
            stateLayer = {
                affordance = v2.Enums.StateLayerAffordance.None
            }, 
            ZIndex = 2
        }, {
            Checkbox = v3.createElement(l_Checkbox_0, {
                AnchorPoint = Vector2.new(1, 0), 
                isChecked = v7.isSelected, 
                label = "", 
                onActivated = v13, 
                Position = UDim2.fromScale(1, 0)
            })
        }) else nil, 
        Image = if not v18 then v3.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            ImageContent = v7.content, 
            Position = UDim2.fromScale(0.5, 0.5), 
            ScaleType = Enum.ScaleType.Crop, 
            Size = UDim2.fromScale(1, 1)
        }) else nil, 
        Video = if v18 then v3.createElement("VideoFrame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Looped = true, 
            Playing = true, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = l_getCropSize_0(v8, v11), 
            VideoContent = v7.content, 
            Volume = 0, 
            [v3.Event.Loaded] = v17
        }) else nil
    });
end;