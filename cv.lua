userdata = userdata or {}

function userdata.ResumeEntry(keyvals)
    -- keyword_options = utilities.parsers.settings_to_array(keywords)
    keyvals = utilities.parsers.settings_to_hash(keyvals)

    margin = keyvals["margin"]
    institution = keyvals["institution"]
    city = keyvals["city"]
    country = keyvals["country"]
    if margin then
        context("\\inmargin{\\tf %s}", margin)
    end
    context("{\\bf %s}", keyvals["main"])
    if institution then
        context(", {\\sl %s}", institution)
    end
    if city then
        context(", {%s}", city)
    end
    if country then
        context(", {%s}", country)
    end
    context(".")
end

function userdata.ResumeShortEntry(keyvals)
    keyvals = utilities.parsers.settings_to_hash(keyvals)

    margin = keyvals["margin"] or ""
    text = keyvals["text"]

    context("\\inmargin{\\tf %s}", margin)
    context("{%s}", text)
end

function userdata.ResumeTitle(keyvals)
    named_values = utilities.parsers.settings_to_hash(keyvals)
    fullname = named_values["fullname"]
    subtitle = named_values["subtitle"] or "Curriculum Vitae"

    if fullname then
        context("\\rightaligned{\\tfd{\\color[darkgray]{%s}}}", fullname)
    end
    context("\\hairline")
    context("\\rightaligned{\\sl %s}", subtitle)
end
