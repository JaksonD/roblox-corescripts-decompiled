local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.AppCommonLib);
local v5 = require(l_Parent_0.SocialLuaAnalytics);
local v6 = require(l_Parent_0.RoactUtils);
local l_SubPages_0 = v5.Analytics.Enums.SubPages;
local v8 = require(l_script_FirstAncestor_0.Analytics.initializeProfileAnalytics);
local v9 = require(l_script_FirstAncestor_0.Contexts.ProfileAnalyticsContext);
local v10 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v11 = require(l_script_FirstAncestor_0.Contexts.ProfileScrollContext.ProfileScrollContextProvider);
local l_dependencyArray_0 = v6.Hooks.dependencyArray;
local l_HttpService_0 = game:GetService("HttpService");
local l_FFlagProfilePlatformEnableImpressions_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableImpressions;
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableCoverPhoto);
local v16 = require(script.Parent.ProfilePlatformNavigator);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local function v25(v18) --[[ Line: 23 ]]
    -- upvalues: l_FFlagProfilePlatformEnableImpressions_0 (copy), v3 (copy), v10 (copy), v4 (copy), l_HttpService_0 (copy), v8 (copy), l_SubPages_0 (copy), v2 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v9 (copy), v15 (copy), v11 (copy), v16 (copy)
    local v19 = if l_FFlagProfilePlatformEnableImpressions_0 then nil else v3.createRef();
    local v20 = v10();
    local l_profileId_0 = v20.profileId;
    local v22 = if l_FFlagProfilePlatformEnableImpressions_0 then v4.Signal.new() else nil;
    local v24 = v3.useMemo(function() --[[ Line: 33 ]]
        -- upvalues: l_FFlagProfilePlatformEnableImpressions_0 (ref), v19 (copy), l_HttpService_0 (ref), v8 (ref), v20 (copy), l_profileId_0 (copy), l_SubPages_0 (ref), v2 (ref), v22 (copy)
        if not l_FFlagProfilePlatformEnableImpressions_0 and v19.current == nil then
            v19.current = l_HttpService_0:GenerateGUID(false);
        end;
        local v23 = v8();
        v23.updateInfoForAllEvents({
            profileSessionId = if l_FFlagProfilePlatformEnableImpressions_0 then v20.profileSessionId else if v20.sessionIdOverride then v20.sessionIdOverride else v19.current, 
            profileId = l_profileId_0, 
            profileType = v20.profileType, 
            subpage = l_SubPages_0.PeekView
        });
        if l_FFlagProfilePlatformEnableImpressions_0 then
            return (v2.Dictionary.join(v23, {
                scrollViewPositionChangedSignal = v22
            }));
        else
            return v23;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        l_profileId_0, 
        v20.sessionIdOverride
    } else l_dependencyArray_0(l_profileId_0, v20.sessionIdOverride));
    return v3.createElement(v9.Provider, {
        value = v24
    }, {
        if v15 then v3.createElement(v11, nil, {
            v3.createElement(v16, v18)
        }) else v3.createElement(v16, v18)
    });
end;
local v26 = v3.PureComponent:extend("ProfilePlatformNavigatorWithProviders");
v26.render = function(v27) --[[ Line: 73 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v25 (copy)
    return v3.createElement(v25, v27.props);
end;
v26.router = v16.router;
return v26;