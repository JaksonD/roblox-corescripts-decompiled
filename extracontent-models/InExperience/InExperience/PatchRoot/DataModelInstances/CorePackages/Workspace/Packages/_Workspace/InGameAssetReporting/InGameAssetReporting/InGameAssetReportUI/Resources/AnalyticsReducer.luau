local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameAssetReporting");
local _ = require(l_script_FirstAncestor_0.InGameAssetReportUI.Resources.Types);
local l_AnalyticsActions_0 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Resources.Constants).AnalyticsActions;
return function(v3, v4) --[[ Line: 8 ]] --[[ Name: analyticsReducer ]]
    -- upvalues: l_AnalyticsActions_0 (copy)
    local v5 = table.clone(v3);
    local l_type_0 = v4.type;
    if l_type_0 == l_AnalyticsActions_0.SetPlaceId then
        v5.place_id = v4.place_id;
        return v5;
    elseif l_type_0 == l_AnalyticsActions_0.AccumulateForTimeSpent then
        v5.accumulated_time_ms = v4.accumulated_time_ms;
        return v5;
    elseif l_type_0 == l_AnalyticsActions_0.SetReasonSelection then
        v5.reason_selection = v4.reason_selection;
        return v5;
    elseif l_type_0 == l_AnalyticsActions_0.SetSurfaceSelection then
        v5.surface_selection = v4.surface_selection;
        return v5;
    elseif l_type_0 == l_AnalyticsActions_0.SetPrefilledSurfaceSelection then
        v5.prefilled_surface_selection = v4.prefilled_surface_selection;
        return v5;
    elseif l_type_0 == l_AnalyticsActions_0.SetCommentAdded then
        v5.comment_added = v4.comment_added;
        return v5;
    elseif l_type_0 == l_AnalyticsActions_0.IncrementNextCount then
        v5.next_count = v5.next_count + 1;
        return v5;
    elseif l_type_0 == l_AnalyticsActions_0.IncremementAnnotationCount then
        v5.annotation_place_count = v5.annotation_place_count + 1;
        return v5;
    elseif l_type_0 == l_AnalyticsActions_0.IncremementAnnotationUndoCount then
        v5.annotation_undo_count = v5.annotation_undo_count + 1;
        return v5;
    elseif l_type_0 == l_AnalyticsActions_0.IncremementAnnotationRedoCount then
        v5.annotation_redo_count = v5.annotation_redo_count + 1;
        return v5;
    elseif l_type_0 == l_AnalyticsActions_0.SetExtractionResults then
        local l_results_0 = v4.results;
        v5.annotation_final_count = v4.final_annotation_count;
        v5.avatar_final_count = l_results_0.stats.playersCount;
        v5.image_asset_count = #l_results_0.extractedAssets.Image;
        v5.mesh_asset_count = #l_results_0.extractedAssets.Mesh;
        v5.model_asset_count = #l_results_0.extractedAssets.Model;
        v5.package_asset_count = #l_results_0.extractedAssets.Package;
        v5.final_raycast_target_count = l_results_0.stats.raycastTargetCount;
        v5.final_raycast_completed_count = l_results_0.stats.raycastCompletedCount;
        v5.final_raycast_resumption_count = l_results_0.stats.raycastResumptionCount;
        v5.final_raycast_computation_time_us = math.ceil(l_results_0.stats.raycastComputeTime * 1000000);
        v5.hit_count_map_size = l_results_0.stats.hitCountMapSize;
        v5.top_level_objects_size = l_results_0.stats.topLevelObjectsSize;
        v5.instances_traversed_count = l_results_0.stats.instancesTraversed;
        v5.traversal_task_list_size = l_results_0.stats.traversalTaskListSize;
        v5.traversal_tasks_completed_count = l_results_0.stats.traversalTasksCompleted;
        v5.extraction_resumption_count = l_results_0.stats.resumptionCount;
        v5.extraction_computation_time_us = math.ceil(l_results_0.stats.computeTime * 1000000);
        v5.extraction_wall_time_us = math.ceil(l_results_0.stats.wallTime * 1000000);
        return v5;
    elseif l_type_0 == l_AnalyticsActions_0.SetViewportInformation then
        v5.viewport_size_x = v4.viewport_size_x;
        v5.viewport_size_y = v4.viewport_size_y;
        v5.is_portrait_mode = v4.is_portrait_mode;
        return v5;
    elseif l_type_0 == l_AnalyticsActions_0.SetDidUserResize then
        v5.did_user_resize = v4.did_user_resize;
        return v5;
    else
        if l_type_0 == l_AnalyticsActions_0.SetVariant then
            v5.variant = v4.variant;
        end;
        return v5;
    end;
end;