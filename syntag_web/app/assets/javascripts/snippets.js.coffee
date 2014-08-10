$(document).on("page:change", () ->
        # "tell" that we're on the select snippet page
        if ($("#snippet_select").length isnt 0)
                $("#snippet_select").change(() ->
                        $.ajax(url: "/snippets/" +
                                $("#snippet_select").val() + ".json").done (json_snip) ->
                                        $("#snippet").text(json_snip['contents'])
                                        $.ajax(url: "/admin/languages/" + json_snip['language_id'] + '.json').done((json_lang) ->
                                                $("#lang").text(json_lang['name'])
                                                $("#snippet").addClass("lang-" + json_lang['highlighter_name'])
                                                ))

        # "tell" that we're on the new snippet page
        if ($("#snippet_contents").length isnt 0)
                # editor = CodeMirror.fromTextArea($("#snippet_contents")[0]))
                editor = CodeMirror.fromTextArea($("#snippet_contents")[0], {
                        value: "testfunction\n",
                        mode: "ruby",
                        lineNumbers: true,}))
