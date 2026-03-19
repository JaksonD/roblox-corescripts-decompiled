local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice);
local v3 = require(l_CorePackages_0.Workspace.Packages.SquadsCore);
local v4 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v5 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_getColorFromUserId_0 = v3.Common.getColorFromUserId;
local l_useLastActiveParticipant_0 = v2.Hooks.useLastActiveParticipant;
local l_useSequentialAnimation_0 = v2.Hooks.useSequentialAnimation;
local l_usePrevious_0 = v4.Hooks.usePrevious;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
local v11 = game:DefineFastInt("PartyVoiceTopbarActivityIndicatorAnimationMs", 50);
local v12 = game:DefineFastInt("PartyVoiceTopbarActivityIndicatorDebounceMs", 50);
local l_GetFFlagEnableCrossExpVoice_0 = v5.GetFFlagEnableCrossExpVoice;
createAnimations = function(v14, v15) --[[ Line: 33 ]] --[[ Name: createAnimations ]]
    -- upvalues: v11 (copy)
    return {
        ICON_OUT_ANIMATION = {
            value = 0, 
            durationInMs = v11, 
            easingStyle = Enum.EasingStyle.Linear
        }, 
        ICON_IN_ANIMATION = {
            value = v14, 
            durationInMs = v11, 
            easingStyle = Enum.EasingStyle.Linear
        }, 
        AVATAR_IN_ANIMATION = {
            value = v15, 
            durationInMs = v11, 
            easingStyle = Enum.EasingStyle.Linear
        }, 
        AVATAR_OUT_ANIMATION = {
            value = 0, 
            durationInMs = v11, 
            easingStyle = Enum.EasingStyle.Linear
        }
    };
end;
getDisplayImage = function(v16, v17) --[[ Line: 58 ]] --[[ Name: getDisplayImage ]]
    -- upvalues: l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_getColorFromUserId_0 (copy)
    return {
        thumbnail = if v16 ~= -1 then l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v16))) else v17, 
        backgroundColor = if v16 ~= -1 then l_getColorFromUserId_0(v16) else nil
    };
end;
usePartyIcon = function(v18, v19, v20) --[[ Line: 65 ]] --[[ Name: usePartyIcon ]]
    -- upvalues: l_GetFFlagEnableCrossExpVoice_0 (copy), l_useLastActiveParticipant_0 (copy), l_usePrevious_0 (copy), v1 (copy), l_useSequentialAnimation_0 (copy), v2 (copy), v12 (copy)
    if l_GetFFlagEnableCrossExpVoice_0() then
        local v21 = l_useLastActiveParticipant_0();
        local v22 = v21 and v21.userId or -1;
        local v23 = l_usePrevious_0(v22);
        local v24, v25 = v1.useState(getDisplayImage(v22, v20));
        local v26, v27 = l_useSequentialAnimation_0(if v22 == -1 then v18 else v19);
        local v28 = v1.useMemo(function() --[[ Line: 76 ]]
            -- upvalues: v18 (copy), v19 (copy)
            return createAnimations(v18, v19);
        end, {
            v18, 
            v19
        });
        local v32 = v1.useCallback(function(v29) --[[ Line: 80 ]]
            -- upvalues: v25 (copy), v20 (copy)
            v25(function(v30) --[[ Line: 81 ]]
                -- upvalues: v29 (copy), v20 (ref)
                local v31 = getDisplayImage(v29, v20);
                if v30.thumbnail == v31.thumbnail and v30.backgroundColor == v31.backgroundColor then
                    return v30;
                else
                    return v31;
                end;
            end);
        end, {
            v20, 
            v25
        });
        local v35 = v1.useMemo(function() --[[ Line: 94 ]]
            -- upvalues: v2 (ref), v27 (copy), v12 (ref)
            return v2.Utils.debounce(function(v33, v34) --[[ Line: 96 ]]
                -- upvalues: v27 (ref)
                v27(v33, v34);
            end, v12);
        end, {});
        v1.useEffect(function() --[[ Line: 104 ]]
            -- upvalues: v23 (copy), v22 (copy), v35 (copy), v28 (copy), v32 (copy), v27 (copy)
            if v23 ~= nil and v22 ~= v23 then
                v35.cancel();
                if v22 == -1 then
                    v35.call({
                        v28.AVATAR_OUT_ANIMATION, 
                        v28.ICON_IN_ANIMATION
                    }, function() --[[ Line: 111 ]]
                        -- upvalues: v32 (ref)
                        v32(-1);
                    end);
                    return;
                elseif v23 == -1 then
                    v27({
                        v28.ICON_OUT_ANIMATION, 
                        v28.AVATAR_IN_ANIMATION
                    }, function() --[[ Line: 119 ]]
                        -- upvalues: v32 (ref), v22 (ref)
                        v32(v22);
                    end);
                    return;
                else
                    v32(v22);
                    return;
                end;
            else
                v32(v22);
                return;
            end;
        end, {
            v22, 
            v32, 
            v35, 
            v28
        });
        return {
            image = v24, 
            size = v26
        };
    else
        local v36, _ = v1.createBinding(v18);
        return {
            image = getDisplayImage(-1, v20), 
            size = v36
        };
    end;
end;
return usePartyIcon;