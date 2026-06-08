-- ... (existing code)

local function get_limit_conf(plugin_conf) {
    -- Include the configuration version in the cache key to ensure immediate invalidation
    local cache_key = plugin_conf.conf_version or "default"
    return lrucache(cache_key, nil, function() {
        return plugin_conf
    })
}

-- ... (rest of the file)