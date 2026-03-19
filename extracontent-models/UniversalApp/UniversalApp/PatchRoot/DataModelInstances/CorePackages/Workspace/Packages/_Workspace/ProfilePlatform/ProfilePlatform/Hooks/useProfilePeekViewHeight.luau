local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v4 = require(l_script_FirstAncestor_0.Common.Constants);
local v5 = require(l_script_FirstAncestor_0.Common.Enums);
local v6 = require(l_script_FirstAncestor_0.Hooks.useAboutSectionHeight);
local v7 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v8 = require(l_script_FirstAncestor_0.Hooks.useDynamicSizeMargin);
local v9 = require(l_script_FirstAncestor_0.Hooks.useCurrentlyPlayingSectionHeight);
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformAddCurrentlyPlaying);
return function(v11, v12) --[[ Line: 19 ]]
    -- upvalues: l_useTokens_0 (copy), v8 (copy), v7 (copy), v5 (copy), v2 (copy), v6 (copy), v10 (copy), v9 (copy), v4 (copy)
    local v13 = l_useTokens_0();
    local v14, _ = v8();
    local v16 = v7(v5.Components.About);
    local v17 = v2.useMemo(function() --[[ Line: 25 ]]
        -- upvalues: v16 (copy)
        return v16.description;
    end, {
        v16, 
        v16.description
    });
    local v18, _ = v6(v17, v11, v14);
    local v20 = nil;
    local v21 = nil;
    if v10 then
        v20 = v7(v5.Components.CurrentlyPlaying);
        v21 = v9(v20);
    end;
    return (v2.useMemo(function() --[[ Line: 40 ]]
        -- upvalues: v4 (ref), v13 (copy), v12 (copy), v18 (copy), v10 (ref), v21 (ref), v11 (copy)
        local v22 = v4.AVATAR_HEADSHOT_HEIGHT / 2 + v13.Gap.Large;
        local v23 = if v12 then v4.CONTEXTUAL_INFORMATION_HEIGHT + v13.Gap.XXLarge else 0;
        local l_SOCIAL_ROW_HEIGHT_0 = v4.SOCIAL_ROW_HEIGHT;
        local l_CTA_BUTTON_HEIGHT_0 = v4.CTA_BUTTON_HEIGHT;
        local v26 = (if v18 ~= 0 then v13.Gap.XXLarge else 0) + 10;
        if v10 then
            v26 = v26 + if v21 ~= 0 then v13.Gap.XXLarge else 0;
        end;
        return v11 * 0.75 + v22 + v23 + l_SOCIAL_ROW_HEIGHT_0 + v18 + l_CTA_BUTTON_HEIGHT_0 + v26 + if v10 then v21 else 0;
    end, {
        v11, 
        v12, 
        v18, 
        v21 or 0
    }));
end;