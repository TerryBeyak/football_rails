# $(document).ready -> 

#   $(".radio-btn").click (button) -> 
#     team = $(this).val()
#     name = $(this).attr('name')
#     $('.' + team).each ->
#       if $("input:radio[name='" + name + "']").is(":checked")
#         subtract_old_values_from_total($(this), name)
#         add_new_values_to_total($(this))
#       else 
#         add_new_values_to_total($(this))

#   add_new_values_to_total = (element)-> 
#     user = element.attr "data-user"
#     pick_value = parseInt(element.text())
#     initial_value = parseInt($('#total-user-' + user).text())
#     $('#total-user-' + user).text(initial_value + pick_value)

#   subtract_old_values_from_total = (element) ->
#     initial_value = parseInt($('#total-user-' + user).text())
#     unchecked_team = $("input:radio[name='" + name + "']:unchecked").val()
#     old_pick_value = $("input:radio[name='" + name + "']:unchecked").attr "data-user"
#     $('#total-user-' + user).text(initial_value - old_pick_value)

$(document).ready ->

  totals = new app.views.Picks
