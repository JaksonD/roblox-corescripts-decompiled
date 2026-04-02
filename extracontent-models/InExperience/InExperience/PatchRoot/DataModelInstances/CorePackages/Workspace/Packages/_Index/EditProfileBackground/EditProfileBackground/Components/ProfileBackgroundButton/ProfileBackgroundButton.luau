local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfileBackground");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Image_0 = require(l_Parent_0.Foundation).Image;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useSelectedTheme_0 = require(l_Parent_0.RoactUtils).Hooks.useSelectedTheme;
local v6 = require(l_script_FirstAncestor_0.Common.Constants);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v8 = v6.BACKGROUND_ASSET_IDS[1];
local v9 = Color3.fromRGB(255, 255, 255);
local v10 = Color3.fromRGB(0, 0, 0);
local v11 = Color3.fromRGB(80, 80, 80);
local v12 = Color3.fromRGB(30, 38, 58);
local v13 = Color3.fromRGB(156, 178, 196);
local v14 = {
    [v6.BACKGROUND_ASSET_IDS[2]] = Color3.fromRGB(255, 242, 216), 
    [v6.BACKGROUND_ASSET_IDS[3]] = Color3.fromRGB(254, 244, 194), 
    [v6.BACKGROUND_ASSET_IDS[4]] = Color3.fromRGB(238, 246, 216), 
    [v6.BACKGROUND_ASSET_IDS[5]] = Color3.fromRGB(214, 254, 202), 
    [v6.BACKGROUND_ASSET_IDS[6]] = Color3.fromRGB(192, 255, 226), 
    [v6.BACKGROUND_ASSET_IDS[7]] = Color3.fromRGB(208, 252, 255), 
    [v6.BACKGROUND_ASSET_IDS[8]] = Color3.fromRGB(238, 244, 255)
};
local function _(v15, v16) --[[ Line: 41 ]] --[[ Name: getButtonColor ]]
    -- upvalues: v8 (copy), v12 (copy), v13 (copy), v14 (copy)
    if v15 == v8 then
        if v16 == "dark" then
            return v12;
        else
            return v13;
        end;
    else
        return v14[v15];
    end;
end;
return function(v18) --[[ Line: 56 ]] --[[ Name: ProfileBackgroundButton ]]
    -- upvalues: l_useSelectedTheme_0 (copy), v2 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v8 (copy), v12 (copy), v13 (copy), v14 (copy), v9 (copy), v10 (copy), v11 (copy), l_Image_0 (copy)
    local l_buttonSize_0 = v18.buttonSize;
    local v20 = l_useSelectedTheme_0();
    local v21 = v2.useCallback(function() --[[ Line: 61 ]]
        -- upvalues: v18 (copy)
        if v18.selected then
            return;
        else
            if v18.onActivated then
                v18.onActivated(v18.profileBackgroundId);
            end;
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v18.onActivated, 
        v18.selected, 
        v18.profileBackgroundId
    } else l_dependencyArray_0(v18.onActivated, v18.selected, v18.profileBackgroundId));
    local v22 = math.floor(l_buttonSize_0 * 0.4);
    local l_profileBackgroundId_0 = v18.profileBackgroundId;
    local v24 = if l_profileBackgroundId_0 == v8 then if v20 == "dark" then v12 else v13 else v14[l_profileBackgroundId_0];
    return v2.createElement("ImageButton", {
        Size = UDim2.new(0, l_buttonSize_0, 0, l_buttonSize_0), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = v24, 
        BorderSizePixel = v18.selected and 3 or 0, 
        BorderColor3 = if v18.selected then v9 else v10, 
        LayoutOrder = v18.LayoutOrder, 
        [v2.Event.Activated] = v21
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        }), 
        Overlay = v18.selected and v2.createElement("Frame", {
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundColor3 = v11, 
            BackgroundTransparency = 0.5, 
            Size = UDim2.fromScale(0.8, 0.8), 
            ZIndex = 2
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            })
        }) or nil, 
        Checkmark = v18.selected and v2.createElement(l_Image_0, {
            tag = "position-center-center anchor-center-center", 
            Image = "rbxassetid://6031094667", 
            Size = UDim2.fromOffset(v22, v22), 
            ZIndex = 3
        }) or nil
    });
end;