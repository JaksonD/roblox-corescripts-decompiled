local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_WebViewService_0 = game:GetService("WebViewService");
local l_BrowserService_0 = game:GetService("BrowserService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v6 = require(l_Parent_1.Loggers);
local v7 = require(l_Parent_0.ClickoutTelemetry);
local l_flaggedMutedError_0 = v6.flaggedMutedError;
local v9 = game:DefineFastFlag("LuaAppIsClickoutEnabledUniverse", false);
local l_GetFFlagEnableUnifiedWebViews_0 = require(l_Parent_1.SharedFlags).GetFFlagEnableUnifiedWebViews;
return function() --[[ Line: 19 ]] --[[ Name: starterScript ]]
    -- upvalues: v9 (copy), l_ReplicatedStorage_0 (copy), l_flaggedMutedError_0 (copy), l_HttpService_0 (copy), l_GetFFlagEnableUnifiedWebViews_0 (copy), l_WebViewService_0 (copy), v7 (copy), l_BrowserService_0 (copy)
    if not v9 then
        return;
    else
        l_ReplicatedStorage_0:WaitForChild("AdClickoutEvent").Event:Connect(function(v11) --[[ Line: 26 ]]
            -- upvalues: l_flaggedMutedError_0 (ref), l_HttpService_0 (ref), l_GetFFlagEnableUnifiedWebViews_0 (ref), l_WebViewService_0 (ref), v7 (ref), l_BrowserService_0 (ref)
            if string.find(v11, "[<>]") then
                l_flaggedMutedError_0("InExperienceClickout_InvalidURL", (("AdClickoutEvent received invalid URL: %*"):format(v11)));
                return;
            elseif not string.match(v11, "^https://") then
                l_flaggedMutedError_0("InExperienceClickout_InvalidURL", (("AdClickoutEvent received URL with invalid scheme: %*"):format(v11)));
                return;
            elseif #v11 == 0 then
                l_flaggedMutedError_0("InExperienceClickout_InvalidURL", "AdClickoutEvent received empty URL.");
                return;
            elseif #v11 > 512 then
                l_flaggedMutedError_0("InExperienceClickout_InvalidURL", (("AdClickoutEvent received URL exceeding max length: %*"):format(v11)));
                return;
            else
                local v12 = l_HttpService_0:GenerateGUID(false);
                local v13 = nil;
                v13 = if l_GetFFlagEnableUnifiedWebViews_0() then l_WebViewService_0.OnWindowClosed:Connect(function() --[[ Line: 59 ]]
                    -- upvalues: v7 (ref), v12 (copy), v11 (copy), l_WebViewService_0 (ref), v13 (ref)
                    v7.logWebviewToggled(false, v12, v11);
                    l_WebViewService_0:CloseWindow();
                    if v13 then
                        v13:Disconnect();
                        v13 = nil;
                    end;
                end) else l_BrowserService_0.BrowserWindowClosed:Connect(function() --[[ Line: 68 ]]
                    -- upvalues: v7 (ref), v12 (copy), v11 (copy), v13 (ref)
                    v7.logWebviewToggled(false, v12, v11);
                    if v13 then
                        v13:Disconnect();
                        v13 = nil;
                    end;
                end);
                v7.logWebviewToggled(true, v12, v11);
                if l_GetFFlagEnableUnifiedWebViews_0() then
                    l_WebViewService_0:OpenWindow(v11, nil, true, nil, nil, true);
                else
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 89 ]]
                        -- upvalues: l_HttpService_0 (ref), v11 (copy)
                        return l_HttpService_0:JSONEncode({
                            command = "open", 
                            url = v11, 
                            visible = true, 
                            isGenericWebview = true, 
                            showDomainAsTitle = true
                        });
                    end);
                    if not l_status_0 then
                        l_flaggedMutedError_0("InExperienceClickout_JSONEncodeFailed", (("AdClickoutEvent failed to JSON encode command for URL: %*"):format(v11)));
                        return;
                    else
                        l_BrowserService_0:SendCommand(l_result_0);
                    end;
                end;
                return;
            end;
        end);
        return;
    end;
end;