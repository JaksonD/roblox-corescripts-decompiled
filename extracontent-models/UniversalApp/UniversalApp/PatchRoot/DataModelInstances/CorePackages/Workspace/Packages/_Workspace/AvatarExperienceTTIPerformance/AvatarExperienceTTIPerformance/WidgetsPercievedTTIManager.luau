local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceTTIPerformance").Parent;
local l_FFlagAXTTIEnableMilestones_0 = require(l_Parent_0.SharedFlags).FFlagAXTTIEnableMilestones;
local l_TimeToInteractiveTracker_0 = require(l_Parent_0.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_Milestone_0 = l_TimeToInteractiveTracker_0.Milestone;
local v4 = require(script.Parent.TTIMetricNames);
local v5 = "AvatarExperience_" .. v4.Marketplace.WidgetThumbnails .. "_Percieved";
local v6 = "AvatarExperience_" .. v4.Marketplace.WidgetTiles .. "_Percieved";
local v7 = {
    FetchHydratedWidgets = "FetchHydratedWidgets", 
    FetchCatalogSearchWithSponsoredItems = "FetchCatalogSearchWithSponsoredItems", 
    FetchCatalogSearch = "FetchCatalogSearch"
};
if l_FFlagAXTTIEnableMilestones_0 then
    return {
        Requests = v7, 
        startPerceivedTracking = function() --[[ Line: 29 ]] --[[ Name: startPerceivedTracking ]]
            -- upvalues: l_TimeToInteractiveTracker_0 (copy), v6 (copy), v5 (copy)
            l_TimeToInteractiveTracker_0.trackStart(v6);
            l_TimeToInteractiveTracker_0.trackStart(v5);
        end, 
        Hooks = {
            useRenderAndMountedTracking = function() --[[ Line: 35 ]] --[[ Name: useRenderAndMountedTracking ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), v5 (copy)
                l_TimeToInteractiveTracker_0.Hooks.useTTIRenderAndMountedTracking(v5);
            end
        }, 
        L2 = {
            primaryDataStarted = function() --[[ Line: 41 ]] --[[ Name: primaryDataStarted ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), v5 (copy), l_Milestone_0 (copy)
                l_TimeToInteractiveTracker_0.trackMilestone(v5, l_Milestone_0.PrimaryDataStarted.Name);
            end, 
            primaryDataReady = function() --[[ Line: 44 ]] --[[ Name: primaryDataReady ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), v5 (copy), l_Milestone_0 (copy)
                l_TimeToInteractiveTracker_0.trackMilestone(v5, l_Milestone_0.PrimaryDataReady.Name);
            end, 
            dataProcessingStarted = function() --[[ Line: 47 ]] --[[ Name: dataProcessingStarted ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), v5 (copy), l_Milestone_0 (copy)
                l_TimeToInteractiveTracker_0.trackMilestone(v5, l_Milestone_0.DataProcessingStarted.Name);
            end, 
            dataProcessingCompleted = function() --[[ Line: 50 ]] --[[ Name: dataProcessingCompleted ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), v5 (copy), l_Milestone_0 (copy)
                l_TimeToInteractiveTracker_0.trackMilestone(v5, l_Milestone_0.DataProcessingCompleted.Name);
            end, 
            functionallyReady = function() --[[ Line: 53 ]] --[[ Name: functionallyReady ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), v5 (copy), l_Milestone_0 (copy)
                l_TimeToInteractiveTracker_0.trackMilestone(v5, l_Milestone_0.FunctionallyReady);
            end, 
            surfaceReady = function() --[[ Line: 56 ]] --[[ Name: surfaceReady ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), v5 (copy), l_Milestone_0 (copy)
                l_TimeToInteractiveTracker_0.trackMilestone(v5, l_Milestone_0.SurfaceReady);
            end
        }, 
        L3 = {
            networkFetch = function() --[[ Line: 62 ]] --[[ Name: networkFetch ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), v5 (copy), l_Milestone_0 (copy)
                l_TimeToInteractiveTracker_0.trackSubphase(v5, l_Milestone_0.PrimaryDataStarted.Name, l_Milestone_0.PrimaryDataStarted.Subphase.NetworkFetch);
            end, 
            responseReceived = function() --[[ Line: 69 ]] --[[ Name: responseReceived ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), v5 (copy), l_Milestone_0 (copy)
                l_TimeToInteractiveTracker_0.trackSubphase(v5, l_Milestone_0.PrimaryDataStarted.Name, l_Milestone_0.PrimaryDataStarted.Subphase.ResponseReceived);
            end, 
            requestFetchHydratedWidgets = function() --[[ Line: 76 ]] --[[ Name: requestFetchHydratedWidgets ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), v5 (copy), l_Milestone_0 (copy), v7 (copy)
                l_TimeToInteractiveTracker_0.trackRequest(v5, l_Milestone_0.PrimaryDataReady.Name, v7.FetchHydratedWidgets);
            end, 
            requestFetchCatalogSearch = function() --[[ Line: 83 ]] --[[ Name: requestFetchCatalogSearch ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), v5 (copy), l_Milestone_0 (copy), v7 (copy)
                l_TimeToInteractiveTracker_0.trackRequest(v5, l_Milestone_0.PrimaryDataReady.Name, v7.FetchCatalogSearchWithSponsoredItems);
            end, 
            requestFetchCatalogSearchOrganic = function() --[[ Line: 90 ]] --[[ Name: requestFetchCatalogSearchOrganic ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), v5 (copy), l_Milestone_0 (copy), v7 (copy)
                l_TimeToInteractiveTracker_0.trackRequest(v5, l_Milestone_0.PrimaryDataReady.Name, v7.FetchCatalogSearch);
            end
        }
    };
else
    return nil;
end;