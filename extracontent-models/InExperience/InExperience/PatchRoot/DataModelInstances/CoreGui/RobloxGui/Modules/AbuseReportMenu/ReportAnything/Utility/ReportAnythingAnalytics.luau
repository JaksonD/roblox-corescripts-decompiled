local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_CorePackages_0 = game:GetService("CorePackages");
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
local function _() --[[ Line: 33 ]]
    return {
        previewBackCount = 0, 
        previewAttachCount = 0, 
        retakeCount = 0, 
        retakeAbandon = false, 
        highlightSceneCount = 0, 
        annotationBackCount = 0, 
        annotationPlaceCount = 0, 
        annotationUndoCount = 0, 
        annotationRedoCount = 0, 
        annotationNext = false
    };
end;
local v7 = {
    previewBackCount = 0, 
    previewAttachCount = 0, 
    retakeCount = 0, 
    retakeAbandon = false, 
    highlightSceneCount = 0, 
    annotationBackCount = 0, 
    annotationPlaceCount = 0, 
    annotationUndoCount = 0, 
    annotationRedoCount = 0, 
    annotationNext = false
};
local v8 = nil;
local function _() --[[ Line: 51 ]]
    -- upvalues: v8 (ref), l_EventIngest_0 (copy), l_EventIngestService_0 (copy)
    if not v8 then
        v8 = l_EventIngest_0.new(l_EventIngestService_0);
    end;
    return v8;
end;
return {
    incrementPreviewBack = function() --[[ Line: 59 ]] --[[ Name: incrementPreviewBack ]]
        -- upvalues: v7 (ref)
        local l_v7_0 = v7;
        l_v7_0.previewBackCount = l_v7_0.previewBackCount + 1;
    end, 
    incrementPreviewAttach = function() --[[ Line: 62 ]] --[[ Name: incrementPreviewAttach ]]
        -- upvalues: v7 (ref)
        local l_v7_1 = v7;
        l_v7_1.previewAttachCount = l_v7_1.previewAttachCount + 1;
    end, 
    incrementRetake = function() --[[ Line: 65 ]] --[[ Name: incrementRetake ]]
        -- upvalues: v7 (ref)
        local l_v7_2 = v7;
        l_v7_2.retakeCount = l_v7_2.retakeCount + 1;
    end, 
    setRetakeAbandon = function() --[[ Line: 68 ]] --[[ Name: setRetakeAbandon ]]
        -- upvalues: v7 (ref)
        v7.retakeAbandon = true;
    end, 
    incrementHighlightScene = function() --[[ Line: 71 ]] --[[ Name: incrementHighlightScene ]]
        -- upvalues: v7 (ref)
        local l_v7_3 = v7;
        l_v7_3.highlightSceneCount = l_v7_3.highlightSceneCount + 1;
    end, 
    incrementAnnotationBack = function() --[[ Line: 74 ]] --[[ Name: incrementAnnotationBack ]]
        -- upvalues: v7 (ref)
        local l_v7_4 = v7;
        l_v7_4.annotationBackCount = l_v7_4.annotationBackCount + 1;
    end, 
    incrementAnnotationPlace = function() --[[ Line: 77 ]] --[[ Name: incrementAnnotationPlace ]]
        -- upvalues: v7 (ref)
        local l_v7_5 = v7;
        l_v7_5.annotationPlaceCount = l_v7_5.annotationPlaceCount + 1;
    end, 
    incrementAnnotationUndo = function() --[[ Line: 80 ]] --[[ Name: incrementAnnotationUndo ]]
        -- upvalues: v7 (ref)
        local l_v7_6 = v7;
        l_v7_6.annotationUndoCount = l_v7_6.annotationUndoCount + 1;
    end, 
    incrementAnnotationRedo = function() --[[ Line: 83 ]] --[[ Name: incrementAnnotationRedo ]]
        -- upvalues: v7 (ref)
        local l_v7_7 = v7;
        l_v7_7.annotationRedoCount = l_v7_7.annotationRedoCount + 1;
    end, 
    setAnnotationNext = function() --[[ Line: 86 ]] --[[ Name: setAnnotationNext ]]
        -- upvalues: v7 (ref)
        v7.annotationNext = true;
    end, 
    getAccumulatedParameters = function() --[[ Line: 90 ]] --[[ Name: getAccumulatedParameters ]]
        -- upvalues: v7 (ref)
        return v7;
    end, 
    emitAvatarsIdentifiedStats = function(v18) --[[ Line: 93 ]] --[[ Name: emitAvatarsIdentifiedStats ]]
        -- upvalues: v2 (copy), v8 (ref), l_EventIngest_0 (copy), l_EventIngestService_0 (copy), v5 (copy)
        local v19 = v2.Dictionary.join(v18, {
            duration = v18.duration * 1000000
        });
        if not v8 then
            v8 = l_EventIngest_0.new(l_EventIngestService_0);
        end;
        v8:sendEventDeferred(v5.Context.LegacyMenu, v5.EventType.AvatarsIdentified, v19);
    end, 
    clear = function() --[[ Line: 103 ]] --[[ Name: clear ]]
        -- upvalues: v7 (ref)
        v7 = {
            previewBackCount = 0, 
            previewAttachCount = 0, 
            retakeCount = 0, 
            retakeAbandon = false, 
            highlightSceneCount = 0, 
            annotationBackCount = 0, 
            annotationPlaceCount = 0, 
            annotationUndoCount = 0, 
            annotationRedoCount = 0, 
            annotationNext = false
        };
    end
};