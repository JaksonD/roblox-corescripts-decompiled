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
local function v24(v17) --[[ Line: 21 ]]
    -- upvalues: l_FFlagProfilePlatformEnableImpressions_0 (copy), v3 (copy), v10 (copy), v4 (copy), l_HttpService_0 (copy), v8 (copy), l_SubPages_0 (copy), v2 (copy), l_dependencyArray_0 (copy), v9 (copy), v15 (copy), v11 (copy), v16 (copy)
    local v18 = if l_FFlagProfilePlatformEnableImpressions_0 then nil else v3.createRef();
    local v19 = v10();
    local l_profileId_0 = v19.profileId;
    local v21 = if l_FFlagProfilePlatformEnableImpressions_0 then v4.Signal.new() else nil;
    local v23 = v3.useMemo(function() --[[ Line: 30 ]]
        -- upvalues: l_FFlagProfilePlatformEnableImpressions_0 (ref), v18 (copy), l_HttpService_0 (ref), v8 (ref), v19 (copy), l_profileId_0 (copy), l_SubPages_0 (ref), v2 (ref), v21 (copy)
        if not l_FFlagProfilePlatformEnableImpressions_0 and v18.current == nil then
            v18.current = l_HttpService_0:GenerateGUID(false);
        end;
        local v22 = v8();
        v22.updateInfoForAllEvents({
            profileSessionId = if l_FFlagProfilePlatformEnableImpressions_0 then v19.profileSessionId else if v19.sessionIdOverride then v19.sessionIdOverride else v18.current, 
            profileId = l_profileId_0, 
            profileType = v19.profileType, 
            subpage = l_SubPages_0.PeekView
        });
        if l_FFlagProfilePlatformEnableImpressions_0 then
            return (v2.Dictionary.join(v22, {
                scrollViewPositionChangedSignal = v21
            }));
        else
            return v22;
        end;
    end, l_dependencyArray_0(l_profileId_0, v19.sessionIdOverride));
    return v3.createElement(v9.Provider, {
        value = v23
    }, {
        if v15 then v3.createElement(v11, nil, {
            v3.createElement(v16, v17)
        }) else v3.createElement(v16, v17)
    });
end;
local v25 = v3.PureComponent:extend("ProfilePlatformNavigatorWithProviders");
v25.render = function(v26) --[[ Line: 66 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v24 (copy)
    return v3.createElement(v24, v26.props);
end;
v25.router = v16.router;
return v25;