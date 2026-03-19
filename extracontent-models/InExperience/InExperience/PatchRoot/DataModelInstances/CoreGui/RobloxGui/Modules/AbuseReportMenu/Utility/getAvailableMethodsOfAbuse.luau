local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_script_FirstAncestor_0.Components.Constants);
local v3 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v4 = require(l_script_FirstAncestor_0.Flags.GetFFlagTranslatorUseInAbuseMethods);
getAvailableMethodsOfAbuse = function(v5, v6) --[[ Line: 9 ]] --[[ Name: getAvailableMethodsOfAbuse ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy)
    if v4() then
        local v7 = {
            {
                label = v3:FormatByKey(v2.localizationKeys[v2.AbuseMethods.TextChat]), 
                subLabel = v3:FormatByKey("Feature.SettingsHub.MethodOfAbuse.Text.Subtitle"), 
                identifier = v2.AbuseMethods.TextChat
            }
        };
        if v6 then
            v7[#v7 + 1] = {
                label = v3:FormatByKey(v2.localizationKeys[v2.AbuseMethods.Avatar]), 
                subLabel = v3:FormatByKey("Feature.SettingsHub.MethodOfAbuse.AvatarSubtitle"), 
                identifier = v2.AbuseMethods.Avatar
            };
        else
            v7[#v7 + 1] = {
                label = v3:FormatByKey(v2.localizationKeys[v2.AbuseMethods.Other]), 
                subLabel = v3:FormatByKey("Feature.SettingsHub.MethodOfAbuse.Other.Subtitle"), 
                identifier = v2.AbuseMethods.Other
            };
        end;
        if v5 then
            table.insert(v7, 1, {
                label = v3:FormatByKey(v2.localizationKeys[v2.AbuseMethods.VoiceChat]), 
                subLabel = v3:FormatByKey("Feature.SettingsHub.MethodOfAbuse.VoiceChat.Subtitle"), 
                identifier = v2.AbuseMethods.VoiceChat
            });
        end;
        return v7;
    else
        local v8 = {
            {
                label = v2.AbuseMethods.TextChat, 
                subLabel = v2.AbuseMethodSublabel.TextChat, 
                identifier = v2.AbuseMethods.TextChat
            }
        };
        if v6 then
            v8[#v8 + 1] = {
                label = v2.AbuseMethods.Avatar, 
                subLabel = v2.AbuseMethodSublabel.Avatar, 
                identifier = v2.AbuseMethods.Avatar
            };
        else
            v8[#v8 + 1] = {
                label = v2.AbuseMethods.Other, 
                subLabel = v2.AbuseMethodSublabel.Other, 
                identifier = v2.AbuseMethods.Other
            };
        end;
        if v5 then
            table.insert(v8, 1, {
                label = v2.AbuseMethods.VoiceChat, 
                subLabel = v2.AbuseMethodSublabel.VoiceChat, 
                identifier = v2.AbuseMethods.VoiceChat
            });
        end;
        return v8;
    end;
end;
return getAvailableMethodsOfAbuse;