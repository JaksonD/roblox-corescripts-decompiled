local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Avatar);
local v4 = require(l_script_FirstAncestor_0.Enums.ColorMode);
local v5 = require(l_script_FirstAncestor_0.Components.Icon);
local v6 = require(l_script_FirstAncestor_0.Enums.IconSize);
local v7 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v8 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v10 = require(l_script_FirstAncestor_0.Components.View);
local v11 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v12 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v13 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local _ = require(l_script_FirstAncestor_0.Enums.UserPresence);
local v15 = require(l_script_FirstAncestor_0.Enums.AvatarGroupType);
local l_usePresentationContext_0 = require(l_script_FirstAncestor_0.Providers.Style.PresentationContext).usePresentationContext;
local v17 = require(l_script_FirstAncestor_0.Utility.useCumulativeBackground);
local v18 = require(l_script_FirstAncestor_0.Components.Avatar.getAvatarSize);
local v19 = {
    type = v15.Spread, 
    max = 1e999, 
    size = v7.Medium, 
    testId = "--foundation-avatar-group"
};
local function v27(v20) --[[ Line: 43 ]] --[[ Name: AvatarOverflow ]]
    -- upvalues: v11 (copy), l_usePresentationContext_0 (copy), v17 (copy), v7 (copy), v4 (copy), v2 (copy), v10 (copy), v12 (copy), v5 (copy), v6 (copy), v8 (copy)
    local v21 = v11();
    local v22 = l_usePresentationContext_0();
    local v23 = v17(v20.backplateStyle, v20.backgroundStyle);
    local v24 = v22.isIconSize and (v20.size == v7.XSmall or v20.size == v7.Small);
    local v25 = (not not v22.isIconSize or v7.XSmall) and "text-caption-small" or "text-caption-medium";
    local l_Emphasis_0 = v21[v22.colorMode or v4.Color].Content.Emphasis;
    return v2.createElement(v10, v12(v20, {
        Size = v20.Size, 
        backgroundStyle = v23, 
        tag = "radius-circle row align-x-center align-y-center"
    }), if v24 then v2.createElement(v5, {
        name = "three-dots-horizontal", 
        size = v6.XSmall, 
        style = l_Emphasis_0
    }) else v2.createElement(v8, {
        Text = ("+%*"):format(v20.count), 
        tag = ("text-align-x-center auto-xy %*"):format(v25), 
        textStyle = l_Emphasis_0
    }));
end;
return v2.memo(v2.forwardRef(function(v28, v29) --[[ Line: 79 ]] --[[ Name: AvatarGroup ]]
    -- upvalues: v13 (copy), v19 (copy), l_usePresentationContext_0 (copy), v11 (copy), v15 (copy), v7 (copy), v4 (copy), v18 (copy), v2 (copy), v27 (copy), v3 (copy), v10 (copy), v12 (copy)
    local v30 = v13(v28, v19);
    local v31 = l_usePresentationContext_0();
    local v32 = v11();
    local v33 = nil;
    v33 = if v30.type == v15.Spread then v32.Size.Size_200 else if v31.isIconSize then if not (v30.size ~= v7.Large) or v30.size == v7.Medium then -v32.Size.Size_50 else -v32.Size.Size_0 else if v30.size == v7.XSmall then -v32.Size.Size_50 else -v32.Size.Size_100;
    local l_Shift_300_0 = v32[v31.colorMode or v4.Color].Shift.Shift_300;
    local v35 = v18(v32, v30.size, v31.isIconSize);
    local v36 = v30.backplateStyle or v32.Color.Surface.Surface_0;
    local v37 = {};
    local v38 = v35 + v33;
    for v39, v40 in v30.avatars do
        local v41 = UDim2.fromOffset(v38 * (v39 - 1), 0);
        local v42 = nil;
        local l_v40_0 = v40;
        if typeof(v40) == "table" then
            v42 = v40.userPresence;
            l_v40_0 = v40.userId;
        end;
        local v44 = #v30.avatars - (v39 - 1);
        if v30.max < v39 then
            v37[v39] = v2.createElement(v27, {
                key = "overflow", 
                count = #v30.avatars - v30.max, 
                size = v30.size, 
                Size = UDim2.fromOffset(v35, v35), 
                LayoutOrder = v39, 
                Position = v41, 
                ZIndex = v44, 
                backgroundStyle = l_Shift_300_0, 
                backplateStyle = v36
            });
            break;
        else
            v37[v39] = v2.createElement(v3, {
                key = tostring(l_v40_0), 
                userId = l_v40_0, 
                backgroundStyle = l_Shift_300_0, 
                backplateStyle = v36, 
                size = v30.size, 
                userPresence = v42, 
                LayoutOrder = v39, 
                Position = v41, 
                ZIndex = v44, 
                testId = ("%*--avatar-%*"):format(v30.testId, l_v40_0)
            });
        end;
    end;
    return v2.createElement(v10, v12(v30, {
        ref = v29, 
        tag = "auto-xy"
    }), v37);
end));