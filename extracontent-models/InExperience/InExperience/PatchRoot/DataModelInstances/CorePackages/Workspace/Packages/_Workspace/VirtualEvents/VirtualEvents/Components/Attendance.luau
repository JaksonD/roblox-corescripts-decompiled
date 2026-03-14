local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local l_Players_0 = game:GetService("Players");
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Components.AttendanceCount);
local v5 = require(l_script_FirstAncestor_0.Components.FacePile);
local _ = require(l_script_FirstAncestor_0.Parent.VirtualEventsState);
return function(v7) --[[ Line: 16 ]] --[[ Name: Attendance ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy), l_Players_0 (copy)
    local l_experienceDetails_0 = v7.virtualEvent.experienceDetails;
    local l_rsvpCounters_0 = v7.virtualEvent.rsvpCounters;
    local v13 = v3.useMemo(function() --[[ Line: 20 ]]
        -- upvalues: v7 (copy)
        local v10 = {};
        if v7.virtualEvent.rsvps then
            for _, v12 in v7.virtualEvent.rsvps do
                if v12.rsvpStatus == "going" then
                    table.insert(v10, (tostring(v12.userId)));
                end;
            end;
        end;
        return v10;
    end, {
        v7.virtualEvent
    });
    if v7.eventStatus == "Ongoing" and l_experienceDetails_0 and l_experienceDetails_0.playing == 0 or v7.eventStatus ~= "Ongoing" and l_rsvpCounters_0 and l_rsvpCounters_0.going == 0 then
        return nil;
    else
        return v3.createElement("Folder", nil, {
            Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 8)
            }), 
            AttendanceCount = v3.createElement(v4, {
                layoutOrder = 1, 
                eventStatus = v7.eventStatus, 
                interested = if l_rsvpCounters_0 and l_rsvpCounters_0.going then l_rsvpCounters_0.going else 0, 
                attending = if l_experienceDetails_0 and l_experienceDetails_0.playing then l_experienceDetails_0.playing else 0
            }), 
            FacePile = v3.createElement(v5, {
                layoutOrder = 2, 
                userIds = v13, 
                desiredFirstUserId = if l_Players_0.LocalPlayer then tostring(l_Players_0.LocalPlayer.UserId) else nil
            })
        });
    end;
end;