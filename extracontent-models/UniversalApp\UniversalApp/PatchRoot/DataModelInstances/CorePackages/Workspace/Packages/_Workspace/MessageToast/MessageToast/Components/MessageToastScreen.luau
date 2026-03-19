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
local v11 = {
    messageType = v2.DefaultError, 
    duration = 2
};
return function(v12) --[[ Line: 28 ]]
    -- upvalues: l_Dash_0 (copy), v11 (copy), l_useLocalization_0 (copy), v10 (copy), l_useNavigation_0 (copy), l_useDidUpdate_0 (copy), l_React_0 (copy), l_dependencyArray_0 (copy), l_Toast_0 (copy)
    local v13 = l_Dash_0.join(v11, v12 or {});
    local v14 = l_useLocalization_0(v10(v13.messageType, v13.localizationOverrides));
    local v15 = l_useNavigation_0();
    local v16 = l_useDidUpdate_0();
    local v17 = l_React_0.useMemo(function() --[[ Line: 35 ]]
        -- upvalues: v14 (copy), v16 (copy), v15 (copy)
        return {
            toastTitle = v14.toastTitle, 
            toastSubtitle = v14.toastSubtitle, 
            onDismissed = function() --[[ Line: 39 ]] --[[ Name: onDismissed ]]
                -- upvalues: v16 (ref), v15 (ref)
                if v16.current then
                    return;
                else
                    v15.goBack();
                    return;
                end;
            end
        };
    end, l_dependencyArray_0(v14.toastTitle, v14.toastSubtitle));
    return l_React_0.createElement(l_Toast_0, {
        toastContent = v17, 
        duration = v13.duration
    });
end;