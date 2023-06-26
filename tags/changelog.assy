{if:{tryarg:0}|=||Usage: -t changelog <platform> [version] [locale]
List of changelogs can be obtained by running the command without a version set.
Locale defaults to en-US.

Valid platforms:
0 - Desktop
1 - Mobile|{js:
(async () => \{
    let platform = "{tryarg:0}";
    let version = "{tryarg:1}";
    let locale = "{tryarg:2}";
{ignore:
    let req = await fetch(`https://cdn.discordapp.com/changelogs/config_${platform}.json`);
    let ids = await req.json()
    let v = Object.values(ids).map(x => x.min_version.toString());
    let id;
    if (v.length > 1) {
        if (!v.includes(version)) return `Valid changelogs for platform ${platform}: ${v.join(", ")}`;

        id = Object.entries(ids).find(x => x[1].min_version.toString() == version)[0];
    } else {
        id = Object.keys(ids)[0];
    }

    if (!locale.length) locale = "en-US";
    let url = `https://cdn.discordapp.com/changelogs/${platform}/${id}/${locale}.json`
    let reqc = await fetch(url);
    let changelog = await reqc.json()
    let out = url + " \`\`\`" + changelog.content;

    if (out.length > 1980) out = out.substring(0, 1970) + "... (continues)";
    return out + "\`\`\`";
}
\})();
}}