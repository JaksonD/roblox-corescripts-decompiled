return function(v0, v1) --[[ Line: 1 ]]
    local v2 = string.gsub(v1 or "0", "%p", {
        ["."] = "_"
    });
    v0.reportCounter(string.format("ExpChatV%sCount", v2));
end;