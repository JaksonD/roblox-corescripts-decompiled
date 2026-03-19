local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_reportWarning_0 = require(l_Parent_0.DiscoveryAnalytics).Points.reportWarning;
local v2 = require(l_Parent_0.LoggingProtocol);
local v3 = require(script.Parent.TextSearchEntry);
return function(v4) --[[ Line: 9 ]] --[[ Name: getFormattedTextSearchEntry ]]
    -- upvalues: l_reportWarning_0 (copy), v2 (copy), v3 (copy)
    if not v4 then
        l_reportWarning_0(v2.default, "TextSearchEntryNoResults", "Text search results is nil");
        return nil;
    elseif v4 and #v4 == 0 then
        l_reportWarning_0(v2.default, "TextSearchEntryNoResults", "Text search results is empty");
        return nil;
    else
        local v5 = nil;
        local v6 = v4[1];
        v3.fromTextSearchEntryJson(v6):match(function(v7) --[[ Line: 27 ]]
            -- upvalues: v5 (ref)
            v5 = v7;
        end):matchError(function(v8) --[[ Line: 30 ]]
            -- upvalues: l_reportWarning_0 (ref), v2 (ref)
            l_reportWarning_0(v2.default, "TextSearchEntryParseError", v8);
        end);
        return v5;
    end;
end;