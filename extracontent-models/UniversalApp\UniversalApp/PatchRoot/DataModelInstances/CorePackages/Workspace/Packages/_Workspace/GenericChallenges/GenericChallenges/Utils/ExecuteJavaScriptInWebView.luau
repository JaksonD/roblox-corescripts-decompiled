local l_BrowserService_0 = game:GetService("BrowserService");
return {
    Execute = function(v1, v2) --[[ Line: 5 ]] --[[ Name: Execute ]]
        -- upvalues: l_BrowserService_0 (copy)
        local v3 = "(function() { CoreRobloxUtilities.hybridResponseService.injectNativeResponse(" .. v1 .. ", " .. v2 .. "); })();";
        l_BrowserService_0:ExecuteJavaScript(v3);
    end
};