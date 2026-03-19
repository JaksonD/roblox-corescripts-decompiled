local v0 = newproxy(true);
getmetatable(v0).__tostring = function() --[[ Line: 10 ]]
    return "UsageGraphSentinel";
end;
return {
    UsageGraphKey = v0, 
    getUsageGraph = function(v1) --[[ Line: 14 ]] --[[ Name: getUsageGraph ]]
        -- upvalues: v0 (copy)
        return table.clone(v1[v0]);
    end
};