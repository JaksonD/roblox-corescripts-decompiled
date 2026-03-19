local _ = game:GetService("Players");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local _ = require(l_RobloxGui_0.Modules.VoiceChat.ReportAbuseLogic);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Resources.Constants);
local v5 = require(l_Parent_0.Actions.ShowToast);
local v6 = require(l_Parent_0.Actions.OpenReportSentDialog);
local v7 = require(l_Parent_0.Actions.EndReportFlow);
local v8 = require(l_Parent_0.Utility.ReportManager);
return function(v9, v10, v11, v12, v13, v14, v15) --[[ Line: 15 ]]
    -- upvalues: v4 (copy), v8 (copy), v6 (copy), v5 (copy), v7 (copy)
    return function(v16) --[[ Line: 16 ]]
        -- upvalues: v9 (copy), v4 (ref), v8 (ref), v13 (copy), v10 (copy), v11 (copy), v12 (copy), v6 (ref), v5 (ref), v14 (copy), v15 (copy), v7 (ref)
        local v17 = v16:getState();
        if v9 == v4.ReportType.Player then
            v8.submitUserAbuseReport({
                reportCategory = v13, 
                abusingPlayer = v10, 
                reason = v11, 
                comment = v12, 
                beginningTimestamp = v17.report.beginningTimestamp, 
                sortedUserIds = v17.report.sortedUserIds
            }, function() --[[ Line: 26 ]]
                -- upvalues: v16 (copy), v6 (ref), v9 (ref), v10 (ref)
                v16:dispatch(v6(v9, v10));
            end);
            return;
        else
            if v9 == v4.ReportType.Place then
                v8.submitPlaceAbuseReport({
                    placeId = game.PlaceId, 
                    placeName = v17.placeInfo.name, 
                    placeDescription = v17.placeInfo.description, 
                    reason = v11, 
                    comment = v12
                }, function() --[[ Line: 36 ]]
                    -- upvalues: v16 (copy), v5 (ref), v14 (ref), v15 (ref)
                    v16:dispatch(v5(v14, v15));
                end);
                v16:dispatch(v7());
            end;
            return;
        end;
    end;
end;