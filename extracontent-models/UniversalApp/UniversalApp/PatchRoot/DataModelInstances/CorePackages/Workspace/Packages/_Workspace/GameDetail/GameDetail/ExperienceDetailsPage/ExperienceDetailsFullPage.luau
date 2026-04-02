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
local l_FFlagSduiExperienceDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiExperienceDetailsSupport;
local l_FFlagSduiPageEntryUseSharedHooks_0 = require(l_Parent_0.SharedFlags).FFlagSduiPageEntryUseSharedHooks;
return v7.memo(function(v20) --[[ Line: 31 ]] --[[ Name: ExperienceDetailsFullPage ]]
    -- upvalues: v1 (copy), v4 (copy), v7 (copy), l_useNavigation_0 (copy), l_useRoactService_0 (copy), l_AppSessionService_0 (copy), l_useTokens_0 (copy), l_SduiLoadTimer_0 (copy), l_AppPage_0 (copy), l_SessionType_0 (copy), v3 (copy), l_DetailsPageLayout_0 (copy), l_SduiPageEntryPoint_0 (copy), l_FFlagSduiPageEntryUseSharedHooks_0 (copy), v2 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy)
    local v21 = v1.getUniverseId(v20);
    local v22 = v4(v21);
    local v23 = v7.useRef(nil);
    local v24 = l_useNavigation_0();
    local v25 = l_useRoactService_0(l_AppSessionService_0);
    local v26 = l_useTokens_0();
    local v28 = v7.useMemo(function() --[[ Line: 41 ]]
        -- upvalues: v1 (ref), v20 (copy), l_SduiLoadTimer_0 (ref), l_AppPage_0 (ref)
        local v27 = v1.getFromPropsOrNavigationParams(v20, "pageTimer");
        if v27 then
            return v27;
        else
            return l_SduiLoadTimer_0.createLoadTimer(l_AppPage_0.ExperienceDetail);
        end;
    end, {});
    local v29 = v7.useCallback(function() --[[ Line: 49 ]]
        -- upvalues: v24 (copy), v25 (copy), l_SessionType_0 (ref)
        v24.goBack();
        if v25 then
            v25:RemoveSession(l_SessionType_0.StructuralIdentifier.GameDetailSource);
        end;
    end, {
        v24, 
        v25
    });
    v7.useEffect(function() --[[ Line: 56 ]]
        -- upvalues: v21 (copy), v28 (copy), v3 (ref)
        if v21 and v28 then
            v3(v21, v28);
        end;
    end, {
        v21, 
        v28
    });
    if v21 == nil then
        return nil;
    else
        return v7.createElement(l_DetailsPageLayout_0.Root, {
            onClose = v29
        }, {
            Header = v7.createElement(l_DetailsPageLayout_0.Header), 
            Content = v7.createElement(l_DetailsPageLayout_0.Content, {
                scrollingFrameRef = v23
            }, {
                Feed = v7.createElement(l_SduiPageEntryPoint_0, {
                    appPage = l_AppPage_0.ExperienceDetail, 
                    configKey = v22, 
                    identifier = if l_FFlagSduiPageEntryUseSharedHooks_0 then v2.EDP_FEED_IDENTIFIER else v1.getResolvedIdentifier(v22, v2.EDP_FEED_IDENTIFIER_SUFFIX), 
                    pageTimer = v28, 
                    includeNavigationHeaderBar = false, 
                    scrollingFrameRef = v23, 
                    backgroundStyle = v26.Color.None, 
                    disableRootPadding = l_FFlagSduiExperienceDetailsSupport_0 and true or nil, 
                    clipsDescendantsOverride = not l_FFlagSduiExperienceDetailsSupport_0 and nil
                })
            })
        });
    end;
end);