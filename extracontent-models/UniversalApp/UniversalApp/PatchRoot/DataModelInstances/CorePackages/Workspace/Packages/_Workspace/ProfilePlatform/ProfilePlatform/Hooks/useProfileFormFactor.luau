local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local v5 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v6 = require(l_script_FirstAncestor_0.Common.Enums);
local v7 = game:DefineFastFlag("ProfilePlatformEnableWideModeForItemDetailsPage_DEV", false);
return function() --[[ Line: 20 ]]
    -- upvalues: l_useSelector_0 (copy), v5 (copy), v6 (copy), v7 (copy), v2 (copy), l_FormFactor_0 (copy)
    local v9 = l_useSelector_0(function(v8) --[[ Line: 21 ]]
        return v8.FormFactor;
    end);
    local v10 = v5();
    local v11 = v10.profileType == v6.ProfileTypes.Community;
    local v12 = v10.sourceInfo.source == v6.Sources.HomepageAd;
    local v13 = if v7 then v10.sourceInfo.source == v6.Sources.ItemDetailsPage else nil;
    return (v2.useMemo(function() --[[ Line: 32 ]]
        -- upvalues: v9 (copy), l_FormFactor_0 (ref), v6 (ref), v11 (copy), v12 (copy), v7 (ref), v13 (copy), v10 (copy)
        if v9 == l_FormFactor_0.WIDE then
            return {
                formFactor = v6.ProfileFormFactor.Wide, 
                isFullView = v11 and v12 or v7 and (v13 or tostring(v10.profileId) == "35505309")
            };
        else
            return {
                formFactor = v6.ProfileFormFactor.PeekView, 
                isFullView = v11 and v12 or v7 and (v13 or tostring(v10.profileId) == "35505309")
            };
        end;
    end, {
        v9, 
        v11, 
        v12
    }));
end;