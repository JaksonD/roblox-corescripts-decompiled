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
return v7.memo(function(v19) --[[ Line: 30 ]] --[[ Name: ExperienceDetailsFullPage ]]
    -- upvalues: v1 (copy), v4 (copy), v7 (copy), l_useNavigation_0 (copy), l_useRoactService_0 (copy), l_AppSessionService_0 (copy), l_useTokens_0 (copy), l_SduiLoadTimer_0 (copy), l_AppPage_0 (copy), l_SessionType_0 (copy), v3 (copy), l_DetailsPageLayout_0 (copy), l_SduiPageEntryPoint_0 (copy), v2 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy)
    local v20 = v1.getUniverseId(v19);
    local v21 = v4(v20);
    local v22 = v7.useRef(nil);
    local v23 = l_useNavigation_0();
    local v24 = l_useRoactService_0(l_AppSessionService_0);
    local v25 = l_useTokens_0();
    local v27 = v7.useMemo(function() --[[ Line: 40 ]]
        -- upvalues: v1 (ref), v19 (copy), l_SduiLoadTimer_0 (ref), l_AppPage_0 (ref)
        local v26 = v1.getFromPropsOrNavigationParams(v19, "pageTimer");
        if v26 then
            return v26;
        else
            return l_SduiLoadTimer_0.createLoadTimer(l_AppPage_0.ExperienceDetail);
        end;
    end, {});
    local v28 = v7.useCallback(function() --[[ Line: 48 ]]
        -- upvalues: v23 (copy), v24 (copy), l_SessionType_0 (ref)
        v23.goBack();
        if v24 then
            v24:RemoveSession(l_SessionType_0.StructuralIdentifier.GameDetailSource);
        end;
    end, {
        v23, 
        v24
    });
    v7.useEffect(function() --[[ Line: 55 ]]
        -- upvalues: v20 (copy), v27 (copy), v3 (ref)
        if v20 and v27 then
            v3(v20, v27);
        end;
    end, {
        v20, 
        v27
    });
    if v20 == nil then
        return nil;
    else
        return v7.createElement(l_DetailsPageLayout_0.Root, {
            onClose = v28
        }, {
            Header = v7.createElement(l_DetailsPageLayout_0.Header), 
            Content = v7.createElement(l_DetailsPageLayout_0.Content, {
                scrollingFrameRef = v22
            }, {
                Feed = v7.createElement(l_SduiPageEntryPoint_0, {
                    appPage = l_AppPage_0.ExperienceDetail, 
                    configKey = v21, 
                    identifier = v1.getResolvedIdentifier(v21, v2.EDP_FEED_IDENTIFIER_SUFFIX), 
                    pageTimer = v27, 
                    includeNavigationHeaderBar = false, 
                    scrollingFrameRef = v22, 
                    backgroundStyle = v25.Color.None, 
                    disableRootPadding = l_FFlagSduiExperienceDetailsSupport_0 and true or nil, 
                    clipsDescendantsOverride = not l_FFlagSduiExperienceDetailsSupport_0 and nil
                })
            })
        });
    end;
end);