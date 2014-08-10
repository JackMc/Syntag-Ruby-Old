var downloaded = []

$(document).on("page:change", function () {
    var editor = null

    function set_language(lang_id) {
	var code_editor_name = null

	// If the language has already been downloaded (along with it's JSON)
	if (lang_id < downloaded.length && downloaded[lang_id] != undefined) {
	    code_editor_name = downloaded[lang_id]
	    
	    if (editor != null) {
		editor.setOption("mode", code_editor_name)
	    }
	}
	else {
	    $.ajax("/admin/languages/" + lang_id + ".json").done(function (json_lang) {
		$("head").append($("<script src=\"/assets/codemirror/modes/" + json_lang["code_editor_name"] + ".js\"></script>"))
		downloaded[json_lang["id"]] = json_lang["code_editor_name"]

		code_editor_name = json_lang["code_editor_name"]

		if (editor != null) {
		    editor.setOption("mode", code_editor_name)
		}
	    })
	}
    }
    
    if ($("#snippet_select").length !== 0) {
	var editor = null
	
	function download_selected_snippet() {
	    $.ajax("/snippets/" + $("#snippet_select").val() + ".json").done(function (json_snip) {
		editor.getDoc().setValue(json_snip["contents"])
		set_language($("#snippet_select").val())
	    })
	}

	$("#snippet_select").change(download_selected_snippet)

	if ($(".CodeMirror").length === 0) {
	    editor = CodeMirror.fromTextArea($("#snippet")[0], {
		lineNumbers: false,
	    })
	}
	
	download_selected_snippet()
    }

    else if ($("#snippet_contents").length !== 0) {
	function load_selected_language() {
	    snippet_lang_id = $("#snippet_language_id").val()
	    // <script data-turbolinks-track="true" src="/assets/codemirror/modes/ruby.js?body=1"></script>
            set_language(snippet_lang_id)
	}

	$("#snippet_language_id").change(load_selected_language)

	load_selected_language()

	if ($(".CodeMirror").length === 0) {
	    editor = CodeMirror.fromTextArea($("#snippet_contents")[0], {
		lineNumbers: true,
	    })
	}
    }
})
