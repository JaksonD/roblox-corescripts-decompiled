local l_Parent_0 = script:FindFirstAncestor("GameDetail").Parent;
local v1 = require(script.Parent.ExperienceDetailsPageUtils);
local v2 = require(script.Parent.ExperienceDetailsPageConstants);
local v3 = require(script.Parent.fetchExperienceDetailsPage);
local v4 = require(script.Parent.getExperienceDetailsPageKey);
local _ = require(l_Parent_0.Navigation);
local v6 = require(l_Parent_0.Foundation);
local v7 = require(l_Parent_0.React);
local l_useTokens_0 = v6.Hooks.useTokens;
local l_AppSessionService_0 = require(l_Parent_0.RoactServiceTags).AppSessionService;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_SessionType_0 = require(l_Parent_0.RobloxAppSessionization).SessionType;
local l_DetailsPageLayout_0 = require(l_Parent_0.AppBlox).DetailsPageLayout;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v15 = require(l_Parent_0.SduiSharedUtilities);
local l_SduiPageEntryPoint_0 = v15.SduiPageEntryPoint;
local l_SduiLoadTimer_0 = v15.SduiLoadTimer;
return v7.memo(function(v18) --[[ Line: 28 ]] --[[ Name: ExperienceDetailsFullPage ]]
    -- upvalues: v1 (copy), v4 (copy), v7 (copy), l_useNavigation_0 (copy), l_useRoactService_0 (copy), l_AppSessionService_0 (copy), l_useTokens_0 (copy), l_SduiLoadTimer_0 (copy), l_AppPage_0 (copy), l_SessionType_0 (copy), v3 (copy), l_DetailsPageLayout_0 (copy), l_SduiPageEntryPoint_0 (copy), v2 (copy)
    local v19 = v1.getUniverseId(v18);
    local v20 = v4(v19);
    local v21 = v7.useRef(nil);
    local v22 = l_useNavigation_0();
    local v23 = l_useRoactService_0(l_AppSessionService_0);
    local v24 = l_useTokens_0();
    local v26 = v7.useMemo(function() --[[ Line: 38 ]]
        -- upvalues: v1 (ref), v18 (copy), l_SduiLoadTimer_0 (ref), l_AppPage_0 (ref)
        local v25 = v1.getFromPropsOrNavigationParams(v18, "pageTimer");
        if v25 then
            return v25;
        else
            return l_SduiLoadTimer_0.createLoadTimer(l_AppPage_0.ExperienceDetail);
        end;
    end, {});
    local v27 = v7.useCallback(function() --[[ Line: 46 ]]
        -- upvalues: v22 (copy), v23 (copy), l_SessionType_0 (ref)
        v22.goBack();
        if v23 then
            v23:RemoveSession(l_SessionType_0.StructuralIdentifier.GameDetailSource);
        end;
    end, {
        v22, 
        v23
    });
    v7.useEffect(function() --[[ Line: 53 ]]
        -- upvalues: v19 (copy), v26 (copy), v3 (ref)
        if v19 and v26 then
            v3(v19, v26);
        end;
    end, {
        v19, 
        v26
    });
    if v19 == nil then
        return nil;
    else
        return v7.createElement(l_DetailsPageLayout_0.Root, {
            onClose = v27
        }, {
            Header = v7.createElement(l_DetailsPageLayout_0.Header), 
            Content = v7.createElement(l_DetailsPageLayout_0.Content, {
                scrollingFrameRef = v21
            }, {
                Feed = v7.createElement(l_SduiPageEntryPoint_0, {
                    appPage = l_AppPage_0.ExperienceDetail, 
                    configKey = v20, 
                    identifier = v1.getResolvedIdentifier(v20, v2.EDP_FEED_IDENTIFIER_SUFFIX), 
                    pageTimer = v26, 
                    includeNavigationHeaderBar = false, 
                    scrollingFrameRef = v21, 
                    backgroundStyle = v24.Color.None
                })
            })
        });
    end;
end);