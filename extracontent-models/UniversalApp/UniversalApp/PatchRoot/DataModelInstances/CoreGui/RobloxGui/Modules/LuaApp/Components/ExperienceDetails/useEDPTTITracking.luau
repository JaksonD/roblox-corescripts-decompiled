local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local v3 = if l_TimeToInteractiveTracker_0.Hooks then l_TimeToInteractiveTracker_0.Hooks.useTTIRenderAndMountedTracking else nil;
local l_FetchGamePlayButtonData_0 = require(l_CorePackages_0.Workspace.Packages.GamePlayButton).FetchGamePlayButtonData;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_CorePackages_0.Workspace.Packages.GameDetailTelemetry);
local l_EDPTTIConstants_0 = v6.EDPTTIConstants;
local l_EDPTTIManager_0 = v6.EDPTTIManager;
local l_useAssetFetchStatus_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useAssetFetchStatus;
local l_MediaCarouselImageStatus_0 = require(script.Parent.useFirstMediaCarouselImageUri).MediaCarouselImageStatus;
local l_EDP_TTI_EVENT_NAME_0 = l_EDPTTIConstants_0.EDP_TTI_EVENT_NAME;
return function(v12, v13, v14) --[[ Line: 26 ]] --[[ Name: useEDPTTITracking ]]
    -- upvalues: v1 (copy), l_EDPTTIManager_0 (copy), v3 (copy), l_EDP_TTI_EVENT_NAME_0 (copy), l_useSelector_0 (copy), l_FetchGamePlayButtonData_0 (copy), l_MediaCarouselImageStatus_0 (copy), l_useAssetFetchStatus_0 (copy)
    local v15 = v1.useRef(false);
    if not v15.current then
        v15.current = true;
        l_EDPTTIManager_0.startTracking("Untracked");
        l_EDPTTIManager_0.setImplementation(v12);
    end;
    if v3 then
        v3(l_EDP_TTI_EVENT_NAME_0);
    end;
    local v17 = l_useSelector_0(function(v16) --[[ Line: 42 ]]
        -- upvalues: v13 (copy), l_FetchGamePlayButtonData_0 (ref)
        if v13 then
            return l_FetchGamePlayButtonData_0.IsLoading(v16, v13);
        else
            return true;
        end;
    end);
    v1.useEffect(function() --[[ Line: 49 ]]
        -- upvalues: v17 (copy), v13 (copy), l_EDPTTIManager_0 (ref)
        if not v17 and v13 then
            l_EDPTTIManager_0.trackFunctionallyReady();
        end;
    end, {
        v17, 
        v13
    });
    local l_url_0 = v14.url;
    local v19 = v14.status == l_MediaCarouselImageStatus_0.NotFound;
    local v20 = l_useAssetFetchStatus_0(l_url_0);
    local v21 = true;
    if v20 ~= Enum.AssetFetchStatus.Success then
        v21 = v19;
    end;
    v1.useEffect(function() --[[ Line: 60 ]]
        -- upvalues: v17 (copy), v21 (copy), v13 (copy), l_EDPTTIManager_0 (ref), v19 (copy)
        if not v17 and v21 and v13 then
            l_EDPTTIManager_0.trackSurfaceReady({
                mediaImageFound = not v19
            });
        end;
    end, {
        v17, 
        v21, 
        v19, 
        v13
    });
end;