local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Roact);
local _ = require(l_Parent_1.React);
local v4 = require(l_Parent_1.BuilderIcons);
local v5 = require(l_Parent_0.migrationSizeExceptions);
local v6 = {
    ImageLabel = "TextLabel", 
    ImageButton = "TextButton"
};
local v7 = {
    ["icons/common/goldrobux"] = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(0.97, 0.93, 0.72)), 
        ColorSequenceKeypoint.new(0.6, Color3.new(0.67, 0.58, 0.36)), 
        ColorSequenceKeypoint.new(1, Color3.new(0.99, 0.88, 0.64))
    }), 
    ["icons/common/goldrobux_small"] = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(0.78, 0.71, 0.43)), 
        ColorSequenceKeypoint.new(0.5, Color3.new(0.65, 0.55, 0.32)), 
        ColorSequenceKeypoint.new(1, Color3.new(0.83, 0.71, 0.44))
    })
};
local function _(v8) --[[ Line: 28 ]]
    if not v8 then
        return true;
    else
        return v8.X.Offset ~= 0 and v8.Y.Scale ~= 0 or v8.Y.Offset ~= 0 and v8.X.Scale ~= 0;
    end;
end;
local function v13(v10) --[[ Line: 35 ]]
    local l_v10_0 = v10;
    if not (not l_v10_0 or l_v10_0.X.Offset ~= 0 and l_v10_0.Y.Scale ~= 0 or l_v10_0.Y.Offset ~= 0 and l_v10_0.X.Scale ~= 0) and (v10.X.Offset ~= v10.Y.Offset or v10.X.Scale ~= v10.Y.Scale) then
        if v10.X.Offset ~= 0 then
            l_v10_0 = math.min(v10.X.Offset, v10.Y.Offset);
            return (UDim2.fromOffset(l_v10_0, l_v10_0));
        else
            local _ = true;
        end;
    end;
    return v10;
end;
local function v15(v14) --[[ Line: 48 ]]
    return not v14 or v14.X.Offset ~= 0 and v14.Y.Scale ~= 0 or v14.Y.Offset ~= 0 and v14.X.Scale ~= 0 or v14.X.Offset == 0;
end;
local function _(v16, v17, v18, v19, v20) --[[ Line: 58 ]]
    -- upvalues: v5 (copy)
    local l_Offset_0 = v16.Y.Offset;
    if l_Offset_0 ~= 0 and not v17 and not v5[v19.name] then
        local l_Size_100_0 = v18.Size.Size_100;
        local l_Size_600_0 = v18.Size.Size_600;
        local v24 = v20 * 38;
        if l_Size_600_0 <= l_Offset_0 and l_Offset_0 <= v24 then
            return l_Size_600_0;
        else
            l_Offset_0 = math.round(l_Offset_0 / l_Size_100_0) * l_Size_100_0;
        end;
    end;
    return l_Offset_0;
end;
return function(v26, v27, v28, v29, v30, v31, v32) --[[ Line: 74 ]] --[[ Name: getBuilderIconElement ]]
    -- upvalues: v13 (copy), v15 (copy), v5 (copy), v4 (copy), v6 (copy), v2 (copy), v7 (copy)
    local v33 = false;
    if v26.ImageRectOffset == nil then
        v33 = v26.ImageRectSize == nil;
    end;
    assert(v33, "ImageRect props not supported for migration icons");
    v33 = false;
    if v26.SliceCenter == nil then
        v33 = v26.SliceScale == nil;
    end;
    assert(v33, "Image slices not supported for migration icons");
    local v34 = table.clone(v26);
    if typeof(v34.Size) == "table" then
        v33 = v34.Size;
        v34.Size = v33:map(v13);
        v34.TextScaled = v33:map(v15);
        v34.TextSize = v33:map(function(v35) --[[ Line: 97 ]]
            -- upvalues: v30 (copy), v28 (copy), v32 (copy), v5 (ref)
            local v36 = not v35 or v35.X.Offset ~= 0 and v35.Y.Scale ~= 0 or v35.Y.Offset ~= 0 and v35.X.Scale ~= 0 or v35.X.Offset == 0;
            local l_v30_0 = v30;
            local l_v28_0 = v28;
            local v39 = v32 or 1;
            local l_Offset_1 = v35.Y.Offset;
            if l_Offset_1 ~= 0 and not v36 and not v5[l_v28_0.name] then
                local l_Size_100_1 = l_v30_0.Size.Size_100;
                local l_Size_600_1 = l_v30_0.Size.Size_600;
                local v43 = v39 * 38;
                l_Offset_1 = if l_Size_600_1 <= l_Offset_1 and l_Offset_1 <= v43 then l_Size_600_1 else math.round(l_Offset_1 / l_Size_100_1) * l_Size_100_1;
            end;
            return l_Offset_1;
        end);
    else
        v33 = v34.Size;
        v34.Size = v13(v33);
        local v44 = not v33 or v33.X.Offset ~= 0 and v33.Y.Scale ~= 0 or v33.Y.Offset ~= 0 and v33.X.Scale ~= 0 or v33.X.Offset == 0;
        v34.TextScaled = v44;
        local v45 = v32 or 1;
        local l_Offset_2 = v33.Y.Offset;
        if l_Offset_2 ~= 0 and not v44 and not v5[v28.name] then
            local l_Size_100_2 = v30.Size.Size_100;
            local l_Size_600_2 = v30.Size.Size_600;
            local v49 = v45 * 38;
            l_Offset_2 = if l_Size_600_2 <= l_Offset_2 and l_Offset_2 <= v49 then l_Size_600_2 else math.round(l_Offset_2 / l_Size_100_2) * l_Size_100_2;
        end;
        v34.TextSize = l_Offset_2;
    end;
    v34.Text = v28.name;
    v34.FontFace = v4.Font[v28.variant];
    v34.TextColor3 = v34.ImageColor3 or v30.Color.Content.Emphasis.Color3;
    v34.TextTransparency = v34.ImageTransparency or v30.Color.Content.Emphasis.Transparency;
    v34.ImageColor3 = nil;
    v34.ImageTransparency = nil;
    v34.ResampleMode = nil;
    v34.ScaleType = nil;
    v34.TileSize = nil;
    v34.Image = nil;
    v33 = v6[v27];
    if v33 == nil then
        error("Unsupported inner component for image set icon migration: " .. v27);
    end;
    local v50 = nil;
    if v31 > 0 then
        if v50 == nil then
            v50 = {};
        end;
        v50.UITextSizeConstraint = v2.createElement("UITextSizeConstraint", {
            MaxTextSize = v34.TextSize
        });
    end;
    local v51 = v7[v29];
    if v51 then
        if v50 == nil then
            v50 = {};
        end;
        v34.TextColor3 = Color3.new(1, 1, 1);
        v50.UIGradient = v2.createElement("UIGradient", {
            Color = v51, 
            Rotation = 90
        });
    end;
    if v50 ~= nil then
        v50.Children = v2.createFragment(v26[v2.Children]);
        return v2.createElement(v33, v34, v50);
    else
        return v2.createElement(v33, v34);
    end;
end;