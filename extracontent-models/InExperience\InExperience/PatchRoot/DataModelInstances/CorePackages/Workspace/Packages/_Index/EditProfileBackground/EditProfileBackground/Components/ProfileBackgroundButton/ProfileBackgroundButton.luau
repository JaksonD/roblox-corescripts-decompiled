local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfileBackground");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Image_0 = require(l_Parent_0.Foundation).Image;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useSelectedTheme_0 = require(l_Parent_0.RoactUtils).Hooks.useSelectedTheme;
local v6 = require(l_script_FirstAncestor_0.Common.Constants);
local v7 = v6.BACKGROUND_ASSET_IDS[1];
local v8 = Color3.fromRGB(255, 255, 255);
local v9 = Color3.fromRGB(0, 0, 0);
local v10 = Color3.fromRGB(80, 80, 80);
local v11 = Color3.fromRGB(30, 38, 58);
local v12 = Color3.fromRGB(156, 178, 196);
local v13 = {
    [v6.BACKGROUND_ASSET_IDS[2]] = Color3.fromRGB(255, 242, 216), 
    [v6.BACKGROUND_ASSET_IDS[3]] = Color3.fromRGB(254, 244, 194), 
    [v6.BACKGROUND_ASSET_IDS[4]] = Color3.fromRGB(238, 246, 216), 
    [v6.BACKGROUND_ASSET_IDS[5]] = Color3.fromRGB(214, 254, 202), 
    [v6.BACKGROUND_ASSET_IDS[6]] = Color3.fromRGB(192, 255, 226), 
    [v6.BACKGROUND_ASSET_IDS[7]] = Color3.fromRGB(208, 252, 255), 
    [v6.BACKGROUND_ASSET_IDS[8]] = Color3.fromRGB(238, 244, 255)
};
local function _(v14, v15) --[[ Line: 39 ]] --[[ Name: getButtonColor ]]
    -- upvalues: v7 (copy), v11 (copy), v12 (copy), v13 (copy)
    if v14 == v7 then
        if v15 == "dark" then
            return v11;
        else
            return v12;
        end;
    else
        return v13[v14];
    end;
end;
return function(v17) --[[ Line: 54 ]] --[[ Name: ProfileBackgroundButton ]]
    -- upvalues: l_useSelectedTheme_0 (copy), v2 (copy), l_dependencyArray_0 (copy), v7 (copy), v11 (copy), v12 (copy), v13 (copy), v8 (copy), v9 (copy), v10 (copy), l_Image_0 (copy)
    local l_buttonSize_0 = v17.buttonSize;
    local v19 = l_useSelectedTheme_0();
    local v20 = v2.useCallback(function() --[[ Line: 58 ]]
        -- upvalues: v17 (copy)
        if v17.selected then
            return;
        else
            if v17.onActivated then
                v17.onActivated(v17.profileBackgroundId);
            end;
            return;
        end;
    end, l_dependencyArray_0(v17.onActivated, v17.selected, v17.profileBackgroundId));
    local v21 = math.floor(l_buttonSize_0 * 0.4);
    local l_profileBackgroundId_0 = v17.profileBackgroundId;
    local v23 = if l_profileBackgroundId_0 == v7 then if v19 == "dark" then v11 else v12 else v13[l_profileBackgroundId_0];
    return v2.createElement("ImageButton", {
        Size = UDim2.new(0, l_buttonSize_0, 0, l_buttonSize_0), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = v23, 
        BorderSizePixel = v17.selected and 3 or 0, 
        BorderColor3 = if v17.selected then v8 else v9, 
        LayoutOrder = v17.LayoutOrder, 
        [v2.Event.Activated] = v20
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        }), 
        Overlay = v17.selected and v2.createElement("Frame", {
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundColor3 = v10, 
            BackgroundTransparency = 0.5, 
            Size = UDim2.fromScale(0.8, 0.8), 
            ZIndex = 2
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            })
        }) or nil, 
        Checkmark = v17.selected and v2.createElement(l_Image_0, {
            tag = "position-center-center anchor-center-center", 
            Image = "rbxassetid://6031094667", 
            Size = UDim2.fromOffset(v21, v21), 
            ZIndex = 3
        }) or nil
    });
end;