local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Common.Enums);
local v4 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v5 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local l_parseSectionsFromData_0 = require(l_script_FirstAncestor_0.Components.About).parseSectionsFromData;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v8 = require(l_script_FirstAncestor_0.Components.Description);
local v9 = require(l_Parent_0.NavigationRodux);
local v10 = require(l_Parent_0.RoactUtils);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = v9.Thunks.NavigateDown;
local l_useDispatch_0 = v10.Hooks.RoactRodux.useDispatch;
return function(v14) --[[ Line: 27 ]] --[[ Name: ContactDescriptionContainer ]]
    -- upvalues: l_useDispatch_0 (copy), v5 (copy), v3 (copy), l_useLocalization_0 (copy), v4 (copy), v2 (copy), l_parseSectionsFromData_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v8 (copy)
    local v15 = l_useDispatch_0();
    local v16 = v5(v3.Components.ContactDescription);
    local l_contactsProfileDescription_0 = l_useLocalization_0({
        contactsProfileDescription = {
            v4.ContactsProfileBody; 
            contactName = v16.contactName
        }
    }).contactsProfileDescription;
    local v18 = v2.useMemo(function() --[[ Line: 35 ]]
        -- upvalues: l_parseSectionsFromData_0 (ref), l_contactsProfileDescription_0 (copy), v3 (ref)
        return l_parseSectionsFromData_0({
            description = l_contactsProfileDescription_0
        }, v3.ProfileTypes.Contact);
    end, {
        l_contactsProfileDescription_0
    });
    local v19 = v2.useCallback(function() --[[ Line: 39 ]]
        -- upvalues: v15 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v18 (copy)
        v15(l_NavigateDown_0({
            name = l_AppPage_0.AboutDetailsSheet, 
            extraProps = {
                sections = v18
            }
        }));
    end, {
        v15, 
        v18
    });
    return v2.createElement(v8, {
        description = l_contactsProfileDescription_0, 
        layoutOrder = v14.layoutOrder, 
        onActivateMoreButton = v19
    });
end;