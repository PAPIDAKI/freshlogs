jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()

  # $(document).on "page:change", ->
  # $("#cof").click (event) ->
  #    event.preventDefault()
  #    $("#table").fadeToggle()	
 