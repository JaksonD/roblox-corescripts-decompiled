local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local l_Players_0 = game:GetService("Players");
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local v3 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v4 = require(l_script_FirstAncestor_0.Parent.React);
local v5 = require(l_script_FirstAncestor_0.Components.EventSocialProof);
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local v7 = require(l_script_FirstAncestor_0.Common.formatNumberWithShortUnits);
local _ = require(l_script_FirstAncestor_0.Parent.VirtualEventsState);
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_useTokens_0 = v3.Hooks.useTokens;
return function(v12) --[[ Line: 21 ]] --[[ Name: AttendanceChip ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalization_0 (copy), v4 (copy), l_View_0 (copy), v5 (copy), l_Players_0 (copy), l_Text_0 (copy), v7 (copy)
    local v13 = l_useTokens_0();
    local v14 = l_useLocalization_0({
        interested = "Feature.VirtualEvents.AttendanceBeforeEvent", 
        attendingNow = "Feature.VirtualEvents.AttendanceDuringEvent"
    });
    local l_experienceDetails_0 = v12.virtualEvent.experienceDetails;
    local l_rsvpCounters_0 = v12.virtualEvent.rsvpCounters;
    local v17 = v12.eventStatus == "Ongoing";
    local v21 = v4.useMemo(function() --[[ Line: 32 ]]
        -- upvalues: v12 (copy)
        local v18 = {};
        if v12.virtualEvent.rsvps then
            for _, v20 in v12.virtualEvent.rsvps do
                if v20.rsvpStatus == "going" then
                    table.insert(v18, (tostring(v20.userId)));
                end;
            end;
        end;
        return v18;
    end, {
        v12.virtualEvent
    });
    if v17 and l_experienceDetails_0 and l_experienceDetails_0.playing == 0 or not v17 and l_rsvpCounters_0 and l_rsvpCounters_0.going == 0 then
        return nil;
    else
        local v22 = if l_rsvpCounters_0 and l_rsvpCounters_0.going then l_rsvpCounters_0.going else 0;
        local v23 = if l_experienceDetails_0 and l_experienceDetails_0.playing then l_experienceDetails_0.playing else 0;
        return v4.createElement(l_View_0, {
            backgroundStyle = v13.Inverse.Surface.Surface_300, 
            tag = {
                ["row gap-xsmall size-0-700 auto-x align-y-center align-x-center clip radius-circle"] = true
            }
        }, {
            Padding = v4.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 4), 
                PaddingRight = UDim.new(0, 12)
            }), 
            EventSocialProof = v4.createElement(v5, {
                userIds = v21, 
                desiredFirstUserId = if l_Players_0.LocalPlayer then tostring(l_Players_0.LocalPlayer.UserId) else nil
            }), 
            AttendanceCount = v4.createElement(l_Text_0, {
                Text = ("%s %s"):format(v7(if v17 then v23 else v22), if v17 then v14.attendingNow else v14.interested), 
                textStyle = v13.Inverse.Content.Emphasis, 
                fontStyle = v13.Typography.TitleSmall, 
                tag = "auto-x size-0-full shrink text-caption-large text-truncate-end"
            })
        });
    end;
end;