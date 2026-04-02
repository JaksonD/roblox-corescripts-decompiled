local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local v2 = require(l_Parent_0.Common.Types);
local l_Dash_0 = v1.Dash;
local l_Toast_0 = v1.UIBlox.App.Dialog.Toast;
local l_React_0 = v1.React;
local l_useLocalization_0 = v1.Hooks.useLocalization;
local l_useNavigation_0 = v1.Hooks.useNavigation;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local l_useDidUpdate_0 = v1.Hooks.useDidUpdate;
local v10 = require(script.Parent.getTranslationKeys);
local l_FFlagRemoveDependencyArrayAntipattern_0 = v1.SharedFlags.FFlagRemoveDependencyArrayAntipattern;
local v12 = {
    messageType = v2.DefaultError, 
    duration = 2
};
return function(v13) --[[ Line: 31 ]]
    -- upvalues: l_Dash_0 (copy), v12 (copy), l_useLocalization_0 (copy), v10 (copy), l_useNavigation_0 (copy), l_useDidUpdate_0 (copy), l_React_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_Toast_0 (copy)
    local v14 = l_Dash_0.join(v12, v13 or {});
    local v15 = l_useLocalization_0(v10(v14.messageType, v14.localizationOverrides));
    local v16 = l_useNavigation_0();
    local v17 = l_useDidUpdate_0();
    local v18 = l_React_0.useMemo(function() --[[ Line: 39 ]]
        -- upvalues: v15 (copy), v17 (copy), v16 (copy)
        return {
            toastTitle = v15.toastTitle, 
            toastSubtitle = v15.toastSubtitle, 
            onDismissed = function() --[[ Line: 43 ]] --[[ Name: onDismissed ]]
                -- upvalues: v17 (ref), v16 (ref)
                if v17.current then
                    return;
                else
                    v16.goBack();
                    return;
                end;
            end
        };
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v15.toastTitle, 
        v15.toastSubtitle
    } else l_dependencyArray_0(v15.toastTitle, v15.toastSubtitle));
    return l_React_0.createElement(l_Toast_0, {
        toastContent = v18, 
        duration = v14.duration
    });
end;