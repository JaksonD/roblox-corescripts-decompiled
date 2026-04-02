local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.Foundation);
local l_TextButton_0 = require(l_Parent_0.UIBlox).App.Button.TextButton;
local v7 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatDomLocatorFoundationMigration);
return function(v8) --[[ Line: 14 ]]
    -- upvalues: v2 (copy), v4 (copy), l_TextButton_0 (copy), v7 (copy), v3 (copy), v5 (copy)
    local l_localizedStrings_0 = v8.localizedStrings;
    local l_isDisabled_0 = v8.isDisabled;
    local l_onActivated_0 = v8.onActivated;
    v2.isNotNil(l_localizedStrings_0, "props.localizedStrings");
    local v12 = v4.createElement(l_TextButton_0, {
        text = l_localizedStrings_0.systemButtonText, 
        isDisabled = l_isDisabled_0, 
        onActivated = function() --[[ Line: 24 ]] --[[ Name: onActivated ]]
            -- upvalues: l_isDisabled_0 (copy), l_onActivated_0 (copy), l_localizedStrings_0 (copy)
            if l_isDisabled_0 then
                return;
            else
                if l_onActivated_0 then
                    l_onActivated_0(l_localizedStrings_0);
                end;
                return;
            end;
        end
    });
    if v7 and v8.testId then
        return v3.createElement(v5.View, {
            tag = "auto-xy", 
            testId = v8.testId
        }, {
            button = v12
        });
    else
        return v12;
    end;
end;