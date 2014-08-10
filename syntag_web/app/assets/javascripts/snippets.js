var downloaded = []

$(document).on("page:change", function () {
    var editor = null

    function set_language(json_lang) {
	// TODO: Here we assume that it succeeded. Can we do better?
	if (downloaded.indexOf(json_lang["id"]) < 0) {
	    $("head").append($("<script src=\"/assets/codemirror/modes/" + json_lang["code_editor_name"] + ".js\"></script>"))
	}
	
	downloaded.push(json_lang["id"])
	
	if (editor != null) {
	    editor.setOption("mode", json_lang["code_editor_name"])
	}
    }
    
    if ($("#snippet_select").length !== 0) {
	var editor = null
	
	function download_selected_snippet() {
	    $.ajax("/snippets/" + $("#snippet_select").val() + ".json").done(function (json_snip) {
		editor.getDoc().setValue(json_snip["contents"])
		
		$.ajax("/admin/languages/" + json_snip["language_id"] + ".json").done(function (json_lang) {
		    $("#lang").text(json_lang["name"])

		    set_language(json_lang)
		})
	    })
	}

	$("#snippet_select").change(download_selected_snippet)

	editor = CodeMirror.fromTextArea($("#snippet")[0], {
	    lineNumbers: false,
	})
	
	download_selected_snippet()
    }

    else if ($("#snippet_contents").length !== 0) {
	function load_selected_language() {
	    snippet_lang_id = $("#snippet_language_id").val()
	    // <script data-turbolinks-track="true" src="/assets/codemirror/modes/ruby.js?body=1"></script>
            $.ajax("/admin/languages/" + snippet_lang_id + ".json").done(function (json_lang) {
		set_language(json_lang)
	    })
	}

	$("#snippet_language_id").change(load_selected_language)

	load_selected_language()

	editor = CodeMirror.fromTextArea($("#snippet_contents")[0], {
	    lineNumbers: true,
	})
    }
})
