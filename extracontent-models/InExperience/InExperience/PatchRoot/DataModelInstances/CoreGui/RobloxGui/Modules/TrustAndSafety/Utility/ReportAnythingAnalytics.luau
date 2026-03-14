local l_CorePackages_0 = game:GetService("CorePackages");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local _ = require(l_CorePackages_0.Workspace.Packages.TnSAvatarIdentification);
local l_EventIngest_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest;
local v5 = {
    EventType = {
        AvatarsIdentified = "ReportAnythingAvatarsIdentified"
    }, 
    Context = {
        LegacyMenu = "ReportAbuseLegacyMenu"
    }
};
local function _() --[[ Line: 29 ]]
    return {
        annotationOptionSeenCount = 0, 
        annotationPageSeenCount = 0, 
        annotationPlaceCount = 0, 
        annotationUndoCount = 0, 
        annotationRedoCount = 0, 
        abandonedForRetake = false, 
        isPortraitMode = false
    };
end;
local v7 = {
    annotationOptionSeenCount = 0, 
    annotationPageSeenCount = 0, 
    annotationPlaceCount = 0, 
    annotationUndoCount = 0, 
    annotationRedoCount = 0, 
    abandonedForRetake = false, 
    isPortraitMode = false
};
local v8 = nil;
local function _() --[[ Line: 44 ]]
    -- upvalues: v8 (ref), l_EventIngest_0 (copy), l_EventIngestService_0 (copy)
    if not v8 then
        v8 = l_EventIngest_0.new(l_EventIngestService_0);
    end;
    return v8;
end;
return {
    incrementAnnotationOptionSeen = function() --[[ Line: 52 ]] --[[ Name: incrementAnnotationOptionSeen ]]
        -- upvalues: v7 (ref)
        local l_v7_0 = v7;
        l_v7_0.annotationOptionSeenCount = l_v7_0.annotationOptionSeenCount + 1;
    end, 
    incrementAnnotationPageSeen = function() --[[ Line: 55 ]] --[[ Name: incrementAnnotationPageSeen ]]
        -- upvalues: v7 (ref)
        local l_v7_1 = v7;
        l_v7_1.annotationPageSeenCount = l_v7_1.annotationPageSeenCount + 1;
    end, 
    incrementAnnotationPlace = function() --[[ Line: 58 ]] --[[ Name: incrementAnnotationPlace ]]
        -- upvalues: v7 (ref)
        local l_v7_2 = v7;
        l_v7_2.annotationPlaceCount = l_v7_2.annotationPlaceCount + 1;
    end, 
    incrementAnnotationUndo = function() --[[ Line: 61 ]] --[[ Name: incrementAnnotationUndo ]]
        -- upvalues: v7 (ref)
        local l_v7_3 = v7;
        l_v7_3.annotationUndoCount = l_v7_3.annotationUndoCount + 1;
    end, 
    incrementAnnotationRedo = function() --[[ Line: 64 ]] --[[ Name: incrementAnnotationRedo ]]
        -- upvalues: v7 (ref)
        local l_v7_4 = v7;
        l_v7_4.annotationRedoCount = l_v7_4.annotationRedoCount + 1;
    end, 
    setAbandonedForRetake = function() --[[ Line: 67 ]] --[[ Name: setAbandonedForRetake ]]
        -- upvalues: v7 (ref)
        v7.abandonedForRetake = true;
    end, 
    setIsPortraitMode = function() --[[ Line: 70 ]] --[[ Name: setIsPortraitMode ]]
        -- upvalues: v7 (ref)
        v7.isPortraitMode = true;
    end, 
    getAccumulatedParameters = function() --[[ Line: 74 ]] --[[ Name: getAccumulatedParameters ]]
        -- upvalues: v7 (ref)
        return v7;
    end, 
    emitAvatarsIdentifiedStats = function(v15) --[[ Line: 77 ]] --[[ Name: emitAvatarsIdentifiedStats ]]
        -- upvalues: v2 (copy), v8 (ref), l_EventIngest_0 (copy), l_EventIngestService_0 (copy), v5 (copy)
        local v16 = v2.Dictionary.join(v15, {
            duration = v15.duration * 1000000
        });
        if not v8 then
            v8 = l_EventIngest_0.new(l_EventIngestService_0);
        end;
        v8:sendEventDeferred(v5.Context.LegacyMenu, v5.EventType.AvatarsIdentified, v16);
    end, 
    clear = function() --[[ Line: 87 ]] --[[ Name: clear ]]
        -- upvalues: v7 (ref)
        v7 = {
            annotationOptionSeenCount = 0, 
            annotationPageSeenCount = 0, 
            annotationPlaceCount = 0, 
            annotationUndoCount = 0, 
            annotationRedoCount = 0, 
            abandonedForRetake = false, 
            isPortraitMode = false
        };
    end
};