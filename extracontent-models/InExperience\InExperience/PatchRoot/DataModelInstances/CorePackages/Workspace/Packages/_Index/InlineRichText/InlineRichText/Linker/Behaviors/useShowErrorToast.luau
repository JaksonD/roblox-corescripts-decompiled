local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineRichText");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.NotificationModalsManager);
local v3 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local _ = require(l_script_FirstAncestor_0.Types);
return function(v6) --[[ Line: 14 ]]
    -- upvalues: l_useLocalization_0 (copy), v3 (copy), v2 (copy)
    local v7 = l_useLocalization_0({
        errorToastText = "Feature.CommonUI.Messages.Response.SomethingWentWrong"
    });
    local v8 = if v6.errorToastTextOverride and v6.errorToastTextOverride ~= "" then v6.errorToastTextOverride else v7.errorToastText;
    return v3.useCallback(function() --[[ Line: 22 ]]
        -- upvalues: v2 (ref), v8 (copy)
        v2.SetUIBloxToast({
            toastTitle = v8, 
            sequenceNumber = DateTime.now().UnixTimestamp
        });
    end, {
        v8
    });
end;