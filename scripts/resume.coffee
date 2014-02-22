do ->
  collapse = $ ".collapse"
  toggle = $ ".toggle a"
  toggle.on "click", (event) ->
    collapse.toggleClass "in"
    if toggle.html() is '展开更多...'
      toggle.html "收起"
    else
      toggle.html "展开更多..."

do ->
  return if !(bowser.msie and bowser.version <= 9)
  $(".alert").detach().prependTo('body')
  $(".alert").removeClass "hide"
  $("body").on 'click', '.close', ->
    $(".alert").remove()
  setTimeout ->
    $(".alert").remove()
  , 1000*15

do ->
  Handlebars.registerHelper 'carousel_indicators', (imageObj, b) ->
    if  imageObj.data.first
      new Handlebars.SafeString "
        <li data-target='#works-carousel' data-slide-to=#{imageObj.data.index} class='active'></li>
      "
    else
      new Handlebars.SafeString "
        <li data-target='#works-carousel' data-slide-to=#{imageObj.data.index}></li>
      "

  Handlebars.registerHelper 'carousel_items', (imageObj) ->
    if  imageObj.data.first
      new Handlebars.SafeString "
        <div class='item active'>
          <img src=#{this.url} width='520' height='325'>
        </div>"
    else
      new Handlebars.SafeString "
        <div class='item'>
          <img src=#{this.url} width='520' height='325'>
        </div>"

do ->
  $("h3>a").on "click", (event) ->
    html = JST["temp/carousel.hbs"]
      images: imageList[@getAttribute("data-key")]
      url: jumpUrls[@getAttribute("data-key")]
      
    $(".modal-dialog").html html

  jumpUrls =
    atom: "http://my.appatom.com"
    zst: "http://92zst.com/"
    flow: "http://92zst.com/app/#!/"
    hipark: "http://www.hipark.cn/"
    dt: "http://designtotalk.com/"
    gezbox: "http://gezbox.com/"

  imageList =
    atom: [{
      url: "images/screenshots/atom01.png"
    } ,{
      url: "images/screenshots/atom02.png"
    } ,{
      url: "images/screenshots/atom03.png"
    } ,{
      url: "images/screenshots/atom04.png"
    } ,{
      url: "images/screenshots/atom05.png"
    } ,{
      url: "images/screenshots/atom06.png"
    } ,{
      url: "images/screenshots/atom07.png"
    }]
    zst: [{
      url: "images/screenshots/zst01.png"
    } ,{
      url: "images/screenshots/zst02.png"
    } ,{
      url: "images/screenshots/zst03.png"
    } ,{
      url: "images/screenshots/zst04.png"
    }]
    flow: [{
      url: "images/screenshots/flow01.png"
    } ,{
      url: "images/screenshots/flow02.png"
    } ,{
      url: "images/screenshots/flow03.png"
    } ,{
      url: "images/screenshots/flow04.png"
    } ,{
      url: "images/screenshots/flow05.png"
    } ,{
      url: "images/screenshots/flow06.png"
    } ,{
      url: "images/screenshots/flow07.png"
    }]
    hipark: [{
      url: "images/screenshots/hipark01.png"
    } ,{
      url: "images/screenshots/hipark02.png"
    } ,{
      url: "images/screenshots/hipark03.png"
    } ,{
      url: "images/screenshots/hipark04.png"
    } ,{
      url: "images/screenshots/hipark05.png"
    } ,{
      url: "images/screenshots/hipark06.png"
    } ,{
      url: "images/screenshots/hipark07.png"
    } ,{
      url: "images/screenshots/hipark08.png"
    } ,{
      url: "images/screenshots/hipark09.png"
    } ,{
      url: "images/screenshots/hipark10.png"
    }]
    dt: [{
      url: "images/screenshots/dt01.png"
    } ,{
      url: "images/screenshots/dt02.png"
    } ,{
      url: "images/screenshots/dt03.png"
    } ,{
      url: "images/screenshots/dt04.png"
    }]
    gezbox: [{
      url: "images/screenshots/gezbox01.png"
    } ,{
      url: "images/screenshots/gezbox02.png"
    } ,{
      url: "images/screenshots/gezbox03.png"
    } ,{
      url: "images/screenshots/gezbox04.png"
    }]