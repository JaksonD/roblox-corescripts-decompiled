local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v4 = require(l_Modules_0.AvatarExperience.Photobooth.photoboothCategories);
local l_PhotoboothCategories_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperiencePhotobooth).Enums.PhotoboothCategories;
local v6 = require(l_Modules_0.AvatarExperience.Photobooth.Components.Animations.CustomPill);
local v7 = {
    l_PhotoboothCategories_0.All, 
    l_PhotoboothCategories_0.Emotes, 
    l_PhotoboothCategories_0.Idle, 
    l_PhotoboothCategories_0.Walk, 
    l_PhotoboothCategories_0.Run, 
    l_PhotoboothCategories_0.Jump, 
    l_PhotoboothCategories_0.Fall, 
    l_PhotoboothCategories_0.Climb, 
    l_PhotoboothCategories_0.Swim
};
return function(v8) --[[ Line: 32 ]] --[[ Name: PhotoboothAnimationsPillBar ]]
    -- upvalues: v7 (copy), v4 (copy), l_useLocalization_0 (copy), v2 (copy), v6 (copy)
    local l_animationFilter_0 = v8.animationFilter;
    local l_onAnimationFilterChanged_0 = v8.onAnimationFilterChanged;
    local v11 = {};
    for _, v13 in v7 do
        local v14 = v4[v13];
        if v14 then
            v11[v14.NavigationKey] = v14.Title;
        end;
    end;
    local v15 = l_useLocalization_0(v11);
    local v20 = v2.useMemo(function() --[[ Line: 47 ]]
        -- upvalues: v2 (ref), v8 (copy), v7 (ref), v4 (ref), v6 (ref), v15 (copy), l_animationFilter_0 (copy), l_onAnimationFilterChanged_0 (copy)
        local v16 = {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, v8.tokens.Padding.Small)
            })
        };
        for v17, v18 in v7 do
            local v19 = v4[v18];
            if v19 then
                v16[("Chip%*"):format(v18)] = v2.createElement(v6, {
                    text = v15[v19.NavigationKey], 
                    isChecked = l_animationFilter_0 == v19.NavigationKey, 
                    onActivated = function() --[[ Line: 63 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_onAnimationFilterChanged_0 (ref), v19 (copy)
                        l_onAnimationFilterChanged_0(v19.NavigationKey);
                    end, 
                    LayoutOrder = v17
                });
            end;
        end;
        return v16;
    end, {
        l_animationFilter_0, 
        v15, 
        v8.tokens
    });
    return v2.createElement("ScrollingFrame", {
        Size = UDim2.new(1, 0, 1, 0), 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        AutomaticCanvasSize = Enum.AutomaticSize.X, 
        ScrollBarThickness = 0, 
        VerticalScrollBarInset = Enum.ScrollBarInset.None, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, v20);
end;