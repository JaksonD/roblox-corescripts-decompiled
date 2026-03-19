local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Common.Enums);
local v4 = require(l_script_FirstAncestor_0.Components.EditDisplayName);
local v5 = require(l_script_FirstAncestor_0.Components.EditBio);
local v6 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v7 = require(l_script_FirstAncestor_0.Hooks.useRealNamesInDisplayNamesEnabled);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v9 = require(l_Parent_0.Promise);
local l_ProfileRefreshSignal_0 = require(l_Parent_0.ProfilePlatformCommon).Signals.ProfileRefreshSignal;
local v11 = {
    [v3.Screens.EditDisplayName] = {
        component = v4, 
        titleKey = v6.EditDisplayName
    }, 
    [v3.Screens.EditBio] = {
        component = v5, 
        titleKey = v6.About
    }
};
return function(v12) --[[ Line: 38 ]]
    -- upvalues: v11 (copy), l_useNavigation_0 (copy), v7 (copy), v2 (copy), l_ProfileRefreshSignal_0 (copy), v9 (copy), v3 (copy), v6 (copy)
    local v13 = v11[v12];
    local v14 = l_useNavigation_0();
    local v15 = v7();
    local v16 = v2.useRef(nil);
    local v17, v18 = v2.useState(false);
    local v19, v20 = v2.useState(false);
    local v22 = v2.useCallback(function(v21) --[[ Line: 47 ]]
        -- upvalues: v20 (copy)
        v20(v21);
    end, {});
    local v23 = v2.useCallback(function() --[[ Line: 51 ]]
        -- upvalues: l_ProfileRefreshSignal_0 (ref), v14 (copy)
        l_ProfileRefreshSignal_0.notifyProfileRefresh();
        v14.goBack();
    end, {
        v14
    });
    local v25 = v2.useCallback(function(v24) --[[ Line: 56 ]]
        -- upvalues: v16 (copy)
        v16.current = v24;
    end, {});
    local v27 = v2.useCallback(function() --[[ Line: 60 ]]
        -- upvalues: v16 (copy), v19 (copy), v18 (copy), v9 (ref), v23 (copy)
        if v16.current and not v19 then
            v18(true);
            v9.resolve(v16.current()):andThen(function() --[[ Line: 64 ]]
                -- upvalues: v18 (ref), v23 (ref)
                v18(false);
                v23();
            end):catch(function(_) --[[ Line: 68 ]]
                -- upvalues: v18 (ref)
                v18(false);
            end);
        end;
    end, {
        v19
    });
    local v28 = if v12 == v3.Screens.EditDisplayName then if v15 then v6.EditAgedUpDisplayName else v6.EditDisplayName else v13.titleKey;
    return {
        component = v13.component, 
        titleKey = v28, 
        saveKey = v6.SaveButtonText, 
        onClose = v23, 
        onSave = v27, 
        isLoading = v17, 
        registerSaveHandler = v25, 
        updateErrorState = v22, 
        hasError = v19
    };
end;