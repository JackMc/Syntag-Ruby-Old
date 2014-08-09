$(() ->
        $("#snippet_select").change(() ->
                $.ajax(url: "/snippets/" +
                        $("#snippet_select").val() + ".json").done (json_snip) ->
                                $("#snippet").text(json_snip['contents'])
                                $.ajax(url: "/admin/languages/" + json_snip['language_id'] + '.json').done((json_lang) ->
                                        $("#lang").text(json_lang['name'])
                                        $("#snippet").addClass("lang-" + json_lang['highlighter_name'])
                                )))
