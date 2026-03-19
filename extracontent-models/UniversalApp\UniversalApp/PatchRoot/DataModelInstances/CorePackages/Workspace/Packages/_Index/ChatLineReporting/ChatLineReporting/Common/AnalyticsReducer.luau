local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatLineReporting");
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_AnalyticsActions_0 = require(l_script_FirstAncestor_0.Common.Constants).AnalyticsActions;
return function(v3, v4) --[[ Line: 7 ]] --[[ Name: analyticsReducer ]]
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
    elseif l_type_0 == l_AnalyticsActions_0.SetCommentAdded then
        v5.comment_added = v4.comment_added;
        return v5;
    elseif l_type_0 == l_AnalyticsActions_0.SetChatLineSelected then
        v5.chat_line_selected = true;
        v5.selected_chat_line_index = v4.selected_chat_line_index;
        return v5;
    elseif l_type_0 == l_AnalyticsActions_0.SetChatHistoryInformation then
        v5.selectable_chat_history_size = v4.selectable_chat_history_size;
        v5.total_chat_history_size = v4.total_chat_history_size;
        v5.num_non_general_channel_chats = v4.num_non_general_channel_chats;
        return v5;
    else
        if l_type_0 == l_AnalyticsActions_0.SetViewportInformation then
            v5.viewport_size_x = v4.viewport_size_x;
            v5.viewport_size_y = v4.viewport_size_y;
            v5.is_portrait_mode = v4.is_portrait_mode;
        end;
        return v5;
    end;
end;