local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.NavigationRodux);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v5 = require(l_Parent_0.RoactUtils);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v7 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v8 = require(l_script_FirstAncestor_0.Hooks.useAboutSections);
local v9 = require(l_script_FirstAncestor_0.Common.Enums);
local v10 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v11 = require(l_script_FirstAncestor_0.Components.Description);
local v12 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v13 = require(script.Parent.parseSectionsFromData);
local l_NavigateDown_0 = v3.Thunks.NavigateDown;
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_FFlagProfilePlatformNewProfileHeader_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformNewProfileHeader;
return function(v17) --[[ Line: 26 ]] --[[ Name: AboutDescriptionContainer ]]
    -- upvalues: l_useDispatch_0 (copy), l_FFlagProfilePlatformNewProfileHeader_0 (copy), v8 (copy), v12 (copy), v10 (copy), v9 (copy), v2 (copy), v13 (copy), l_useLocalization_0 (copy), v7 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v11 (copy)
    local v18 = l_useDispatch_0();
    local v19 = nil;
    local v20 = nil;
    if l_FFlagProfilePlatformNewProfileHeader_0 then
        local v21 = v8();
        v19 = v21.aboutDetails;
        v20 = v21.aboutSections;
    else
        local l_profileType_0 = v12().profileType;
        v19 = v10(v9.Components.About);
        local l_l_profileType_0_0 = l_profileType_0 --[[ copy: 4 -> 7 ]];
        v20 = v2.useMemo(function() --[[ Line: 38 ]]
            -- upvalues: v13 (ref), v19 (ref), l_l_profileType_0_0 (copy), v9 (ref)
            return v13(v19, l_l_profileType_0_0, if l_l_profileType_0_0 == v9.ProfileTypes.User then ("@%*"):format(v19.name) else v19.name);
        end, {
            v19, 
            l_profileType_0, 
            v19.name
        });
    end;
    local l_description_0 = v19.description;
    local v25 = l_useLocalization_0({
        noBioYet = v7.NoBioYet
    });
    if l_description_0 == nil or l_description_0 == "" then
        l_description_0 = if l_FFlagProfilePlatformNewProfileHeader_0 then nil else v25.noBioYet;
    end;
    local v26 = v2.useCallback(function() --[[ Line: 58 ]]
        -- upvalues: v18 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v20 (ref)
        v18(l_NavigateDown_0({
            name = l_AppPage_0.AboutDetailsSheet, 
            extraProps = {
                sections = v20
            }
        }));
    end, {
        v18, 
        v20
    });
    return v2.createElement(v11, {
        description = l_description_0, 
        layoutOrder = v17.layoutOrder, 
        onActivateMoreButton = v26
    });
end;