local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_CorePackages_0.Packages.React);
local l_ImageSetButton_0 = v2.Core.ImageSet.ImageSetButton;
local l_Images_0 = v2.App.ImageSet.Images;
return function(v6) --[[ Line: 25 ]] --[[ Name: ScreenshotHighlighter ]]
    -- upvalues: l_RobloxGui_0 (copy), v3 (copy), l_ImageSetButton_0 (copy), l_Images_0 (copy)
    local l_AbsoluteSize_0 = l_RobloxGui_0.AbsoluteSize;
    local v8 = (l_AbsoluteSize_0.Y > l_AbsoluteSize_0.X and l_AbsoluteSize_0.X or l_AbsoluteSize_0.Y) / 5;
    local v9, v10 = v3.useState(false);
    local function v15(v11, v12) --[[ Line: 35 ]]
        -- upvalues: v6 (copy), v8 (copy)
        local v13 = (Vector2.new(v12.X, v12.Y) - v11.AbsolutePosition) / v11.AbsoluteSize;
        table.insert(v6.annotationPoints, v13);
        local v14 = if v11.AbsoluteSize.X > v11.AbsoluteSize.Y then v11.AbsoluteSize.X else v11.AbsoluteSize.Y;
        v6.setAnnotationCircleRadius(v8 * 0.5 / v14);
        v6.setAnnotationAreaDimensions(v11.AbsoluteSize.X, v11.AbsoluteSize.Y);
        v6.handleAnnotationPoints(v6.annotationPoints);
    end;
    local function v21(v16, v17) --[[ Line: 47 ]]
        -- upvalues: v6 (copy), v10 (copy), v15 (copy)
        local v18 = v17.UserInputState == Enum.UserInputState.Begin;
        local v19 = v17.UserInputType == Enum.UserInputType.Touch;
        local v20 = v17.UserInputType == Enum.UserInputType.MouseButton1;
        if v18 and (v19 or v20) and #v6.annotationPoints < 25 then
            v10(true);
            v15(v16, v17.Position);
        end;
    end;
    local function v24(_, _) --[[ Line: 57 ]]
        -- upvalues: v15 (copy)
    end;
    local function v27(_, _) --[[ Line: 69 ]]
        -- upvalues: v9 (copy), v10 (copy)
        if v9 then
            v10(false);
        end;
    end;
    local v28 = {};
    for v29, v30 in ipairs(v6.annotationPoints) do
        v28["point" .. v29] = v3.createElement("Frame", {
            Position = UDim2.fromScale(v30.X, v30.Y), 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(v8, v8)
        }, {
            Border = v3.createElement(l_ImageSetButton_0, {
                Size = UDim2.fromOffset(v8, v8), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = l_Images_0["component_assets/circle_49_stroke_1"], 
                ImageColor3 = Color3.fromHex("#3CF3E9"), 
                ImageTransparency = 0, 
                BackgroundTransparency = 1
            }), 
            Background = v3.createElement(l_ImageSetButton_0, {
                Size = UDim2.fromOffset(v8, v8), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = l_Images_0["component_assets/circle_49"], 
                ImageColor3 = Color3.fromHex("#3CF3E9"), 
                ImageTransparency = 0.6, 
                BackgroundTransparency = 1
            })
        });
    end;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        [v3.Event.InputBegan] = v21, 
        [v3.Event.InputChanged] = v24, 
        [v3.Event.InputEnded] = v27, 
        ZIndex = 3
    }, v28);
end;