local l_InGameMenu_0 = script.Parent.Parent.Parent.InGameMenu;
local v1 = require(l_InGameMenu_0.Network.Url);
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Promise_0 = require(l_CorePackages_0.Packages.InGameMenuDependencies).Promise;
local function _(v6, v7, v8) --[[ Line: 22 ]] --[[ Name: request ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:RequestInternal(v6):Start(function(v9, v10) --[[ Line: 23 ]]
        -- upvalues: v7 (copy), v8 (copy)
        if v9 then
            v7();
            return;
        else
            v8((tostring(v10.StatusMessage)));
            return;
        end;
    end);
end;
return function(v12, v13, v14, v15, v16, v17) --[[ Line: 32 ]]
    -- upvalues: l_Players_0 (copy), v1 (copy), l_HttpService_0 (copy), l_Promise_0 (copy)
    local v18 = 1;
    if v14 == "" or v14 == nil then
        v14 = "UID_" .. game.GameId;
        v18 = 2;
    end;
    local v19 = {
        LocalizationFeedback = {
            FeedbackTarget = {
                ServiceSource = {
                    Type = v18, 
                    ExternalId = v14
                }, 
                Source = {
                    ContentType = 1, 
                    Value = v12
                }, 
                Translation = {
                    ContentType = 1, 
                    Value = v13
                }
            }, 
            Locale = if l_Players_0.LocalPlayer.LocaleId then l_Players_0.LocalPlayer.LocaleId:gsub("-", "_") else "", 
            ReasonType = v17, 
            Suggestion = {
                ContentType = 1, 
                Value = v15
            }, 
            Comments = v16
        }
    };
    local v20 = {
        Url = string.format("%sfeedback-api/v1/feedback/create-localization", v1.APIS_URL), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode(v19), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    return l_Promise_0.new(function(v21, v22) --[[ Line: 87 ]]
        -- upvalues: v20 (copy), l_HttpService_0 (ref)
        spawn(function() --[[ Line: 88 ]]
            -- upvalues: v20 (ref), v21 (copy), v22 (copy), l_HttpService_0 (ref)
            local l_v20_0 = v20;
            local l_v21_0 = v21;
            local l_v22_0 = v22;
            local _ = l_HttpService_0:RequestInternal(l_v20_0):Start(function(v26, v27) --[[ Line: 23 ]]
                -- upvalues: l_v21_0 (copy), l_v22_0 (copy)
                if v26 then
                    l_v21_0();
                    return;
                else
                    l_v22_0((tostring(v27.StatusMessage)));
                    return;
                end;
            end);
        end);
    end);
end;