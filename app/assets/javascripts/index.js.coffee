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
    $('#keitaidenwa_url').val "http://twitter.com/#{data.user.screen_name}/status/#{data.id_str}"
  @detect = (source)=>
    if source.match /iPhone|iOS/
      'iPhone'
    else
      undefined
  this

Search = ->
  @attach_event = =>
    $('#seiyu_jump').submit(->
      location.pathname = "/seiyu/#{encodeURIComponent $('#seiyu_name').val()}"
      false
    )
    $('#keitaidenwa_jump').submit(->
      location.pathname = "/kishu/#{encodeURIComponent $('#keitaidenwa_name').val()}"
      false
    )
  this

$ ->
  router 'index', 'tweet', ->
    t = new Tweet()
    t.attach_event()
  router 'index', 'index', ->
    s = new Search()
    s.attach_event()
