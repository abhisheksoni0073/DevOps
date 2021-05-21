__Index read-only__

    PUT trackhive_6/_settings
    {
    "index": {
        "blocks": {
        "read_only_allow_delete": "false"
        }
    }
    }