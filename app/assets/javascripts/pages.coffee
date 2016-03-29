# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  if $(".pages.home").length
    window.vm = new Vue
      el: "#wrapper"
      data:
        user:
          id: null
          username: null
          login_count: -1
        stranger:
          uuid: null
        duration: -1
      methods:
        update_duration: () ->
          this.duration = this.duration + 1

          if this.user.id
            url = "/users/#{this.user.id}/stay"
          else
            url = "/strangers/#{this.stranger.uuid}/stay"
          $.ajax(
            method: "PUT",
            url: url
          ).done (data) =>
            console.log "success"

        async_user: () ->
          _id  = this.user.id || this.stranger.id
          url = "/users/#{_id}.json"

          $.getJSON url, (json) =>
            this.user.username = json.username
            this.user.login_count = json.login_count
            this.duration = json.login_duration

        async_stranger: () ->
          _id  = this.stranger.uuid
          url = "/strangers/#{_id}.json"

          $.getJSON url, (json) =>
            this.duration = json.duration

      ready: ()->
        this.duration = 0

        if $(".signed-in").length
          this.user.id = $(".signed-in").data("user-id")
          this.async_user()
        else
          this.stranger.uuid = document.cookie.replace(/(?:(?:^|.*;\s*)stranger_id\s*\=\s*([^;]*).*$)|^.*$/, "$1")
          this.async_stranger()

        setInterval( () =>
          this.update_duration()
        , 1000*60)
