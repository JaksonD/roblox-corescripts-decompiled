local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactOtter);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local function v12(v5, v6, v7) --[[ Line: 19 ]] --[[ Name: interpolateColors ]]
    -- upvalues: l_mutedError_0 (copy)
    local l_Color3_0 = v6.Color3;
    local l_Color3_1 = v7.Color3;
    local l_Transparency_0 = v6.Transparency;
    local l_Transparency_1 = v7.Transparency;
    if l_Color3_0 == nil or l_Color3_1 == nil or l_Transparency_0 == nil or l_Transparency_1 == nil then
        l_mutedError_0("useCategoryPillColorAnimation: ColorStyle is nil");
        return v6;
    else
        return {
            Color3 = l_Color3_0:Lerp(l_Color3_1, v5), 
            Transparency = l_Transparency_0 + (l_Transparency_1 - l_Transparency_0) * v5
        };
    end;
end;
return function(v13) --[[ Line: 38 ]] --[[ Name: useCategoryPillColorAnimation ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), v1 (copy), v12 (copy)
    local v14 = l_useTokens_0();
    local v15, v16 = v2.useAnimatedBinding(v13 and 1 or 0);
    v1.useEffect(function() --[[ Line: 45 ]]
        -- upvalues: v13 (copy), v16 (copy), v2 (ref)
        local v17 = v13 and 1 or 0;
        if not v13 then
            v16((v2.instant(v17)));
            return;
        else
            v16((v2.spring(v17, {
                frequency = 1.2, 
                dampingRatio = 1
            })));
            return;
        end;
    end, {
        v13
    });
    local v19 = v15:map(function(v18) --[[ Line: 60 ]]
        -- upvalues: v12 (ref), v14 (copy)
        return (v12(v18, v14.Color.ActionStandard.Background, v14.Color.ActionSubEmphasis.Background));
    end);
    local v21 = v15:map(function(v20) --[[ Line: 68 ]]
        -- upvalues: v12 (ref), v14 (copy)
        return (v12(v20, v14.Color.ActionStandard.Foreground, v14.Color.ActionSubEmphasis.Foreground));
    end);
    return {
        animatedBackgroundStyle = v19, 
        animatedTextStyle = v21
    };
end;