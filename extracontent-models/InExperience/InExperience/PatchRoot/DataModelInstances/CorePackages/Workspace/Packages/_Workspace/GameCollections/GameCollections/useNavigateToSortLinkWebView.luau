local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v2 = require(l_Parent_0.React);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local v8 = require(l_Parent_0.t);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_default_0 = require(l_Parent_0.LinkingProtocol).LinkingProtocol.default;
local v11 = v8.strictInterface({
    action = v8.string, 
    linkPath = v8.string, 
    webViewSupported = v8.boolean, 
    gameSetTypeId = v8.optional(v8.string), 
    durationInSeconds = v8.optional(v8.number)
});
local function _(v12) --[[ Line: 28 ]] --[[ Name: validateEventSchema ]]
    -- upvalues: v11 (copy), l_mutedError_0 (copy)
    local v13, v14 = v11(v12);
    if not v13 then
        l_mutedError_0(v14);
    end;
end;
return function() --[[ Line: 36 ]] --[[ Name: useNavigateToSortLinkWebView ]]
    -- upvalues: l_useNavigation_0 (copy), l_useAppPolicy_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), v2 (copy), v11 (copy), l_mutedError_0 (copy), l_UrlBuilder_0 (copy), l_default_0 (copy), l_AppPage_0 (copy)
    local v16 = l_useNavigation_0();
    local v18 = l_useAppPolicy_0(function(v17) --[[ Line: 38 ]]
        return v17.getWebViewSupport();
    end);
    local v19 = l_useRoactService_0(l_AppEventIngestService_0);
    return v2.useCallback(function(v20, v21, v22, v23, v24) --[[ Line: 44 ]]
        -- upvalues: v18 (copy), v11 (ref), l_mutedError_0 (ref), v19 (copy), l_UrlBuilder_0 (ref), l_default_0 (ref), v16 (copy), l_AppPage_0 (ref)
        local function _(v25, v26) --[[ Line: 45 ]]
            -- upvalues: v20 (copy), v23 (copy), v18 (ref), v11 (ref), l_mutedError_0 (ref), v19 (ref), v21 (copy)
            local v27 = {
                linkPath = v20, 
                action = v25, 
                gameSetTypeId = v23, 
                webViewSupported = v18, 
                durationInSeconds = v26
            };
            local v28, v29 = v11(v27);
            if not v28 then
                l_mutedError_0(v29);
            end;
            v19:sendEventDeferred(v21, "navigateToSortLink", v27);
        end;
        local v31 = {
            linkPath = v20, 
            action = "click", 
            gameSetTypeId = v23, 
            webViewSupported = v18, 
            durationInSeconds = nil
        };
        local v32, v33 = v11(v31);
        if not v32 then
            l_mutedError_0(v33);
        end;
        v19:sendEventDeferred(v21, "navigateToSortLink", v31);
        if v18 then
            v31 = l_UrlBuilder_0.fromString(if string.find(v20, "/") == 1 then v20:gsub("/", "www:", 1) else v20)();
            v32 = os.clock();
            v33 = {
                linkPath = v20, 
                action = "open", 
                gameSetTypeId = v23, 
                webViewSupported = v18, 
                durationInSeconds = nil
            };
            local v34, v35 = v11(v33);
            if not v34 then
                l_mutedError_0(v35);
            end;
            v19:sendEventDeferred(v21, "navigateToSortLink", v33);
            l_default_0:isURLRegistered(v31):andThen(function(v36) --[[ Line: 69 ]]
                -- upvalues: l_default_0 (ref), v31 (copy), v16 (ref), l_AppPage_0 (ref), v22 (copy), v32 (copy), v20 (copy), v23 (copy), v18 (ref), v11 (ref), l_mutedError_0 (ref), v19 (ref), v21 (copy), v24 (copy)
                if v36 then
                    l_default_0:detectURL(v31);
                    return;
                else
                    v16.navigate(l_AppPage_0.GenericWebPage, {
                        detail = v31, 
                        extraProps = {
                            title = v22, 
                            onClose = function() --[[ Line: 77 ]] --[[ Name: onClose ]]
                                -- upvalues: v32 (ref), v20 (ref), v23 (ref), v18 (ref), v11 (ref), l_mutedError_0 (ref), v19 (ref), v21 (ref), v24 (ref)
                                local v37 = os.clock() - v32;
                                local v38 = {
                                    linkPath = v20, 
                                    action = "close", 
                                    gameSetTypeId = v23, 
                                    webViewSupported = v18, 
                                    durationInSeconds = v37
                                };
                                local v39, v40 = v11(v38);
                                if not v39 then
                                    l_mutedError_0(v40);
                                end;
                                v19:sendEventDeferred(v21, "navigateToSortLink", v38);
                                if v24 then
                                    v24();
                                end;
                            end
                        }
                    });
                    return;
                end;
            end);
            return;
        else
            warn("WebView is not supported on this platform");
            return;
        end;
    end, {
        v16, 
        v18
    });
end;