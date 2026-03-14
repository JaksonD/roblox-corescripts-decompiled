local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local l_LocalizationRoactContext_0 = require(l_Parent_0.Localization).LocalizationRoactContext;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotificationsCommon");
local _ = require(l_script_FirstAncestor_0.type);
local v6 = require(l_Parent_0.RobloxTranslator);
return {
    getLocalizedStrings = function(v7) --[[ Line: 13 ]]
        -- upvalues: v1 (copy), l_LocalizationRoactContext_0 (copy), l_useLocalization_0 (copy), v6 (copy)
        if v1.useContext(l_LocalizationRoactContext_0) ~= nil then
            return l_useLocalization_0(v7);
        else
            local v8 = {};
            for v9, v10 in pairs(v7) do
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 24 ]]
                    -- upvalues: v6 (ref), v10 (copy)
                    return v6:FormatByKey(v10);
                end);
                if l_status_0 then
                    v8[v9] = l_result_0;
                else
                    v8[v9] = v10;
                end;
            end;
            return v8;
        end;
    end
};