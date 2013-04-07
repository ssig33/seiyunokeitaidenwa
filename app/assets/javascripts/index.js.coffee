Tweet = ->
  @attach_event = =>
    $('#get').click =>
      $.get('/tweet/', url: $('#url').val()).success((data)=>
        @render data
      )
  @render = (data)=>
    phone = @detect data.source
    html = "@#{data.user.screen_name}/#{data.user.name} さんが使用している Twitter クライアントは #{data.source} です。"
    if phone
      html += "<br/>クライアント名より #{phone} を使用している可能性が高いです"
    $('#area').html html
    $('#keitaidenwa_seiyu_name').val data.user.name
    $('#keitaidenwa_phone').val phone if phone
    date = new Date(Date.parse(data.created_at))
    $('#keitaidenwa_at').val "#{date.getFullYear()}/#{date.getMonth()}/#{date.getDate()}"
    $('#keitaidenwa_url').val "http://twitter.com/#{data.user.screen_name}/status/#{data.id}"
  @detect = (source)=>
    if source.match /iPhone/
      'iPhone'
    else
      undefined
  this

$ ->
  router 'index', 'tweet', ->
    t = new Tweet()
    t.attach_event()
