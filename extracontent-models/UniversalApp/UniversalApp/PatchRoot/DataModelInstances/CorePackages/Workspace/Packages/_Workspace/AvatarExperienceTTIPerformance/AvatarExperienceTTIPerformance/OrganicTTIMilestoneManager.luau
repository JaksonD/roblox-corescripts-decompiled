local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceTTIPerformance").Parent;
local l_FFlagAXTTIEnableMilestones_0 = require(l_Parent_0.SharedFlags).FFlagAXTTIEnableMilestones;
local l_TimeToInteractiveTracker_0 = require(l_Parent_0.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_Milestone_0 = l_TimeToInteractiveTracker_0.Milestone;
local v4 = "AvatarExperience_" .. require(script.Parent.TTIMetricNames).Marketplace.OrganicThumbnails;
local v5 = {
    SponsoredSearchStarted = "SponsoredSearchStarted", 
    SponsoredSearchCompleted = "SponsoredSearchCompleted", 
    CatalogApiSearchStarted = "CatalogApiSearchStarted", 
    CatalogApiSearchCompleted = "CatalogApiSearchCompleted"
};
if l_FFlagAXTTIEnableMilestones_0 then
    return {
        CustomSubphases = v5, 
        Hooks = {
            useRenderAndMountedTracking = function() --[[ Line: 28 ]] --[[ Name: useRenderAndMountedTracking ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), v4 (copy)
                l_TimeToInteractiveTracker_0.Hooks.useTTIRenderAndMountedTracking(v4);
            end
        }, 
        L2 = {
            primaryDataStarted = function() --[[ Line: 34 ]] --[[ Name: primaryDataStarted ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), v4 (copy), l_Milestone_0 (copy)
                l_TimeToInteractiveTracker_0.trackMilestone(v4, l_Milestone_0.PrimaryDataStarted.Name);
            end, 
            primaryDataReady = function() --[[ Line: 37 ]] --[[ Name: primaryDataReady ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), v4 (copy), l_Milestone_0 (copy)
                l_TimeToInteractiveTracker_0.trackMilestone(v4, l_Milestone_0.PrimaryDataReady.Name);
            end, 
            dataProcessingStarted = function() --[[ Line: 40 ]] --[[ Name: dataProcessingStarted ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), v4 (copy), l_Milestone_0 (copy)
                l_TimeToInteractiveTracker_0.trackMilestone(v4, l_Milestone_0.DataProcessingStarted.Name);
            end, 
            dataProcessingCompleted = function() --[[ Line: 43 ]] --[[ Name: dataProcessingCompleted ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), v4 (copy), l_Milestone_0 (copy)
                l_TimeToInteractiveTracker_0.trackMilestone(v4, l_Milestone_0.DataProcessingCompleted.Name);
            end, 
            functionallyReady = function() --[[ Line: 46 ]] --[[ Name: functionallyReady ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), v4 (copy), l_Milestone_0 (copy)
                l_TimeToInteractiveTracker_0.trackMilestone(v4, l_Milestone_0.FunctionallyReady);
            end, 
            surfaceReady = function() --[[ Line: 49 ]] --[[ Name: surfaceReady ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), v4 (copy), l_Milestone_0 (copy)
                l_TimeToInteractiveTracker_0.trackMilestone(v4, l_Milestone_0.SurfaceReady);
            end
        }, 
        L3 = {
            networkFetch = function() --[[ Line: 55 ]] --[[ Name: networkFetch ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), v4 (copy), l_Milestone_0 (copy)
                l_TimeToInteractiveTracker_0.trackSubphase(v4, l_Milestone_0.PrimaryDataStarted.Name, l_Milestone_0.PrimaryDataStarted.Subphase.NetworkFetch);
            end, 
            responseReceived = function() --[[ Line: 62 ]] --[[ Name: responseReceived ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), v4 (copy), l_Milestone_0 (copy)
                l_TimeToInteractiveTracker_0.trackSubphase(v4, l_Milestone_0.PrimaryDataStarted.Name, l_Milestone_0.PrimaryDataStarted.Subphase.ResponseReceived);
            end, 
            sponsoredSearchStarted = function() --[[ Line: 69 ]] --[[ Name: sponsoredSearchStarted ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), v4 (copy), l_Milestone_0 (copy), v5 (copy)
                l_TimeToInteractiveTracker_0.trackSubphase(v4, l_Milestone_0.PrimaryDataStarted.Name, v5.SponsoredSearchStarted);
            end, 
            sponsoredSearchCompleted = function() --[[ Line: 76 ]] --[[ Name: sponsoredSearchCompleted ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), v4 (copy), l_Milestone_0 (copy), v5 (copy)
                l_TimeToInteractiveTracker_0.trackSubphase(v4, l_Milestone_0.PrimaryDataStarted.Name, v5.SponsoredSearchCompleted);
            end, 
            catalogApiSearchStarted = function() --[[ Line: 83 ]] --[[ Name: catalogApiSearchStarted ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), v4 (copy), l_Milestone_0 (copy), v5 (copy)
                l_TimeToInteractiveTracker_0.trackSubphase(v4, l_Milestone_0.PrimaryDataStarted.Name, v5.CatalogApiSearchStarted);
            end, 
            catalogApiSearchCompleted = function() --[[ Line: 90 ]] --[[ Name: catalogApiSearchCompleted ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), v4 (copy), l_Milestone_0 (copy), v5 (copy)
                l_TimeToInteractiveTracker_0.trackSubphase(v4, l_Milestone_0.PrimaryDataStarted.Name, v5.CatalogApiSearchCompleted);
            end
        }
    };
else
    return nil;
end;