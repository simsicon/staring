# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  if $(".pages.home").length
    new Vue
      el: "#wrapper"
      data:
        user_id: null
        duration: -1
      methods:
        update_duration: () ->
          this.duration = this.duration + 1

      ready: ()->
        this.duration = 0
        setInterval( () =>
          this.update_duration()
        , 1000*60)
